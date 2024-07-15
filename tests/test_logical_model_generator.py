import unittest
import os
import pandas as pd
import shutil
import sys
from who_l3_smart_tools.core.logical_models.logical_model_generator import (
    LogicalModelAndTerminologyGenerator,
)


class TestLogicalModelAndTerminologyGenerator(unittest.TestCase):
    def setUp(self):
        self.input_file = os.path.join("tests", "data", "l2", "test_dd.xlsx")
        self.output_dir = os.path.join("tests", "output", "fsh")

    def test_generate_fsh_from_excel(self):
        self.maxDiff = 50000
        g = LogicalModelAndTerminologyGenerator(self.input_file, self.output_dir)

        g.generate_fsh_from_excel()

        output_file = os.path.join(self.output_dir, "models", "HIVARegistration.fsh")
        self.assertTrue(os.path.exists(output_file))

        with open(output_file, "r") as f:
            fsh_artifact = f.read()

        with open(
            os.path.join("tests", "data", "example_fsh", "HIVARegistration.fsh"), "r"
        ) as f:
            expected_fsh_artifact = f.read()

        self.assertEqual(expected_fsh_artifact, fsh_artifact)


class TestFullLogicalModelGeneration(unittest.TestCase):
    def setUp(self) -> None:
        self.input_file = os.path.join("tests", "data", "l2", "test_dd.xlsx")
        self.output_dir = os.path.join("tests", "output", "fsh")

    def test_full_data_dictionary(self):
        generator = LogicalModelAndTerminologyGenerator(
            self.input_file, self.output_dir
        )

        generator.generate_fsh_from_excel()


if __name__ == "__main__":
    unittest.main()
