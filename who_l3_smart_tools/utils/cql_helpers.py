import re

import pandas as pd
import stringcase

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

# CQL File name type keywords per
# https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_cql.html
common_cql_filename_keywords: list = [
    "Common",
    "Concepts",
    "Config",
    "Elements",
]

common_cql_element_filename_keywords: list = [
    "Encounter",
    "Indicator",
]

# Get indicator DAK ID from CQL file with first instance of DAK ID pattern HIV.IND.X
DAK_INDICATOR_ID_COMMENT_PATTERN = re.compile(r"(\S+)\.(IND)\.(\d+)\s(Logic)")
DAK_INDICATOR_ID_CODE_PATTERN = re.compile(r"(\S+)(IND)(\d+)(Logic)")
DAK_DT_ID_COMMENT_PATTERN = re.compile(r"(\S+)\.(\S+)\.(DT)(\S*)\s(Logic)")
DAK_DT_ID_CODE_PATTERN = re.compile(r"(\S+)(DT)(\S*)(Logic)")


def sanitize_description(description: str):
    # Sanitize description to remove special characters
    return description.replace('"', "'").replace("\n", " | ").replace("*", "")


def sanitize_label(label: str):
    # Sanitize label to remove special characters
    return label.replace("*", "")


def create_cql_concept_dictionaries(dd_xls: dict, dak_name: str):
    """
    This method creates a dictionary of concepts from the data dictionary file to include in the CQL
    templates
    """

    # Create a dictionary of concepts
    indicator_concept_lookup: dict[str, list[dict[str, str]]] = {}
    cql_concept_dictionary: dict[str, dict[str, str]] = {}

    for sheet_name in dd_xls.keys():
        if re.match(rf"{dak_name}\.\w+", sheet_name):
            df: pd.DataFrame = dd_xls[sheet_name]
            lastCodingId = None
            for _, row in df.iterrows():
                linkages: list = []
                # Save last coding label for use in following codings
                if row["Data Type"] == "Coding":
                    lastCodingId = row["Data Element ID"]

                linkages = []

                update_concepts_and_linkages(
                    row,
                    sheet_name,
                    lastCodingId,
                    linkages,
                    cql_concept_dictionary,
                )

                # Add linkages as keys to concept dictionary, and add data element details
                for linkage in linkages:
                    # if linkage not in concept dictionary, add it
                    if linkage not in indicator_concept_lookup:
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


