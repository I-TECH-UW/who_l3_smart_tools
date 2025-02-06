import os
import unittest
import yaml

from who_l3_smart_tools.core.indicator_testing.v2.mapping_template_generator import (
    generate_mapping_template,
)


class TestMappingTemplateGenerator(unittest.TestCase):

    def test_generate_mapping_template(self):
        phenotype_file = "tests/data/scaffolding/v2/phenotype_HIVIND20_filled.xlsx"
        output_yaml = "tests/output/mapping_template_test.yaml"

        # Ensure output directory exists
        os.makedirs(os.path.dirname(output_yaml), exist_ok=True)

        # Generate mapping template
        generate_mapping_template(phenotype_file, output_yaml)

        # Check the file exists
        self.assertTrue(os.path.exists(output_yaml))

        # Read the output file content
        with open(output_yaml, "r") as f:
            content = f.read()

        # Split commented meta (lines starting with '#') from YAML dump
        lines = content.splitlines()
        meta_lines = []
        yaml_lines = []
        for line in lines:
            if line.startswith("#"):
                meta_lines.append(line)
            else:
                yaml_lines.append(line)

        # Ensure commented meta is present
        self.assertTrue(len(meta_lines) > 0, "Meta comments missing in YAML output")

        # Parse the YAML part
        yaml_content = yaml.safe_load("\n".join(yaml_lines))
        self.assertIn("dak_id", yaml_content)
        self.assertIn("features", yaml_content)
        self.assertIsInstance(
            yaml_content["features"], list, "Features should be a list"
        )

        # Check that the features list is not empty
        self.assertGreater(len(yaml_content["features"]), 0)

        # Verify each feature entry has the required structure
        for feature in yaml_content["features"]:
            self.assertIn("name", feature)
            self.assertIn("id", feature)
            self.assertIn("target_profile", feature)
            self.assertIn("target_valueset", feature)
            self.assertIn("values", feature)
            self.assertIsInstance(
                feature["values"], list, "Feature values should be a list"
            )


if __name__ == "__main__":
    unittest.main()
