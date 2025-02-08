import yaml


class YamlMappingManager:
    """
    Provides an interface for accessing mapping configuration.
    Accepts either a mapping dict or a file path.
    """

    def __init__(self, mapping):
        # If mapping is not a dict, assume it's a file path
        if not isinstance(mapping, dict):
            mapping = self.load_yaml_mapping(mapping)
        self.mapping = mapping
        # Build an index of features by their name field.
        self.features_index = {
            feature["name"]: feature for feature in self.mapping.get("features", [])
        }

    @staticmethod
    def load_yaml_mapping(mapping_file):
        """
        Load a YAML file that maps phenotype columns (from the template)
        to FHIR profiles, resources, and example generators.
        """
        with open(mapping_file, "r") as f:
            mapping = yaml.safe_load(f)
        return mapping

    def get_feature_mapping(self, feature_name):
        """
        Return the mapping entry for the given feature name.
        """
        return self.features_index.get(feature_name)


# Example YAML Structure:


# dak_id: HIV.IND.20
# reporting_period:
#   start: '2025-01-01'
#   end: '2025-01-30'
# features:
# - id: '0'
#   name: Has HIV test
#   target_profile: 'HivHivTest'
#   grouping_id: '0'
#   values:
#   - exists: true
#     phenotype_value: '1'
#   - exists: false
#     phenotype_value: '0'
# - id: '1'
#   name: Has HIV test within reporting period
#   target_profile: 'HivHivTest'
#   target_fhir_path: 'Observation.effectiveDateTime'
#   grouping_id: '0'
#   values:
#   - fhir_value: '2025-01-05'
#     phenotype_value: '1'
#   - fhir_value: '2024-12-22'
#     phenotype_value: '0'
# - id: '2'
#   name: Hiv test resulted
#   target_profiles: 'HivHivTest'
#   grouping_id: '0'
#   values:
#   - phenotype_value: '1'
#   - phenotype_value: '0'
# - id: '3'
#   name: HIV test result returned during reporting period
#   grouping_id: '0'
#   fhir_path: 'Observation.issuedDateTime'
#   values:
#   - fhir_value: '2025-01-10'
#     phenotype_value: '1'
#   - fhir_value: '2025-02-10'
#     phenotype_value: '0'
# - id: '4'
#   name: HIV test result value
#   target_profiles: 'HivHivTest'
#   target_valuesets: 'HIV.B.DE111'
#   fhir_path: 'Observation.valueCodeableConcept'
#   values:
#   - fhir_value: '#HIV.B.DE112'
#     phenotype_value: positive
#   - fhir_value: '#HIV.B.DE113'
#     phenotype_value: negative
#   - fhir_value: '#HIV.B.DE114'
#     phenotype_value: inconclusive
# - id: '5'
#   name: Has HIV Diagnosis
#   grouping_id: '1'
#   target_profiles: 'HivStatusCondition'
#   target_valuesets: 'HIV.B.DE115'
#   fhir_path: 'Condition.code'
#   values:
#   - fhir_value: '#HIV.B.DE117'
#     phenotype_value: '0'
#   - fhir_value: '#HIV.B.DE116'
#     phenotype_value: '1'
# - id: '6'
#   name: HIV Diagnosis in reporting period
#   target_profiles: 'HivStatusCondition'
#   grouping_id: '1'
#   fhir_path: 'Condition.onsetDateTime'
#   values:
#   - fhir_value: '2025-02-10'
#     phenotype_value: '0'
#   - fhir_value: '2025-01-10'
#     phenotype_value: '1'
