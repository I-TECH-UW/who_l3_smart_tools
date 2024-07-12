from typing import Any
import stringcase
import pandas as pd
from jinja2 import Environment, FileSystemLoader

from who_l3_smart_tools.utils.cql_helpers import (
    determine_scoring_suggestion,
    get_dak_name,
    create_cql_concept_dictionaries,
)

# Initialize Jinja2 environment
env = Environment(
    loader=FileSystemLoader("."), autoescape=False, trim_blocks=True, lstrip_blocks=True
)

# AutoGen Markers
start_marker = "/* AUTO-GENERATED START */"
end_marker = "/* AUTO-GENERATED END */"

# Templates
indicator_file_scaffold_template = env.from_string(
    """
{{ header }}
{{ default_content}}
"""
)

header_template = env.from_string(
    """/**
 * Library: {{ dak_id }} Logic
 * Ref No: {{ ref_no_ }}
 * Short Name: {{ short_name }}
 *
 * Definition: {{ indicator_definition }}
 *
 * Numerator: {{ numerator_definition }}
 * Numerator Calculation: {{ numerator_calculation }}
 * Numerator Exclusions: {{ numerator_exclusions }}
 *
 * Denominator: {{ denominator_definition }}
 * Denominator Calculation: {{ denominator_calculation }}
 * Denominator Exclusions: {{ denominator_exclusions }}
 *
 * Disaggregations:
{% for disaggregation in disaggregations %}
 * {{ disaggregation }}
{% endfor %}
 *
 * Disaggregation Elements: {{ disaggregation_data_elements }}
 *
 * Numerator and Denominator Elements:
{% for element in all_data_elements %}
 * {{ element }}
{% endfor %}
 *
 * Reference: {{ reference }}
 * 
 * Data Concepts:
{% for concept in data_concepts %}
 * {{ concept.id }}: {{ concept.label }} | {{ concept.description }}
{% endfor %}
 *
 * Additional Context
 * - what it measures: {{ what_it_measures }}
 * - rationale: {{ rationale }}
 * - method: {{ method_of_measurement }}
 * 
 * Suggested Scoring Method: {{ scoring_method }} | {{ scoring_instance }}
 */

library {{ cql_library_name }}

// Included Libraries
using FHIR version '4.0.1'

include HIVCommon version '0.0.1' called HIC
include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include WHOCommon called WCom

// Indicator Definition
parameter "Measurement Period" Interval<Date> default Interval[@2023-01-01, @2023-01-30]

context Patient
"""
)

default_content_template = env.from_string(
    """
/* Populations */
{% if proportion %}
{{ proportion }}
{% elif continuous_variable %}
{{ continuous_variable }}
{% endif %}
/* end Populations */

{% if dissagrations %}
{{ disaggregations }}
{% endif %}
"""
)

proportion_template = env.from_string(
    """
{{ initial_population }}

{{ numerator }}

{% if numerator_exclusions %}
{{ numerator_exclusions }}
{% endif %}

{{ denominator }}
    
{% if denominator_exclusions %}
{{ denominator_exclusions }}
{% endif %}
"""
)

continuous_variable_template = env.from_string(
    """
{{ initial_population }}

{{ measure_population }}

{% if measure_population_exclusions %}
{{ measure_population_exclusions }}
{% endif %}

{{ measure_observation }}
"""
)

cql_file_initial_population_template = env.from_string(
    """/*
 *Initial Population
 */

define "Initial Population":
  true
"""
)

cql_file_numerator_template = env.from_string(
    """/**
 * Numerator
 * 
 * Definition: {{ numerator_definition }}
 * Calculation: {{ numerator_calculation }}
 */

define "Numerator":
  true
"""
)

cql_file_numerator_exclusions_template = env.from_string(
    """/**
 * Numerator Exclusions
 *
 * Calculation: {{ numerator_exclusions }}
 */
    
define "Numerator Exclusions":
  false
"""
)

cql_file_denominator_template = env.from_string(
    """/**
 * Denominator
 *
 * Definition: {{ denominator_definition }}
 * Calculation: {{ denominator_calculation }}
 */

define "Denominator":
  true
"""
)

cql_file_denominator_exclusions_template = env.from_string(
    """/**
* Denominator Exclusions
*
* Calculation: {{ denominator_exclusions }}
*/

define "Denominator Exclusions":
  false
"""
)

cql_file_measure_population_template = env.from_string(
    """/**
 * Measure Population
 *
 * Definition: {{ measure_population_definition }}
 * Calculation: {{ measure_population_calculation }}
 */
                                                       
define "Measure Population":
  true
"""
)

cql_file_measure_population_exclusions_template = env.from_string(
    """/**
 * Measure Population Exclusions
 *
 * Calculation: {{ measure_population_exclusions }}
 */
 define "Measure Population Exclusions":
    false
"""
)

