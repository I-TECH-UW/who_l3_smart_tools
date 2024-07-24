#! /usr/bin/env python
import argparse

from who_l3_smart_tools.cli.utils import add_common_args
from who_l3_smart_tools.core.questionnaires.questionnaire_generator import (
    QuestionnaireGenerator,
)


def main():
    parser = argparse.ArgumentParser(
        description="Generate Questionnaire FSH from L3 Data Dictionary Excel file."
    )
    add_common_args(parser)

    args = parser.parse_args()

    QuestionnaireGenerator(args.input, args.output).generate_fsh_from_excel()


if __name__ == "__main__":
    main()
