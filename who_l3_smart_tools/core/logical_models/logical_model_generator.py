import pandas as pd
import argparse
import stringcase
import os
import re
import datetime

# TODO: differentiate between Coding, code, and CodableConcept
# Boolean
# String
# Date
# Time
# DateTime
# ID
# Quantity
# Signature
# Attachment
# Coding
# Codes
data_type_map = {
    "Boolean": "boolean",
    "String": "string",
    "Date": "date",
    "DateTime": "dateTime",
    "Coding": "Coding",
    "ID": "Identifier",
    "Quantity": "integer",
}

fsh_invariant_template = """
Invariant:    {invariant_id}
Description:  "{description}"
Expression:   "{expression}"
Severity:     #error
"""

fsh_header_template = """
Logical: {name}
Title: "{title}"
Description: "{description}"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^experimental = true
* ^name = "{name}"
* ^status = #active"""

# Template for element definitions in FSH, including a placeholder for invariants
# * severelyImmunosuppressed 1..1 boolean "Severely immunosuppressed" "The client is known to be severely immunocompromised or immunosuppressed"
# * ^code[+] = IMMZConcepts#D1.DE92
# * artStartDate 1..1 date "ART start date" "The date on which the client started or restarted antiretroviral therapy (ART)"
# * ^code[+] = IMMZConcepts#D1.DE49
fsh_element_template = """
* {labelCamel} {cardinality} {data_type} "{label}" "{description}" """

fsh_validation_element_template = """
  * obeys {validation_id}"""

# `Coding`` will be the first entry, followed by n `Codes` rows.
# We use the valueset named after the row name, and skip the `Codes` values, since
# they are in the terminology
#
# * hivStatus 0..1 Coding "HIV status" "The current human immunodeficiency virus (HIV) status of the client"
# * ^code[+] = IMMZConcepts#D1.DE10
# * hivStatus from IMMZ.D1.DE10

fsh_valueset_element_tempalte = """
  * {label} from {valueset}" """

fsh_coding_element_template = """
  * ^code[+] = {code} """


class LogicalModelGenerator:
    def __init__(self, input_file, output_dir):
        self.input_file = input_file
        self.output_dir = output_dir

    def generate_fsh_from_excel(self):
        # Load the Excel file
        dd_xls = pd.read_excel(self.input_file, sheet_name=None)

        # Process the Cover sheet
        cover_info = self.process_cover(dd_xls["COVER"])

        validation_lookup = {}

        # Iterate over each sheet in the Excel file and generate a FSH logical model for each one

        for sheet_name in dd_xls.keys():
            if re.match(r"HIV\.\w+", sheet_name):
                print(f"Processing sheet: {sheet_name}")

                df = dd_xls[sheet_name]
                clean_name = stringcase.alphanumcase(sheet_name)
                short_name = (sheet_name.split(" ")[0]).split(".")

                # Initialize the FSH artifact
                fsh_artifact = ""

                # Process Invariants First
                # Get all unique validation conditions, and store their assigned rows
                validations = self.parse_validations(df)

                # Template for invariants based on validation conditions
                for i, (validation, data_ids) in enumerate(validations.items()):
                    invariant_id = f"{short_name[0]}-{short_name[1]}-{i+1}"
                    description = validation
                    expression = "<NOT-IMPLEMENTED>"
                    fsh_artifact += fsh_invariant_template.format(
                        invariant_id=invariant_id,
                        description=description,
                        expression=expression,
                    )
                    for data_element_id in data_ids:
                        validation_lookup[data_element_id] = invariant_id

                # Generate the FSH logical model header based on the sheet name
                fsh_header = fsh_header_template.format(
                    name=clean_name,
                    title=sheet_name,
                    description=cover_info[sheet_name.upper()],
                )

                fsh_artifact += fsh_header

                # Set code system
                code_system = "HIVConcepts"

                for i, row in df.iterrows():
                    de_id = row["Data Element ID"]
                    if not de_id or type(de_id) != str:
                        continue

                    # Process general fields
                    data_element_id = row["Data Element ID"].split(".")
                    data_type = row["Data Type"]
                    label = row["Data Element Label"]

                    if label and type(label) == str:
                        label_camel = stringcase.camelcase(label.replace(" ", "_"))
                    else:
                        label_camel = ""
                    code_sys_ref = f"{code_system}#{'.'.join(data_element_id[1:])}"
                    description = row["Description and Definition"]

                    required = row["Required"]

                    if required == "C":
                        required_condition = row["Explain Conditionality"]

                    # If row is a value in a valueset, skip since the info is in Terminology
                    if data_type == "Codes":
                        continue

                    # Process as a normal entry
                    fsh_artifact += fsh_element_template.format(
                        labelCamel=label_camel,
                        cardinality=self.map_cardinality(required),
                        data_type=self.map_data_type(data_type),
                        label=label,
                        description=description,
                    )

                    # Add validation if needed
                    if row["Data Element ID"] in validation_lookup.keys():
                        fsh_artifact += fsh_validation_element_template.format(
                            validation_id=validation_lookup[row["Data Element ID"]]
                        )

                    # Add Terminology reference
                    fsh_artifact += fsh_coding_element_template.format(
                        code=code_sys_ref
                    )

                    # Process Coding/Codes/Input Options with ValueSets
                    if data_type == "Coding":
                        fsh_artifact += fsh_valueset_element_tempalte.format(
                            label=label_camel, valueset=row["Data Element ID"]
                        )

                print(fsh_artifact)

                output_file = os.path.join(
                    self.output_dir, f"{stringcase.alphanumcase(sheet_name)}.fsh"
                )

                with open(output_file, "w") as f:
                    f.write(fsh_artifact)

    ### Helpers
    def process_cover(self, cover_df):
        row_iterator = cover_df.iterrows()
        cover_data = {}

        # loop until header row reached
        for i, row in row_iterator:
            print(row.iloc[0])
            if row.iloc[0] and type(row.iloc[0]) == str:
                if re.match(r"sheet name", row.iloc[0], re.IGNORECASE):
                    break

        for i, row in row_iterator:
            sheet_name = row.iloc[0]
            description = row.iloc[1]

            if type(row.iloc[0]) == str and row.iloc[0] != "":
                cover_data[sheet_name.upper()] = description
            else:
                break

        return cover_data

    ###

    def map_data_type(self, data_type_str):
        return data_type_map[data_type_str]

    def map_cardinality(self, card_str):
        if card_str == "R":
            return "1..1"
        else:
            return "0..1"

    def parse_validations(self, df):
        # unique_validations = set(df["Validation Condition"])
        valids = df.groupby("Validation Condition")["Data Element ID"].groups
        return valids
