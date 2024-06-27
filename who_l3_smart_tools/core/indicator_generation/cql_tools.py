import re
import json
from datetime import datetime, timezone
from typing import Any
import stringcase
import pandas as pd


# Templates
cql_file_header_template = """
/*
 * Library: {dak_id} Logic
 * Ref No: {ref_no_}
 * Short Name: {short_name}
 *
 * Definition: {indicator_definition}
 *
 * Numerator: {numerator_definition}
 * Numerator Calculation: {numerator_calculation}
 * Numerator Exclusions: {numerator_exclusions}
 *
 * Denominator: {denominator_definition}
 * Denominator Calculation: {denominator_calculation}
 * Denominator Exclusions: {denominator_exclusions}
 *
 * Disaggregations:
 * {disaggregation_description}
 * Disaggregation Elements: {disaggregation_data_elements}
 *
 * Numerator and Denominator Elements:
 * {list_of_all_data_elements_included_in_numerator_and_denominator}
 *
 * Reference: {reference}
 * 
 * Data Concepts:
 """
cql_file_header_additional_context_template = """
 *
 * Additional Context
 * - what it measures: {what_it_measures}
 * - rationale: {rationale}
 * - method: {method_of_measurement}
 */
"""

cql_file_header_data_concept_template = """ 
 * {id}: {label} | {description}"""


library_fsh_template = """
Instance: {library_name}
InstanceOf: Library
Title: "{title} Logic"
Description: "{description}"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablelibrary"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablelibrary"
* meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-library"
* meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-module"
* url = "http://smart.who.int/immunizations-measles/Library/{library_name}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
  * valueCode = #computable
* name = "{library_name}"
* status = #draft
* experimental = true
* publisher = "World Health Organization (WHO)"
* type = $library-type#logic-library
* content.id = "ig-loader-{library_name}.cql"
"""

measure_fsh_template = """
Instance: {measure_name}
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "{title}"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "{description}"
* url = "http://smart.who.int/immunizations-measles/Measure/{measure_name}"
* status = #draft
* experimental = true
* date = "{date}"
* name = "{measure_name}"
* title = "{title}"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/immunizations-measles/Library/{measure_name}Logic"
"""

scoring_value_set: str = {"proportion", "continuous-variable"}

measure_scoring_fsh_template = """
* scoring = $measure-scoring#{scoring} "{scoring_title}"
"""

measure_population_fsh_template = """
  * population[{population_camel_case}]
    * id = "{dak_id}.{pop_code}"
    * description = "Number in target group"
    * code = $measure-population#{pop_string} "{population}"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "{population}"
"""

measure_denominator_fsh_template = """
  * population[denominator]
    * id = "{dak_id}.DEN"
    * description = "{description}"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
"""

measure_numerator_fsh_template = """
  * population[numerator]
    * id = "{dak_id}.NUM"
    * description = "{description}"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
"""

measure_stratifier_fsh_template = """
  * stratifier[+]
    * id = "{dak_id}.S.{strat_code}"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "{index}"
"""


