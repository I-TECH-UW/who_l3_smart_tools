import re
from typing import Optional
import pandas as pd
import html  # added to escape HTML characters

indicator_sheet_name = "Indicator definitions"
default_indicator_columns = [
    "DAK ID",
    "Ref no.",
    "Short name",
    "Indicator definition",
    "Category",
    "What it measures",
    "Rationale",
    "Numerator definition",
    "Numerator calculation",
    "Denominator definition",
    "Denominator calculation",
    "Disaggregation description",
    "Reference",
]
overview_table_template = """
<div style=" width: 100%;">
  <table border="1" class="dataframe table table-striped table-bordered">
    <thead>
      <tr style="text-align: left;">
        <th>Decision Table ID</th>
        <th>Decision Table Description</th>
        <th>Reference/Source</th>
      </tr>
    </thead>
    <tbody style="text-align: left; vertical-align: top">
        {{overview_table_rows}}
    </tbody>
  </table>
</div>
"""
overview_table_row_template = """  <tr>
    <td>{{dt_id}}</td>
    <td>{{dt_desc}}</td>
    <td>{{dt_ref}}</td>
</tr>"""

dt_template = """#### {{dt_title}}

{{dt_table}}

{{dt_notes}}
"""


class MarkdownTableHelper:
    def generate_html_table(self, df: pd.DataFrame) -> dict:
        html_table_head_columns = []
        html_table_body = []
        html_table_head_columns.append("<tr>")
        headers = list(df.columns)
        for h in headers:
            html_table_head_columns.append(f"<th>{h}</th>")
        html_table_head_columns.append("</tr>")
        for _, row in df.iterrows():
            html_table_body.append("<tr>")
            for h in headers:
                cell_value = row[h] if pd.notna(row[h]) else ""
                html_table_body.append(f"<td>{cell_value}</td>")
            html_table_body.append("</tr>")
        return {
            "head": "\n".join(html_table_head_columns),
            "body": "\n".join(html_table_body),
        }


class IndicatorMarkdownGenerator(MarkdownTableHelper):
    def __init__(
        self,
        indicator_input_file: str,
        indicators_md_template_path: str,
        indicator_columns: Optional[list] = None,
    ):
        self.indicator_dak_data = pd.read_excel(
            indicator_input_file, sheet_name=indicator_sheet_name
        )
        self.indicators_md_template_path = indicators_md_template_path
        self.indicator_columns = (
            indicator_columns if indicator_columns else default_indicator_columns
        )

    def generate_indicator_list(self, output_file_path: str) -> None:
        # Read template.
        with open(
            self.indicators_md_template_path, "r", encoding="utf-8"
        ) as template_file:
            template_content = template_file.read()
        # Subset data.
        df = self.indicator_dak_data[self.indicator_columns]
        table_markdown = self.generate_html_table(df)
        final_md_content = template_content.replace(
            "{{body}}", table_markdown["body"]
        ).replace("{{head}}", table_markdown["head"])
        with open(output_file_path, "w", encoding="utf-8") as output_file:
            output_file.write(final_md_content)


