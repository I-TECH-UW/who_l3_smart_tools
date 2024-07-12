from collections import defaultdict
import inflect
import pandas as pd
import stringcase
import os
import re
import sys
import datetime
from who_l3_smart_tools.utils import camel_case
from who_l3_smart_tools.utils.counter import Counter

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
* ^meta.profile[+] = "http://smart.who.int/base/StructureDefinition/SGLogicalModel"
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
* {element_name} {cardinality} {data_type} "{label}" "{description}" """.rstrip()

fsh_lm_validation_element_template = """
  * obeys {validation_id}"""

# `Coding`` will be the first entry, followed by n `Codes` rows.
# We use the valueset named after the row name, and skip the `Codes` values, since
# they are in the terminology
#
# * hivStatus 0..1 Coding "HIV status" "The current human immunodeficiency virus (HIV) status of the client"
# * ^code[+] = IMMZConcepts#D1.DE10
# * hivStatus from IMMZ.D1.DE10

fsh_lm_valueset_element_template = """\n* {label} from {valueset}"""

fsh_lm_coding_element_template = """
  * ^code[+] = {code}"""

fsh_cs_header_template = """CodeSystem: {code_system}
Title: "{title}"
Description: "{description}"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"
* ^meta.profile[+] = "http://smart.who.int/base/StructureDefinition/SGCodeSystem"
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
* ^meta.profile[+] = "http://smart.who.int/base/StructureDefinition/SGValueSet"
* ^status = #active
* ^experimental = true
* ^name = "{name}"
"""

fsh_vs_code_template = """
* {code} "{label}" """.rstrip()

inflect_engine = inflect.engine()


class LogicalModelAndTerminologyGenerator:
    def __init__(self, input_file, output_dir):
        self.input_file = input_file
        self.output_dir = output_dir
        self.models_dir = os.path.join(output_dir, "models")
        self.codesystem_dir = os.path.join(output_dir, "codesystems")
        self.valuesets_dir = os.path.join(output_dir, "valuesets")
        self.invariants_dict = defaultdict(lambda: Counter())

    def generate_fsh_from_excel(self):
        # create output structure
        for dir in [self.models_dir, self.codesystem_dir, self.valuesets_dir]:
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

                # hard-coded, but the page labelled E-F has no F codes
                if sheet_name == "HIV.E-F PMTCT":
                    cleaned_sheet_name = "HIV.E PMTCT"
                else:
                    cleaned_sheet_name = sheet_name

                clean_name = stringcase.alphanumcase(cleaned_sheet_name)
                short_name = (cleaned_sheet_name.split(" ")[0]).split(".")

                # Initialize the FSH artifact
                fsh_artifact = ""

                # Initialize any ValueSets
                valuesets = []
                active_valueset = None

                # Track element names
                existing_elements = defaultdict(lambda: Counter())

                # For handling "Other (specify)"
                previous_element_label = None

                # Process Invariants First
                # Get all unique validation conditions, and store their assigned rows
                validations = self.parse_validations(df)

                # Template for invariants based on validation conditions
                for validation, data_ids in validations.items():
                    id = self.invariants_dict[short_name[1]].next
                    invariant_id = f"{short_name[0]}-{short_name[1]}-{id}"
                    if type(validation) == str:
                        description = validation.replace('"', "'")
                    else:
                        description = ""

                    expression = "<NOT-IMPLEMENTED>"
                    fsh_artifact += (
                        fsh_invariant_template.format(
                            invariant_id=invariant_id,
                            description=description,
                            expression=expression,
                        )
                        + "\n"
                    )

                    for data_element_id in data_ids:
                        validation_lookup[data_element_id] = invariant_id

                # Generate the FSH logical model header based on the sheet name
                fsh_header = (
                    fsh_lm_header_template.format(
                        name=clean_name,
                        title=sheet_name,
                        description=cover_info[sheet_name.upper()],
                    )
                    + "\n"
                )

                fsh_artifact += fsh_header

                for i, row in df.iterrows():
                    data_element_id = row["Data Element ID"]
                    if type(data_element_id) != str or not data_element_id:
                        continue

                    # Process general fields
                    multiple_choice_type = row["Multiple Choice Type (if applicable)"]
                    data_type = row["Data Type"]
                    label = row["Data Element Label"]

                    if type(label) == str and label:
                        # Other (specify) elements come after a list as a data element to
                        # contain a non-coded selection
                        if label.lower() == "other (specify)":
                            if previous_element_label:
                                label_clean = f"Other_{previous_element_label.lower()}"
                            else:
                                label_clean = "Other (specify)"
                        else:

                            # equalize spaces
                            label = (
                                label.strip()
                                .replace("*", "")
                                .replace("[", "")
                                .replace("]", "")
                                .replace('"', "'")
                            )

                            # remove many special characters
                            label_clean = (
                                label.replace("(", "")
                                .replace(")", "")
                                .replace("'s", "")
                                .replace("-", "_")
                                .replace("/", "_")
                                .replace(",", "")
                                .replace(" ", "_")
                                .replace(">=", "more than")
                                .replace("<=", "less than")
                                .replace(">", "more than")
                                .replace("<", "less than")
                                .lower()
                            )
                    else:
                        label = ""
                        label_clean = ""

                    code_sys_ref = f"{code_system}#{data_element_id}"
                    description = row["Description and Definition"]

                    if type(description) == str:
                        description = description.replace("*", "").replace('"', "'")
                    else:
                        description = ""

                    required = row["Required"]

                    if required == "C":
                        required_condition = row["Explain Conditionality"]

                    codes.append(
                        {
                            "code": data_element_id,
                            "label": label,
                            "description": description,
                        }
                    )

                    # handle ValueSets
                    # First we identify a ValueSet
                    # Originally, this looked at the Multiple Choice Type, but that doesn't seem to be
                    # guaranteed to be meaningful
                    if data_type == "Coding":
                        active_valueset = {
                            "value_set": data_element_id,
                            "name": data_element_id.replace(".", ""),
                            "title": f"{label} ValueSet",
                            "description": f"Value set of {description[0].lower() + description[1:] if description[0].isupper() and not description.startswith('HIV') else description}",
                            "codes": [],
                        }
                        valuesets.append(active_valueset)
                    # Then we identify the codes for the ValueSet
                    elif (
                        data_type == "Codes" and multiple_choice_type == "Input Option"
                    ):
                        if active_valueset is None:
                            print(
                                f"Attempted to create a member of a ValueSet without a ValueSet context for code {data_element_id}",
                                sys.stderr,
                            )
                        else:
                            active_valueset["codes"].append(
                                {
                                    "code": f"{code_system}#{data_element_id}",
                                    "label": f"{label}",
                                }
                            )

                    # If row is a value in a valueset, skip since the info is in Terminology
                    if data_type == "Codes":
                        continue

                    # For any non-code we set the previous element name. This is used to determine the
                    # name for "Other (specify)" data elements
                    previous_element_label = label_clean

                    # The camel-case version of the label becomes the element name in the logical model
                    label_camel = camel_case(label_clean)

                    # valid element identifiers in FHIR must start with a alphabetical character
                    # therefore if an element starts with a number, we swap the spelt-out version of the
                    # number, using the inflect library
                    if len(label_camel) > 0 and not label_camel[0].isalpha():
                        try:
                            prefix, rest = re.split(r"(?=[a-zA-Z])", label_camel, 1)
                        except:
                            prefix, rest = label_camel, ""

                        if prefix.isnumeric():
                            prefix = camel_case(
                                inflect_engine.number_to_words(int(prefix)).replace(
                                    "-", "_"
                                )
                            )
                        else:
                            print(
                                "Did not know how to handle element prefix:",
                                sheet_name,
                                data_element_id,
                                prefix,
                                file=sys.stderr,
                            )

                        label_camel = f"{prefix}{rest}"

                    # data elements can only be 64 characters
                    # note that the idea here is that we trim whole words until reaching the desired size
                    if len(label_camel) > 64:
                        new_label_camel = ""
                        for label_part in re.split("(?=[A-Z1-9])", label_camel):
                            if len(new_label_camel) + len(label_part) > 64:
                                break

                            new_label_camel += label_part
                        label_camel = new_label_camel

                    # data elements names must be unique per logical model
                    count = existing_elements[label_camel].next

                    # we have a duplicate data element
                    if count > 1:
                        # the first element needs no suffix
                        # so the suffix is one less than the count
                        suffix = str(count - 1)

                        # if the data element id will still be less than 64 characters, we're ok
                        if len(label_camel) + len(suffix) <= 64:
                            label_camel += suffix
                        # otherwise, shorten the name to include the suffix
                        else:
                            label_camel = label_camel[: 64 - len(suffix)] + suffix

                    # Process as a normal entry
                    fsh_artifact += fsh_lm_element_template.format(
                        element_name=label_camel,
                        cardinality=self.map_cardinality(
                            required, multiple_choice_type
                        ),
                        data_type=self.map_data_type(data_type),
                        label=label,
                        description=description,
                    )

                    # Add validation if needed
                    if data_element_id in validation_lookup.keys():
                        fsh_artifact += fsh_lm_validation_element_template.format(
                            validation_id=validation_lookup[data_element_id]
                        )

                    # Add Terminology reference
                    fsh_artifact += fsh_lm_coding_element_template.format(
                        code=code_sys_ref
                    )

                    # Process Coding/Codes/Input Options with ValueSets
                    if data_type == "Coding":
                        fsh_artifact += fsh_lm_valueset_element_template.format(
                            label=label_camel, valueset=f"{data_element_id}"
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

                        if len(valueset["codes"]) > 0:
                            vs_artifact += "\n"

                        output_file = os.path.join(
                            self.valuesets_dir, f"{valueset['value_set']}.fsh"
                        )

                        with open(output_file, "w") as f:
                            f.write(vs_artifact)

        if len(codes) > 0:
            code_system_artifact = fsh_cs_header_template.format(
                code_system=code_system,
                title="WHO SMART HIV Concepts CodeSystem",
                description="This code system defines the concepts used in the World Health Organization SMART HIV DAK",
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
                if (
                    row.iloc[0]
                    and type(row.iloc[0]) == str
                    and re.match(r"sheet\s*name", row.iloc[0], re.IGNORECASE)
                ):
                    seen_header = True
                continue

            if type(row.iloc[0]) == str and row.iloc[0] != "":
                key = row.iloc[0].upper()
                first_dot_idx = key.find(".")
                if first_dot_idx >= 0 and first_dot_idx < len(key):
                    if key[first_dot_idx + 1].isspace():
                        key = (
                            key[0:first_dot_idx]
                            + "."
                            + key[first_dot_idx + 1 :].lstrip()
                        )

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
