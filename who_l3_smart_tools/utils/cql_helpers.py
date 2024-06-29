import stringcase
import re
import pandas as pd

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
        or denominator_val.strip() == "1"
        or denominator_val.strip() == ""
    ):
        scoring = "continuous-variable"
        scoring_title = stringcase.titlecase(scoring)
    else:
        scoring = "proportion"
        scoring_title = stringcase.titlecase(scoring)

    scoring_instance = measure_instance[scoring]

    return scoring, scoring_title, scoring_instance


def get_dak_name(dd_xls: dict):
    # Get DAK name from sheet names using regex to match
    # a sheet name like `HIV.A Registration` or `HIV.B HTS visit`
    # and grab the `HIV` part of the name
    # TODO: save as utility?
    dak_name_pattern = re.compile(r"(\w+)\.\w+")
    dak_name_matches = []
    dak_name = None

    for sheet_name in dd_xls.keys():
        if not sheet_name or pd.isna(sheet_name) or type(sheet_name) != str:
            continue
        matches = dak_name_pattern.search(sheet_name)
        dak_name_matches.extend(matches.groups()) if matches else None

    # Determine if all matches are the same
    if len(set(dak_name_matches)) == 1:
        dak_name = dak_name_matches[0]
    else:
        raise ValueError("DAK name does not match across all sheets")

    return dak_name