class CqlGenerator:
    def __init__(self, indicator_artifact_file: str, data_dictionary_file: str):
        self.dak_name: str = None
        self.indicator_artifact_file = indicator_artifact_file
        self.data_dictionary_file = data_dictionary_file

        self.concept_lookup: dict[str, Any] = {}
        self.cql_concept_dictionary: dict[str, Any] = {}

        self.concept_lookup, self.cql_concept_dictionary = (
            self.create_cql_concept_dictionaries()
        )

    def print_to_files(self, output_dir: str):
        """
        This method writes the CQL scaffolds to files in the output directory.
        """
        for indicator_name, scaffold in self.cql_scaffolds.items():
            file_name = indicator_name.replace(".", "")
            with open(f"{output_dir}/{file_name}Logic.cql", "w") as file:
                file.write(scaffold)

    def create_cql_concept_dictionaries(self):
        """
        This method creates a dictionary of concepts from the data dictionary file to include in the CQL
        templates
        """

        # Create a dictionary of concepts
        indicator_concept_lookup = {}
        cql_concept_dictionary = {}

        dd_xls = pd.read_excel(self.data_dictionary_file, sheet_name=None)

        # Get DAK name from sheet names using regex to match
        # a sheet name like `HIV.A Registration` or `HIV.B HTS visit`
        # and grab the `HIV` part of the name
        # TODO: save as utility?
        dak_name_pattern = re.compile(r"(\w+)\.\w+")
        dak_name_matches = []

        for sheet_name in dd_xls.keys():
            if not sheet_name or pd.isna(sheet_name) or type(sheet_name) != str:
                continue
            matches = dak_name_pattern.search(sheet_name)
            dak_name_matches.extend(matches.groups()) if matches else None

        # Determine if all matches are the same
        if len(set(dak_name_matches)) == 1:
            self.dak_name = dak_name_matches[0]
        else:
            raise ValueError("DAK name does not match across all sheets")

        # TODO: refactor to common method across logic/terminology/this file
        for sheet_name in dd_xls.keys():
            if re.match(rf"{self.dak_name}\.\w+", sheet_name):
                df = dd_xls[sheet_name]
                for i, row in df.iterrows():
                    # Grab Linkages to Decision Support Tables and Aggregate Indicators
                    data_type = row["Data Type"]
                    data_element_id = row["Data Element ID"]

                    # Skip for individual valueset values
                    # if data_type == "Codes":
                    #     continue

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
                    if (
                        indicators
                        and type(indicators) == str
                        and not pd.isna(indicators)
                    ):
                        # Add to concept dictionary if not already present
                        if data_element_id not in cql_concept_dictionary.keys():
                            cql_concept_dictionary[data_element_id] = {
                                "label": row["Data Element Label"],
                                "sheet": sheet_name,
                                "data_type": data_type,
                                "description": row["Description and Definition"],
                            }

                        linkages.extend(
                            [item.strip() for item in indicators.split(",")]
                        )

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

    def generate_cql_scaffolds(self):
        """
        This method generates CQL scaffolds for each indicator in the DAK.
        """
        # Load the DAK
        indicator_artifact = pd.read_excel(
            self.indicator_artifact_file, sheet_name="Indicator definitions"
        )

        # Generate CQL scaffolds for each indicator
        cql_scaffolds = {}

        for index, row in indicator_artifact.iterrows():
            if row["Included in DAK"]:
                indicator_name, scaffold = self.generate_cql_header(row)
                cql_scaffolds[indicator_name] = scaffold

        self.cql_scaffolds = cql_scaffolds

        return cql_scaffolds

    def generate_cql_header(self, row_content):
        """
        This method provides scaffolding for CQL templates that includes
        indicator details from the DAK to facilitate CQL authoring.
        """

        # Columns: DAK ID	Ref no.	Short name	Indicator definition	Numerator calculation	Numerator exclusions	Denominator calculation	Denominator exclusions	Disaggregation data elements	List of all data elements included in numerator and denominator	Numerator definition	Denominator definition	Disaggregation description	Comments and references	Reference	Page no.	GAM2023 alignment	GF2022 alignment	MER2.6.1 alignment	WHO2020 alignment	Survey based	Included in DAK	Priority	Core	New	Updated	Category	What it measures	Rationale	Method of measurement
        # Column list:
        # - DAK ID
        # - Ref no.
        # - Short name
        # - Indicator definition
        # - Numerator calculation
        # - Numerator exclusions
        # - Denominator calculation
        # - Denominator exclusions
        # - Disaggregation data elements
        # - List of all data elements included in numerator and denominator
        # - Numerator definition
        # - Denominator definition
        # - Disaggregation description
        # - Comments and references
        # - Reference
        # - Page no.
        # - GAM2023 alignment
        # - GF2022 alignment
        # - MER2.6.1 alignment
        # - WHO2020 alignment
        # - Survey based
        # - Included in DAK
        # - Priority
        # - Core
        # - New
        # - Updated
        # - Category
        # - What it measures
        # - Rationale
        # - Method of measurement

        # Convert row_content to a dictionary and process it to remove newlines
        raw_row_dict = row_content.to_dict()
        row_dict = {}

        dak_id = raw_row_dict["DAK ID"]
        ref_no = raw_row_dict["Ref no."]

        for key, value in raw_row_dict.items():
            if isinstance(value, list):
                value = " ".join(str(v) for v in value)
            if isinstance(value, str):
                value = value.replace("\n", " | ")
            if pd.isna(value):
                value = ""

            key = stringcase.snakecase(stringcase.lowercase(key))
            row_dict[key] = value

        filled_template = cql_file_header_template.format(**row_dict)

        if ref_no in self.concept_lookup.keys():
            for concept in self.concept_lookup[ref_no]:
                if pd.isna(concept["id"]):
                    continue
                filled_template += cql_file_header_data_concept_template.format(
                    **concept
                )

        filled_template += cql_file_header_additional_context_template.format(
            **row_dict
        )

        # Using the format method to fill in the template with row content
        return dak_id, filled_template

    def generate_cql_concept_file(self, output_dir: str):
        # Parse the data dictionary and generate a CQL file with all relevant concepts
        # that can be referenced in the indicator CQL files and CDS CQL files
        #
        # Example valueset: `valueset "MCV Vaccine": 'http://smart.who.int/immunizations-measles/ValueSet/IMMZ.Z.DE9'`
        # Example code: `code "History of anaphylactic reactions": 'D4.DE166' from "IMMZConcepts" display 'History of anaphylactic reactions''`

        # Use the concept lookup dictionary to generate the CQL file
        library_name = f"{self.dak_name}Concepts"
        concept_file_name = f"{library_name}.cql"

        label_frequency: dict[str, int] = {}
        label_sheet_frequency: dict[(str, str), int] = {}

        # Collapse concept_details["label"] to count frequency
        for concept_id, concept_details in self.cql_concept_dictionary.items():
            if pd.isna(concept_details["label"]) or not concept_details["label"]:
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
        with open(f"{output_dir}/{concept_file_name}", "w") as file:
            file.write("// Automatically generated from DAK Data Dictionary\n")
            file.write(f"library {library_name}\n")
            file.write(
                f"codesystem \"{library_name}\": 'http://smart.who.int/{self.dak_name.lower()}/CodeSystem/{library_name}'\n\n"
            )

            # Write valuesets
            for concept_id, concept_details in self.cql_concept_dictionary.items():
                if concept_details["data_type"] == "Coding":
                    label_str = self.get_concept_label(
                        label_frequency,
                        label_sheet_frequency,
                        concept_id,
                        concept_details,
                    )
                    file.write(
                        f"valueset \"{label_str}\": 'http://smart.who.int/{self.dak_name.lower()}/ValueSet/{concept_id}'\n"
                    )
            file.write("\n")

            # Write codes
            for concept_id, concept_details in self.cql_concept_dictionary.items():
                if concept_details["data_type"] != "Coding":
                    label_str = self.get_concept_label(
                        label_frequency,
                        label_sheet_frequency,
                        concept_id,
                        concept_details,
                    )

                    file.write(
                        f"code \"{label_str}\": '{concept_id}' from \"{library_name}\" display '{concept_details['label']}'\n"
                    )

    def get_concept_label(
        self, label_frequency, label_sheet_frequency, concept_id, concept_details
    ):
        if label_frequency[concept_details["label"]] == 1:
            label_str = concept_details["label"]
        else:
            label_str = f"{concept_details['label']} - {concept_id}"

        # if (
        #     label_sheet_frequency[concept_details["label"], concept_details["sheet"]]
        #     > 1
        # ):
        #     label_str += f" - {concept_id}"
        return label_str


