from typing import Any

import pandas as pd

from who_l3_smart_tools.utils.cql_helpers import (
    create_cql_concept_dictionaries,
    get_concept_label,
    get_dak_name,
    count_label_frequencies,
)


class CqlFileGenerator:
    def __init__(self, data_dictionary_file: str):
        self.dak_name: str = None
        self.data_dictionary_file = data_dictionary_file

        self.concept_lookup: dict[str, Any] = {}
        self.cql_concept_dictionary: dict[str, Any] = {}

        self.data_dictionary_xls = pd.read_excel(
            self.data_dictionary_file, sheet_name=None
        )

        self.dak_name = get_dak_name(self.data_dictionary_xls)

        self.concept_lookup, self.cql_concept_dictionary = (
            create_cql_concept_dictionaries(self.data_dictionary_xls, self.dak_name)
        )

    def generate_cql_concept_library(self, output_dir: str):
        # Referenced SOP: https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html#concepts-library
        #
        # Parse the data dictionary and generate a CQL file with all relevant concepts
        # that can be referenced in the indicator CQL files and CDS CQL files
        #
        # Example valueset: `valueset "MCV Vaccine": 'http://smart.who.int/immunizations-measles/ValueSet/IMMZ.Z.DE9'`
        # Example code: `code "History of anaphylactic reactions": 'D4.DE166' from "IMMZConcepts" display 'History of anaphylactic reactions''`

        # Use the concept lookup dictionary to generate the CQL file
        library_name = f"{self.dak_name}Concepts"
        concept_file_name = f"{library_name}.cql"

        label_frequency, label_sheet_frequency = count_label_frequencies(
            self.cql_concept_dictionary
        )

        with open(f"{output_dir}/{concept_file_name}", "w") as file:
            file.write("// **Automatically generated from DAK Data Dictionary**\n")
            file.write(
                """
// This file contains all concepts from the Data Dictionary that are labeled
// as linked to Aggregate Indicators in the indicator CQL files and CDS CQL files.

// Valuesets reference the IG ValueSet definitions and are labeled with `Choices`
// Codes are provided for each Data Dictionary concept
// Specific Data Element IDs are appended to the label if the label is not unique within the DAK

"""
            )

            file.write(f"library {library_name}\n")
            file.write(
                f'codesystem "{library_name}": '
                f"'http://smart.who.int/{self.dak_name.lower()}/CodeSystem/{library_name}'\n\n"
            )

            # Write valuesets for Coding data types, and label as `Grouping`
            for concept_id, concept_details in self.cql_concept_dictionary.items():
                # if concept_details["linkage_type"] is None:
                #     continue
                if concept_details["data_type"] == "Coding":
                    label_str = get_concept_label(
                        label_frequency,
                        concept_id,
                        concept_details,
                    )
                    file.write(
                        f'valueset "{label_str} Choices": '
                        f"'http://smart.who.int/{self.dak_name.lower()}/ValueSet/{concept_id}'\n"
                    )
            file.write("\n")

            # Write codes
            for concept_id, concept_details in self.cql_concept_dictionary.items():
                if concept_details["linkage_type"] is None:
                    continue
                label_str = get_concept_label(
                    label_frequency,
                    concept_id,
                    concept_details,
                )

                file.write(
                    f"code \"{label_str}\": '{concept_id}' "
                    f"from \"{library_name}\" display '{concept_details['label']}'\n"
                )
