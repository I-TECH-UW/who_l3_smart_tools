import pandas as pd
from itertools import product
from openpyxl import Workbook
import re
from openpyxl.styles import PatternFill
from openpyxl.utils import get_column_letter

# Define fill colors
fills = {
    "Patient ID": PatternFill(
        start_color="FFFF00", end_color="FFFF00", fill_type="solid"
    ),  # Yellow
    "Disaggregation": PatternFill(
        start_color="99FF99", end_color="99FF99", fill_type="solid"
    ),  # Light Green
    "Numerator Terms": PatternFill(
        start_color="FF9999", end_color="FF9999", fill_type="solid"
    ),  # Light Red
    "Denominator Terms": PatternFill(
        start_color="9999FF", end_color="9999FF", fill_type="solid"
    ),  # Light Blue
    "Other": PatternFill(
        start_color="FFFFFF", end_color="FFFFFF", fill_type="solid"
    ),  # White
}


# Function to add unique items preserving order
def add_unique_preserving_order(original_list, items_to_add):
    for item in items_to_add:
        if item not in original_list:
            original_list.append(item)


def apply_background_color(ws, column_letter, fill):
    """
    Apply background color to an entire column.
    """
    for row in ws[column_letter]:
        row.fill = fill


def apply_fill_to_column_range(ws, start_col, end_col, fill):
    """
    Apply a background fill to a range of columns within a worksheet.
    """

    for col in range(start_col, end_col + 1):
        for row in ws[get_column_letter(col)]:
            row.fill = fill


def parse_terms(description):
    # Define the patterns
    count_pattern = re.compile(r"COUNT OF (.*?) WITH", re.IGNORECASE)
    sum_pattern = re.compile(r"SUM OF (.*?) FOR ALL CLIENTS WITH", re.IGNORECASE)
    term_pattern = re.compile(r"WITH (.*)", re.IGNORECASE)
    and_or_pattern = re.compile(r"\bAND\b|\bOR\b", re.IGNORECASE)
    op_split_terms = []

    # Find COUNT OF or SUM OF patterns
    count_match = count_pattern.search(description)
    sum_match = sum_pattern.search(description)

    if count_match:
        op_term_str = count_match.group(1)
    elif sum_match:
        op_term_str = sum_match.group(1)
        op_split_terms = re.split(
            r"\sAND\s|\sOR\s(?![^()]*\))", op_term_str, flags=re.IGNORECASE
        )
    else:
        return []

    # Find the terms after the WITH
    term_match = term_pattern.search(description)
    if not term_match:
        return []

    terms = term_match.group(1)

    # Split the terms by AND or OR, but not within parentheses
    split_terms = re.split(r"\sAND\s|\sOR\s(?![^()]*\))", terms, flags=re.IGNORECASE)

    return_terms = []
    if op_split_terms and len(op_split_terms) > 0:
        return_terms.extend(op_split_terms)
    return_terms.extend(split_terms)

    return [term.strip() for term in return_terms]


def extract_elements(calculation_str):
    # Extract the main operation (SUM or COUNT)
    operation_match = re.match(r"(SUM|COUNT)\s+", calculation_str)
    operation = operation_match.group(1) if operation_match else ""

    if not operation:
        return {}, 1

    # Initialize storage for unique terms
    unique_terms = set()
    sum_expression_terms = set()  # For terms inside a SUM expression

    # Handle complex SUM expressions separately
    if operation == "SUM":
        # Look for a term immediately following "SUM of" for simple SUM operations
        simple_sum_term_match = re.search(
            r'SUM of\s+"([^"]+)"\s+for all clients', calculation_str
        )
        if simple_sum_term_match:
            sum_expression_terms.add(simple_sum_term_match.group(1))

        # Handle complex SUM expressions involving DIFFERENCE, MIN, and MAX
        complex_sum_term_match = re.search(
            r"SUM of \[(.*?)\] for all clients", calculation_str, re.DOTALL
        )
        if complex_sum_term_match:
            sum_expression = complex_sum_term_match.group(1)
            # Extract terms from the complex SUM expression
            for term in re.findall(r'"([^"]+)"', sum_expression):
                sum_expression_terms.add(term)

    # Extract conditions outside of SUM expressions
    conditions_match = re.finditer(
        r'"([^"]+)"\s*(=|IN)\s*\'([^\']*)\'', calculation_str
    )
    for match in conditions_match:
        unique_terms.add(f"{match.group(1)} {match.group(2)} {match.group(3)}")

    # Handle "in the reporting period" phrases
    reporting_period_match = re.finditer(
        r'"([^"]+)"\s+in\s+the\s+reporting\s+period', calculation_str
    )
    for match in reporting_period_match:
        unique_terms.add(f"{match.group(1)} in the reporting period")

    # Combine and assign placeholders
    combined_terms = unique_terms.union(sum_expression_terms)
    term_to_placeholder = {term: chr(66 + i) for i, term in enumerate(combined_terms)}

    # Construct the logical expression
    return term_to_placeholder, calculation_str


