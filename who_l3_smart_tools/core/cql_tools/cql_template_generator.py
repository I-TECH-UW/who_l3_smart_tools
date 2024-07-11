from typing import Any
import stringcase
import pandas as pd
from jinja2 import Environment, FileSystemLoader, select_autoescape

from who_l3_smart_tools.utils.cql_helpers import (
    determine_scoring_suggestion,
    get_dak_name,
    create_cql_concept_dictionaries,
)

# Initialize Jinja2 environment
env = Environment(
    loader=FileSystemLoader("."), autoescape=select_autoescape(["html", "xml"])
)

# AutoGen Markers
start_marker = "/* AUTO-GENERATED START */"
end_marker = "/* AUTO-GENERATED END */"

# Templates
master_template = env.from_string(
    """
{{start_marker}}
/**
 * CQL Indicator File
 */

{{ header }}
                                  
{% if proportion %}
  {{ proportion }}
{% elif continuous_variable %}
  {{ continuous_variable }}
{% endif %}
{{end_marker}}

{% if dissagrations %}
    {{ disaggregations }}
{% endif %}
"""
)

header_template = env.from_string(
    """
/**
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

proportion_template = env.from_string(
    """
/**
 * Proportion Template
 */

{{ initial_population }}

{{ numerator }}

{{ denominator }}
"""
)

continuous_variable_template = env.from_string(
    """
/**
 * Continuous Variable Template
 */

{{ initial_population }}

{{ measure_population }}

{{ measure_observation }}
"""
)

measure_observation_template = env.from_string(
    """                                         
/**
 * Measure Observation Template
 */

define "Measure Observation":
  true                                     
"""
)

cql_file_initial_population_template = env.from_string(
    """
/*
 *Initial Population
 */

define "Initial Population":
  true
"""
)

cql_file_numerator_template = env.from_string(
    """
/**
 * Numerator
 * 
 * Definition: {{ numerator_definition }}
 * Calculation: {{ numerator_calculation }}
 */

define "Numerator":
  true
"""
)

cql_file_denominator_template = env.from_string(
    """                                          
/**
 * Denominator
 *
 * Definition: {{ denominator_definition }}
 * Calculation: {{ denominator_calculation }}
 */

define "Denominator":
  true
"""
)

cql_file_measure_population_template = env.from_string(
    """                                           
/**
 * Measure Population
 *
 * Definition: {{ measure_population_definition }}
 * Calculation: {{ measure_population_calculation }}
 */
                                                       
define "Measure Population":
  true
"""
)

cql_file_measure_observation_template = env.from_string(
    """
/**
 * Measure Observation
 * Definition:
 * Calculation:                                                       
 */     

define function "Measure Observation"(Patient "Patient"):
  1
"""
)

cql_file_disaggregations_template = env.from_string(
    """
/**
 * Disaggregators
 * 
 */
{% for disaggregation in disaggregations %}
define "{{ disaggregation.name }}":
  HIC."{{ disaggregation.name }} Stratifier"
"""
)


class CqlTemplateGenerator:
    """
    This class represents a CQL template generator that is used to generate CQL scaffolds for each indicator in the DAK.

    Attributes:
        indicator_artifact_file (str): The path to the indicator artifact file.
        data_dictionary_file (str): The path to the data dictionary file.
        cql_scaffolds (dict[str, str]): A dictionary containing the generated CQL scaffolds, with indicator names as keys and scaffolds as values.
        concept_lookup (dict[str, Any]): A dictionary containing the concept lookup data.
        cql_concept_dictionary (dict[str, Any]): A dictionary containing the CQL concept dictionary data.
        data_dictionary_xls (pd.ExcelFile): The data dictionary Excel file.
        indicator_artifact (pd.DataFrame): The indicator artifact data frame.
        dak_name (str): The DAK name.

    There is limited regeneration of existing CQL files. The header section up to the // AUTO-GENERATED END comment is updated.

    The other sections are updated only if the input file is empty after the AUTO-GENERATED END comment. Otherwise, a new file is created with a
    -AG suffix.

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
            create_cql_concept_dictionaries()
        )

    def print_to_files(self, output_dir: str, update_existing: bool = True):
        """
        This method writes the CQL scaffolds to files in the output directory.

        Args:
            output_dir (str): The directory where the CQL files will be written.
            update_existing (bool, optional): Whether to update existing files or create new ones. Defaults to True.
        """
        last_generated_line = [
            "include FHIRCommon called FC\n",
            "using FHIR version '4.0.1'\n",
        ]

        for indicator_name, scaffold in self.cql_scaffolds.items():
            file_name = indicator_name.replace(".", "")
            output_file_contents = scaffold

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
                    output_file_contents += "".join(
                        lines[last_generated_line_index + 1 :]
                    )

            with open(f"{output_dir}/{file_name}Logic.cql", "w") as file:
                file.write(output_file_contents)

    def generate_cql_scaffolds(self):
        """
        This method generates CQL scaffolds for each indicator in the DAK.

        Returns:
            dict[str, str]: A dictionary containing the generated CQL scaffolds, with indicator names as keys and scaffolds as values.
        """

        # Generate CQL scaffolds for each indicator
        cql_scaffolds: dict[str, str] = {}

        for index, row in self.indicator_artifact.iterrows():
            if row["Included in DAK"]:
                indicator_name, scaffold = self.generate_cql_indicator_file(row)
                cql_scaffolds[indicator_name] = scaffold

        self.cql_scaffolds = cql_scaffolds

        return cql_scaffolds

    def generate_cql_header(self, row_content: pd.Series):
        """
        This method provides scaffolding for CQL templates that includes
        indicator details from the DAK to facilitate CQL authoring.

        Args:
            row_content (pd.Series): The row content containing indicator details.

        Returns:
            tuple[str, str]: A tuple containing the DAK ID and the filled CQL header template.
        """
        # ... (rest of the code)


# Example usage
generator = CqlTemplateGenerator("indicator_artifact.xlsx", "data_dictionary.xlsx")
generator.generate_cql_scaffolds()
generator.print_to_files("output_dir")
