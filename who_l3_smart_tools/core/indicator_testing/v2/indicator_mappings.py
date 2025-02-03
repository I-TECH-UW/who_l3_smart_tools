# Mapping between indicator definitions and corresponding FHIR resource data
INDICATOR_MAPPINGS = {
    "HIV.IND.20": {
        "fhir_profiles": {
            "Patient": "HivPatientProfile",
            "Observation": "HivHivTestProfile",
        },
        "expected_fields": {
            "num": "HIV-positive",  # numerator indicator value expected in Observation.valueCodeableConcept
            "den": "valid_test_date",  # indicator that the test date is in-range
        },
    },
    # ... add further indicators as needed
}
