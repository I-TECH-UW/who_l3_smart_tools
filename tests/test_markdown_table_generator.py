import unittest
import os
import tempfile
import pandas as pd
from datetime import datetime, timezone
from who_l3_smart_tools.core.cql_tools import markdown_table_generator
from who_l3_smart_tools.core.cql_tools.markdown_table_generator import (
    NonFunctionalMarkdownGenerator,
)


class TestMarkdownTableGenerator(unittest.TestCase):
    def setUp(self):
        # Ensure output directory exists
        output_dir = "tests/output/content"
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
        self.output_dir = output_dir

    def test_generate_indicator_md(self):
        indicator_input_file = "tests/data/l2/test_indicators.xlsx"
        timestamp = datetime.now(timezone.utc).strftime("%Y%m%d%H%M%S")
        md_output_file = os.path.join(
            self.output_dir, f"generated_indicators-{timestamp}.md"
        )
        indicators_md_template_path = (
            "tests/data/example_templates/indicators-template.md"
        )

        generator = markdown_table_generator.IndicatorMarkdownGenerator(
            indicator_input_file,
            indicators_md_template_path,
        )

        generator.generate_indicator_list(md_output_file)
        self.assertTrue(os.path.exists(md_output_file))

    def test_generate_decision_table_md(self):
        decision_logic_input_file = "tests/data/l2/test_cds.xlsx"
        # timestamp = datetime.now(timezone.utc).strftime("%Y%m%d%H%M%S")
        md_output_file = os.path.join(
            self.output_dir, "generated_decision_tables"  # -{timestamp}.md"
        )
        decision_logic_md_template_path = (
            "tests/data/example_templates/decision-logic.template.md"
        )

        generator = markdown_table_generator.DecisionTableMarkdownGenerator(
            decision_logic_input_file,
            decision_logic_md_template_path,
        )
        generator.generate_decision_table_list(md_output_file)
        self.assertTrue(os.path.exists(md_output_file))


class TestNonFunctionalMarkdownGenerator(unittest.TestCase):
    def setUp(self):
        # Create a sample DataFrame with three columns.
        self.df = pd.DataFrame(
            {
                "Requirement": ["Offline Capability", "Multi-language"],
                "Description": [
                    "Works without internet",
                    "Supports multiple languages",
                ],
                "Priority": ["High", "Medium"],
            }
        )

        # Create a temporary Excel file with sheet 'Non-functional'.
        self.temp_excel_fd, self.temp_excel_path = tempfile.mkstemp(suffix=".xlsx")
        os.close(self.temp_excel_fd)
        with pd.ExcelWriter(self.temp_excel_path) as writer:
            self.df.to_excel(writer, sheet_name="Non-functional", index=False)

        # Create a temporary file path for the markdown output.
        self.temp_md_fd, self.temp_md_path = tempfile.mkstemp(suffix=".md")
        os.close(self.temp_md_fd)

    def tearDown(self):
        os.remove(self.temp_excel_path)
        os.remove(self.temp_md_path)

    def test_generate_non_functional_md(self):
        # Instantiate the generator and generate the markdown file.
        generator = NonFunctionalMarkdownGenerator(self.temp_excel_path)
        generator.generate_non_functional_md(self.temp_md_path)

        # Read the markdown result.
        with open(self.temp_md_path, "r", encoding="utf-8") as f:
            content = f.read()

        # Check that the template intro text exists.
        self.assertIn("This page provides an overview", content)
        # Check that table delimiters for markdown exist.
        self.assertIn("| Requirement | Description | Priority |", content)
        self.assertIn("| --- | --- | --- |", content)
        # Check that each sample row is present.
        self.assertIn("| Offline Capability | Works without internet | High |", content)
        self.assertIn(
            "| Multi-language | Supports multiple languages | Medium |", content
        )

    def test_generate_non_functional_md_on_dak(self):
        # New test using fixed input file and timestamped output path.
        timestamp = datetime.now(timezone.utc).strftime("%Y%m%d%H%M%S")
        md_output_file = os.path.join("tests/output/content", f"generated_non_functional-{timestamp}.md")
        input_file = "tests/data/l2/test_functional_nonfunctional.xlsx"
        generator = NonFunctionalMarkdownGenerator(input_file)
        generator.generate_non_functional_md(md_output_file)
        self.assertTrue(os.path.exists(md_output_file))


if __name__ == "__main__":
    unittest.main()
