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
            base_cql_dir=self.base_cql_dir, output_dir=self.output_dir
        )
        captured_output = io.StringIO()
        with contextlib.redirect_stdout(captured_output):
            generator.run(self.indicator_file)
        console_output = captured_output.getvalue()
        # Verify console output includes the subset header for HIE
        self.assertIn("Subset for library alias HIE", console_output)
        # Verify the expected output file is created and not empty
        expected_file = os.path.join(self.output_dir, "HIVIndicatorElements_subset.cql")
        self.assertTrue(
            os.path.exists(expected_file), f"Output file not found: {expected_file}"
        )
        with open(expected_file, "r", encoding="utf-8") as f:
            file_content = f.read()
        self.assertIn("Subset for library alias HIE", file_content)
        self.assertNotEqual(file_content.strip(), "", "Output file is empty")


if __name__ == "__main__":
    unittest.main()
