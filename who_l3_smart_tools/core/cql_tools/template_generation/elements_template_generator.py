import pandas as pd
from jinja2 import Environment, FileSystemLoader

from who_l3_smart_tools.utils.cql_helpers import (
    create_cql_concept_dictionaries,
    get_dak_name,
)

# Initialize Jinja2 environment
env = Environment(
    loader=FileSystemLoader("."), autoescape=False, trim_blocks=True, lstrip_blocks=True
)

#
# Templates
#

# Top-level Templates
elements_library_template = env.from_string(
    """library {{dak_name}}Elements

{{ elements_library_includes }}

context Patient

/**
 * {{dak_name}} Elements
 */

// Auto-generated Elements from DAK Data Dictionary
//   Entries based on DAK Data Dictionary for Data Elements marked as used
//   in at least one Decision Support Table or Aggregate Indicator

{% for element in elements %}
/*
@dataElement: {{element['dak_id']}} - {{element['label']}}
@activity: {{element['activity']}}
@description: {{element['description']}}
*/
// TODO: Replace placeholder with relevant CQL logic
{{data_element_define}}
{{observation_define}}
{{condition_define}}
// End of {{element['label']}}
{% endfor %}

// Custom Elements and Logic for use DT and IND cql files
"""
)

indicator_elements_library_template = env.from_string(
    """library {{ dak_name }}IndicatorElements

{{ elements_library_includes }}

parameter "Measurement Period" Interval<Date> default Interval[@2024-01-01, @2024-12-30]

context Patient

// Auto-generated Elements from DAK Data Dictionary
//   Entries based on DAK Data Dictionary for Data Elements marked as used
//   in at least one Decision Support Table or Aggregate Indicator

{% for indicator_element in indicator_elements %}
/*
@dataElement: {{element['dak_id']}} - {{element['label']}}
@activity: {{element['activity']}}
@description: {{element['description']}}
*/
define "{{element['label']}}":
    Elements."{{element['label']}}" O // TODO: Placeholder
        where O.effective.ToInterval() starts during "Measurement Period"

{% endfor %}
"""
)

# Header Templates
elements_library_includes_template = env.from_string(
    """using FHIR version '4.0.1'

include fhir.cqf.common.FHIRHelpers called FH
include fhir.cqf.common.FHIRCommon called FC

include WHOConcepts
include WHOCommon called WC
include WHOElements called WE

include {{dak_name}}Concepts called Concepts
include {{dak_name}}Common called Common
"""
)

# Suggested CQL Templates
collection_observation_template = env.from_string(
    """define "{{element['label']}} Observation":
    [Observation: Concepts."{{element['label']}}"] O 
    where O.status in { 'final', 'amended', 'corrected' }
"""
)

element_observation_template = env.from_string(
    """"{{element['collection_label']}} O
    where O.value ~ Concepts."{{element['label']}}"
"""
)

condition_template = env.from_string("""[Condition: Concepts."{{element['label']}}"]""")


class ElementsCqlGenerator:
    """
    Generates CQL element libraries based on data dictionary and indicator files.

    Referenced SOPs:
     - https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html#elements-library
     - https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html#encounter-and-indicator-elements-libraries

    This class creates template CQL for data elements in the DAK Data Dictionary (DAK_DD)

    Example CQL is generated  CQL for DAK_DD Coding and Codes elements with the contrived assumption that
    the data would be stored as a FHIR observation or condition, and the base element would be a OR
    expression of the condition or observation.

    IndicatorElements file is generated with the contrived assumption that the entries
    only differ from the base entries by adding a filter to the base elements
    against the provided measurement period.

    EncounterElements file is generated with the contrived assumption that Encounter definitions
    only differ from the base entries by adding a filter to the base elements
    for the provider encounter and date.

    These templates should be replaced with the relevant CQL logic during the authoring process.
    """

    def __init__(self, data_dictionary_file: str):
        self.dd_xlsx = pd.read_excel(data_dictionary_file, sheet_name=None)

        self.dak_name = get_dak_name(self.data_dictionary_xls)

        self.concept_lookup, self.cql_concept_dictionary = (
            create_cql_concept_dictionaries(self.data_dictionary_xls, self.dak_name)
        )

    def generate_cql_element_libraries(self, output_dir: str):
        """
        Generates CQL element libraries and writes them to the specified output directory.

        Args:
            output_dir (str): The directory where the CQL element libraries will be written.
        """
        encounter_library_name = f"{self.dak_name}EncounterElements"
        encounter_file_name = f"{encounter_library_name}.cql"

        indicator_library_name = f"{self.dak_name}IndicatorElements"
        indicator_file_name = f"{indicator_library_name}.cql"

        label_frequency: dict[str, int] = {}
        label_sheet_frequency: dict[(str, str), int] = {}

        # Collapse concept_details["label"] to count frequency
        for concept_id, concept_details in self.cql_concept_dictionary.items():
            if pd.isna(concept_details["label"]) or not concept_details["label"]:
                continue

            concept_details["label"] = re.sub(r"[\'\"()]", "", concept_details["label"])
            if concept_details["label"] not in label_frequency:
                label_frequency[concept_details["label"]] = 1
            else:
                label_frequency[concept_details["label"]] += 1

            if (
                concept_details["label"],
                concept_details["sheet"],
            ) not in label_sheet_frequency:
                label_sheet_frequency[
                    concept_details["label"], concept_details["sheet"]
                ] = 1
            else:
                label_sheet_frequency[
                    concept_details["label"], concept_details["sheet"]
                ] += 1
        with open(f"{output_dir}/{concept_file_name}", "w") as file:
            file.write("// Automatically generated from DAK Data Dictionary\n")
            file.write(f"library {library_name}\n")
            file.write(
                f"codesystem \"{library_name}\": 'http://smart.who.int/{self.dak_name.lower()}/CodeSystem/{library_name}'\n\n"
            )

            # Write valuesets
            for concept_id, concept_details in self.cql_concept_dictionary.items():
                if concept_details["data_type"] == "Coding":
                    label_str = self.get_concept_label(
                        label_frequency,
                        label_sheet_frequency,
                        concept_id,
                        concept_details,
                    )
                    file.write(
                        f"valueset \"{label_str}\": 'http://smart.who.int/{self.dak_name.lower()}/ValueSet/{concept_id}'\n"
                    )
            file.write("\n")

            # Write codes
            for concept_id, concept_details in self.cql_concept_dictionary.items():
                label_str = self.get_concept_label(
                    label_frequency,
                    label_sheet_frequency,
                    concept_id,
                    concept_details,
                )

                if concept_details["data_type"] == "Coding":
                    label_str = label_str + " - Coding"

                # Handle NAN for concept id
                if pd.isna(concept_id):
                    continue

                file.write(
                    f"code \"{label_str}\": '{concept_id}' from \"{library_name}\" display '{concept_details['label']}'\n"
                )
