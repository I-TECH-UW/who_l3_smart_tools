import yaml


def generate_mapping_template(template_excel, output_yaml):
    """
    For L3 Technical Experts:
    Generates a stub mapping YAML template from a filled phenotype XLSX.
    This template is then to be updated with correct FHIR profile links and mappings.
    """
    mapping_template = {
        "HIV.IND.20": {
            "Patient": {
                "profile": "HivPatient",  # placeholder profile
                "id_column": "Patient.id",
                "gender_column": "Patient.gender",
                "birthDate_column": "Patient.birthDate",
            },
            "Observation": {
                "profile": "HivHivTest",  # placeholder profile
                "test_date_column": "Test.date",
                "result_column": "Test.result",
            },
            "labels": {
                "numerator_label": "Label as Numerator (True/False)",
                "denominator_label": "Label as Denom (True/False)",
            },
        }
    }
    with open(output_yaml, "w") as f:
        yaml.dump(mapping_template, f, default_flow_style=False)
    print(f"Mapping template YAML generated: {output_yaml}")