# Get indicator DAK ID from CQL file with first instance of DAK ID pattern HIV.IND.X
# TODO: generalize this pattern to match any DAK
DAK_INDICATOR_ID_PATTERN = re.compile(r"(HIV\.IND\.\d+)")


class EmptyItem:
    def __getitem__(self, item) -> Any:
        return None

    def keys(self):
        return []


__empty__ = EmptyItem()


class CQLResourceGenerator:
    """
    This class assists in the translation of L2 DAK indicator artifacts into
    CQL and related resources for loading into the IG.

    Attributes:
        cql_content (str): The content of the CQL file.
        indicator_row (dict): The row of the indicator artifact.
    """

    def __init__(self, cql_content: str, indicator_dictionary: dict[str, Any]):
        self.cql_content = cql_content
        self.parsed_cql = __empty__
        self.parse_cql()
        self.indicator_dictionary = indicator_dictionary

    def parseRow(self, row):
        """
        This method converts the indicator row into a dictionary.
        """
        return row.to_dict()

    def parse_cql(self):
        """
        Parse the CQL file to extract relevant information.
        """
        if self.parsed_cql is not __empty__:
            return self.parsed_cql

        parsed_data = {
            "stratifiers": {},
            "populations": {},
            "numerator": False,
            "denominator": False,
            "library_name": None,
        }

        indicator_match = DAK_INDICATOR_ID_PATTERN.search(self.cql_content)

        if indicator_match:
            parsed_data["library_name"] = indicator_match.group(1)
            parsed_data["is_indicator"] = True
        else:
            parsed_data["is_indicator"] = False
            non_indicator_name = non_indicator_name = re.search(
                r"^library\s(\w+)\s.*$", self.cql_content, re.MULTILINE
            )
            parsed_data["library_name"] = (
                non_indicator_name.group(1) if non_indicator_name else None
            )

        if not parsed_data["library_name"]:
            raise ValueError("Could not find library name in CQL file.")

        # chomp "Logic" off the ned of the library name
        if parsed_data["library_name"].endswith("Logic"):
            parsed_data["library_name"] = parsed_data["library_name"][:-5]

        # Extract denominator, if exists:
        denominator_match = re.search(
            r"define \"denominator\"\:", self.cql_content, re.IGNORECASE
        )
        if denominator_match:
            parsed_data["denominator"] = True

        # Extract numerator, if exists:
        numerator_match = re.search(
            r"define \"numerator\"\:", self.cql_content, re.IGNORECASE
        )
        if numerator_match:
            parsed_data["numerator"] = True

        # Extract stratifiers
        stratifier_matches = re.findall(r'define "(.+ Stratifier)":', self.cql_content)
        for stratifier in stratifier_matches:
            parsed_data["stratifiers"][stratifier] = True

        # Extract populations
        population_matches = re.findall(r'define "(.+ Population)":', self.cql_content)
        for population in population_matches:
            parsed_data["populations"][population] = True

        self.parsed_cql = parsed_data
        return self.parsed_cql

    def generate_library_fsh(self):
        """
        Generate the Library FSH file content.
        """

        raw_library_name = self.parsed_cql["library_name"]
        library_name = f"{raw_library_name.replace('.', '')}Logic"

        # Treat as indicator
        if raw_library_name in self.indicator_dictionary.keys():
            header_variables = self.parseRow(
                self.indicator_dictionary[raw_library_name]
            )
            title = raw_library_name
            description = header_variables["Indicator definition"]
        else:
            title = raw_library_name
            description = f"Description not yet available for {library_name}."

        library_fsh = library_fsh_template.format(
            library_name=library_name, title=title, description=description
        )

        return library_fsh

    def generate_measure_fsh(self):
        if not self.parsed_cql["is_indicator"]:
            return None

        header_variables = self.parseRow(
            self.indicator_dictionary[self.parsed_cql["library_name"]]
        )
        indicator_row = self.indicator_dictionary[self.parsed_cql["library_name"]]

        dak_id = header_variables["DAK ID"]
        measure_name = header_variables["DAK ID"].replace(".", "")
        title = f"{header_variables['DAK ID']} {header_variables['Short name']}"

        # Determine Scoring Type
        if (
            not self.parsed_cql["denominator"]
            or self.parsed_cql["denominator"].trim() == "1"
            or self.parsed_cql["denominator"].trim() == ""
        ):
            scoring = "continuous-variable"
            scoring_title = stringcase.titlecase(scoring)
        else:
            scoring = "proportion"
            scoring_title = stringcase.titlecase(scoring)

        # Generate the Measure FSH file content.
        measure_fsh = measure_fsh_template.format(
            measure_name=measure_name,
            title=title,
            description=header_variables["Indicator definition"],
            date=datetime.now(timezone.utc).date().isoformat(),
        )

        measure_fsh += measure_scoring_fsh_template.format(
            scoring=scoring, scoring_title=scoring_title
        )

        # Add Populations and Stratifiers to the measure FSH string if group is not empty
        if (
            self.parsed_cql["stratifiers"]
            or self.parsed_cql["populations"]
            or self.parsed_cql["denominator"]
            or self.parsed_cql["numerator"]
        ):
            measure_fsh += "\n* group[+]\n"

            for population in self.parsed_cql["populations"].keys():
                # Grab first letters of population title to create code
                pop_code = "".join([word[0] for word in population.split()])
                pop_string = population.replace(" ", "-").lower()
                population_camel_case = stringcase.camelcase(
                    stringcase.alphanumcase(population)
                )
                measure_fsh += measure_population_fsh_template.format(
                    population_camel_case=population_camel_case,
                    dak_id=dak_id,
                    pop_code=pop_code,
                    pop_string=pop_string,
                    population=population,
                )

            if self.parsed_cql["denominator"]:
                measure_fsh += measure_denominator_fsh_template.format(
                    dak_id=dak_id,
                    description=indicator_row["Denominator definition"],
                )

            if self.parsed_cql["numerator"]:
                measure_fsh += measure_numerator_fsh_template.format(
                    dak_id=dak_id,
                    description=indicator_row["Numerator definition"],
                )

            for index, stratifier in self.parsed_cql["stratifiers"].items():
                # Remove last word from stratifier title, and use first letter of each remaining word to create code
                words = index.split()
                strat_code = "".join([word[0] for word in words[:-1]]).upper()
                measure_fsh += measure_stratifier_fsh_template.format(
                    dak_id=dak_id, strat_code=strat_code, index=index
                )

        # remove any empty lines from measure
        measure_fsh = "\n".join(
            [line for line in measure_fsh.split("\n") if line.strip()]
        )
        return measure_fsh

    def get_library_name(self):
        return self.parsed_cql["library_name"]

    def is_indicator(self):
        return self.parsed_cql["is_indicator"]
