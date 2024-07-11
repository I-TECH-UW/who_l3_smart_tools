import re
from typing import Any
import stringcase
import pandas as pd

from who_l3_smart_tools.utils.cql_helpers import (
    determine_scoring_suggestion,
    get_dak_name,
    create_cql_concept_dictionaries,
)


# Templates
cql_file_header_template = """/**
 * Library: {dak_id} Logic
 * Ref No: {ref_no_}
 * Short Name: {short_name}
 *
 * Definition: {indicator_definition}
 *
 * Numerator: {numerator_definition}
 * Numerator Calculation: {numerator_calculation}
 * Numerator Exclusions: {numerator_exclusions}
 *
 * Denominator: {denominator_definition}
 * Denominator Calculation: {denominator_calculation}
 * Denominator Exclusions: {denominator_exclusions}
 *
 * Disaggregations:
 """
cql_file_header_disaggregation_list_template = """* {disaggregation_description}
 """
cql_file_header_second_template = """* 
 * Disaggregation Elements: {disaggregation_data_elements}
 *
 * Numerator and Denominator Elements:
 * {list_of_all_data_elements_included_in_numerator_and_denominator}
 *
 * Reference: {reference}
 * 
 * Data Concepts:
 * """

cql_file_header_data_concept_template = """ 
 * {id}: {label} | {description}"""


cql_file_header_additional_context_template = """
 *
 * Additional Context
 * - what it measures: {what_it_measures}
 * - rationale: {rationale}
 * - method: {method_of_measurement}
 * 
 * Suggested Scoring Method: {scoring_method} | {scoring_instance}
 */

library {cql_library_name}

// Included Libraries
using FHIR version '4.0.1'

include HIVIndicatorCommon version '0.0.1' called HIC
include FHIRHelpers version '4.0.1'
include WHOCommon called WCom
include FHIRCommon called FC

// Indicator Definition
parameter "Measurement Period" Interval<Date> default Interval[@2023-01-01, @2020-01-30]

context Patient
"""

cql_file_initial_population_template = """
/*
 *Initial Population
 */

define "Initial Population":
  true
"""

cql_file_numerator_template = """
/**
 * Numerator: {numerator_definition}
 * Numerator Calculation: {numerator_calculation}
 */

define "Numerator":
  true 
"""

cql_file_denominator_template = """
/**
 * Denominator: {denominator_definition}
 * Denominator Calculation: {denominator_calculation}
 */

define "Denominator":
  true
"""

cql_file_measure_population_template = """
/**
 * Measure Population
 */

define "Measure Population":
  true
"""

class CqlTemplateGenerator:
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

        self.concept_lookup, self.cql_concept_dictionary = create_cql_concept_dictionaries()


    def print_to_files(self, output_dir: str, update_existing: bool = True):
        """
        This method writes the CQL scaffolds to files in the output directory.
        """
        last_generated_line = ["include FHIRCommon called FC\n", "using FHIR version '4.0.1'\n"]

        for indicator_name, scaffold in self.cql_scaffolds.items():
            file_name = indicator_name.replace(".", "")
            output_file_contents = scaffold

            # Update existing files, replacing the header and keeping the content
            if update_existing:
                with open(f"{output_dir}/{file_name}Logic.cql", "r") as file:
                    # Read up to the last generated line
                    lines = file.readlines()
                    last_generated_line_index = lines.index(last_generated_line[0]) if last_generated_line[0] in lines else lines.index(last_generated_line[1])
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
        """

        # Generate CQL scaffolds for each indicator
        cql_scaffolds: dict[str, str] = {}

        for index, row in self.indicator_artifact.iterrows():
            if row["Included in DAK"]:
                indicator_name, scaffold = self.generate_cql_header(row)
                cql_scaffolds[indicator_name] = scaffold

        self.cql_scaffolds = cql_scaffolds

        return cql_scaffolds

    def generate_cql_header(self, row_content: pd.Series):
        """
        This method provides scaffolding for CQL templates that includes
        indicator details from the DAK to facilitate CQL authoring.
        """

        # Columns: DAK ID	Ref no.	Short name	Indicator definition	Numerator calculation	Numerator exclusions	Denominator calculation	Denominator exclusions	Disaggregation data elements	List of all data elements included in numerator and denominator	Numerator definition	Denominator definition	Disaggregation description	Comments and references	Reference	Page no.	GAM2023 alignment	GF2022 alignment	MER2.6.1 alignment	WHO2020 alignment	Survey based	Included in DAK	Priority	Core	New	Updated	Category	What it measures	Rationale	Method of measurement
        # Column list:
        # - DAK ID
        # - Ref no.
        # - Short name
        # - Indicator definition
        # - Numerator calculation
        # - Numerator exclusions
        # - Denominator calculation
        # - Denominator exclusions
        # - Disaggregation data elements
        # - List of all data elements included in numerator and denominator
        # - Numerator definition
        # - Denominator definition
        # - Disaggregation description
        # - Comments and references
        # - Reference
        # - Page no.
        # - GAM2023 alignment
        # - GF2022 alignment
        # - MER2.6.1 alignment
        # - WHO2020 alignment
        # - Survey based
        # - Included in DAK
        # - Priority
        # - Core
        # - New
        # - Updated
        # - Category
        # - What it measures
        # - Rationale
        # - Method of measurement

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

        # Generate header using templates
        filled_template: str = cql_file_header_template.format(**row_dict)

        for disaggregation in disaggregation_data_elements:
            disaggregation = disaggregation.strip()
            filled_template += cql_file_header_disaggregation_list_template.format(
                disaggregation_description=disaggregation
            )

        filled_template += cql_file_header_second_template.format(**row_dict)

        if ref_no in self.concept_lookup.keys():
            for concept in self.concept_lookup[ref_no]:
                if pd.isna(concept["id"]):
                    continue
                filled_template += cql_file_header_data_concept_template.format(
                    **concept
                )

        filled_template += cql_file_header_additional_context_template.format(
            **row_dict
        )

        # Using the format method to fill in the template with row content
        return dak_id, filled_template
