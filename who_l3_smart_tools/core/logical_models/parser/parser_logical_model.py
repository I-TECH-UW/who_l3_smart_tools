from collections import defaultdict
from enum import Enum
import sys
from typing import Dict, List, Set, Union


class ImplementationGuideLogicalModel:
    """An ImplementationGuideLogicalModel is an instance of the full logical model
    for an IG, including all terminology, logical models, and data elements"""

    def __init__(self, ig_name: str):
        self.ig_name = ig_name
        self.data_element_records: Dict[str, DataElementRecord] = {}
        self.data_element_records_by_name: Dict[str, List[DataElementRecord]] = {}
        self.invariants: Dict[str, Invariant] = {}


class DataElementRecord:
    """A DataElementRecord stores the full record for a data element defined by an ImplementationGuide"""

    def __init__(self, data_element_id: str):
        self.data_element_id = data_element_id
        self.activity_id: Union[str, None] = None
        self.data_element_label: Union[str, None] = None
        self.data_element_label_camel: Union[str, None] = None
        self.description: Union[str, None] = None
        self.multiple_choice_type: Union[MultipleChoiceType, None] = None
        self.data_type: Union[str, None] = None
        self.input_options: Union[str, None] = None
        self.quantity_subtype: Union[QuantityType, None] = None
        self.calculation: Union[str, None] = None
        self.required: Union[RequiredType, None] = None
        self.condition_expression: Union[str, None] = None
        self.decision_support_tables: List[str] = []
        self.aggregate_indicators: List[str] = []
        self.annotations: Union[str, None] = None
        self.containing_value_set: Union[str, None] = None
        self.extra_attributes: Dict[str, str] = {}
        self.invariants: List[Invariant] = []

    def is_required(self):
        return self.required == RequiredType.REQUIRED

    def __str__(self):
        return f"DataElement {self.data_element_id} - {self.data_element_label}"


class Invariant:
    """An Invariant is an invariant used by the logical model defined by an ImplementationGuide"""

    def __init__(
        self,
        invariant_id: str,
        description: Union[str, None] = None,
        expression: Union[str, None] = None,
    ):
        self.invariant_id = invariant_id
        self.description = description
        self.expression = expression


class CodeSystem:
    """A CodeSystem is a record of a CodeSystem defined by an ImplementationGuide"""

    def __init__(self, code_system: str):
        self.code_system = code_system
        self.title = code_system
        self.description = code_system
        self.codes = {}


class ValueSet:
    """A ValueSet is a record of a ValueSet defined by an ImplementationGuide"""

    def __init__(self, value_set: str):
        self.value_set = value_set
        self.title = value_set
        self.description = value_set
        self.name = value_set
        self.codes: Set[Code] = set()


class Code:
    """A Code is a code defined in a CodeSystem by this ImplemnetationGuide"""

    def __init__(
        self,
        code: str,
        label: Union[str, None] = None,
        description: Union[str, None] = None,
    ):
        self.code = code
        self.label = label
        self.description = description


class LogicalModel:
    """A LogicalModel is a record of a LogicalModel defined by an ImplementationGuide"""

    def __init__(self, logical_model_name: str):
        self.name = logical_model_name
        self.title = logical_model_name
        self.description = logical_model_name
        self.elements: Set[LogicalModelElement] = set()
        self.validations: Set[Invariant] = set()


class MultipleChoiceType(Enum):
    ONE_OF = "Select one"
    ANY_OF = "Select all that apply"
    OPTION = "Input Option"

    def __str__(self):
        return self.value


class QuantityType(Enum):
    INTEGER = "Integer"
    DECIMAL = "Decimal"
    DURATION = "Duration"

    def __str__(self):
        return self.value


class RequiredType(Enum):
    REQUIRED = "R"
    OPTIONAL = "O"
    CONDITIONAL = "C"

    def __str__(self):
        return self.value


class LogicalModelElement:
    __data_type_map = {
        "Boolean": "boolean",
        "String": "string",
        "Date": "date",
        "DateTime": "dateTime",
        "Coding": "Coding",
        "Codes": "Code",
        "ID": "Identifier",
    }

    def __init__(self, name: str, label: str, description: str):
        self.name = name
        self.description = description
        self.cardinality = Cardinality()
        self._data_type: Union[None, str] = None
        self.label = label
        self.value_set: Union[str, None] = None
        self.validation_rules: List[str] = []

    @property
    def data_type(self):
        return self._data_type

    @data_type.setter
    def data_type(self, data_type: Union[None, str]):
        if data_type is None:
            self._data_type = None
        elif data_type in LogicalModelElement.__data_type_map:
            self._data_type = LogicalModelElement.__data_type_map[data_type]
        else:
            self._data_type = data_type


class Cardinality:
    def __init__(self):
        self.minimum = 0
        self.maximum = 1

    def update_cardinality(
        self,
        required: Union[bool, None] = None,
        multiple_choice: Union[bool, None] = None,
    ):
        if required is not None:
            self.minimum = 1 if required else 0

        if multiple_choice is not None:
            self.maximum = sys.maxsize if multiple_choice else 1

    def __str__(self):
        return f"{self.minimum}..{'*' if self.maximum == sys.maxsize else self.maximum}"