class DecisionTableMarkdownGenerator(MarkdownTableHelper):
    def __init__(
        self,
        decision_logic_input_file: str,
        decision_logic_md_template_path: str,
    ):
        self.decision_logic_input_file = decision_logic_input_file
        self.decision_logic_md_template_path = decision_logic_md_template_path

    def generate_dt_section_table(self, df: pd.DataFrame) -> str:
        # remove the first column
        df = df.iloc[:, 1:]

        # Extract decision details
        decision_id = df.iloc[0, 1]
        business_rule = df.iloc[1, 1]
        trigger = df.iloc[2, 1]
        hit_policy = df.iloc[3, 1]

        # Column headers are in row 6
        headers = list(df.iloc[4])
        headers[0] = "Rule ID"

        # Generate HTML header row using HTML-safe contents
        header_html = (
            "  <tr>"
            + "".join([f"    <th>{html.escape(str(h))}</th>" for h in headers])
            + "  </tr>"
        )

        # Generate HTML table rows from row 7 until column B is empty
        rows_html = ""
        row_index = 5
        while row_index < len(df) and pd.notna(df.iloc[row_index, 1]):
            row = df.iloc[row_index]
            row_cells = "\n".join(
                [
                    f"    <td>{html.escape(str(cell)) if not pd.isna(cell) else ''}</td>"
                    for cell in row
                ]
            )
            rows_html += f"\n  <tr>{row_cells}</tr>\n"
            row_index += 1

        # Build HTML table section
        table_html = (
            f"<table border='1' class='dataframe table table-striped table-bordered'>\n"
            f"  <thead>\n    {header_html}\n  </thead>\n"
            f"  <tbody>\n    {rows_html}\n  </tbody>\n"
            f"</table>"
        )

        # Build markdown output with decision details in markdown and embed the HTML table
        markdown_output = (
            f"### {decision_id}\n\n"
            f"**Business Rule**: {business_rule}\n\n"
            f"**Trigger**: {html.escape(str(trigger))}\n\n"
            f"**Hit Policy**: {html.escape(str(hit_policy))}\n\n"
            f"{table_html}"
            f"\n\n---\n\n"
        )
        return markdown_output

    def generate_dt_overview_list_table(
        self, cover_sheet: pd.DataFrame, dt_sheets: list, excel: pd.ExcelFile
    ) -> str:
        # Get the rows from the 15th row onwards
        # TODO: This is hardcoded for now, but we should make it dynamic
        first_dt_row = 15
        last_dt_row = 27
        dt_rows = []
        if len(dt_sheets) != (last_dt_row - first_dt_row + 1):
            print(
                """The number of decision tables in the cover sheet does not match
                the number of decision tables in the excel file"""
            )

            return ""
        for i in range(first_dt_row, last_dt_row):
            dt_id = cover_sheet.iloc[i, 2]
            dt_desc = cover_sheet.iloc[i, 1]
            dt_ref = cover_sheet.iloc[i, 3]

            # Make variables html-safe
            dt_desc = html.escape(str(dt_desc))
            dt_ref = html.escape(str(dt_ref))

            dt_row = (
                overview_table_row_template.replace("{{dt_id}}", str(dt_id))
                .replace("{{dt_desc}}", dt_desc)
                .replace("{{dt_ref}}", dt_ref)
            )
            dt_rows.append(dt_row)
        overview_html = overview_table_template.replace(
            "{{overview_table_rows}}", "\n".join(dt_rows)
        )
        return overview_html

    def generate_decision_table_list(self, output_file_path: str) -> None:

        # Read template.
        with open(
            self.decision_logic_md_template_path, "r", encoding="utf-8"
        ) as template_file:
            template_content = template_file.read()
        # Load all sheets.
        excel = pd.ExcelFile(self.decision_logic_input_file)
        pattern = re.compile(r"^HIV\..*\.DT\s+.*$")
        dt_sheets = [s for s in excel.sheet_names if pattern.match(str(s))]

        # Generate DT list table from cover sheet
        cover_sheet = excel.parse(sheet_name="COVER")
        overview_table_html = self.generate_dt_overview_list_table(
            cover_sheet, dt_sheets, excel
        )

        # Add title and table for each sheet.
        sections = []
        for sheet in dt_sheets:
            df = excel.parse(sheet_name=sheet)
            dt_table = self.generate_dt_section_table(df)
            sections.append(dt_table)
        decision_tables_md = "\n".join(sections)
        final_md_content = template_content.replace(
            "{{decision-tables}}", decision_tables_md
        ).replace("{{overview-table}}", overview_table_html)

        with open(output_file_path, "w", encoding="utf-8") as output_file:
            output_file.write(final_md_content)
