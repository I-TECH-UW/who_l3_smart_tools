import datetime
import os
import argparse
from pathlib import Path
import pandas as pd
from bundle_generator import generate_patient_bundle
from fhirclient import send_to_fhir_server
from test_data_generation import generate_test_dataset
from test_data_generation import generate_test_scaffold

def generate_test_scaffold(input_file):
    generate_test_scaffold(input_file, output_file='Indicator_Scaffold_' + datetime.now().strftime('%Y%m%d_%H%M%S') + '.xlsx'

def generate_test_data(input_file):
    generate_test_dataset(1000, 'Indicator_Test_Data_' + datetime.now().strftime('%Y%m%d_%H%M%S') + '.xlsx')

def generate_fhir_data(input_file, start_date, end_date, output_mode, fhir_server_url):
    df = pd.read_excel(input_file, sheet_name=0)  # Adjust sheet_name as necessary

    # Create the output directory if it does not exist and if local output is needed
    if output_mode in ['local', 'both'] and not os.path.exists('output'):
        os.makedirs('output')

    for i, row in df.iterrows():
        patient_bundle = generate_patient_bundle(row.to_dict(), start_date, end_date)

        if output_mode in ['local', 'both']:
            Path(f'output/patient_bundle_{i+1}.json').write_text(patient_bundle.json())

        if output_mode in ['server', 'both']:
            send_to_fhir_server(patient_bundle, fhir_server_url)

def main():
    parser = argparse.ArgumentParser(description='Tool for generating FHIR patient bundles and scaffolding spreadsheets from Excel files.')
    subparsers = parser.add_subparsers(dest='command', help='Available commands')

    # Step 1: Testing Scaffold Generation
    scaffolding_parser = subparsers.add_parser('scaffold', help='Generate test scaffolding spreadsheet from DAK Indicator file.')
    scaffolding_parser.add_argument('input_file', help='The Indicator Excel file to be used as input for generating the scaffolding.')

    # Step 2: Test Data Generation
    test_data_parser = subparsers.add_parser('generate-test-sheets', help='Generate random test data sheets from the scaffolding spreadsheet.')
    test_data_parser.add_argument('input_file', help='The Excel file containing the scaffolding data.')

    # Step 3: FHIR Bundle generation
    generate_fhir_parser = subparsers.add_parser('generate-fhir-data', help='Generate FHIR patient bundles from Test Data file.')
    generate_fhir_parser.add_argument('input_file', help='The Excel file containing the patient data.')
    generate_fhir_parser.add_argument('--start_date', help='The start of the measurement period (inclusive).')
    generate_fhir_parser.add_argument('--end_date', help='The end of the measurement period (inclusive).')
    generate_fhir_parser.add_argument('--output', help='Output mode: local, server, both', default='local')
    generate_fhir_parser.add_argument('--fhir-server-url', help='FHIR server URL', default='http://localhost:8080/fhir/')


    args = parser.parse_args()

    if args.command == 'scaffold':
        generate_test_scaffold(args.input_file)
    elif args.command == 'generate-fhir-data':
        generate_fhir_data(args.input_file, getattr(args, 'start_date', None), getattr(args, 'end_date', None), args.output, args.fhir_server_url)
    else:
        parser.print_help()

if __name__ == '__main__':
    main()
