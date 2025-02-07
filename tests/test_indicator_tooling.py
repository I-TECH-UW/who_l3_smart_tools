import os
import shutil
import unittest
import yaml
import pandas as pd
from who_l3_smart_tools.core.indicator_testing.v2.phenotype_generator import (
    generate_phenotype_xlsx,
)
from who_l3_smart_tools.core.indicator_testing.v2.dataset_generator import (
    generate_random_dataset,
)


from who_l3_smart_tools.core.indicator_testing.v2.fhir_bundle_generator import (
    FhirBundleGenerator,
)

from who_l3_smart_tools.core.indicator_testing.v2.mapping_template_generator import (
    generate_mapping_template,
)


class TestIndicatorToolingV2(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.input_excel = "tests/data/l2/test_indicators.xlsx"
        cls.phenotype_template_excel = "tests/output/testing/phenotype_v2.xlsx"
        cls.dataset_excel = "tests/output/dataset_v2.xlsx"
        cls.measure_report_json = "tests/output/measure_report_v2.json"
        cls.mapping_template_yaml = "tests/output/mapping_template_test.yaml"
        os.makedirs("tests/output/testing", exist_ok=True)
        os.makedirs("tests/output", exist_ok=True)

    def test_generate_phenotype_template(self):
        generate_phenotype_xlsx(
            self.input_excel, self.phenotype_template_excel, "HIV.IND.20"
        )
        df = pd.read_excel(self.phenotype_template_excel)
        self.assertEqual(len(df), 3)

    def test_generate_dataset(self):
        generate_random_dataset(
            self.phenotype_template_excel, self.dataset_excel, num_rows=10
        )
        df = pd.read_excel(self.dataset_excel)
        self.assertEqual(len(df), 10)

    def test_generate_mapping_template(self):
        # Generate mapping template using the phenotype file and output YAML location.
        phenotype_file = "tests/data/scaffolding/v2/phenotype_HIVIND20_filled.xlsx"
        output_yaml = self.mapping_template_yaml

        # Ensure output directory exists
        os.makedirs(os.path.dirname(output_yaml), exist_ok=True)

        generate_mapping_template(phenotype_file, output_yaml)

        # Check the file exists
        self.assertTrue(os.path.exists(output_yaml))

        # Read the output file content
        with open(output_yaml, "r") as f:
            content = f.read()

        # Split commented meta (lines starting with '#') from YAML dump
        lines = content.splitlines()
        meta_lines = [line for line in lines if line.startswith("#")]
        yaml_lines = [line for line in lines if not line.startswith("#")]

        # Ensure meta comments are present
        self.assertTrue(len(meta_lines) > 0, "Meta comments missing in YAML output")

        # Parse the YAML part
        yaml_content = yaml.safe_load("\n".join(yaml_lines))
        self.assertIn("dak_id", yaml_content)
        self.assertIn("features", yaml_content)
        self.assertIsInstance(
            yaml_content["features"], list, "Features should be a list"
        )
        self.assertGreater(len(yaml_content["features"]), 0)

        for feature in yaml_content["features"]:
            self.assertIn("name", feature)
            self.assertIn("id", feature)
            self.assertIn("target_profile", feature)
            self.assertIn("target_valueset", feature)
            self.assertIn("values", feature)
            self.assertIsInstance(
                feature["values"], list, "Feature values should be a list"
            )

    def test_fhir_bundle_generator(self):
        # Inputs for FHIR bundle generation using provided mapping and phenotype files.
        phenotype_file = "tests/data/scaffolding/v2/phenotype_HIVIND20_filled.xlsx"
        mapping_file = "tests/data/testing/phenotypes_IND20.yaml"
        output_directory = "tests/output/fhir_bundles"
        if os.path.exists(output_directory):
            shutil.rmtree(output_directory)
        os.makedirs(output_directory)

        generator = FhirBundleGenerator(phenotype_file, mapping_file, output_directory)
        generator.execute()

        # Check that test artifact bundle exists.
        test_bundle_path = os.path.join(output_directory, "test_bundle.json")
        self.assertTrue(os.path.exists(test_bundle_path))

        # Check at least one patient bundle exists.
        patient_bundles = [
            f
            for f in os.listdir(output_directory)
            if f.startswith("test_data_bundle_") and f.endswith(".json")
        ]
        self.assertTrue(len(patient_bundles) > 0, "No patient bundles were generated.")


if __name__ == "__main__":
    unittest.main()
