import pandas as pd


class ElementsTemplateGenerator:

    def __init__(self, data_dictionary_file: str, indicator_file: str):
        self.dd_xlsx = pd.read_excel(data_dictionary_file, sheet_name=None)
        self.indicator_xlsx = pd.read_excel(
            indicator_file, sheet_name="Indicator definitions"
        )

    def generate_cql_element_libraries(self, output_dir: str):
        # Referenced SOPs:
        # - https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html#elements-library
        # - https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html#encounter-and-indicator-elements-libraries

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
