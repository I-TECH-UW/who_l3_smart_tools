import pandas as pd
import json
import os
from fhir_mapping_manager import load_yaml_mapping
from fhir.resources.bundle import Bundle
from fhir.resources.measurereport import MeasureReport
from fhir.resources.testscriptexample import (
    TestScript,
)  # Assume a TestScript resource exists


def generate_fhir_resources(template_file, mapping_file, output_directory):
    """
    For L3 Technical Experts:
    Uses a filled phenotype template and YAML mapping to generate:
    1. A FHIR Bundle for each phenotype row,
    2. A representative MeasureReport,
    3. A TestScript resource for automated testing.
    """
    mapping = load_yaml_mapping(mapping_file)
    indicator_key = list(mapping.keys())[0]
    indicator_mapping = mapping[indicator_key]

    df = pd.read_excel(template_file)
    bundles = []

    for idx, row in df.iterrows():
        bundle = Bundle.construct()
        patient = {
            "resourceType": "Patient",
            "id": row.get(indicator_mapping["Patient"]["id_column"]),
            "gender": row.get(indicator_mapping["Patient"]["gender_column"]),
            "birthDate": str(row.get(indicator_mapping["Patient"]["birthDate_column"])),
        }
        bundle.entry = [{"resource": patient}]
        if (
            row.get(indicator_mapping["labels"]["numerator_label"], "").lower()
            == "true"
        ):
            observation = {
                "resourceType": "Observation",
                "status": "final",
                "subject": {"reference": f"Patient/{patient['id']}"},
                "code": {"coding": [{"code": "HIV-positive"}]},
                "effectiveDateTime": row.get(
                    indicator_mapping["Observation"]["test_date_column"]
                ),
                "valueCodeableConcept": {
                    "text": row.get(indicator_mapping["Observation"]["result_column"])
                },
            }
            bundle.entry.append({"resource": observation})
        bundles.append(bundle)

    measure_report = MeasureReport.construct()
    measure_report.status = "complete"
    measure_report.group = [
        {
            "population": [
                {
                    "code": {"coding": [{"code": "initial-population"}]},
                    "count": len(df),
                },
                {
                    "code": {"coding": [{"code": "numerator"}]},
                    "count": int(
                        df[indicator_mapping["labels"]["numerator_label"]]
                        .str.lower()
                        .eq("true")
                        .sum()
                    ),
                },
            ]
        }
    ]

    test_script = TestScript.construct()
    test_script.status = "active"
    test_script.name = f"TestScript for {indicator_key}"
    # ...existing code for additional test steps...

    if not os.path.isdir(output_directory):
        os.makedirs(output_directory)

    for i, bundle in enumerate(bundles):
        bundle_file = os.path.join(output_directory, f"bundle_{i}.json")
        with open(bundle_file, "w") as f:
            json.dump(bundle.dict(), f, indent=4)
    mr_file = os.path.join(output_directory, "measure_report.json")
    with open(mr_file, "w") as f:
        json.dump(measure_report.dict(), f, indent=4)
    ts_file = os.path.join(output_directory, "test_script.json")
    with open(ts_file, "w") as f:
        json.dump(test_script.dict(), f, indent=4)

    print(f"FHIR resources generated in: {output_directory}")
