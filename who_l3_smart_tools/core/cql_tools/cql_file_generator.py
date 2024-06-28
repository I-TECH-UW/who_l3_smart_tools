import re
from typing import Any
import stringcase
import pandas as pd

from who_l3_smart_tools.utils.cql_helpers import determine_scoring

# Templates
cql_file_header_template = """
/*
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
 * {disaggregation_description}
 * Disaggregation Elements: {disaggregation_data_elements}
 *
 * Numerator and Denominator Elements:
 * {list_of_all_data_elements_included_in_numerator_and_denominator}
 *
 * Reference: {reference}
 * 
 * Data Concepts:
 """

cql_file_header_additional_context_template = """
 *
 * Additional Context
 * - what it measures: {what_it_measures}
 * - rationale: {rationale}
 * - method: {method_of_measurement}
 * 
 * Suggested Scoring Method: {scoring_method} | {scoring_title} | {scoring_instance}
 */
"""

cql_file_header_data_concept_template = """ 
 * {id}: {label} | {description}"""


class CqlFileGenerator:
    def __init__(self, indicator_artifact_file: str, data_dictionary_file: str):
        self.dak_name: str = None
        self.indicator_artifact_file = indicator_artifact_file
        self.data_dictionary_file = data_dictionary_file

        self.concept_lookup: dict[str, Any] = {}
        self.cql_concept_dictionary: dict[str, Any] = {}

        self.concept_lookup, self.cql_concept_dictionary = (
            self.create_cql_concept_dictionaries()
        )

    def print_to_files(self, output_dir: str):
        """
        This method writes the CQL scaffolds to files in the output directory.
        """
        for indicator_name, scaffold in self.cql_scaffolds.items():
            file_name = indicator_name.replace(".", "")
            with open(f"{output_dir}/{file_name}Logic.cql", "w") as file:
                file.write(scaffold)

    def create_cql_concept_dictionaries(self):
        """
        This method creates a dictionary of concepts from the data dictionary file to include in the CQL
        templates
        """

        # Create a dictionary of concepts
        indicator_concept_lookup = {}
        cql_concept_dictionary = {}

        dd_xls = pd.read_excel(self.data_dictionary_file, sheet_name=None)

        # Get DAK name from sheet names using regex to match
        # a sheet name like `HIV.A Registration` or `HIV.B HTS visit`
        # and grab the `HIV` part of the name
        # TODO: save as utility?
        dak_name_pattern = re.compile(r"(\w+)\.\w+")
        dak_name_matches = []

        for sheet_name in dd_xls.keys():
            if not sheet_name or pd.isna(sheet_name) or type(sheet_name) != str:
                continue
            matches = dak_name_pattern.search(sheet_name)
            dak_name_matches.extend(matches.groups()) if matches else None

        # Determine if all matches are the same
        if len(set(dak_name_matches)) == 1:
            self.dak_name = dak_name_matches[0]
        else:
            raise ValueError("DAK name does not match across all sheets")

        # TODO: refactor to common method across logic/terminology/this file
        for sheet_name in dd_xls.keys():
            if re.match(rf"{self.dak_name}\.\w+", sheet_name):
                df = dd_xls[sheet_name]
                for i, row in df.iterrows():
                    # Grab Linkages to Decision Support Tables and Aggregate Indicators
                    data_type = row["Data Type"]
                    data_element_id = row["Data Element ID"]

                    # Skip for individual valueset values
                    # if data_type == "Codes":
                    #     continue

                    cds = row["Linkages to Decision Support Tables"]
                    indicators = row["Linkages to Aggregate Indicators"]

                    # Handle label value == "None"
                    if row["Data Element Label"] is None or pd.isna(
                        row["Data Element Label"]
                    ):
                        print(f"Data Element Label is None for {data_element_id}")
                        row["Data Element Label"] = "None"

                    linkages = []
                    ## TODO: refactor to remove duplicate code for cds and indicators

                    # Select row if Linkage to CDS or Indicator is not empty
                    if cds and type(cds) == str and not pd.isna(cds):
                        # Grab: Data Element ID, Data Element Label, Description and Definition
                        # and index by indicator / cds ids

                        # Add to concept dictionary if not already present
                        if data_element_id not in cql_concept_dictionary.keys():
                            cql_concept_dictionary[data_element_id] = {
                                "label": row["Data Element Label"],
                                "sheet": sheet_name,
                                "data_type": data_type,
                                "description": row["Description and Definition"],
                            }

                        # Parse linkages
                        linkages.extend([item.strip() for item in cds.split(",")])
                    if (
                        indicators
                        and type(indicators) == str
                        and not pd.isna(indicators)
                    ):
                        # Add to concept dictionary if not already present
                        if data_element_id not in cql_concept_dictionary.keys():
                            cql_concept_dictionary[data_element_id] = {
                                "label": row["Data Element Label"],
                                "sheet": sheet_name,
                                "data_type": data_type,
                                "description": row["Description and Definition"],
                            }

                        linkages.extend(
                            [item.strip() for item in indicators.split(",")]
                        )

                    # Add linkages as keys to concept dictionary, and add data element details
                    for linkage in linkages:
                        # if linkage not in concept dictionary, add it
                        if linkage not in indicator_concept_lookup.keys():
                            indicator_concept_lookup[linkage] = []

                        # Add data element details to linkage
                        indicator_concept_lookup[linkage].append(
                            {
                                "id": row["Data Element ID"],
                                "label": row["Data Element Label"],
                                "description": row["Description and Definition"],
                            }
                        )

        return indicator_concept_lookup, cql_concept_dictionary

    def generate_cql_scaffolds(self):
        """
        This method generates CQL scaffolds for each indicator in the DAK.
        """
        # Load the DAK
        indicator_artifact = pd.read_excel(
            self.indicator_artifact_file, sheet_name="Indicator definitions"
        )

        # Generate CQL scaffolds for each indicator
        cql_scaffolds = {}

        for index, row in indicator_artifact.iterrows():
            if row["Included in DAK"]:
                indicator_name, scaffold = self.generate_cql_header(row)
                cql_scaffolds[indicator_name] = scaffold

        self.cql_scaffolds = cql_scaffolds

        return cql_scaffolds

    def generate_cql_header(self, row_content):
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

        dak_id = raw_row_dict["DAK ID"]
        ref_no = raw_row_dict["Ref no."]

        for key, value in raw_row_dict.items():
            if isinstance(value, list):
                value = " ".join(str(v) for v in value)
            if isinstance(value, str):
                value = value.replace("\n", " | ")
            if pd.isna(value):
                value = ""

            key = stringcase.snakecase(stringcase.lowercase(key))
            row_dict[key] = value

        filled_template = cql_file_header_template.format(**row_dict)

        # get scoring variables using the determine_scoring method
        (
            row_dict["scoring_method"],
            row_dict["scoring_title"],
            row_dict["scoring_instance"],
        ) = determine_scoring(self.parsed_cql)

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

    def generate_cql_concept_file(self, output_dir: str):
        # Parse the data dictionary and generate a CQL file with all relevant concepts
        # that can be referenced in the indicator CQL files and CDS CQL files
        #
        # Example valueset: `valueset "MCV Vaccine": 'http://smart.who.int/immunizations-measles/ValueSet/IMMZ.Z.DE9'`
        # Example code: `code "History of anaphylactic reactions": 'D4.DE166' from "IMMZConcepts" display 'History of anaphylactic reactions''`

        # Use the concept lookup dictionary to generate the CQL file
        library_name = f"{self.dak_name}Concepts"
        concept_file_name = f"{library_name}.cql"

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
                if concept_details["data_type"] != "Coding":
                    label_str = self.get_concept_label(
                        label_frequency,
                        label_sheet_frequency,
                        concept_id,
                        concept_details,
                    )

                    file.write(
                        f"code \"{label_str}\": '{concept_id}' from \"{library_name}\" display '{concept_details['label']}'\n"
                    )

    def get_concept_label(
        self, label_frequency, label_sheet_frequency, concept_id, concept_details
    ):
        if label_frequency[concept_details["label"]] == 1:
            label_str = concept_details["label"]
        else:
            label_str = f"{concept_details['label']} - {concept_id}"

        # if (
        #     label_sheet_frequency[concept_details["label"], concept_details["sheet"]]
        #     > 1
        # ):
        #     label_str += f" - {concept_id}"
        return label_str
