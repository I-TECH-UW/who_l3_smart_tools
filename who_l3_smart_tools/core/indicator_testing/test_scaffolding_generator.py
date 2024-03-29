import pandas as pd
from itertools import product
from openpyxl import Workbook
import re

def extract_elements(calculation_str):
    """
    Extract unique terms and operation types from calculation strings.
    """    # Define function keywords to look for
    function_keywords = ['SUM', 'DIFFERENCE', 'MIN', 'MAX', 'IN']
    
    # Regular expression to identify terms (assuming terms are quoted or listed after 'IN')
    term_regex = re.compile(r'"(.*?)"|\'(.*?)\'|\bIN\s*\((.*?)\)')
    
    # Find all terms
    terms = term_regex.findall(calculation_str)
    # Flatten the list of terms and filter out empty strings
    terms = [item for sublist in terms for item in sublist if item]
    
    # Clean and separate terms for 'IN' operation
    in_terms = [term.split(',') for term in terms if ',' in term]
    in_terms = [item.strip().strip("'").strip('"') for sublist in in_terms for item in sublist]
    
    # Remove 'IN' operation terms from the main list
    terms = [term for term in terms if ',' not in term]
    
    # Combine and ensure unique terms
    all_terms = list(set(terms + in_terms))
    
    # Assign each term a column name
    term_to_column = {term: chr(65 + i) for i, term in enumerate(all_terms)}
    
    # Reconstruct the logical function with column names
    logical_function = calculation_str
    for term, column_name in term_to_column.items():
        logical_function = re.sub(rf'"{term}"|\'{term}\'', column_name, logical_function)

    # Replace function keywords with their operation equivalents if needed
    for keyword in function_keywords:
        logical_function = logical_function.replace(keyword, keyword.upper())

    return term_to_column, logical_function


def generate_test_scaffolding(input_file, output_file):
    df = pd.read_excel(input_file, sheet_name='indicator definitions')
    writer = pd.ExcelWriter(output_file, engine='openpyxl')

    for index, row in df.iterrows():
        # Create a new worksheet for each indicator
        ws_name = f'Indicator_{index + 1}'
        workbook = writer.book
        if ws_name in workbook.sheetnames:
            ws = workbook[ws_name]
        else:
            ws = workbook.create_sheet(title=ws_name)

        # Extract disaggregation elements and data elements
        disaggregation_elements = row['Disaggregation data elements'].split(',')
        data_elements = row['List of all data elements included in numerator and denominator'].split(',')

        # Extract and process calculation elements
        numerator_terms, numerator_ops = extract_elements(row['Numerator Calculation'])
        denominator_terms, denominator_ops = extract_elements(row['Denominator Calculation'])

        # Combine all unique terms for header
        all_terms = list(set(disaggregation_elements + data_elements + list(numerator_terms) + list(denominator_terms)))
        headers = ['Patient ID'] + all_terms + ['Operation Type']

        # Write headers to the worksheet
        ws.append(headers)

        # Generate true/false combinations for each term
        combinations = list(product([0, 1], repeat=len(all_terms)))
        for i, combo in enumerate(combinations, start=1):
            # Append combination rows with Patient ID
            ws.append([i] + list(combo) + ['COUNT' if 'COUNT' in numerator_ops else 'SUM'])

    writer.save()
