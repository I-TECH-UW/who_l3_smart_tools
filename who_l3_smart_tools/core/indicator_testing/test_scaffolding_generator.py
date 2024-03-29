import pandas as pd
from itertools import product
from openpyxl import Workbook
import re


import re


def extract_elements(calculation_str):
    """
    Extract unique terms and operation types from calculation strings and
    reconstruct a logical function with column names.
    """
    # Extract the operation type (e.g., 'COUNT') from the string
    operation_match = re.match(r"(\w+)\s+of\s+clients\s+with", calculation_str)
    operation = operation_match.group(1) if operation_match else ""

    # Split by ' with ' and ignore the first chunk ('COUNT of clients with')
    terms = calculation_str.split(" with ")[1:]

    # Clean the terms and remove special characters and additional information
    cleaned_terms = []
    for term in terms:
        # Remove quotes and other non-alphanumeric characters except for equal sign and spaces
        cleaned_term = re.sub(r"[^\w\s=]", "", term).strip()
        cleaned_terms.append(cleaned_term)

    # Ensure unique terms and generate column names (A, B, C, ...)
    all_terms = list(set(cleaned_terms))  # In case of duplicates
    term_to_column = {term: chr(65 + i) for i, term in enumerate(all_terms)}

    # Construct the logical expression
    logical_expression = " AND ".join([f"{term_to_column[term]}" for term in all_terms])
    logical_expression = f"{operation} where {logical_expression}"

    return term_to_column, logical_expression


def generate_test_scaffolding(input_file, output_file):
    df = pd.read_excel(input_file, sheet_name="indicator definitions")
    writer = pd.ExcelWriter(output_file, engine="openpyxl")

    for index, row in df.iterrows():
        # Create a new worksheet for each indicator
        ws_name = f"Indicator_{index + 1}"
        workbook = writer.book
        if ws_name in workbook.sheetnames:
            ws = workbook[ws_name]
        else:
            ws = workbook.create_sheet(title=ws_name)

        # Extract disaggregation elements and data elements
        disaggregation_elements = row["Disaggregation data elements"].split(",")
        data_elements = row[
            "List of all data elements included in numerator and denominator"
        ].split(",")

        # Extract and process calculation elements
        numerator_terms, numerator_ops = extract_elements(row["Numerator Calculation"])
        denominator_terms, denominator_ops = extract_elements(
            row["Denominator Calculation"]
        )

        # Combine all unique terms for header
        all_terms = list(
            set(
                disaggregation_elements
                + data_elements
                + list(numerator_terms)
                + list(denominator_terms)
            )
        )
        headers = ["Patient ID"] + all_terms + ["Operation Type"]

        # Write headers to the worksheet
        ws.append(headers)

        # Generate true/false combinations for each term
        combinations = list(product([0, 1], repeat=len(all_terms)))
        for i, combo in enumerate(combinations, start=1):
            # Append combination rows with Patient ID
            ws.append(
                [i] + list(combo) + ["COUNT" if "COUNT" in numerator_ops else "SUM"]
            )

    writer.save()
