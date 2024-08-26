#! /usr/bin/env python
import argparse

from who_l3_smart_tools.core.l2.data_dictionary import L2Dictionary


def main():
    parser = argparse.ArgumentParser(
        description="Generate Questionnaire FSH from L3 Data Dictionary Excel file."
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
    parser.add_argument(
        "--skip-models",
        action="store_true",
        help="Skip generating models",
    )
    parser.add_argument(
        "--skip-questionnaires",
        action="store_true",
        help="Skip generating questionnaires",
    )
    parser.add_argument(
        "--skip-valuesets",
        action="store_true",
        help="Skip generating valuesets",
    )
    parser.add_argument(
        "--skip-concepts",
        action="store_true",
        help="Skip generating concepts",
    )
    args = parser.parse_args()

    data_dictionary = L2Dictionary(args.input, args.output)
    data_dictionary.process()
    if not args.skip_models:
        data_dictionary.write_models()
    if not args.skip_questionnaires:
        data_dictionary.write_questionnaires()
    if not args.skip_valuesets:
        data_dictionary.write_valuesets()
    if not args.skip_concepts:
        data_dictionary.write_concepts()


if __name__ == "__main__":
    main()
