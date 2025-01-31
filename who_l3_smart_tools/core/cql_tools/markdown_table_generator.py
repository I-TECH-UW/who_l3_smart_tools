from typing import Optional
import pandas as pd

indicator_sheet_name = "Indicator definitions"
# Table header columns:
# - Indicator code
# - Indicator name
# - Description
# - Numerator definition
# - Numerator computation
# - Denominator definition
# - Denominator computation
# - Disaggregation

default_filter_by_columns = ["Included in DAK"]

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


class MarkdownTableGenerator:
    def __init__(
        self,
        input_file: str,
        indicators_md_template_path: str,
        columns: Optional[list] = None,
    ):
        self.input_file = input_file
        self.dak_data = pd.read_excel(input_file, sheet_name=indicator_sheet_name)
        self.indicators_md_template_path = indicators_md_template_path
        if not (columns):
            self.columns = default_indicator_columns
        else:
            self.columns = columns

    def generate_table_markdown(self, df: pd.DataFrame) -> dict:
        """
        Generate an HTML table in Markdown format based on the data from the given Excel file, sheet,
        and subset of columns.

        Parameters:
            df (pd.DataFrame): The DataFrame to generate the table from.

        Returns:
          str: The generated HTML table in Markdown format.
        """
        import pandas as pd

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

        html_table_body = "\n".join(html_table_body)
        html_table_head_columns = "\n".join(html_table_head_columns)

        return {
            "head": html_table_head_columns,
            "body": html_table_body,
        }

    def generate_indicator_tables(self, output_file_path: str) -> None:
        """
        Generate a contextualized version of the indicators.md file by embedding an HTML table generated
        from the given Excel file, sheet, and subset of columns. The function reads a template markdown file,
        replaces the table placeholder with the output of generate_table_markdown, and writes the modified
        content to 'md_output_file'. This method modifies no input objects and returns None.

        Parameters:
          md_output_file (str): Path to the output markdown file.
          excel_file (str): Path to the Excel file to retrieve data from.
          sheet_name (str): Name of the sheet to select within the Excel file.
          columns (list): List of column names to include in the table generated.
        """

        # Read the markdown template. Assume self.indicators_md_template_path stores the path.
        with open(
            self.indicators_md_template_path, "r", encoding="utf-8"
        ) as template_file:
            template_content = template_file.read()

        # Read the Excel file and subset the data to the specified columns.
        df = pd.read_excel(self.input_file, sheet_name=indicator_sheet_name)

        # Subset by the specified columns.
        df = df[self.columns]

        # Generate table markdown from the Excel file.
        # The generate_table_markdown method should be generic.
        table_markdown = self.generate_table_markdown(df)

        # Replace the placeholder in the template with the generated table.
        # Here "{table}" is used as the placeholder.
        final_md_content = template_content.replace(
            "{{body}}", table_markdown["body"]
        ).replace("{{head}}", table_markdown["head"])

        # Write the final markdown content to the specified output file.
        with open(output_file_path, "w", encoding="utf-8") as output_file:
            output_file.write(final_md_content)
