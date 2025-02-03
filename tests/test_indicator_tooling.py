import unittest
import os
import pandas as pd
from who_l3_smart_tools.core.indicator_testing.v2 import (
    phenotype_generator,
    dataset_generator,
    measure_report_generator,
)


class TestIndicatorToolingV2(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Create temporary input files (these would be in tests/data/ in a real scenario)
        cls.input_excel = "tests/data/test_indicators.xlsx"
        cls.phenotype_excel = "tests/output/phenotype_v2.xlsx"
        cls.dataset_excel = "tests/output/dataset_v2.xlsx"
        cls.measure_report_json = "tests/output/measure_report_v2.json"
        os.makedirs("tests/output", exist_ok=True)
        # Create a dummy indicator definitions file
        pd.DataFrame(
            {
                "Patient.id": ["id1", "id2"],
                "Patient.gender": ["male", "female"],
                "Patient.birthDate": ["1980-01-01", "1990-05-05"],
                "num": ["HIV-positive", "HIV-negative"],
            }
        ).to_excel(cls.input_excel, index=False)

    def test_generate_phenotype(self):
        phenotype_generator.generate_phenotype_xlsx(
            self.input_excel, "HIV.IND.20", self.phenotype_excel
        )
        df = pd.read_excel(self.phenotype_excel)
        self.assertTrue("Patient.id" in df.columns)
        self.assertTrue("num" in df.columns)

    def test_generate_dataset(self):
        dataset_generator.generate_random_dataset(
            self.phenotype_excel, self.dataset_excel, num_rows=10
        )
        df = pd.read_excel(self.dataset_excel)
        self.assertEqual(len(df), 10)

    def test_measure_report(self):
        measure_report_generator.generate_measure_report(
            self.dataset_excel, self.measure_report_json
        )
        self.assertTrue(os.path.exists(self.measure_report_json))
        with open(self.measure_report_json) as f:
            mr = f.read()
            self.assertIn("MeasureReport", mr)


if __name__ == "__main__":
    unittest.main()
