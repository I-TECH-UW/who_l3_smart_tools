import unittest
import os
import pandas as pd
from who_l3_smart_tools.core.indicator_testing.v2 import (
    phenotype_generator,
    dataset_generator,
)


class TestIndicatorToolingV2(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.input_excel = "tests/data/l2/test_indicators.xlsx"
        cls.phenotype_template_excel = "tests/output/testing/phenotype_v2.xlsx"
        cls.dataset_excel = "tests/output/dataset_v2.xlsx"
        cls.measure_report_json = "tests/output/measure_report_v2.json"
        os.makedirs("tests/output/testing", exist_ok=True)

    def test_generate_phenotype_template(self):
        phenotype_generator.generate_phenotype_xlsx(
            self.input_excel, self.phenotype_template_excel, "HIV.IND.20"
        )
        df = pd.read_excel(self.phenotype_template_excel)
        self.assertEqual(len(df), 2)

    def test_generate_dataset(self):
        dataset_generator.generate_random_dataset(
            self.phenotype_template_excel, self.dataset_excel, num_rows=10
        )
        df = pd.read_excel(self.dataset_excel)
        self.assertEqual(len(df), 10)

    # def test_measure_report(self):
    #     measure_report_generator.generate_measure_report(
    #         self.dataset_excel, self.measure_report_json
    #     )
    #     self.assertTrue(os.path.exists(self.measure_report_json))
    #     with open(self.measure_report_json) as f:
    #         mr = f.read()
    #         self.assertIn("MeasureReport", mr)


if __name__ == "__main__":
    unittest.main()
