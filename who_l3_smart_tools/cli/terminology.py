#! /usr/bin/env python
import argparse
import os
import sys

sys.path.insert(0, os.getcwd())

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
    -f, --output-format: Output format for the generated HIV Concept Terminology. (default: csv)
    -v, --values-set: File where to write valuesets.

    Raises:
    - ValueError: If neither an Excel file nor CSV files are provided.

    """
    argparser = argparse.ArgumentParser(description="Generate HIV Concept Terminology.")

    argparser.add_argument(
        "-o",
        "--output-dir",
        required=True,
        help="Output directory for the generated HIV Concept Terminology.",
    )
    argparser.add_argument(
        "-e",
        "--excel-file",
        help="Excel file containing the HIV terminology data.",
    )
    argparser.add_argument(
        "-f",
        "--output-format",
        default="csv",
        choices=["csv", "json"],
        help="Output format for the generated HIV Concept Terminology.",
    )
    argparser.add_argument(
        "-v",
        "--values-set",
        help="File where to write valuesets.",
    )
    args = argparser.parse_args()

    os.makedirs(args.output_dir, exist_ok=True)


    hiv_terminology = HIVTerminology.from_excel(args.excel_file)
    if args.output_format == "json":
        hiv_terminology.process_concept_for_json(os.path.join(args.output_dir, "hiv_concepts.json"))
    else:
        hiv_terminology.process_concept_for_csv(os.path.join(args.output_dir, "hiv_concepts.csv"))
    hiv_terminology.write_value_sets(args.values_set)


if __name__ == "__main__":
    sys.exit(main())