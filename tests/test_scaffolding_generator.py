import unittest
import os
from openpyxl import load_workbook
from who_l3_smart_tools.core.indicator_testing.test_scaffolding_generator import (
    extract_elements,
    generate_test_scaffolding,
)


class TestExtractElements(unittest.TestCase):
    def setUp(self):
        self.test_cases = {
            'COUNT of clients with "Medications prescribed"=\'PrEP for HIV prevention\' with "Date medications prescribed" in the reporting period': {
                "expected_terms": {
                    "Medications prescribed=PrEP for HIV prevention",
                    "Date medications prescribed in the reporting period",
                },
                "expected_logic": "COUNT where A AND B",
            },
            'SUM of "Number of days prescribed" for all clients with "Medications prescribed"=\'PrEP for HIV prevention\'': {
                "expected_terms": {
                    "Number of days prescribed",
                    "Medications prescribed",
                },
                "expected_logic": "SUM of A for all clients with B='PrEP for HIV prevention'",
            },
            'SUM of [DIFFERENCE in MIN("Date OAMT initiated", "Reporting period start date") and MAX("Date of loss to follow-up or OAMT stopped", "Reporting period end date")] for all clients with "Medications prescribed" IN \'Methadone\', \'Buprenorphine\'': {
                "expected_terms": {
                    "Date OAMT initiated",
                    "Reporting period start date",
                    "Date of loss to follow-up or OAMT stopped",
                    "Reporting period end date",
                    "Medications prescribed",
                },
                "expected_logic": "SUM of [DIFFERENCE in MIN(A, B) and MAX(C, D)] for all clients with E IN 'Methadone', 'Buprenorphine'",
            },
            'COUNT of clients with ("Medications prescribed"=\'Methadone\' AND "Dose of medications prescribed" GREATER THAN OR EQUAL TO 60mg) OR ("Medications prescribed"=\'Buprenorphine\' AND "Dose of medications prescribed" GREATER THAN OR EQUAL TO 8mg) for a specified "Reporting date"': {
                "expected_terms": {
                    "Medications prescribed",
                    "Dose of medications prescribed",
                    "Reporting date",
                },
                "expected_logic": "COUNT of clients with (A='Methadone' AND B GREATER THAN OR EQUAL TO 60mg) OR (A='Buprenorphine' AND B GREATER THAN OR EQUAL TO 8mg) for a specified C",
            },
            'COUNT of clients with "HIV status"=\'HIV-positive\' AND "On ART"=True and "ART start date" GREATER THAN 6 months before reporting period end date AND "Date of viral load sample collection" within reporting period AND "Reason for HIV viral load test"=\'Routine viral load test\' AND "Viral load test result" LESS THAN 1000 copies/mL': {
                "expected_terms": {
                    "HIV status",
                    "On ART",
                    "ART start date",
                    "Date of viral load sample collection",
                    "Reason for HIV viral load test",
                    "Viral load test result",
                },
                "expected_logic": "COUNT of clients with A='HIV-positive' AND B=True and C GREATER THAN 6 months before reporting period end date AND D within reporting period AND E='Routine viral load test' AND F LESS THAN 1000 copies/mL",
            },
        }

    def test_extract_elements(self):
        for input_str, expected in self.test_cases.items():
            with self.subTest(input_str=input_str):
                terms, logic = extract_elements(input_str)
                self.assertEqual(
                    set(terms.keys()),
                    expected["expected_terms"],
                    f"Failed to extract terms for input: {input_str}",
                )
                self.assertEqual(
                    logic,
                    expected["expected_logic"],
                    f"Failed to construct logic for input: {input_str}",
                )


if __name__ == "__main__":
    unittest.main()


# class ScaffoldingTestCase(unittest.TestCase):

#     @classmethod
#     def setUpClass(cls):
#         # Setup tasks before any tests are run (e.g., create a minimal input Excel file)
#         cls.input_file = "data/indicator_dak_input.xlsx"
#         cls.output_file = "output/indicator_test_output.xlsx"

#     @classmethod
#     def tearDownClass(cls):
#         # Clean up tasks after all tests are run (e.g., delete test files)
#         os.remove(cls.output_file)

#     def test_extract_elements(self):
#         # Test the extract_elements function
#         calculation_str = '"Element1" + "Element2"'
#         term_to_column, logical_function = extract_elements(calculation_str)
#         self.assertEqual(set(term_to_column.keys()), {"Element1", "Element2"})
#         self.assertTrue(
#             logical_function.startswith("A + B"), "Logical function replacement error."
#         )

#     def test_generate_test_scaffolding_sheets_count(self):
#         # Test to ensure the output Excel file has the expected number of sheets
#         generate_test_scaffolding(self.input_file, self.output_file)
#         wb = load_workbook(self.output_file)
#         expected_sheets_count = 1  # Adjust based on your input file
#         self.assertEqual(
#             len(wb.sheetnames),
#             expected_sheets_count,
#             "Incorrect number of sheets in the output file.",
#         )


# if __name__ == "__main__":
#     unittest.main()
