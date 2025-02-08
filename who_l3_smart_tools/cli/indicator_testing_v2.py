import argparse
import sys
from who_l3_smart_tools.core.indicator_testing.v2.phenotype_generator import (
    generate_phenotype_xlsx,
)
from who_l3_smart_tools.core.indicator_testing.v2.dataset_generator import (
    generate_random_dataset,
)
from who_l3_smart_tools.core.indicator_testing.v2.fhir_bundle_generator import (
    generate_fhir_resources,
)
from who_l3_smart_tools.core.indicator_testing.v2.mapping_template_generator import (
    generate_mapping_template,
)


def main():
    parser = argparse.ArgumentParser(description="CLI tooling for indicator testing v2")
    subparsers = parser.add_subparsers(
        dest="command", help="Available commands for v2 testing"
    )

    # Generate phenotype XLSX
    phen_parser = subparsers.add_parser(
        "generate-phenotype", help="Generate phenotype definitions XLSX"
    )
    phen_parser.add_argument(
        "--input", required=True, help="Path to L2 indicator dataset (Excel)"
    )
    phen_parser.add_argument("--indicator", required=True, help="Indicator to work on")
    phen_parser.add_argument(
        "--output", required=True, help="Output phenotype XLSX file path"
    )

    # Generate random test dataset
    data_parser = subparsers.add_parser(
        "generate-test-dataset",
        help="Generate random test dataset from phenotype file for L3 Technical Experts",
    )
    data_parser.add_argument(
        "--phenotype", required=True, help="Path to phenotype XLSX file"
    )
    data_parser.add_argument(
        "--output", required=True, help="Output test dataset XLSX file path"
    )
    data_parser.add_argument(
        "--rows", type=int, default=1000, help="Number of random rows"
    )

    # Generate MeasureReport
    report_parser = subparsers.add_parser(
        "evaluate", help="Generate expected MeasureReport"
    )
    report_parser.add_argument(
        "--dataset", required=True, help="Path to test dataset XLSX file"
    )
    report_parser.add_argument(
        "--output", required=True, help="Output MeasureReport JSON file path"
    )

    # Generate a template XLSX for phenotype mapping
    template_parser = subparsers.add_parser(
        "generate-template", help="Generate a template XLSX for phenotype mapping"
    )
    template_parser.add_argument(
        "--input", required=True, help="Path to indicator XLSX file"
    )
    template_parser.add_argument(
        "--indicator", required=True, help="Indicator to work with"
    )
    template_parser.add_argument(
        "--output", required=True, help="Output template XLSX file path"
    )

    # Generate mapping YAML template
    mapping_parser = subparsers.add_parser(
        "generate-mapping-template",
        help="Generate mapping YAML template from phenotype template",
    )
    mapping_parser.add_argument(
        "--template", required=True, help="Path to filled phenotype XLSX template"
    )
    mapping_parser.add_argument(
        "--output", required=True, help="Output mapping YAML file path"
    )

    # Generate FHIR artifacts using filled template and YAML mapping
    fhir_parser = subparsers.add_parser(
        "generate-fhir",
        help="Generate FHIR bundles and TestScript from a phenotype template and mappings YAML",
    )
    fhir_parser.add_argument(
        "--template", required=True, help="Path to completed phenotype XLSX template"
    )
    fhir_parser.add_argument(
        "--mapping", required=True, help="Path to YAML mapping file"
    )
    fhir_parser.add_argument(
        "--output-dir", required=True, help="Output directory for FHIR resources"
    )

    args = parser.parse_args()

    if args.command == "generate-phenotype":
        generate_phenotype_xlsx(args.input, args.indicator, args.output)
    elif args.command == "generate-test-dataset":
        generate_random_dataset(args.phenotype, args.output, num_rows=args.rows)
    elif args.command == "evaluate":
        generate_measure_report(args.dataset, args.output)
    elif args.command == "generate-template":
        generate_template_xlsx(args.input, args.indicator, args.output)
    elif args.command == "generate-mapping-template":
        generate_mapping_template(args.template, args.output)
    elif args.command == "generate-fhir":
        generate_fhir_resources(args.template, args.mapping, args.output_dir)
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == "__main__":
    main()
