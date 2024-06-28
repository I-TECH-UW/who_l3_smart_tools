import stringcase

# Measure Profiles from http://hl7.org/fhir/us/cqfmeasures/STU4/index.html
measure_instance = {
    "proportion": "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm",
    "continuous-variable": "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cv-measure-cqfm",
}

# Measure Required Populations
measure_required_elements = {
    "proportion": ["initialPopulation", "numerator", "denominator"],
    "continuous-variable": [
        "initialPopulation",
        "measurePopulation",
        "measureObservation",
    ],
}


def determine_scoring(denominator_val):
    # Determine Scoring Type and set proper values
    if (
        not denominator_val
        or denominator_val.trim() == "1"
        or denominator_val.trim() == ""
    ):
        scoring = "continuous-variable"
        scoring_title = stringcase.titlecase(scoring)
    else:
        scoring = "proportion"
        scoring_title = stringcase.titlecase(scoring)

    scoring_instance = measure_instance[scoring]

    return scoring, scoring_title, scoring_instance
