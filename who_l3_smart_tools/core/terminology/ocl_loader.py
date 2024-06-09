# This class processes the DAK data dictionary and loads the concepts and value sets
# into OCL.
#
# For now, the class generates a CSV file that can be uploaded to OCL using the bulk
# import feature. The class will be extended to use the FHIR-based OCL API and load
# the data directly into OCL.
#
# The work based on https://github.com/jamlung-ri/WHO-SMART-Guidelines and the
# python notebook provided in the repository.
#
# Example usage
# loader = OclLoader("path_to_data_dictionary.xlsx", "output_directory")
# loader.generate_ocl_csv()

import pandas as pd
import os
import re
import csv


class OclLoader:
    """
    This class processes the DAK data dictionary and loads the concepts and value sets
    into OCL.
    """

    def __init__(self, data_dictionary_file_path, output_dir):
        """
        Initialize the OclLoader object.
        :param data_dictionary_file_path: The path to the DAK data dictionary file.
        :param output_dir: The directory where the output files will be saved.
        """
        self.data_dictionary_file_path = data_dictionary_file_path
        self.output_dir = output_dir

        # Load the data dictionary into a pandas ExcelFile object.
        self.excel_file = pd.ExcelFile(data_dictionary_file_path)

        # Load relevant sheets into a dictionary of DataFrames.
        self.df_dict = self.load_data()

    def load_data(self):
        """
        Load the relevant sheets from the Excel file into a dictionary of DataFrames.
        """
        df_dict = {}
        pattern = re.compile(r"HIV\.[A-Z]")

        for sheet_name in self.excel_file.sheet_names:
            if pattern.match(sheet_name):
                df_dict[sheet_name] = self.excel_file.parse(sheet_name)

        return df_dict

    def transform_data(self, df):
        """
        Transform the DataFrame for OCL import.
        """
        col_rename_map = {
            "Activity ID": "attr:Activity_ID",
            "Data Element ID": "id",
            "Data Element Label": "name[1]",
            "Description and Definition": "description[1]",
            "Multiple Choice Type (if applicable)": "attr:Multiple_Choice_Type_(if_applicable)",
            "Data Type": "datatype",
            "Calculation": "attr:Calculation",
            "Quantity Sub-Type": "attr:Quantity_Sub-Type",
            "Validation Condition": "attr:Validation_Condition",
            "Editable": "attr:Editable",
            "Required": "attr:Required",
            "Skip Logic": "attr:Skip_Logic",
            "Linkages to Aggregate Indicators": "attr:Linkages_to_Aggregate_Indicators",
            "Notes": "attr:Notes",
            "ICD-11 URI": "attr:ICD-11_URI",
            "ICD-11 Comments / Considerations": "attr:ICD-11_Comments_Considerations",
            "ICD-11 Relationship": "map_type[0]",
            "ICD-10 Comments / Considerations": "attr:ICD-10_Comments_Considerations",
            "ICD-10 Relationship": "map_type[1]",
            "ICD-9 Comments / Considerations": "attr:ICD-9_Comments_Considerations",
            "ICD-9 Relationship": "map_type[2]",
            "LOINC version 2.68 Comments / Considerations": "attr:LOINC_version_2.68_Comments_Considerations",
            "LOINC version 2.68 Relationship": "map_type[3]",
            "ICHI URI": "attr:ICHI_URI",
            "ICHI Comments / Considerations": "attr:ICHI_Comments_Considerations",
            "ICHI Relationship": "map_type[4]",
            "ICF Comments / Considerations": "attr:ICF_Comments_Considerations",
            "ICF Relationship": "map_type[5]",
            "SNOMED GPS Code Comments Considerations": "attr:SNOMED_GPS_Code_Comments_Considerations",
            "SNOMED GPS Relationship": "map_type[6]",
            "SNOMED CT International Version Comments / Considerations": "attr:Snomed_CT_International_Version_Comments_Considerations",
            "SNOMED CT Relationship": "map_type[7]",
            "HL7 FHIR R4 - Resource": "attr:HL7_FHIR_R4_Resource",
            "HL7 FHIR R4 - Values": "attr:HL7_FHIR_R4_Values",
            "HL7 FHIR R4 Relationship": "map_type[8]",
            "ICD-11 Description": "attr:ICD-11_Description",
        }

        df.rename(columns=col_rename_map, inplace=True)
        df = df[list(col_rename_map.values())]

        # Prepping mappings for OCL CSV
        prefix_dict = {
            "map_to_concept_url[0]": "/orgs/WHO/sources/ICD-11-WHO/concepts/",
            "map_to_concept_url[1]": "/orgs/WHO/sources/ICD-10-WHO/concepts/",
            "map_to_concept_url[2]": "/orgs/WHO/sources/ICD-9-WHO/concepts/",
            "map_to_concept_url[3]": "/orgs/Regenstrief/sources/LOINC/concepts/",
            "map_to_concept_url[4]": "/orgs/WHO/sources/WHO-ICHI/concepts/",
            "map_to_concept_url[5]": "/orgs/WHO/sources/WHO-ICF/concepts/",
            "map_to_concept_url[6]": "/orgs/SNOMED-International/sources/SNOMED-GPS/concepts/",
            "map_to_concept_url[7]": "/orgs/IHTSDO/sources/SNOMED-CT/concepts/",
            "map_to_concept_url[9]": "/orgs/WHO/sources/WHOATC/concepts/",
        }

        for col, prefix in prefix_dict.items():
            if col in df.columns:
                df[col] = df[col].apply(
                    lambda x: (
                        ""
                        if "Not classifiable" in str(x)
                        else (prefix + str(x).split(" ")[0] if str(x) else "")
                    )
                )

        # Deal with HL7 codes to tie them to a code system
        url_dict = {
            "male": "/orgs/HL7/sources/administrative-gender/",
            "female": "/orgs/HL7/sources/administrative-gender/",
            "other": "/orgs/HL7/sources/administrative-gender/",
            "unknown": "/orgs/HL7/sources/administrative-gender/",
            "http://hl7.org/fhir/uv/ips/ValueSet/vaccines-gps-uv-ips": "http://hl7.org/fhir/uv/ips/ValueSet/vaccines-gps-uv-ips",
        }

        # Add URLs for HL7 codes
        for code, url in url_dict.items():
            df.loc[df["map_type[8]"] == code, "map_to_concept_url[8]"] = url + code

        return df

    def generate_ocl_csv(self):
        """
        Generate the concepts CSV file that can be loaded into OCL.
        """
        concepts_csv_file = os.path.join(self.output_dir, "concepts.csv")

        # Initialize a list to collect transformed data
        all_transformed_data = []

        for title, df in self.df_dict.items():
            transformed_df = self.transform_data(df)
            all_transformed_data.append(transformed_df)

        # Concatenate all transformed dataframes
        final_df = pd.concat(all_transformed_data, ignore_index=True)

        # Create OCL-required columns that don't have special logic
        final_df["external_id"] = ""
        final_df["version"] = "1.0"
        final_df["concept_class"] = "Question"
        final_df["source"] = "WHO-Digital-Adaptation-Kit"

        # Assign concept IDs for input options and other values without IDs
        final_df["id"] = final_df.apply(
            lambda row: (
                row["id"] if pd.notnull(row["id"]) else "no-id-" + str(row.name)
            ),
            axis=1,
        )

        # Deal with duplicate input options by keeping the latest one
        final_df.drop_duplicates(subset=["id"], keep="last", inplace=True)

        # Save the final dataframe to a CSV file
        final_df.to_csv(concepts_csv_file, index=False)

        print(f"Concepts CSV file generated: {concepts_csv_file}")