def update_concepts_and_linkages(
    row: pd.Series,
    sheet_name: str,
    lastCodingId: str,
    linkages: list,
    cql_concept_dictionary: dict,
):
    """
    This method creates a dictionary of concepts from the data dictionary file to include in the CQL
    templates.

    It takes in a row of data from the data dictionary file, the sheet name, and the last coding ID, and
    modifies the linkages list and the cql_concept_dictionary dictionary in place.

    Parameters:
    - row: pd.Series
        The row of data from the data dictionary file
    - sheet_name: str
        The name of the sheet in the data dictionary file
    - lastCodingId: str
        The last coding ID
    - linkages: list
        The list of linkages that will be updated
    - cql_concept_dictionary: dict
        The dictionary of concepts that will be updated

    Returns: None
    """
    sheet_name_pattern = re.compile(r"\w+\.[\w-]+\s(\w+)")
    sheet_name_alt_pattern = re.compile(r"\w+\.(\w+)")
    sheet_readable_name = None

    # Parse row data
    data_element_id = row["Data Element ID"]
    cds = row["Linkages to Decision Support Tables"]
    indicators = row["Linkages to Aggregate Indicators"]

    # Determine linkage type
    linkage_type = None
    if cds and isinstance(cds, str) and not pd.isna(cds):
        linkage_type = "dt"
    if indicators and isinstance(indicators, str) and not pd.isna(indicators):
        if linkage_type:
            linkage_type = "both"
        else:
            linkage_type = "indicator"

    # Get human-readable part of sheet name
    sheet_name_match = sheet_name_pattern.search(sheet_name)

    # Handle alternate sheet name pattern
    if not sheet_name_match:
        sheet_name_match = sheet_name_alt_pattern.search(sheet_name)
        if sheet_name_match:
            sheet_readable_name = sheet_name_match.group(1)
        else:
            raise ValueError("Sheet name does not match expected pattern")

    sheet_readable_name = sheet_name_match.group(1)

    # Handle label value == "None"
    if row["Data Element Label"] is None or pd.isna(row["Data Element Label"]):
        print(f"Data Element Label is None for {data_element_id}")
        row["Data Element Label"] = "None"

    concept_dict_entry = {
        "label": row["Data Element Label"],
        "sheet_name": sheet_readable_name,
        "sheet": sheet_name,
        "data_type": row["Data Type"],
        "activity": row["Activity ID"],
        "description": row["Description and Definition"],
        "linkage_type": linkage_type,
    }

    if row["Data Type"] == "Codes":
        if not lastCodingId:
            raise ValueError("Last Coding ID not found for Data Element ID")
        concept_dict_entry["parent_coding_id"] = lastCodingId

        if cql_concept_dictionary[lastCodingId]["linkage_type"] is None:
            cql_concept_dictionary[lastCodingId]["linkage_type"] = linkage_type
        elif cql_concept_dictionary[lastCodingId]["linkage_type"] != linkage_type:
            cql_concept_dictionary[lastCodingId]["linkage_type"] = "both"

    # Select row if Linkage to CDS or Indicator is not empty
    if linkage_type == "dt" or linkage_type == "both":
        # Parse linkages
        linkages.extend([item.strip() for item in cds.split(",")])

    if linkage_type == "indicator" or linkage_type == "both":
        linkages.extend([item.strip() for item in indicators.split(",")])

    cql_concept_dictionary[data_element_id] = concept_dict_entry

    return None


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
        if not sheet_name or pd.isna(sheet_name) or not isinstance(sheet_name, str):
            continue
        matches = dak_name_pattern.search(sheet_name)
        if matches:
            dak_name_matches.extend(matches.groups())

    # Determine if all matches are the same
    if len(set(dak_name_matches)) == 1:
        dak_name = dak_name_matches[0]
    else:
        raise ValueError("DAK name does not match across all sheets")

    return dak_name


SCORING_IP_TEMPLATE = """
/*
 * Generated template based on {denominator_definition}
 */
define "Initial Population":
  true
"""

SCORING_CV_MP_TEMPLATE = """
define "measurePopulation":
  true
"""

SCORING_CV_MP_EXCL_TEMPLATE = """
define "measurePopulationExclusion
    false
"""

SCORING_CV_MO_TEMPLATE = """
define "measureObservation":
  true
"""

SCORING_PROP_NUM_TEMPLATE = """
define "Numerator":
  true
"""

SCORING_PROP_DEN_TEMPLATE = """
define: "Denominator":
  true
"""


# pylint: disable=unused-argument
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


