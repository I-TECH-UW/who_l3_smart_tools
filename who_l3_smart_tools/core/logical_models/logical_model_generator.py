import pandas as pd
import argparse
import os
import re


def generate_fsh_from_excel(input_file, output_dir):
    # Load the Excel file
    xls = pd.ExcelFile(input_file)

    # Iterate through all sheet names
    for sheet_name in xls.sheet_names:
        # Check if the sheet name matches the 'HIV.X' pattern
        if re.match(r"HIV\.\w+", sheet_name):
            df = pd.read_excel(input_file, sheet_name=sheet_name)

            # Generate the FSH logical model header based on the sheet name
            fsh_header = f"""
            LogicalModel: {sheet_name.replace(' ', '')}
            Title: "{sheet_name}"
            Description: "Data elements for the {sheet_name} Data Dictionary."
            * ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
            * ^name = "{sheet_name.replace(' ', '')}"
            * ^status = #active
            """

            # Initialize the FSH artifact with the header
            fsh_artifact = fsh_header

            # Template for element definitions in FSH, including a placeholder for invariants
            fsh_element_template = """
            * {data_element_id} 1..1 {data_type} "{label}" "{description}"
            * ^code[+] = {code}
            """

            # Template for invariants based on validation conditions
            fsh_invariant_template = """
            Invariant:    {invariant_id}
            Description:  "{description}"
            Expression:   "{expression}"
            Severity:     #error
            """

            # Generate FSH elements and invariants for each row in the dataframe
            for index, row in df.iterrows():
                # Simplified example of mapping, adjust according to your actual data structure
                data_element_id = row["Data Element ID"].replace(".", "")
                label = row["Data Element Label"]
                description = row["Description and Definition"]
                data_type = "string"  # Simplified, adjust as needed
                code = row["Data Element ID"]

                # Simplified invariant generation, adjust based on actual validation condition
                if "Validation Condition" in row and pd.notnull(
                    row["Validation Condition"]
                ):
                    invariant_id = f"{data_element_id}-inv"
                    expression = "$this.matches('[A-Za-z-.]*')"  # Example, needs actual implementation
                    fsh_artifact += fsh_invariant_template.format(
                        invariant_id=invariant_id,
                        description=description,
                        expression=expression,
                    )

                # Add the element definition to the FSH artifact
                fsh_artifact += fsh_element_template.format(
                    data_element_id=data_element_id,
                    data_type=data_type,
                    label=label,
                    description=description,
                    code=code,
                )

            # Determine the output file path based on the sheet name and output directory
            output_file = os.path.join(output_dir, f"{sheet_name.replace(' ', '')}.fsh")

            # Write the FSH artifact to the output file
            with open(output_file, "w") as f:
                f.write(fsh_artifact)


def main():
    parser = argparse.ArgumentParser(
        description="Generate L3 Logical Model FSH files from DAK Data Dictionary Excel file."
    )
    parser.add_argument(
        "-i", "--input", default="./l3-data/test-data.xlsx", help="Input Data Dictionary file location"
    )
    parser.add_argument(
        "-o", "--output", default="./data/output", help="Output directory for FSH files"
    )

    args = parser.parse_args()

    generate_fsh_from_excel(args.input, args.output)


if __name__ == "__main__":
    main()
