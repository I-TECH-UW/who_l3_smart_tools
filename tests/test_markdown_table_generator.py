import unittest
import os
from datetime import datetime, timezone
from who_l3_smart_tools.core.cql_tools.markdown_table_generator import (
    MarkdownTableGenerator,
)


class TestMarkdownTableGenerator(unittest.TestCase):
    def test_generate_indicator_md(self):
        input_file = "tests/data/l2/test_indicators.xlsx"
        timestamp = datetime.now(timezone.utc).strftime("%Y%m%d%H%M%S")
        md_output_file = f"tests/output/content/generated_indicators-{timestamp}.md"

        if not os.path.exists("tests/output/content"):
            os.makedirs("tests/output/content")

        indicators_md_template_path = (
            "tests/data/example_templates/indicators-template.md"
        )
        generator = MarkdownTableGenerator(input_file, indicators_md_template_path)

        generator.generate_indicator_tables(md_output_file)

        self.assertTrue(os.path.exists(md_output_file))


if __name__ == "__main__":
    unittest.main()