def parse_cql_library_name(cql_file_contents: str):
    parsed_data: dict = {}

    indicator_comment_match = DAK_INDICATOR_ID_COMMENT_PATTERN.search(cql_file_contents)
    # indicator_code_match = DAK_INDICATOR_ID_CODE_PATTERN.search(self.cql_content)
    dt_comment_match = DAK_DT_ID_COMMENT_PATTERN.search(cql_file_contents)
    # dt_code_match = DAK_DT_ID_CODE_PATTERN.search(self.cql_content)

    if indicator_comment_match:
        parsed_data["full_library_name"] = (
            f"{indicator_comment_match.group(1)}.{indicator_comment_match.group(2)}."
            f"{indicator_comment_match.group(3)} {indicator_comment_match.group(4)}"
        )
        parsed_data["file_library_name"] = (
            f"{indicator_comment_match.group(1)}{indicator_comment_match.group(2)}"
            f"{indicator_comment_match.group(3)}{indicator_comment_match.group(4)}"
        )
        parsed_data["dak_name"] = indicator_comment_match.group(1)
        parsed_data["file_type"] = "indicator"
    elif dt_comment_match:
        parsed_data["full_library_name"] = (
            f"{dt_comment_match.group(1)}.{dt_comment_match.group(2)}.{dt_comment_match.group(3)}"
            f"{dt_comment_match.group(4)} {dt_comment_match.group(5)}"
        )
        parsed_data["file_library_name"] = (
            f"{dt_comment_match.group(1)}{dt_comment_match.group(2)}{dt_comment_match.group(3)}"
            f"{dt_comment_match.group(4)}{dt_comment_match.group(5)}"
        )
        parsed_data["dak_name"] = dt_comment_match.group(1)
        parsed_data["file_type"] = "dt"
    else:
        parsed_data["file_type"] = "common"
        non_indicator_match = re.search(
            r"^library\s(\w+).*$", cql_file_contents, re.MULTILINE
        )
        parsed_data["full_library_name"] = (
            non_indicator_match.group(1) if non_indicator_match else None
        )
        parsed_data["file_library_name"] = parsed_data["full_library_name"]

        common_keyword_re = rf"(\w+)({'|'.join(common_cql_filename_keywords)})"
        common_name_match = re.search(
            common_keyword_re, parsed_data["full_library_name"]
        )

        parsed_data["dak_name"] = (
            common_name_match.group(1) if common_name_match else None
        )
        # Handle Element files if dak name contains "Elements"
        if parsed_data["dak_name"] and "Elements" in parsed_data["dak_name"]:
            elements_re = rf"(\w+)({'|'.join(common_cql_element_filename_keywords)})"
            elements_name_match = re.search(elements_re, parsed_data["dak_name"])
            parsed_data["dak_name"] = (
                elements_name_match.group(1) if elements_name_match else None
            )

        # TODO: cleanup
        if parsed_data["dak_name"] == "WHO":
            parsed_data["dak_name"] = "base-clinical"

    if not all(
        key in parsed_data and parsed_data[key] is not None
        for key in [
            "dak_name",
            "full_library_name",
            "file_library_name",
            "file_type",
        ]
    ):
        raise ValueError("Keys missing when parsing CQL library name")

    return parsed_data


def count_label_frequencies(cql_concept_dictionary):
    label_frequency: dict[str, int] = {}
    label_sheet_frequency: dict[(str, str), int] = {}

    # Collapse concept_details["label"] to count frequency
    for concept_id, concept_details in cql_concept_dictionary.items():
        if (
            pd.isna(concept_details["label"])
            or not concept_details["label"]
            # or concept_details["linkage_type"] is None
        ):
            continue

        concept_details["label"] = re.sub(r"[\'\"()]", "", concept_details["label"])
        if concept_details["label"] not in label_frequency:
            label_frequency[concept_details["label"]] = 1
        else:
            label_frequency[concept_details["label"]] += 1

        if (
            concept_details["label"],
            concept_details["sheet"],
        ) not in label_sheet_frequency:
            label_sheet_frequency[
                concept_details["label"], concept_details["sheet"]
            ] = 1
        else:
            label_sheet_frequency[
                concept_details["label"], concept_details["sheet"]
            ] += 1
    return label_frequency, label_sheet_frequency


def get_concept_label(label_frequency, concept_id, concept_details):
    if label_frequency[concept_details["label"]] == 1:
        label_str = concept_details["label"]
    else:
        label_str = f"{concept_details['label']} - {concept_id}"

    return sanitize_label(label_str)


def get_element_label(
    label_frequency, label_sheet_frequency, concept_id, concept_details
):
    split_id = concept_id.split(".")

    if label_frequency[concept_details["label"]] == 1:
        label_str = f"{concept_details["label"]}"
    else:
        label_str = f"{concept_details['label']} {split_id[1]}.{split_id[2]}"

    return sanitize_label(label_str)
