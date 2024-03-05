import argparse
from l3_logical_model_generator.generator import generate_fsh_from_excel


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

    generate_fsh_from_excel(args.input, args.output)


if __name__ == "__main__":
    main()
