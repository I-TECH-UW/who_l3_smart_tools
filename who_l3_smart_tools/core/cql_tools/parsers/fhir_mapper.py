import pandas as pd


class MappingSchema:
    def __init__(self, mapping_file: str):
        self.mapping_file = mapping_file
        self.mapping_xls = pd.read_excel(
            self.mapping_file, sheet_name="HIV indicators_rev"
        )

        self.mapping_rows = self.parse_mapping_rows()

    def parse_mapping_rows(self):
        mapping_rows = []
        for index, row in self.mapping_xls.iterrows():
            mapping_row = MappingRow(row)
            mapping_rows.append(mapping_row)

        return mapping_rows


class MappingRow:
    def __init__(self, excel_row: pd.Series):
        self.element_id: str = excel_row["elementid"]
        self.fhir_path: str = excel_row["FHIR_Final"]
        self.fhir_path_2: str = excel_row["FHIR_Final2"]

        self.target_resource: str = self.parse_resource(self.fhir_path)

    def parse_resource(self, fhir_path: str):
        """
        Parse the FHIR path to get the target resource
        """

        fhir_path_parts = fhir_path.split(".")
        target_resource = fhir_path_parts[0]

        return target_resource
