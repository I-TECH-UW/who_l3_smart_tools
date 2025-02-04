from datetime import datetime, timedelta
import pandas as pd
import os
from who_l3_smart_tools.core.indicator_testing.v2.fhir_mapping_manager import (
    load_yaml_mapping,
)
import requests
import json
from v2.test_artifact_generator import generate_test_artifacts

############################################
# Testing with FHIR Guidance
############################################
# https://build.fhir.org/testing.html
# https://build.fhir.org/testplan.html
# https://build.fhir.org/testscript.html


def generate_test_resource(queried_profile_json, cell_value, resource_mapping, patient):
    resource_template = resource_mapping[cell_value]

    # Update templated fields with relevant data
    # TODO: expand this to handle more complex templating
    resource = resource_template.replace("{{patient_id}}", patient["id"])

    return resource


def generate_fhir_resources(
    template_file, mapping_file, output_directory, reporting_period=None
):
    """
    For L3 Technical Experts:
    Uses a filled phenotype template and YAML mapping to generate:
    1. A FHIR Bundle for each phenotype row,
    2. A representative MeasureReport,
    3. TestScript and TestPlan resources as test artifacts.
    """
    # Use last 30 days as default reporting period
    if not reporting_period:
        reporting_period = (
            (datetime.now() - timedelta(days=30)).isoformat(),
            datetime.now().isoformat(),
        )

    mapping = load_yaml_mapping(mapping_file)
    indicator_key = list(mapping.keys())[0]
    indicator_mapping = mapping[indicator_key]

    df = pd.read_excel(template_file)
    test_bundle = None
    data_bundles = []
    patient = None

    for idx, row in df.iterrows():
        # Create basic Patient resource to bundle
        patient = {
            "resourceType": "Patient",
            "id": row.get(indicator_mapping["Patient"]["id_column"]),
            "gender": row.get(indicator_mapping["Patient"]["gender_column"]),
            "birthDate": str(row.get(indicator_mapping["Patient"]["birthDate_column"])),
        }

        # Add a resource or patient field to the bundle for each column in the yaml mapping
        additional_resources = []

        for column_name, resource_mapping in indicator_mapping.items():
            # For each cell in this row, look up the corresponding column's resource mapping,
            #  determine what specifically the cell value maps to, and use the definition of this
            # profile to create a resource and add it to the bundle. The profile and any other
            # links (example resources etc.) will be available using an url like
            # `https://i-tech-uw.github.io/smart-hiv/StructureDefinition-HivHcvTest.json`, and this
            # url will be available in the yaml mapping file.

            cell_value = row.get(column_name)
            target_profile_url = resource_mapping["target-url"]

            # Query the target_profile_url on the web and grab the json object content.
            #   Raise an error if the url is not found.
            response = requests.get(target_profile_url)
            response.raise_for_status()
            queried_profile_json = response.json()

            additional_resources.append(
                generate_test_resource(
                    queried_profile_json, cell_value, resource_mapping, patient
                )
            )
        patient_bundle = f"""{
            "resourceType": "Bundle",
            "type": "collection",
            "entry": [
              {json.dumps(patient)},
              {",\n".join(additional_resources)}
            ]
        }
        """
        data_bundles.append(patient_bundle)

    # Generate the MeasureReport for this dataset based on the example and the provided row data
    # measure_report = MeasureReport.parse_obj(measure_report_example)
    # measure_report.group[0]["population"][0].count = row.get(
    #     indicator_mapping["labels"]["numerator_label"]
    # )
    # measure_report.group[0]["population"][1].count = row.get(
    #     indicator_mapping["labels"]["denominator_label"]
    # )
    # measure_report.period["start"] = reporting_period[0]
    # measure_report.period["end"] = reporting_period[1]

    # measure_report.date = DateTime.now()

    test_bundle = generate_test_artifacts(df, reporting_period)

    # Create output directory if it doesn't exist
    if not os.path.isdir(output_directory):
        os.makedirs(output_directory)

    # Write Test Data Bundle to one file per patient bundle
    for idx, data_bundle in enumerate(data_bundles):
        with open(
            os.path.join(output_directory, f"test_data_bundle_{idx}.json"), "w"
        ) as f:
            f.write(data_bundle)

    # Write Testing Bundle to file
    with open(os.path.join(output_directory, "test_bundle.json"), "w") as f:
        f.write(test_bundle)

    print(f"FHIR resources generated in: {output_directory}")
