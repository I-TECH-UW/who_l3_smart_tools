#! /usr/bin/env python
import argparse
import json
import os

from who_l3_smart_tools.core.terminology.who.terminology import HIVTerminology


def write_terminology_valuesets(terminology, valueset_file):
    """
    Write terminology valuesets to a file.

    This function takes a terminology object and a file path and writes the valuesets
    from the terminology object to the specified file.

    Args:
    - terminology: The terminology object containing the valuesets.
    - valueset_file: The file path to write the valuesets to.

    """
    with open(valueset_file, "w", encoding="utf-8") as file:
        json.dump(terminology.valuesets, file, indent=2)


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
        required=False,
        help="File where to write valuesets.",
    )
    args = argparser.parse_args()

    os.makedirs(args.output_dir, exist_ok=True)

    hiv_terminology = HIVTerminology(args.excel_file)
    if args.output_format == "json":
        hiv_terminology.to_json(os.path.join(args.output_dir, "hiv_concepts.json"))
    else:
        hiv_terminology.to_csv(os.path.join(args.output_dir, "hiv_concepts.csv"))
    if args.values_set:
        write_terminology_valuesets(hiv_terminology, args.values_set)


if __name__ == "__main__":
    main()
