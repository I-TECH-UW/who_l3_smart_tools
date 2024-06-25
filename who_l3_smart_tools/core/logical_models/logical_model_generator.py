import pandas as pd
import stringcase
import os
import re
import sys
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

fsh_invariant_template = """Invariant:    {invariant_id}
Description:  "{description}"
Expression:   "{expression}"
Severity:     #error
"""

fsh_lm_header_template = """Logical: {name}
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
fsh_lm_element_template = """
* {label_camel} {cardinality} {data_type} "{label}" "{description}" """.rstrip()

fsh_lm_validation_element_template = """
  * obeys {validation_id}"""

# `Coding`` will be the first entry, followed by n `Codes` rows.
# We use the valueset named after the row name, and skip the `Codes` values, since
# they are in the terminology
#
# * hivStatus 0..1 Coding "HIV status" "The current human immunodeficiency virus (HIV) status of the client"
# * ^code[+] = IMMZConcepts#D1.DE10
# * hivStatus from IMMZ.D1.DE10

fsh_lm_valueset_element_template = """
  * {label} from {valueset}"""

fsh_lm_coding_element_template = """
  * ^code[+] = {code}"""

fsh_cs_header_template = """CodeSystem: {code_system}
Title: "{title}"
Description: "{description}"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"
* ^experimental = true
* ^caseSensitive = false
"""

fsh_cs_code_template = """
* #{code} "{label}" "{description}" """.rstrip()

fsh_vs_header_temmplate = """ValueSet: {value_set}
Title: "{title}"
Description: "{description}"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"
* ^status = #active
* ^experimental = true
"""

fsh_vs_code_template = """
* {code} "{label}" """.rstrip()

# regular expression to strip characters that cannot be properly handled from the string
# basically, we try to remove "'s" and anything between parentheses
label_strip_re = re.compile(r"(?:|'s|\s*\([^)]*\))(?:\b|$)", re.IGNORECASE)

