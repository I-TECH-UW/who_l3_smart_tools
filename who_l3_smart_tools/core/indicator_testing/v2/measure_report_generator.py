import pandas as pd
import json
from datetime import datetime


def generate_measure_report(dataset_excel, output_json):
    df = pd.read_excel(dataset_excel)
    # For illustration, we simply count rows to compute denominator and count those with a specific field value for numerator.
    denominator = len(df)
    numerator = df[df.get("num", "") == "HIV-positive"].shape[0]
    measure_report = {
        "resourceType": "MeasureReport",
        "id": "measurereport-v2",
        "status": "complete",
        "type": "summary",
        "measure": "http://example.org/measure/HIV.IND.20",
        "date": datetime.now().isoformat(),
        "period": {"start": "2024-03-01", "end": "2024-03-31"},
        "group": [
            {
                "population": [
                    {
                        "code": {"coding": [{"code": "initial-population"}]},
                        "count": denominator,
                    },
                    {"code": {"coding": [{"code": "numerator"}]}, "count": numerator},
                ]
            }
        ],
    }
    with open(output_json, "w") as f:
        json.dump(measure_report, f, indent=4)
    print(f"MeasureReport generated: {output_json}")
