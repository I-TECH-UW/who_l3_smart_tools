import unittest
import os
import pandas as pd
import sys
from who_l3_smart_tools.core.logical_models.logical_model_generator import (
    LogicalModelGenerator,
)


class TestLogicalModelGenerator(unittest.TestCase):
    def setUp(self):
        self.input_file = "tests/tmp/l2/test_dd.xlsx"
        self.output_dir = "tests/tmp/fsh/models"

    def tearDown(self):
        os.remove(self.input_file)
        for file in os.listdir(self.output_dir):
            os.remove(os.path.join(self.output_dir, file))
        os.rmdir(self.output_dir)

    def test_generate_fsh_from_excel(self):
        # Create a test Excel file
        test_data = {
            "Data Element ID": ["DE1", "DE2"],
            "Data Element Label": ["Label 1", "Label 2"],
            "Description and Definition": ["Description 1", "Description 2"],
            "Validation Condition": [None, "Validation Condition 2"],
        }
        df = pd.DataFrame(test_data)
        df.to_excel(self.input_file, index=False)

        g = LogicalModelGenerator(self.input_file, self.output_dir)

        g.generate_fsh_from_excel()

        output_file = os.path.join(self.output_dir, "HIV.X.fsh")
        self.assertTrue(os.path.exists(output_file))

        with open(output_file, "r") as f:
            fsh_artifact = f.read()

        expected_fsh_artifact = """
            LogicalModel: HIV.X
            Title: "HIV.X"
            Description: "Data elements for the HIV.X Data Dictionary."
            * ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
            * ^name = "HIV.X"
            * ^status = #active

            * DE1 1..1 string "Label 1" "Description 1"
            * ^code[+] = DE1

            * DE2 1..1 string "Label 2" "Description 2"
            * ^code[+] = DE2
        """

        self.assertEqual(fsh_artifact.strip(), expected_fsh_artifact.strip())


class TestFullLogicalModelGeneration(unittest.TestCase):
    def setUp(self) -> None:
        self.input_file = os.path.join("tests", "data", "l2", "test_dd.xlsx")
        self.output_dir = os.path.join("tests", "output", "fsh", "models")

    def test_full_data_dictionary(self):
        generator = LogicalModelGenerator(self.input_file, self.output_dir)

        generator.generate_fsh_from_excel()


if __name__ == "__main__":
    unittest.main()
