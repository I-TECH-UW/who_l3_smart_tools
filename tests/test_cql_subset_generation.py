import os
import unittest
import io
import contextlib
from who_l3_smart_tools.core.cql_tools.subset_generation.cql_subset_generation import (
    CQLSubsetGenerator,
)


class TestCQLSubsetGeneration(unittest.TestCase):
    def setUp(self):
        self.base_cql_dir = "/Users/pmanko/code/who_l3_smart_tools/tests/data/cql"
        self.indicator_file = os.path.join(self.base_cql_dir, "HIVIND20Logic.cql")
        self.output_dir = (
            "/Users/pmanko/code/who_l3_smart_tools/tests/output/cql_subsets"
        )
        os.makedirs(self.output_dir, exist_ok=True)
        self.assertTrue(
            os.path.exists(self.indicator_file),
            f"Indicator file not found: {self.indicator_file}",
        )

    def test_subset_generation(self):
        generator = CQLSubsetGenerator(
            parent_path=self.indicator_file,
            base_cql_dir=self.base_cql_dir,
            elements_path=os.path.join(self.base_cql_dir, "HIVElements.cql"),
            indicators_path=os.path.join(self.base_cql_dir, "HIVIndicatorElements.cql"),
            output_dir=self.output_dir,
        )
        # Directly run the generator
        generator.run()

        # Verify the expected output file for HIVIndicatorElements is created and not empty
        indicator_subset_path = os.path.join(
            self.output_dir, "HIVIndicatorElements.cql"
        )
        self.assertTrue(
            os.path.exists(indicator_subset_path),
            f"Output file not found: {indicator_subset_path}",
        )
        with open(indicator_subset_path, "r", encoding="utf-8") as f:
            indicator_subset = f.read()
        self.assertNotEqual(indicator_subset.strip(), "", "Output file is empty")

        # Check both generated files for the new subset definitions marker
        elements_subset_path = os.path.join(self.output_dir, "HIVElements.cql")
        with open(indicator_subset_path, "r", encoding="utf-8") as f:
            indicator_subset = f.read()
        with open(elements_subset_path, "r", encoding="utf-8") as f:
            elements_subset = f.read()

        self.assertIn("// ...subset definitions...", indicator_subset)
        self.assertIn("// ...subset definitions...", elements_subset)


if __name__ == "__main__":
    unittest.main()
