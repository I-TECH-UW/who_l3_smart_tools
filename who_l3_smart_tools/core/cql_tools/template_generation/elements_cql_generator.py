import pandas as pd
from jinja2 import Environment, FileSystemLoader, Template

from who_l3_smart_tools.utils.cql_helpers import (
    count_label_frequencies,
    create_cql_concept_dictionaries,
    get_concept_label,
    get_dak_name,
    sanitize_description,
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
{% if element['data_type'] == 'Coding' %}
define "{{element['label']}} Observation":
  [Observation: Concepts."{{element['label']}}"] O
    where O.status in { 'final', 'amended', 'corrected' }
{% elif element['data_type'] == 'Codes' %}
define "{{element['label']}}":
  exists "{{element['label']}} Condition"
    or exists "{{element['label']}} Observation"
define "{{element['label']}} Condition":
  [Condition: Concepts."{{element['label']}}"]
define "{{element['label']}} Observation":
  [Observation: Concepts."{{element['collection_label']}}"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."{{element['label']}}"
{% else %}
define "{{element['label']}}":
  [Observation: Concepts."{{element['label']}}"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
{% endif %}
/* End of {{element['label']}} */

{% endfor %}

/*
 * Custom elements and logic for use DT and IND CQL Libraries
 */
"""
)
indicator_elements_library_template = env.from_string(
    """library {{dak_name}}IndicatorElements

{{ elements_library_includes }}
include {{dak_name}}Elements called Elements

parameter "Measurement Period" Interval<Date> default Interval[@2024-01-01, @2024-12-30]

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
{% if element['data_type'] == 'Coding' %}
define "{{element['label']}} Observation":
  Elements."{{element['label']}} Observation" O
    where O.effective.ToInterval() during "Measurement Period"
{% elif element['data_type'] == 'Codes' %}
define "{{element['label']}}":
  exists "{{element['label']}} Condition"
    or exists "{{element['label']}} Observation"
define "{{element['label']}} Condition":
  Elements."{{element['label']}} Condition" C
    where C.toPrevalenceInterval() overlaps before "Measurement Period"
      or C.toPrevalenceInterval() overlaps after "Measurement Period"
define "{{element['label']}} Observation":
  Elements."{{element['label']}} Observation" O
    where O.effective.ToInterval() during "Measurement Period"
{% else %}
define "{{element['label']}}":
  Elements."{{element['label']}}" O
    where O.effective.ToInterval() during "Measurement Period"
    return O.value
{% endif %}
/* End of {{element['label']}} */

{% endfor %}

/*
 * Custom elements and logic for use DT and IND CQL Libraries
 */
"""
)

encounter_elements_library_template = env.from_string(
    """library {{dak_name}}EncounterElements

{{ elements_library_includes }}
include {{dak_name}}Elements called Elements

parameter Today Date default Today()
parameter EncounterId String

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
{% if element['data_type'] == 'Coding' %}
define "{{element['label']}} Observation":
  Elements."{{element['label']}} Observation" O
    where O.encounter.references(EncounterId)
      or O.effective.toInterval() starts on or before Today
{% elif element['data_type'] == 'Codes' %}
define "{{element['label']}}":
  exists "{{element['label']}} Condition"
    or exists "{{element['label']}} Observation"
define "{{element['label']}} Condition":
  Elements."{{element['label']}} Condition" C
    where C.prevalenceInterval() starts on or before Today
define "{{element['label']}} Observation":
  Elements."{{element['label']}} Observation" O
    where O.encounter.references(EncounterId)
      or O.effective.toInterval() starts on or before Today
{% else %}
define "{{element['label']}} Observation":
  Elements."{{element['label']}}" O
    where O.encounter.references(EncounterId)
      or O.effective.toInterval() starts on or before Today
    return O.value
{% endif %}
/* End of {{element['label']}} */

{% endfor %}

/*
 * Custom elements and logic for use DT and IND CQL Libraries
 */
"""
)

# Header Template
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


class ElementsCqlGenerator:
    """
    Generates CQL element libraries based on data dictionary and indicator files.

    Referenced SOPs:
     - https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html#elements-library
     - https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html#encounter-and-indicator-elements-libraries

    This class creates template CQL for data elements in the DAK Data Dictionary (DAK_DD)

    Example CQL is generated  CQL for DAK_DD Date Elements with the contrived assumption that
    the data would be stored as a FHIR observation or condition, and the base element would be a OR
    expression of the condition or observation.

    IndicatorElements file is generated with the contrived assumption that the entries
    only differ from the base entries by adding a filter to the base elements
    against the provided measurement period.

    EncounterElements file is generated with the contrived assumption that Encounter definitions
    only differ from the base entries by adding a filter to the base elements
    for the provider encounter and date.

    Example CQL is also based on the Data Type of the DAK_DD element:
    1. Boolean: Observation of given code
    2. Coding: Observation of given code
    3. Codes: Condition of given code and Observation of parent Coding and value of given code
    4. String: Observation of given code
    5. Date: Observation of given code
    6. DateTime: Observation of given code
    7. Quantity: Observation of given code
    8. ID: Not implemented

    These templates should be replaced with the relevant CQL logic during the authoring process.
    """

    def __init__(self, data_dictionary_file: str):
        self.dd_xlsx = pd.read_excel(data_dictionary_file, sheet_name=None)

        self.dak_name = get_dak_name(self.dd_xlsx)

        self.concept_lookup, self.cql_concept_dictionary = (
            create_cql_concept_dictionaries(self.dd_xlsx, self.dak_name)
        )

    def generate_cql_element_libraries(self, output_dir: str):
        """
        Generates CQL element libraries and writes them to the specified output directory.

        Args:
            output_dir (str): The directory where the CQL element libraries will be written.
        """
        elements_library_name = f"{self.dak_name}Elements"
        elements_file_name = f"{elements_library_name}.cql"

        encounter_elements_library_name = f"{self.dak_name}EncounterElements"
        encounter_file_name = f"{encounter_elements_library_name}.cql"

        indicator_elements_library_name = f"{self.dak_name}IndicatorElements"
        indicator_elements_file_name = f"{indicator_elements_library_name}.cql"

        # Get label frequency counts
        label_frequency, label_sheet_frequency = count_label_frequencies(
            self.cql_concept_dictionary
        )

        # Render Header Template
        elements_library_includes = elements_library_includes_template.render(
            dak_name=self.dak_name
        )

        # Prepare variables for template rendering
        elements: list[dict] = []
        indicator_elements: list[dict] = []
        encounter_elements: list[dict] = []

        for concept_id, concept_details in self.cql_concept_dictionary.items():
            label_str = get_concept_label(
                label_frequency,
                label_sheet_frequency,
                concept_id,
                concept_details,
            )

            if concept_details["data_type"] == "Codes":
                collection_label_str = get_concept_label(
                    label_frequency,
                    label_sheet_frequency,
                    concept_details["parent_coding_id"],
                    concept_details,
                )
            else:
                collection_label_str = None

            element_dict = {
                "dak_id": concept_id,
                "label": label_str,
                "activity": sanitize_description(concept_details["activity"]),
                "description": sanitize_description(concept_details["description"]),
                "data_type": concept_details["data_type"],
                "collection_label": collection_label_str,
            }

            elements.append(element_dict)

            if concept_details["linkage_type"] == "indicator":
                indicator_elements.append(element_dict)

            if concept_details["linkage_type"] == "dt":
                encounter_elements.append(element_dict)

        # Write Elements Library
        self.write_elements_file(
            output_dir,
            elements_file_name,
            elements_library_template,
            elements_library_includes,
            elements,
        )

        # Write Indicator Elements Library
        self.write_elements_file(
            output_dir,
            indicator_elements_file_name,
            indicator_elements_library_template,
            elements_library_includes,
            indicator_elements,
        )

        # Write Encounter Elements Library
        self.write_elements_file(
            output_dir,
            encounter_file_name,
            encounter_elements_library_template,
            elements_library_includes,
            encounter_elements,
        )

    def write_elements_file(
        self,
        output_dir: str,
        file_name: str,
        template: Template,
        includes: str,
        elements: list[dict],
    ):
        """
        Writes a CQL elements file to the specified output directory.

        Args:
            output_dir (str): The directory where the CQL elements file will be written.
            file_name (str): The name of the CQL elements file.
            template (Template): The Jinja2 template to use for rendering the CQL elements file.
            includes (str): The includes to be added to the CQL elements file.
            elements (list[dict]): The elements to be added to the CQL elements file.
        """
        with open(f"{output_dir}/{file_name}", "w") as file:
            file.write(
                template.render(
                    dak_name=self.dak_name,
                    elements_library_includes=includes,
                    elements=elements,
                )
            )