cql_file_measure_observation_template = env.from_string(
    """/**
 * Measure Observation
 * Definition: {{ measure_observation_definition }}
 * Calculation: {{ measure_observation_calculation }}                                                      
 */     

define function "Measure Observation"(Patient "Patient"):
  1
"""
)

cql_file_disaggregations_template = env.from_string(
    """/**
 * Disaggregators
 * 
 */
{% for disaggregation in disaggregations %}
define "{{ disaggregation.name }}":
  HIC."{{ disaggregation.name }} Stratifier"
{% endfor %}
/* end Disaggregators */
"""
)


class CqlTemplateGenerator:
    """
    This class represents a CQL template generator that is used to generate CQL scaffolds for each indicator in the DAK.

    Attributes:
        indicator_artifact_file (str): The path to the indicator artifact file.
        data_dictionary_file (str): The path to the data dictionary file.
        cql_scaffolds (dict[str, str]): A dictionary containing the generated CQL scaffolds, with indicator names as 
        keys and scaffolds as values.
        concept_lookup (dict[str, Any]): A dictionary containing the concept lookup data.
        cql_concept_dictionary (dict[str, Any]): A dictionary containing the CQL concept dictionary data.
        data_dictionary_xls (pd.ExcelFile): The data dictionary Excel file.
        indicator_artifact (pd.DataFrame): The indicator artifact data frame.
        dak_name (str): The DAK name.

    There is limited regeneration of existing CQL files. The header section up to the 
    // AUTO-GENERATED END comment is updated.

    The other sections are updated only if the input file is empty after the AUTO-GENERATED END comment. 
    Otherwise, a new file is created with a .template suffix.

    """

    def __init__(self, indicator_artifact_file: str, data_dictionary_file: str):
        self.indicator_artifact_file = indicator_artifact_file
        self.data_dictionary_file = data_dictionary_file

        self.cql_scaffolds: dict[str, str] = {}
        self.concept_lookup: dict[str, Any] = {}
        self.cql_concept_dictionary: dict[str, Any] = {}

        self.data_dictionary_xls = pd.read_excel(
            self.data_dictionary_file, sheet_name=None
        )

        # Load the DAK
        self.indicator_artifact = pd.read_excel(
            self.indicator_artifact_file, sheet_name="Indicator definitions"
        )

        self.dak_name = get_dak_name(self.data_dictionary_xls)

        self.concept_lookup, self.cql_concept_dictionary = (
            create_cql_concept_dictionaries(self.data_dictionary_xls, self.dak_name)
        )

    def print_to_files(self, output_dir: str, update_existing: bool = True):
        """
        This method writes the CQL scaffolds to files in the output directory.

        Args:
            output_dir (str): The directory where the CQL files will be written.
            update_existing (bool, optional): Whether to update existing files or
            create new ones. Defaults to True.
        """

        # TODO: Settle on updating existing file strategy
        # last_generated_line = [
        #     "include FHIRCommon called FC\n",
        #     "using FHIR version '4.0.1'\n",
        # ]
        last_generated_line = [
            "context Patient\n",
            "// Indicator Definition\n",
        ]

        for indicator_name, scaffold in self.cql_scaffolds.items():
            file_name = indicator_name.replace(".", "")
            output_file_contents = ""
            additional_template_file_contents = ""
            create_template_file = False

            # Update existing files, replacing the header and keeping the content
            if update_existing:
                with open(f"{output_dir}/{file_name}Logic.cql", "r") as file:
                    # Read up to the last generated line
                    lines = file.readlines()
                    last_generated_line_index = (
                        lines.index(last_generated_line[0])
                        if last_generated_line[0] in lines
                        else lines.index(last_generated_line[1])
                    )
                    if last_generated_line_index == -1:
                        raise ValueError(
                            f"Could not find last generated line in {file_name}Logic.cql"
                        )

                    output_file_contents += scaffold["header"]
                    # Check if the file is empty after the last generated line
                    if len(lines) > last_generated_line_index + 1:
                        # File is not empty after the last generated line - update header and generate .template file
                        output_file_contents += "".join(
                            lines[last_generated_line_index + 1:]
                        )
                        create_template_file = True
                        additional_template_file_contents += (
                            scaffold["header"] + scaffold["default_content"]
                        )
                        additional_template_file_contents += "".join(
                            lines[last_generated_line_index + 1:]
                        )
                    else:
                        # File is empty after the last generated line
                        output_file_contents += scaffold["default_content"]

            with open(f"{output_dir}/{file_name}Logic.cql", "w") as file:
                file.write(output_file_contents)
            if create_template_file:
                # Create or Overwrite the .template file
                with open(
                    f"{output_dir}/suggested_templates/{file_name}Logic-template.cql",
                    "w",
                ) as file:
                    file.write(additional_template_file_contents)

    def generate_cql_scaffolds(self):
        """
        This method generates CQL scaffolds for each indicator in the DAK.

        Returns:
            dict[str, str]: A dictionary containing the generated CQL scaffolds, with indicator names 
            as keys and scaffolds as values.
        """

        # Generate CQL scaffolds for each indicator
        cql_scaffolds: dict[str, str] = {}

        for index, row in self.indicator_artifact.iterrows():
            if row["Included in DAK"]:
                indicator_name, scaffold = self.generate_cql_indicator_file(row)
                cql_scaffolds[indicator_name] = scaffold

        self.cql_scaffolds = cql_scaffolds

        return cql_scaffolds

    def generate_cql_indicator_file(self, row_content: pd.Series):
        """
        This method generates the complete CQL indicator file based on the provided row content.
        """
        # Convert row_content to a dictionary and process it to remove newlines
        raw_row_dict = row_content.to_dict()
        row_dict = {}

        dak_id: str = raw_row_dict["DAK ID"]
        cql_library_name = f"{dak_id.replace(".", "")}Logic"
        ref_no = raw_row_dict["Ref no."]
        denominator_val = raw_row_dict["Denominator calculation"]

        for key, value in raw_row_dict.items():
            if isinstance(value, list):
                value = " ".join(str(v) for v in value)
            if isinstance(value, str):
                value = value.replace("\n", " | ")
            if pd.isna(value):
                value = ""

            key = stringcase.snakecase(stringcase.lowercase(key))
            row_dict[key] = value

        # Add library name
        row_dict["cql_library_name"] = cql_library_name

        # get scoring variables using the determine_scoring method
        (
            row_dict["scoring_method"],
            row_dict["scoring_title"],
            row_dict["scoring_instance"],
        ) = determine_scoring_suggestion(denominator_val)

        # Dissagregation parsing
        disaggregation_data_elements = row_dict["disaggregation_description"].split("|")
        row_dict["disaggregations"] = disaggregation_data_elements

        # Data elements parsing
        all_data_elements = row_dict[
            "list_of_all_data_elements_included_in_numerator_and_denominator"
        ].split("|")
        row_dict["all_data_elements"] = all_data_elements

        # Data concepts
        if ref_no in self.concept_lookup.keys():
            row_dict["data_concepts"] = self.concept_lookup[ref_no]
        else:
            row_dict["data_concepts"] = []

        header = header_template.render(row_dict)

        # Proportion or continuous variable templates
        initial_population = cql_file_initial_population_template.render()

        proportion = None
        continuous_variable = None

        if row_dict["scoring_method"] == "proportion":
            numerator = cql_file_numerator_template.render(
                numerator_definition=row_dict["numerator_definition"],
                numerator_calculation=row_dict["numerator_calculation"],
            )
            denominator = cql_file_denominator_template.render(
                denominator_definition=row_dict["denominator_definition"],
                denominator_calculation=row_dict["denominator_calculation"],
            )
            if (
                row_dict["numerator_exclusions"]
                and row_dict["numerator_exclusions"] != ""
            ):
                numerator_exclusions = cql_file_numerator_exclusions_template.render(
                    numerator_exclusions=row_dict["numerator_exclusions"]
                )
            else:
                numerator_exclusions = None
            if (
                row_dict["denominator_exclusions"]
                and row_dict["denominator_exclusions"] != ""
            ):
                denominator_exclusions = (
                    cql_file_denominator_exclusions_template.render(
                        denominator_exclusions=row_dict["denominator_exclusions"]
                    )
                )
            else:
                denominator_exclusions = None
            proportion = proportion_template.render(
                initial_population=initial_population,
                numerator=numerator,
                denominator=denominator,
                numerator_exclusions=numerator_exclusions,
                denominator_exclusions=denominator_exclusions,
            )
        elif row_dict["scoring_method"] == "continuous-variable":
            measure_population = cql_file_measure_population_template.render(
                measure_population_definition=row_dict["numerator_definition"],
                measure_population_calculation=row_dict["numerator_definition"],
            )
            measure_observation = cql_file_measure_observation_template.render(
                measure_observation_definition=row_dict["numerator_definition"],
                measure_observation_calculation=row_dict["numerator_definition"],
            )
            if (
                row_dict["numerator_exclusions"]
                and row_dict["numerator_exclusions"] != ""
            ):
                measure_population_exclusions = (
                    cql_file_measure_population_exclusions_template.render(
                        measure_population_exclusions=row_dict["numerator_exclusions"]
                    )
                )
            else:
                measure_population_exclusions = None
            continuous_variable = continuous_variable_template.render(
                initial_population=initial_population,
                measure_population=measure_population,
                measure_observation=measure_observation,
                measure_population_exclusions=measure_population_exclusions,
            )
        dissagregations = cql_file_disaggregations_template.render(
            disaggregations=row_dict["disaggregation_data_elements"]
        )

        default_content = default_content_template.render(
            proportion=proportion,
            continuous_variable=continuous_variable,
            disaggregations=dissagregations,
        )
        indicator_file_content = {"header": header, "default_content": default_content}
        return row_content["DAK ID"], indicator_file_content
