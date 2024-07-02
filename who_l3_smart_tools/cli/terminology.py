#! /usr/bin/env python
import argparse
import os
import sys

from who_l3_smart_tools.core.terminology.who.terminology import HIVTerminology



def main():
    """
    Generate HIV Concept Terminology.

    This function parses command line arguments to generate HIV Concept Terminology.
    It requires either an Excel file or a list of CSV files containing the HIV terminology data.
    The generated terminology can be outputted in either CSV or JSON format.

    Command line arguments:
    -o, --output-dir: Output directory for the generated HIV Concept Terminology.
    -e, --excel-file: Excel file containing the HIV terminology data.
    -f, --files: List of CSV files containing the HIV terminology data.
    -of, --output-format: Output format for the generated HIV Concept Terminology. (default: csv)

    Raises:
    - ValueError: If neither an Excel file nor CSV files are provided.

    """
    argparser = argparse.ArgumentParser(description="Generate HIV Concept Terminology.")

    files_group = argparser.add_mutually_exclusive_group(required=True)

    argparser.add_argument(
        "-o",
        "--output-dir",
        required=True,
        help="Output directory for the generated HIV Concept Terminology.",
    )
    files_group.add_argument(
        "-e",
        "--excel-file",
        help="Excel file containing the HIV terminology data.",
    )
    files_group.add_argument(
        "-f",
        "--files",
        nargs="+",
        help="List of CSV files containing the HIV terminology data.",
    )
    argparser.add_argument(
        "-of",
        "--output-format",
        default="csv",
        choices=["csv", "json"],
        help="Output format for the generated HIV Concept Terminology.",
    )
    args = argparser.parse_args()

    os.makedirs(args.output_dir, exist_ok=True)

    if args.excel_file:
        hiv_terminology = HIVTerminology.from_excel(args.excel_file)
    elif args.files:
        hiv_terminology = HIVTerminology(args.files)
    else:
        raise ValueError("Either an Excel file or CSV files must be provided.")

    if args.output_format == "json":
        hiv_terminology.process_concept_for_json(os.path.join(args.output_dir, "hiv_concepts.json"))
    else:
        hiv_terminology.process_concept_for_csv(os.path.join(args.output_dir, "hiv_concepts.csv"))


if __name__ == "__main__":
    sys.exit(main())