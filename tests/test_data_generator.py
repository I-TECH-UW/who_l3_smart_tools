import unittest
from who_l3_smart_tools.core.indicator_testing.data_generator import DataGenerator


class TestDataGenerator(unittest.TestCase):
    # Create Instance for each test case
    def setUp(self):
        file_name = "tests/data/indicator_test_output_240515.xlsx"
        self.data_generator = DataGenerator(file_name)

    def test_parse_template_excel(self):
        result = self.data_generator.get_parsed_data()

        # Check if result is dictionary with required keys
        self.assertIsInstance(result, dict)
        self.assertIn("numerator_formula", result)
        self.assertIn("numerator_terms", result)
        self.assertIn("denominator_formula", result)
        self.assertIn("denominator_terms", result)
        self.assertIn("disaggregation_terms", result)

    def test_generate_data_sheet(self):
        # Generate data for each sheet
        for sheet_name in self.data_generator.get_excel_data().keys():
            sheet_data = self.data_generator.generate_data_sheet(sheet_name, 10)
            self.assertIsInstance(sheet_data, list)
            self.assertGreater(len(sheet_data), 10)


if __name__ == "__main__":
    unittest.main()
