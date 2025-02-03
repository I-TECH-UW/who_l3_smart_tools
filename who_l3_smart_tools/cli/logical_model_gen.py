import argparse

from who_l3_smart_tools.cli.utils import add_common_args
from who_l3_smart_tools.core.logical_models.logical_model_generator import (
    LogicalModelAndTerminologyGenerator,
)


def main():
    parser = argparse.ArgumentParser(
        description="Generate Logical Model FSH from L3 Data Dictionary Excel file."
    )
    add_common_args(parser)

    args = parser.parse_args()

    LogicalModelAndTerminologyGenerator(
        args.input, args.output
    ).generate_fsh_from_excel()


if __name__ == "__main__":
    main()
