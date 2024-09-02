#! /usr/bin/env python
import argparse
from os import makedirs

from who_l3_smart_tools.core.l2.indicators import IndicatorLibrary


def main():
    parser = argparse.ArgumentParser(
        description="Generate Questionnaire FSH from L3 Data Dictionary Excel file."
    )
    parser.add_argument(
        "-dd",
        "--data_dictionary",
        required=True,
        help="Path to the L2 Data Dictionary",
    )
    parser.add_argument(
        "-i",
        "--input",
        required=True,
        help="Path to the L2 Data Dictionary",
    )
    parser.add_argument(
        "-o",
        "--output",
        required=True,
        help="Path to the output directory.",
    )
    args = parser.parse_args()

    makedirs(args.output, exist_ok=True)

    indicators = IndicatorLibrary(args.input, args.output, args.data_dictionary)
    indicators.generate_cql_scaffolds()


if __name__ == "__main__":
    main()
