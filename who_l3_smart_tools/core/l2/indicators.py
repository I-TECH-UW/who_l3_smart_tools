import stringcase

from who_l3_smart_tools.utils.jinja2 import initalize_jinja_env

jinja_env = initalize_jinja_env(__name__)


class IndicatorRow:
    """
    Class representing an indicator row.

    Attributes:
        raw_row (dict): The raw row data.
        dak_id (str): The DAK ID.
        library_name (str): The library name.
        ref_no (str): The reference number.
        denominator (str): The denominator calculation.
        all_data_elements (list): The list of all data elements.
        included_in_dak (bool): Indicates if the indicator is included in DAK.

    Methods:
        set_other_columns_as_attributes(self) -> None:
            Sets the other columns as attributes.

        determine_scoring_suggestion(self) -> str:
            Determines the scoring suggestion based on the denominator value.

        to_cql(self) -> str:
            Converts the indicator to CQL format.
    """

    scoring_measure_instance = {
        "proportion": "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm",
        "continuous-variable": "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cv-measure-cqfm",
    }

    measure_required_elements = {
        "proportion": ["initialPopulation", "Numerator", "Denominator"],
        "continuous-variable": [
            "initialPopulation",
            "measurePopulation",
            "measureObservation",
        ],
    }

    def __init__(self, raw_row: dict) -> None:
        self.raw_row = raw_row
        self.dak_id = raw_row.pop("DAK ID")
        self.library_name = f'{self.dak_id.replace(".", "")}Logic'
        self.ref_no = raw_row.pop("Ref no.")
        self.denominator = raw_row.pop("Denominator calculation")
        self.all_data_elements = raw_row.pop("Data elements", "").split("\n")
        self.included_in_dak = raw_row.pop("Included in DAK").lower() == "true"
        self.set_other_columns_as_attributes()

    def set_other_columns_as_attributes(self) -> None:
        for key, value in self.raw_row.items():
            key = stringcase.snakecase(key.lower())
            value = value.replace("\n", "|")
            setattr(self, key, value)

    def determine_scoring_suggestion(self) -> str:
        if not self.denominator.strip() or self.denominator.strip() == "1":
            return "continuous-variable"
        return "proportion"

    def to_cql(self) -> str:
        return jinja_env.get_template("indicators/cql_library.cql.j2").render(
            indicator=self
        )
