import re
import pandas as pd
import uuid
from random import choice, randint
from datetime import datetime, timedelta
from faker import Faker

##-----------------------------------------------------------------##
## This class will generate a dataset for testing indicator logic
## The dataset will be generated based on the input template
##-----------------------------------------------------------------##

## Generate a random dataset row
# This should be generated based on the input spreadsheet.
# Gender and DOB should always be included. In addition, we need a function for each dissagregation type, mapped to
# the corresponding valueset perhaps...For generation we need to use the valueset to generate the data.


class DataGenerator:
    fake = Faker()

    # TODO: Reference IG for valuesets
    valuesets = {
        "Patient.state (home)": ["Lagos", "Abuja", "Kano", "Ogun", "Oyo"],
        "Key population member type": ["FSW", "MSM", "PWID", "TG", "PWUD"],
        "TB diagnosis result": ["Yes", "No"],
        "Presumptive TB": ["Yes", "No"],
        "Patient.gender": ["male", "female", "other", "unknown"],
    }

    general_output_headers = [
        "Bundle #",
        "Patient.id",
        "Patient.name.family",
        "Patient.name.given",
        "Patient.gender",
        "Patient.birthDate",
        "Test.id",
    ]

    indicator_calculation_headers = ["Numerator", "Denominator"]

    def __init__(self, template_file_name):
        self.template_file = template_file_name
        self.excel_data = pd.read_excel(self.template_file, sheet_name=None)
        self.parsed_data = self.parse_template_excel()

    # Getters for Instance Variables
    def get_parsed_data(self):
        return self.parsed_data

    def get_excel_data(self):
        return self.excel_data

    # Parse Template Excel File
    def parse_template_excel(self):
        parsed_data = {}
        # For each worksheet, parse header row
        for sheet_name in self.excel_data.keys():
            sheet_df = self.excel_data[sheet_name]

            headers = sheet_df.columns.tolist()

            # Get all unique terms between 'Numerator:', 'Denominator, and 'Disaggregation:'
            # headings. These will be used to generate the test data.

            # Find the index of the key headings
            numerator_index = headers.index("Numerator:")
            denominator_index = headers.index("Denominator:")
            disaggregation_index = headers.index("Disaggregation:")

            # Determine if sheet contains exclusion column by matching for "EXCLUSION:" regular expression
            re_string = r"EXCLUSION:"
            exclusion_indices = []
            for i, header in enumerate(headers):
                if re.match(re_string, header):
                    exclusion_indices.append(i)

            numerator_len = 3 if exclusion_indices else 2
            denominator_len = 3 if exclusion_indices else 2

            # Get all terms between the 'Numerator:' and 'Denominator:' headings
            numerator_formula = headers[numerator_index + 1]
            numerator_terms = headers[
                numerator_index + numerator_len : denominator_index
            ]

            # Get all terms between the 'Denominator:' and 'Disaggregation:' headings
            denominator_formula = headers[denominator_index + 1]
            denominator_terms = headers[
                denominator_index + denominator_len : disaggregation_index
            ]

            # Get all terms after the 'Disaggregation:' heading
            disaggregation_terms = headers[disaggregation_index + 1 :]

            # Get the scope of the calculation based on first header. For now,
            # regardless of scope, we'll generate one patient per test.
            # TODO: Add support for multiple tests per patient in a way that does not
            #       confuse the L2 authoring process.
            if headers[0] == "Test.id":
                scope = "tests"
            elif headers[0] == "Patient.id":
                scope = "clients"
            else:
                scope = "unknown"

            parsed_data[sheet_name] = {
                "numerator_formula": numerator_formula,
                "numerator_terms": numerator_terms,
                "numerator_index": numerator_index,
                "denominator_formula": denominator_formula,
                "denominator_terms": denominator_terms,
                "denominator_index": denominator_index,
                "disaggregation_terms": disaggregation_terms,
                "disaggregation_index": disaggregation_index,
                "scope": scope,
            }
        return parsed_data

    def generate_data_file(self, path, num_random_rows=1000):
        sheets = {}

        # Generate data for each sheet
        for sheet_name in self.excel_data.keys():
            sheet_data = self.generate_data_sheet(sheet_name, num_random_rows)
            sheets[sheet_name] = sheet_data

        writer = pd.ExcelWriter(path, engine="openpyxl")

        workbook = writer.book

        for sheet_name, sheet_data in sheets.items():
            if sheet_name in workbook.sheetnames:
                ws = workbook[sheet_name]
            else:
                ws = workbook.create_sheet(title=sheet_name)

            ws.append(sheet_data.columns.tolist())

            for row in sheet_data.itertuples(index=False):
                ws.append(row)
        writer.close()

    # Generate a random dataset based on the template
    # Use provided example rows and fill in the additional required values, especially
    # for the disaggregation fields
    def generate_data_sheet(self, input_datasheet_name, num_random_rows):

        sheet_parsed_data = self.parsed_data[input_datasheet_name]
        input_datasheet = self.excel_data[input_datasheet_name]

        # Phenotypes will store the unique combinations of numerator, denominator terms and
        # their calculated values to use for generating the randomized data rows
        phenotypes = []

        # Unique list of headers
        phenotype_headers = (
            list(
                set(
                    sheet_parsed_data["numerator_terms"]
                    + sheet_parsed_data["denominator_terms"]
                )
            )
            + self.indicator_calculation_headers
        )

        # Find headers with appended numbers matching the format .1, .2, etc.
        appended_headers = [
            header for header in phenotype_headers if header.split(".")[-1].isdigit()
        ]

        # Remove any duplicate column names which are read in with an appended number
        for appended_header in appended_headers:
            phenotype_headers.remove(appended_header)

        # Remove Age and Gender from disaggregation terms since they are already generated
        # by default
        if "Age" in sheet_parsed_data["disaggregation_terms"]:
            sheet_parsed_data["disaggregation_terms"].remove("Age")
        if "Gender" in sheet_parsed_data["disaggregation_terms"]:
            sheet_parsed_data["disaggregation_terms"].remove("Gender")

        general_headers = (
            self.general_output_headers + sheet_parsed_data["disaggregation_terms"]
        )

        output_rows = []

        # Get corresponding values from each example phenotype row and place
        # them in the output row
        for index, row in input_datasheet.iterrows():
            general_column_values = []
            phenotype_column_values = []

            # Generate non-phenotype columns
            for general_header in general_headers:
                general_column_values.append(
                    self.map_header_value(general_header, index, sheet_parsed_data, row)
                )
            for phenotype_header in phenotype_headers:
                phenotype_column_values.append(
                    self.map_header_value(
                        phenotype_header, index, sheet_parsed_data, row
                    )
                )

            # Add the phenotype to the list of phenotypes
            phenotypes.append(phenotype_column_values)

            # Add the row to the output
            output_row = general_column_values + phenotype_column_values
            output_rows.append(output_row)

        # Generate additional rows with randomized phenotypes
        for i in range(num_random_rows):
            index = i + len(input_datasheet)
            output_row = []

            # Generate random values for each general header
            for header in general_headers:
                output_row.append(
                    self.map_header_value(header, index, sheet_parsed_data)
                )

            # Randomly select a phenotype from the list of phenotypes and add it to the output row
            phenotype = choice(phenotypes)

            output_row += phenotype
            output_rows.append(output_row)

        output_headers = general_headers + phenotype_headers
        df = pd.DataFrame(output_rows, columns=output_headers)

        return df

    # Generator Functions
    def random_valueset_value(self, header):
        if header not in self.valuesets:
            print(f"Header not found in Value Sets: {header}")
            return None

        valueset = self.valuesets[header]
        return choice(valueset)

    # Generate random family name
    def generate_family_name(self):
        return self.fake.name().split(" ")[1]

    def generate_given_name(self):
        return self.fake.name().split(" ")[0]

    def generate_gender(self):
        return self.fake.random_element()

    def generate_dob(self):
        return self.fake.date_of_birth(minimum_age=18, maximum_age=100)

    def generate_disaggregation_value(self, header):
        if header in self.valuesets.keys():
            return self.random_valueset_value(header)
        else:
            if header == "Age":
                print("Age already generated by default.")
                return None
            elif header == "Gender":
                print("Gender already generated by default.")
                return None

    def random_term_value(self):
        return randint(0, 1)

    # Case function for mapping header values to generator functions
    def map_header_value(self, header, index, parsed_data, row=None):
        # Map header to function
        # Call function with row as argument
        try:
            if header == "Patient #" or header == "Bundle #":
                return index + 1
            elif header == "Patient.id":
                return str(uuid.uuid4())
            elif header == "Test.id":
                return str(uuid.uuid4())
            elif header == "Patient.name.family":
                return self.generate_family_name()
            elif header == "Patient.name.given":
                return self.generate_given_name()
            elif header == "Patient.gender":
                return self.random_valueset_value(header)
            elif header == "Patient.birthDate":
                return self.generate_dob()
            # For now, the formula calculated value is stored in the column after the Denominator/Numerator heading
            elif header in self.indicator_calculation_headers:
                if row is None:
                    return None
                else:
                    if header == "Numerator":
                        return row.iloc[parsed_data["numerator_index"] + 1]
                    elif header == "Denominator":
                        return row.iloc[parsed_data["denominator_index"] + 1]
            elif header in parsed_data["disaggregation_terms"]:
                return self.generate_disaggregation_value(header)
            elif (
                header in parsed_data["numerator_terms"]
                or header in parsed_data["denominator_terms"]
            ):
                if row is None:
                    return self.random_term_value()
                if header in row:
                    return row[header]
                else:
                    print(f"Header not found in row:\n{header}\n{row}")
                return row[header]
        except Exception as e:
            print(f"Error mapping header value: {header}\n{e}")
            return None
        print(f"Header not found in mapping: {header}")
        return None
