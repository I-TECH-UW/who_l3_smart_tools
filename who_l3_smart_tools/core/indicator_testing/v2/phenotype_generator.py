import pandas as pd
from openpyxl.styles import PatternFill
from openpyxl.styles import Alignment
import math


def generate_phenotype_xlsx(input_excel, output_excel, indicator=None):
    """
    For Domain Experts

    This function generates a template phenotype XLSX file based on the indicator definition XLSX file.

    It integrates with an interactive mode CLI command to load the excel file,
    list out available indicators, and prompt the user to select an indicator.
    It then uses the information from this indicator row to generate a template
    file with this information laid out in a way that assists domain experts with defining an exhaustive list of patient phenotypes for this indicator.
    """
    # Read the L2 indicator dataset
    df = pd.read_excel(input_excel, sheet_name="Indicator definitions")

    # Use DAK ID column for listing available indicators
    indicator_list = df["DAK ID"].unique()

    if indicator and indicator in indicator_list:
        selected_dak = indicator
    else:
        # Prompt user to select an indicator
        print("Available indicators:")
        for i, id_val in enumerate(indicator_list):
            print(f"{i}: {id_val}")
        selection = input("Select indicator (index or DAK id): ").strip()
        try:
            idx = int(selection)
            if idx < 0 or idx >= len(indicator_list):
                print("Invalid index selected.")
                return
            selected_dak = indicator_list[idx]
        except ValueError:
            if selection in indicator_list:
                selected_dak = selection
            else:
                print("Invalid DAK id selected.")
                return

    # Retrieve the selected indicator row
    indicator_row = df[df["DAK ID"] == selected_dak]
    if indicator_row.empty:
        print("Selected indicator not found in dataset.")
        return
    indicator_row = indicator_row.head(1)

    # Candidate headers for patient demographics and indicator features
    candidate_header = [
        "Patient.id",
        "<Add dissagregation patient feature columns>",
        "<Add indicator feature columns>",
        "Counted as Numerator (0,1)",
        "Counted as Denominator (0,1)",
    ]

    # Write to XLSX: first row with indicator info, blank row, then header row
    with pd.ExcelWriter(output_excel, engine="openpyxl") as writer:
        # Write the indicator row, a blank row, and the candidate header row
        indicator_row.to_excel(writer, index=False, header=False, startrow=0)
        pd.DataFrame(
            [[""] * indicator_row.shape[1]], columns=indicator_row.columns
        ).to_excel(writer, index=False, header=False, startrow=1)
        pd.DataFrame([candidate_header]).to_excel(
            writer, index=False, header=False, startrow=2
        )

        # Access the workbook and active worksheet
        workbook = writer.book
        worksheet = writer.sheets[workbook.sheetnames[0]]

        # Apply yellow background to the first row (indicator info)
        yellow_fill = PatternFill(
            start_color="FFFF00", end_color="FFFF00", fill_type="solid"
        )
        for cell in worksheet[1]:
            cell.fill = yellow_fill

        # Define minimum and maximum column widths (adjust these values as needed)
        MIN_WIDTH = 10
        MAX_WIDTH = 50

        # Auto-resize columns based on max length in each column,
        # and enable word wrap if content exceeds the maximum width.
        for column_cells in worksheet.columns:
            max_length = 0
            column = column_cells[0].column_letter  # Get the column name
            # Use the longest line among newline-split parts of each cell
            for cell in column_cells:
                try:
                    cell_value = str(cell.value) if cell.value is not None else ""
                    lines = cell_value.split("\n")
                    longest_line = max(lines, key=len) if lines else ""
                    max_length = max(max_length, len(longest_line))
                except Exception:
                    pass
            # Compute adjusted width with a little buffer
            adjusted_width = max_length + 2
            # Set to minimum if too small...
            if adjusted_width < MIN_WIDTH:
                adjusted_width = MIN_WIDTH
            # ...or cap it at maximum and enable wrap_text if too wide.
            if adjusted_width > MAX_WIDTH:
                adjusted_width = MAX_WIDTH
            for cell in column_cells:
                current_alignment = cell.alignment or Alignment()
                cell.alignment = Alignment(
                    wrap_text=True,
                    horizontal=current_alignment.horizontal,
                    vertical=current_alignment.vertical,
                )
            worksheet.column_dimensions[column].width = adjusted_width

        # Adjust row heights to better display wrapped text.
        for row in worksheet.iter_rows():
            max_line_count = 1
            for cell in row:
                if cell.value:
                    cell_value = str(cell.value)
                    # Split by existing newlines
                    lines = cell_value.split("\n")
                    total_lines = 0
                    # Get column width to estimate wrapping.
                    col_letter = cell.column_letter
                    col_width = (
                        worksheet.column_dimensions[col_letter].width or MAX_WIDTH
                    )
                    # Estimate how many lines are needed per line of text.
                    for line in lines:
                        # Use col_width as an approximation of how many characters are visible.
                        wrapped_lines = (
                            math.ceil(len(line) / col_width) if col_width else 1
                        )
                        total_lines += wrapped_lines
                        max_line_count = max(max_line_count, total_lines)
            # Adjust row height (default base height assumed 15, modify multiplier as needed)
            worksheet.row_dimensions[row[0].row].height = 15 * max_line_count

    print(f"Phenotype file generated: {output_excel}")

    return output_excel
