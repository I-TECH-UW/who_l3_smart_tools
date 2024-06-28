import re
import json

import pandas as pd


class CqlScaffoldGenerator:

    def __init__(self, indicator_artifact_file):
        self.indicator_artifact_file = indicator_artifact_file

    def print_to_files(self, output_dir):
        """
        This method writes the CQL scaffolds to files in the output directory.
        """
        for indicator_name, scaffold in self.cql_scaffolds.items():
            with open(f"{output_dir}/{indicator_name}.cql", "w") as file:
                file.write(scaffold)

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
            if str(row["Included in DAK"]) and str(row["Priority"]) and str(row["Core"]):
                indicator_name, scaffold = self.generate_cql_template(row)
                cql_scaffolds[indicator_name] = scaffold

        self.cql_scaffolds = cql_scaffolds

        return cql_scaffolds

    def generate_cql_template(self, row_content):
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

        cql_file_header_template = """
/*
 * Library: {DAK ID} Logic
 * Short Name: {Short name}
 *
 * {Indicator definition}
 *
 * Numerator: {Numerator definition}
 * Numerator Calculation: {Numerator calculation}
 * Numerator Exclusions: {Numerator exclusions}
 *
 * Denominator: {Denominator definition}
 * Denominator Calculation: {Denominator calculation}
 * Denominator Exclusions: {Denominator exclusions}
 *
 * Disaggregations:
 * {Disaggregation description}
 * Disaggregation Elements: {Disaggregation data elements}
 *
 * Numerator and Denominator Elements:
 * {List of all data elements included in numerator and denominator}
 *
 * Reference: {Reference}
 *
 * Additional Context
 * - what it measures: {What it measures}
 * - rationale: {Rationale}
 * - method: {Method of measurement}
 */
        """

        # Convert row_content to a dictionary and process it to remove newlines
        row_dict = row_content.to_dict()

        for key, value in row_dict.items():
            if isinstance(value, list):
                value = " ".join(str(v) for v in value)
            if isinstance(value, str):
                row_dict[key] = value.replace("\n", " | ")

        # Using the format method to fill in the template with row content
        filled_template = cql_file_header_template.format(**row_dict)

        return row_dict["DAK ID"], filled_template


class CQLResourceGenerator:
    """
    This class assists in the translation of L2 DAK indicator artifacts into
    CQL and related resources for loading into the IG.

    Attributes:
        cql_content (str): The content of the CQL file.
        indicator_row (dict): The row of the indicator artifact.
    """

    def __init__(self, indicator_row, cql_content):
        self.cql_content = cql_content
        self.indicator_row = indicator_row
        self.header_variables = self.parseRow(self.indicator_row)

    def parse_cql(self):
        """
        Parse the CQL file to extract relevant information.
        """
        parsed_data = {}

        # Extract library name
        library_name_match = re.search(r"library\s+(\w+)", self.cql_content)
        parsed_data["library_name"] = (
            library_name_match.group(1) if library_name_match else None
        )

        # Extract the description and title
        description_match = re.search(r"\*\s+Description:\s+(.+)", self.cql_content)
        parsed_data["description"] = (
            description_match.group(1) if description_match else None
        )

        title_match = re.search(r"\*\s+Title:\s+(.+)", self.cql_content)
        parsed_data["title"] = title_match.group(1) if title_match else None

        # Extract measure populations
        measure_population_match = re.findall(r'define\s+"(\w+)"', self.cql_content)
        parsed_data["measure_populations"] = (
            measure_population_match if measure_population_match else []
        )

        return parsed_data


# def generate_library_fsh(parsed_data):
#     """
#     Generate the Library FSH file content.
#     """
#     library_fsh = f"""
# Instance: {parsed_data['library_name']}
# InstanceOf: Library
# Title: "{parsed_data['title']}"
# Description: "{parsed_data['description']}"
# Usage: #definition
# * meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablelibrary"
# * meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablelibrary"
# * meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-library"
# * meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-module"
# * url = "http://smart.who.int/immunizations-measles/Library/{parsed_data['library_name']}"
# * extension[+]
#   * url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
#   * valueCode = #computable
# * name = "{parsed_data['library_name']}"
# * status = #draft
# * experimental = true
# * publisher = "World Health Organization (WHO)"
# * type = $library-type#logic-library
# * content.id = "ig-loader-{parsed_data['library_name']}.cql"
# """
#     return library_fsh


# def generate_measure_fsh(parsed_data):
#     """
#     Generate the Measure FSH file content.
#     """
#     measure_fsh = f"""
# Instance: {parsed_data['library_name']}Measure
# InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cv-measure-cqfm
# Title: "{parsed_data['title']}"
# * meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
# * meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
# * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
# * description = "{parsed_data['description']}"
# * url = "http://smart.who.int/immunizations-measles/Measure/{parsed_data['library_name']}Measure"
# * status = #draft
# * experimental = true
# * date = "2023-10-05"
# * name = "{parsed_data['library_name']}Measure"
# * title = "{parsed_data['title']}"
# * publisher = "World Health Organization (WHO)"
# * library = "http://smart.who.int/immunizations-measles/Library/{parsed_data['library_name']}"
# * scoring = $measure-scoring#continuous-variable "Continuous Variable"
# * group[+]
#   * population[initialPopulation]
#     * id = "{parsed_data['library_name']}.IP"
#     * description = "Initial Population"
#     * code = $measure-population#initial-population "Initial Population"
#     * criteria.language = #text/cql-identifier
#     * criteria.expression = "Initial Population"
# """

#     # Add populations
#     for population in parsed_data["measure_populations"]:
#         measure_fsh += f"""
#   * population[{population}]
#     * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
#     * id = "{parsed_data['library_name']}.{population}"
#     * description = "{population}"
#     * code = $measure-population#{population} "{population}"
#     * criteria.language = #text/cql-identifier
#     * criteria.expression = "{population}"
# """
#     measure_fsh += "\n"
#     return measure_fsh


# def main():
#     cql_file_path = "IMMZ.IND.08.cql"

#     with open(cql_file_path, "r") as file:
#         cql_content = file.read()

#     parsed_data = parse_cql(cql_content)

#     library_fsh = generate_library_fsh(parsed_data)
#     measure_fsh = generate_measure_fsh(parsed_data)

#     with open(f"{parsed_data['library_name']}_Library.fsh", "w") as file:
#         file.write(library_fsh)

#     with open(f"{parsed_data['library_name']}_Measure.fsh", "w") as file:
#         file.write(measure_fsh)

#     print(
#         f"Generated {parsed_data['library_name']}_Library.fsh and {parsed_data['library_name']}_Measure.fsh"
#     )


if __name__ == "__main__":
    main()
