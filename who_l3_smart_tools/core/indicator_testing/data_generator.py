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

    valuesets = {
        "Patient.state (home)": ["Lagos", "Abuja", "Kano", "Ogun", "Oyo"],
        "Key population member type": ["FSW", "MSM", "PWID", "TG", "PWUD"],
        "TB diagnosis result": ["Yes", "No"],
        "Presumptive TB": ["Yes", "No"],
        "Patient.gender": ["male", "female", "other", "unknown"],
    }

    general_output_headers = [
        "Patient #",
        "Patient.id",
        "Patient.name.family",
        "Patient.name.given",
        "Patient.gender",
        "Patient.birthDate",
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

            # Get all terms between the 'Numerator:' and 'Denominator:' headings
            numerator_formula = headers[numerator_index + 1]
            numerator_terms = headers[numerator_index + 2 : denominator_index]

            # Get all terms between the 'Denominator:' and 'Disaggregation:' headings
            denominator_formula = headers[denominator_index + 1]
            denominator_terms = headers[denominator_index + 2 : disaggregation_index]

            # Get all terms after the 'Disaggregation:' heading
            disaggregation_terms = headers[disaggregation_index + 1 :]

            return {
                "numerator_formula": numerator_formula,
                "numerator_terms": numerator_terms,
                "numerator_index": numerator_index,
                "denominator_formula": denominator_formula,
                "denominator_terms": denominator_terms,
                "denominator_index": denominator_index,
                "disaggregation_terms": disaggregation_terms,
                "disaggregation_index": disaggregation_index,
            }

    # Generate a random dataset based on the template
    def generate_data_sheet(self, input_datasheet_name, num_random_rows):
        # Use provided example rows and fill in the additional required values, especially
        # for the disaggregation fields

        output_headers = (
            self.general_output_headers
            + self.parsed_data["disaggregation_terms"]
            + self.parsed_data["numerator_terms"]
            + self.parsed_data["denominator_terms"]
            + self.indicator_calculation_headers
        )

        input_datasheet = self.excel_data[input_datasheet_name]

        output_rows = []

        # Get corresponding values from each example row and place
        # them in the right location in the output row
        for index, row in input_datasheet.iterrows():
            output_row = []
            # Add data based on function mapped to header
            for header in output_headers:
                output_row.append(self.map_header_value(header, row, index))

        # Generate additional rows with a random selection of numerator,
        # denominator, and disaggregation values

        df = pd.DataFrame(output_rows, columns=self.parsed_data.keys())

        return df

    def random_valueset_value(self, header):
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
        return self.random_valueset_value(header)

    # Case function for mapping header values to generator functions
    def map_header_value(self, header, row, index):
        # Map header to function
        # Call function with row as argument
        if header == "Patient #":
            return index
        elif header == "Patient.id":
            return str(uuid.uuid4())
        elif header == "Patient.name.family":
            return self.generate_family_name()
        elif header == "Patient.name.given":
            return self.generate_given_name()
        elif header == "Patient.gender":
            return self.random_valueset_value(header)
        elif header == "Patient.birthDate":
            return self.generate_dob()
        elif header in self.parsed_data["disaggregation_terms"]:
            return self.generate_disaggregation_value(header)
        elif header in self.parsed_data["numerator_terms"]:
            return row[header]
        elif header in self.parsed_data["denominator_terms"]:
            return row[header]
