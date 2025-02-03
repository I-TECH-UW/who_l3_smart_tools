import yaml


def load_yaml_mapping(mapping_file):
    """
    Load a YAML file that maps phenotype columns (from the template)
    to FHIR profiles, resources, and example generators.
    """
    with open(mapping_file, "r") as f:
        mapping = yaml.safe_load(f)
    return mapping


# Example YAML structure:
# HIV.IND.20:
#   Patient:
#     profile: HivPatientProfile
#     id_column: "Patient.id"
#     gender_column: "Patient.gender"
#     birthDate_column: "Patient.birthDate"
#   Observation:
#     profile: HivHivTestProfile
#     test_date_column: "Test.date"
#     result_column: "Test.result"
#   labels:
#     numerator_label: "Label as Numerator (True/False)"
#     denominator_label: "Label as Denom (True/False)"