class LogicalModelAndTerminologyGenerator:
    def __init__(self, input_file, output_dir):
        self.input_file = input_file
        self.output_dir = output_dir
        self.models_dir = os.path.join(output_dir, "models")
        self.codesystem_dir = os.path.join(output_dir, "codesystems")
        self.valuesets_dir = os.path.join(output_dir, "valuesets")

    def generate_fsh_from_excel(self):
        # create output structure
        for dir in[self.models_dir, self.codesystem_dir, self.valuesets_dir]:
            if not os.path.exists(dir):
                os.makedirs(dir)

        # Load the Excel file
        dd_xls = pd.read_excel(self.input_file, sheet_name=None)

        # Process the Cover sheet
        cover_info = self.process_cover(dd_xls["COVER"])

        # Code system name
        code_system = "HIVConcepts"
        # store the actual codes as we process them
        codes = []

        validation_lookup = {}

        # Iterate over each sheet in the Excel file and generate a FSH logical model for each one

        for sheet_name in dd_xls.keys():
            if re.match(r"HIV\.\w+", sheet_name):
                df = dd_xls[sheet_name]
                clean_name = stringcase.alphanumcase(sheet_name)
                short_name = (sheet_name.split(" ")[0]).split(".")

                # Initialize the FSH artifact
                fsh_artifact = ""

                # Initialize any ValueSets
                valuesets = []
                active_valueset = None

                # Process Invariants First
                # Get all unique validation conditions, and store their assigned rows
                validations = self.parse_validations(df)

                # Template for invariants based on validation conditions
                for i, (validation, data_ids) in enumerate(validations.items()):
                    invariant_id = f"{short_name[0]}-{short_name[1]}-{i + 1}"
                    if type(validation) == str:
                        description = validation.replace('"', "'")
                    else:
                        description = ""

                    expression = "<NOT-IMPLEMENTED>"
                    fsh_artifact += fsh_invariant_template.format(
                        invariant_id=invariant_id,
                        description=description,
                        expression=expression,
                    ) + "\n"

                    for data_element_id in data_ids:
                        validation_lookup[data_element_id] = invariant_id

                # Generate the FSH logical model header based on the sheet name
                fsh_header = fsh_lm_header_template.format(
                    name=clean_name,
                    title=sheet_name,
                    description=cover_info[sheet_name.upper()],
                ) + "\n"

                fsh_artifact += fsh_header

                for i, row in df.iterrows():
                    de_id = row["Data Element ID"]
                    if type(de_id) != str or not de_id:
                        continue

                    # Process general fields
                    multiple_choice_type = row["Multiple Choice Type (if applicable)"]
                    data_type = row["Data Type"]
                    label = row["Data Element Label"]

                    if type(label) == str and label:
                        # equalize spaces
                        label = label.strip().replace('*', '').replace('[', '').replace(']', '').replace('"', "'")

                        # remove special characters that aren't handled by stringcase properly
                        # also lower-case everything
                        label_clean = label_strip_re.sub("", label).replace("-", "_").replace("/", "_").replace(" ", "_").lower()

                        label_camel = stringcase.camelcase(label_clean)
                    else:
                        label = ""
                        label_camel = ""

                    code_sys_ref = f"{code_system}#{de_id}"
                    description = row["Description and Definition"]

                    if type(description) == str:
                        description = description.replace("*", "").replace('"', "'")
                    else:
                        description = ""

                    required = row["Required"]

                    if required == "C":
                        required_condition = row["Explain Conditionality"]

                    codes.append({
                        "code": de_id,
                        "label": label,
                        "description": description
                    })

                    # handle ValueSets
                    # First we identify a ValueSet
                    if data_type == "Coding" and multiple_choice_type in ["Select one", "Select all that apply"]:
                        active_valueset = {
                            "value_set": de_id,
                            "title": f"{label} ValueSet",
                            "description": f"Value set of {description[0].lower() + description[1:] if description[0].isupper() and not description.startswith("HIV") else description}",
                            "codes": []
                        }
                        valuesets.append(active_valueset)
                    # Then we identify the codes for the ValueSet
                    elif data_type == "Codes" and multiple_choice_type == "Input Option":
                        if active_valueset is None:
                            print(f"Attempted to create a member of a ValueSet without a ValueSet context for code {de_id}", sys.stderr)
                        else:
                            active_valueset['codes'].append({
                                "code": f"{code_system}#{de_id}",
                                "label": f"{label}"
                            })


                    # If row is a value in a valueset, skip since the info is in Terminology
                    if data_type == "Codes":
                        continue

                    # Process as a normal entry
                    fsh_artifact += fsh_lm_element_template.format(
                        label_camel=label_camel,
                        cardinality=self.map_cardinality(required, multiple_choice_type),
                        data_type=self.map_data_type(data_type),
                        label=label,
                        description=description,
                    )

                    # Add validation if needed
                    if de_id in validation_lookup.keys():
                        fsh_artifact += fsh_lm_validation_element_template.format(
                            validation_id=validation_lookup[de_id]
                        )

                    # Add Terminology reference
                    fsh_artifact += fsh_lm_coding_element_template.format(
                        code=code_sys_ref
                    )

                    # Process Coding/Codes/Input Options with ValueSets
                    if data_type == "Coding":
                        fsh_artifact += fsh_lm_valueset_element_template.format(
                            label=label_camel, valueset=de_id
                        )

                output_file = os.path.join(
                    self.models_dir, f"{stringcase.alphanumcase(sheet_name)}.fsh"
                )

                with open(output_file, "w") as f:
                    f.write(fsh_artifact + "\n")

                if len(valuesets) > 0:
                    for valueset in valuesets:
                        vs_artifact = fsh_vs_header_temmplate.format(**valueset)
                        for code in valueset["codes"]:
                            vs_artifact += fsh_vs_code_template.format(**code)

                        output_file = os.path.join(
                            self.valuesets_dir, f"{valueset["value_set"]}.fsh"
                        )

                        with open(output_file, "w") as f:
                            f.write(vs_artifact + "\n")

        if len(codes) > 0:
            code_system_artifact = fsh_cs_header_template.format(
                code_system = code_system,
                title = "WHO HIV DAK Concepts CodeSystem",
                description = "This code system defines the concepts used in the World Health Organization SMART HIV DAK"
            )

            for code in codes:
                code_system_artifact += fsh_cs_code_template.format(**code)

            code_system_output_file = os.path.join(
                self.codesystem_dir, "HIVConcepts.fsh"
            )

            with open(code_system_output_file, "w") as f:
                f.write(code_system_artifact + "\n")

    ### Helpers
    def process_cover(self, cover_df):
        cover_data = {}

        seen_header = False
        for i, row in cover_df.iterrows():
            if not seen_header:
                if row.iloc[0] and type(row.iloc[0]) == str and re.match(r"sheet\s*name", row.iloc[0], re.IGNORECASE):
                    seen_header = True
                continue

            if type(row.iloc[0]) == str and row.iloc[0] != "":
                key = row.iloc[0].upper()
                first_dot_idx = key.find('.')
                if first_dot_idx >= 0 and first_dot_idx < len(key):
                    if key[first_dot_idx + 1].isspace():
                        key = key[0:first_dot_idx] + '.' + key[first_dot_idx + 1:].lstrip()

                cover_data[key] = row.iloc[1]
            else:
                break

        return cover_data

    ###

    def map_data_type(self, data_type_str):
        return data_type_map[data_type_str]

    def map_cardinality(self, required_indicator, multiple_choice):
        minimum = "0"
        maximum = "1"

        if required_indicator == "R":
            minimum = "1"

        if multiple_choice == "Select all that apply":
            maximum = "*"

        return f"{minimum}..{maximum}"


    def parse_validations(self, df):
        # unique_validations = set(df["Validation Condition"])
        valids = df.groupby("Validation Condition")["Data Element ID"].groups
        return valids
