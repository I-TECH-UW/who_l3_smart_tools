import datetime
import os
import argparse
from pathlib import Path
import pandas as pd
from ..core.indicator_testing.bundle_generator import BundleGenerator
from ..core.indicator_testing.data_generator import DataGenerator
from ..core.indicator_testing.scaffolding_generator import (
    ScaffoldingGenerator,
)


def generate_test_scaffold(input_file):
    scaffolding_generator = ScaffoldingGenerator(
        input_file,
        "Indicator_Scaffold_"
        + datetime.datetime.now(datetime.timezone.utc).strftime("%Y%m%d_%H%M%S")
        + ".xlsx",
    )
    scaffolding_generator.generate_test_scaffolding()


def generate_test_values(input_file):
    data_generator = DataGenerator(input_file)
    data_generator.generate_data_file(
        "Indicator_Test_Data_"
        + datetime.datetime.now(datetime.timezone.utc).strftime("%Y%m%d_%H%M%S")
        + ".xlsx",
        1000,
    )


def generate_fhir_data(input_file, start_date, end_date, output_mode, fhir_server_url):
    # Create the output directory if it does not exist and if local output is needed
    if output_mode in ["local", "both"] and not os.path.exists("output"):
        os.makedirs("output")

    bundle_generator = BundleGenerator(input_file, "output/", start_date, end_date)
    generated_data = bundle_generator.generate_all_data()

    # Save generated bundles as ndjson files:
    for indicator, bundles in generated_data["bundles"].items():
        for bundle in bundles:
            if output_mode in ["local", "both"]:
                Path(f"output/{indicator}.json").write_text(bundle.json())
            if output_mode in ["server", "both"]:
                send_to_fhir_server(bundle, fhir_server_url)
    print("FHIR data generation complete.")


def main():
    parser = argparse.ArgumentParser(
        description="Tool for generating FHIR patient bundles and scaffolding spreadsheets from Excel files."
    )
    subparsers = parser.add_subparsers(dest="command", help="Available commands")

    # Step 1: Testing Scaffold Generation
    scaffolding_parser = subparsers.add_parser(
        "scaffold",
        help="Generate test scaffolding spreadsheet from DAK Indicator file.",
    )
    scaffolding_parser.add_argument(
        "input_file",
        help="The Indicator Excel file to be used as input for generating the scaffolding.",
    )

    # Step 2: Test Data Generation
    test_data_parser = subparsers.add_parser(
        "generate-test-sheets",
        help="Generate random test data sheets from the scaffolding spreadsheet.",
    )
    test_data_parser.add_argument(
        "input_file", help="The Excel file containing the scaffolding data."
    )

    # Step 3: FHIR Bundle generation
    generate_fhir_parser = subparsers.add_parser(
        "generate-fhir-data", help="Generate FHIR patient bundles from Test Data file."
    )
    generate_fhir_parser.add_argument(
        "input_file", help="The Excel file containing the patient data."
    )
    generate_fhir_parser.add_argument(
        "--start_date", help="The start of the measurement period (inclusive)."
    )
    generate_fhir_parser.add_argument(
        "--end_date", help="The end of the measurement period (inclusive)."
    )
    generate_fhir_parser.add_argument(
        "--output", help="Output mode: local, server, both", default="local"
    )
    generate_fhir_parser.add_argument(
        "--fhir-server-url",
        help="FHIR server URL",
        default="http://localhost:8080/fhir/",
    )

    args = parser.parse_args()

    if args.command == "scaffold":
        generate_test_scaffold(args.input_file)
    elif args.command == "generate-fhir-data":
        generate_fhir_data(
            args.input_file,
            getattr(args, "start_date", None),
            getattr(args, "end_date", None),
            args.output,
            args.fhir_server_url,
        )
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
