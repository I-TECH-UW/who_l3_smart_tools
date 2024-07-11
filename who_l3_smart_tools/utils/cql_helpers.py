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
    "proportion": ["initialPopulation", "Numerator", "Denominator"],
    "continuous-variable": [
        "initialPopulation",
        "measurePopulation",
        "measureObservation",
    ],
}


def create_cql_concept_dictionaries(dd_xls: dict, dak_name: str):
    """
    This method creates a dictionary of concepts from the data dictionary file to include in the CQL
    templates
    """

    # Create a dictionary of concepts
    indicator_concept_lookup = {}
    cql_concept_dictionary = {}

    # TODO: refactor to common method across logic/terminology/this file
    for sheet_name in dd_xls.keys():
        if re.match(rf"{dak_name}\.\w+", sheet_name):
            df = dd_xls[sheet_name]
            for i, row in df.iterrows():
                # Grab Linkages to Decision Support Tables and Aggregate Indicators
                data_type = row["Data Type"]
                data_element_id = row["Data Element ID"]

                cds = row["Linkages to Decision Support Tables"]
                indicators = row["Linkages to Aggregate Indicators"]

                # Handle label value == "None"
                if row["Data Element Label"] is None or pd.isna(
                    row["Data Element Label"]
                ):
                    print(f"Data Element Label is None for {data_element_id}")
                    row["Data Element Label"] = "None"

                linkages = []
                ## TODO: refactor to remove duplicate code for cds and indicators

                # Select row if Linkage to CDS or Indicator is not empty
                if cds and type(cds) == str and not pd.isna(cds):
                    # Grab: Data Element ID, Data Element Label, Description and Definition
                    # and index by indicator / cds ids

                    # Add to concept dictionary if not already present
                    if data_element_id not in cql_concept_dictionary.keys():
                        cql_concept_dictionary[data_element_id] = {
                            "label": row["Data Element Label"],
                            "sheet": sheet_name,
                            "data_type": data_type,
                            "description": row["Description and Definition"],
                        }

                    # Parse linkages
                    linkages.extend([item.strip() for item in cds.split(",")])
                if indicators and type(indicators) == str and not pd.isna(indicators):
                    # Add to concept dictionary if not already present
                    if data_element_id not in cql_concept_dictionary.keys():
                        cql_concept_dictionary[data_element_id] = {
                            "label": row["Data Element Label"],
                            "sheet": sheet_name,
                            "data_type": data_type,
                            "description": row["Description and Definition"],
                        }

                    linkages.extend([item.strip() for item in indicators.split(",")])

                # Add linkages as keys to concept dictionary, and add data element details
                for linkage in linkages:
                    # if linkage not in concept dictionary, add it
                    if linkage not in indicator_concept_lookup.keys():
                        indicator_concept_lookup[linkage] = []

                    # Add data element details to linkage
                    indicator_concept_lookup[linkage].append(
                        {
                            "id": row["Data Element ID"],
                            "label": row["Data Element Label"],
                            "description": row["Description and Definition"],
                        }
                    )

    return indicator_concept_lookup, cql_concept_dictionary


def determine_scoring_suggestion(denominator_val: str):
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


def determine_scoring_from_cql(parsed_cql: dict):
    # Determine scoring type based on the provided CQL entries
    # For proportion scoring, we need to check for the presence of
    # `initialPopulation`, `Numerator`, and `Denominator` elements
    # For continuous-variable scoring, we need to check for the presence of
    # `initialPopulation`, `measurePopulation`, and `measureObservation` elements

    scoring = None
    scoring_title = None
    scoring_instance = None

    if parsed_cql["initialPopulation"]:
        if parsed_cql["denominator"] and parsed_cql["numerator"]:
            scoring = "proportion"
            scoring_title = stringcase.titlecase(scoring)
            scoring_instance = measure_instance[scoring]
        elif parsed_cql["measurePopulation"] and parsed_cql["measureObservation"]:
            scoring = "continuous-variable"
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


scoring_ip_template = """
/*
 * Generated template based on {denominator_definition}
 */
define "Initial Population":
  true
"""

scoring_cv_mp_template = """
define "measurePopulation":
  true
"""

scoring_cv_mp_excl_template = """
define "measurePopulationExclusion
    false
"""

scoring_cv_mo_template = """
define "measureObservation":
  true
"""

scoring_prop_num_template = """
define "Numerator":
  true
"""

scoring_prop_den_template = """
define: "Denominator":
  true
"""


def generate_population_definitions(scoring, indicator_row):
    # Generate Population Definitions based on suggested scoring
    #
    # For now, we will focus on continuous-variable scoring and
    # proportion scoring.
    #
    # CV scoring requires the following populations:
    # - Initial Population:
    # - Measure Population:
    # - Measure Observation:
    #
    # Proportion scoring requires the following populations:
    # - Initial Population:
    # - Numerator:
    # - Denominator:
    #
    # We will generate placeholder population definitions for now for
    # indicators where these sections are not defined.

    population_definitions = []

    return population_definitions