def generate_test_scaffolding(input_file, output_file):
    df = pd.read_excel(input_file, sheet_name="Indicator definitions")
    writer = pd.ExcelWriter(output_file, engine="openpyxl")

    for index, row in df.iterrows():
        # Create a new worksheet for each indicator
        short_name = row["Short name"]
        indicator_id = row["DAK ID"]
        ref_id = row["Ref no."]

        ws_name = f"{indicator_id}"
        workbook = writer.book
        if ws_name in workbook.sheetnames:
            ws = workbook[ws_name]
        else:
            ws = workbook.create_sheet(title=ws_name)

        # Extract disaggregation elements and data elements
        disaggregation_elements = re.split(
            r"[\n,]+", row["Disaggregation data elements"].strip()
        )

        # Extract Exclusion Elements if they exist and are strings
        numerator_exclusions = []
        denominator_exclusions = []
        if row["Numerator exclusions"] and isinstance(row["Numerator exclusions"], str):
            numerator_exclusions = re.split(
                r"[\n,]+", row["Numerator exclusions"].strip()
            )
        if row["Denominator exclusions"] and isinstance(
            row["Denominator exclusions"], str
        ):
            denominator_exclusions = re.split(
                r"[\n,]+", row["Denominator exclusions"].strip()
            )

        # Extract and process calculation elements for numerator and denominator
        numerator_terms = parse_terms(row["Numerator calculation"])
        denominator_terms = parse_terms(row["Denominator calculation"])

        # Construct headers, starting with 'Patient ID'
        headers = (
            ["Patient ID", "Numerator:"]
            + [row["Numerator calculation"]]
            + numerator_terms
            + ["Denominator:"]
            + [row["Denominator calculation"]]
            + denominator_terms
            + ["Disaggregation:"]
            + disaggregation_elements
        )

        numerator_col_num = len(numerator_terms) + 2
        denominator_col_num = len(denominator_terms) + 2

        # Write headers to the worksheet
        ws.append(headers)

        # Generate true/false combinations for each term
        combinations = list(product([0, 1], repeat=len(numerator_terms)))
        for i, combo in enumerate(combinations, start=1):
            # Append combination rows with Patient ID and placeholders for numerator and denominator values
            ws.append(
                [i] + ["", ""] + list(combo)
            )  # Empty values for placeholder logic and actual num/denom values

        # Apply color fills based on calculated column ranges
        # Column 1 is always Patient ID
        apply_fill_to_column_range(ws, 1, 1, fills["Patient ID"])

        # Numerator terms start after Patient ID
        num_start_col = 2
        num_end_col = num_start_col + numerator_col_num - 1
        apply_fill_to_column_range(
            ws, num_start_col, num_end_col, fills["Numerator Terms"]
        )

        # Denominator terms follow numerator terms
        denom_start_col = num_end_col + 1
        denom_end_col = denom_start_col + denominator_col_num - 1
        apply_fill_to_column_range(
            ws, denom_start_col, denom_end_col, fills["Denominator Terms"]
        )

        # Disaggregation starts after
        dis_start_col = denom_end_col + 1
        dis_end_col = dis_start_col + len(disaggregation_elements) + 1
        apply_fill_to_column_range(
            ws, dis_start_col, dis_end_col, fills["Disaggregation"]
        )

        # # adjust the column widths based on the content
        # for idx, col in enumerate(ws.columns):  # loop through all columns
        #     max_len = len(str(headers[idx])) + 1
        #     ws.column_dimensions[get_column_letter(idx + 1)].width = max_len

    writer.close()
