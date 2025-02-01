import unittest
import os
from datetime import datetime, timezone
from who_l3_smart_tools.core.cql_tools import markdown_table_generator


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


if __name__ == "__main__":
    unittest.main()
