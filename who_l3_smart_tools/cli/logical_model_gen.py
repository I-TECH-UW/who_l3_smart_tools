import argparse
from who_l3_smart_tools.core.logical_models.logical_model_generator import (
    LogicalModelAndTerminologyGenerator,
)


def main():
    parser = argparse.ArgumentParser(
        description="Generate Logical Model FSH from L3 Data Dictionary Excel file."
    )
    parser.add_argument(
        "-i",
        "--input",
        default="./l3-data/test-data.xlsx",
        help="Input Data Dictionary file location",
    )
    parser.add_argument(
        "-o",
        "--output",
        default="./data/output",
        help="Output Logical Model FSH file location",
    )

    args = parser.parse_args()

    LogicalModelAndTerminologyGenerator(
        args.input, args.output
    ).generate_fsh_from_excel()


if __name__ == "__main__":
    main()
