from collections import defaultdict
from numbers import Number
import inflect
import pandas as pd
from pandas import DataFrame
import re
import stringcase
import sys
from typing import Any, Callable, Dict, List, ParamSpec, Tuple, TypeVar, Union, cast
from who_l3_smart_tools.core.models.logical_model import (
    Code,
    CodeSystem,
    DataElementRecord,
    ImplementationGuideLogicalModel,
    Invariant,
    LogicalModelElement,
    LogicalModel,
    MultipleChoiceType,
    QuantityType,
    RequiredType,
    ValueSet,
)
from who_l3_smart_tools.utils import Counter, camel_case


__all__ = ["LogicalModelParser"]

T = TypeVar("T")
P = ParamSpec("P")


def ensure_parsed(fn: Callable[P, T]) -> Callable[P, T]:
    """Decorator for functions of the AbstractLogicalModelParser to ensure that the model is
    parsed before they are invoked"""

    def ensure_parsed_handler(*args: Any, **kwargs: Any) -> T:
        self = args[0]
        if (
            self.logical_model is None
            or self.logical_model.data_element_records is None
        ):
            self.parse_logical_model()

        if (
            self.logical_model is None
            or self.logical_model.data_element_records is None
        ):
            raise Exception("Could not parse LogicalModel")

        if self.dak_name is None:
            raise Exception("DAK name could not be parsed from the provided file")

        return fn(*args, **kwargs)

    return cast(Callable[P, T], ensure_parsed_handler)


class LogicalModelParser:
    def __init__(self, input_file: str):
        self.input_file = input_file
        self.dak_name: Union[str, None] = None
        self.logical_model: Union[ImplementationGuideLogicalModel, None] = None
        self.cover_info: Union[Dict[str, str], None] = None

        # internal state
        self.__invariant_ids = defaultdict(Counter)
        self.__invariant_lookup: Dict[str, Invariant] = {}
        # this is used to turn numbers into words in a few places
        self.__inflect_engine = inflect.engine()

    def parse_logical_model(self):
        """Parses the data elements from the input file into a series of DataElementRecords.
        These are used by other methods to turn into useful output."""
        # Load the Excel file
        dd_xls: Dict[str, DataFrame] = pd.read_excel(self.input_file, sheet_name=None)

        # Process the Cover sheet
        self.cover_info = self._process_cover(dd_xls["COVER"])

        for sheet_name in self.cover_info:
            if "." in sheet_name:
                self.dak_name, _ = sheet_name.split(".", 1)
                break

        if self.dak_name is None:
            raise Exception(
                "Could not determine DAK name from the sheets listed in the cover: "
                + repr(self.cover_info)
            )

        self.logical_model = logical_model = ImplementationGuideLogicalModel(
            self.dak_name
        )

        for sheet_name, df in dd_xls.items():
            if not sheet_name.startswith(self.dak_name + "."):
                continue

            # Used to track element names to ensure uniqueness
            existing_elements = defaultdict(Counter)

            # populates the invariant_ids and invariant_lookups
            self._process_invariants(df, logical_model)

            # used to track the current valueset
            current_valueset: Union[DataElementRecord, None] = None
            for i, row in df.iterrows():
                data_element_id = cast(Any, row["Data Element ID"])
                if pd.isna(data_element_id):
                    continue

                data_element = DataElementRecord(data_element_id)
                data_element.activity_id = cast(str, row["Activity ID"])

                data_element_label = cast(Any, row["Data Element Label"])
                if pd.isna(data_element_label):
                    # Pandas converts "None" to null
                    data_element_label = "None"

                data_element.data_element_label, label_clean = self._process_label(
                    cast(str, data_element_label), current_valueset
                )

                # this is only used for the logical model
                data_element.data_element_label_camel = self._process_camel_case_label(
                    label_clean, existing_elements
                )
                data_element.description = (
                    cast(str, row["Description and Definition"])
                    .replace("*", "")
                    .replace('"', "'")
                )
                multiple_choice = cast(str, row["Multiple Choice Type (if applicable)"])
                if not pd.isna(multiple_choice):
                    data_element.multiple_choice_type = MultipleChoiceType(
                        cast(str, row["Multiple Choice Type (if applicable)"])
                    )
                data_element.data_type = cast(str, row["Data Type"])
                # sometimes "Multiple Choice Type" is set to N/A even though there are multiple choices
                # in these cases, we default to the assumption that the choice is one of the options
                if (
                    data_element.data_type == "Coding"
                    and data_element.multiple_choice_type is None
                ):
                    data_element.multiple_choice_type = MultipleChoiceType.ONE_OF
                data_element.input_options = cast(str, row["Input Options"])
                if data_element.data_type == "Quantity":
                    quantity_subtype = cast(Any, row["Quantity Sub-type"])
                    if not pd.isna(quantity_subtype):
                        data_element.quantity_subtype = QuantityType(
                            re.sub(
                                r"\s*Quantity",
                                "",
                                cast(str, quantity_subtype),
                                flags=re.IGNORECASE,
                            )
                        )
                data_element.calculation = cast(str, row["Calculation"])
                if data_element.calculation == "N/A":
                    data_element.calculation = None

                if data_element_id in self.__invariant_lookup:
                    data_element.invariants += [
                        self.__invariant_lookup[data_element_id]
                    ]

                required = cast(Any, row["Required"])
                if not pd.isna(required):
                    data_element.required = RequiredType(row["Required"])
                    if data_element.required == RequiredType.CONDITIONAL:
                        data_element.condition_expression = cast(
                            str, row["Explain Conditionality"]
                        )
                else:
                    # if unspecified, assume the field is optional
                    data_element.required = RequiredType.OPTIONAL

                links_to_ds_tables = cast(
                    Any, row["Linkages to Decision Support Tables"]
                )
                if not pd.isna(links_to_ds_tables):
                    data_element.decision_support_tables += cast(
                        str, links_to_ds_tables
                    ).split(",")

                links_to_indicators = cast(Any, row["Linkages to Aggregate Indicators"])
                if not pd.isna(links_to_indicators):
                    data_element.aggregate_indicators += cast(
                        str, links_to_indicators
                    ).split(",")

                annotation = cast(Any, row["Annotations"])
                if not pd.isna(annotation):
                    data_element.annotations = cast(str, row["Annotations"])

                if (
                    data_element.multiple_choice_type is not None
                    and data_element.multiple_choice_type != MultipleChoiceType.OPTION
                ):
                    current_valueset = data_element

                self.logical_model.data_element_records[data_element_id] = data_element
                if (
                    data_element.data_element_label
                    in self.logical_model.data_element_records_by_name
                ):
                    self.logical_model.data_element_records_by_name[
                        data_element.data_element_label
                    ].append(data_element)
                else:
                    self.logical_model.data_element_records_by_name[
                        data_element.data_element_label
                    ] = [data_element]

    @ensure_parsed
    def generate_terminology_resources(self) -> Tuple[CodeSystem, Dict[str, ValueSet]]:
        """Generates a CodeSystem and ValueSets from the parsed DataElementRecords"""
        assert self.logical_model is not None

        code_system = CodeSystem(f"{self.dak_name}Concepts")
        code_system.title = f"WHO SMART {self.dak_name} Concepts CodeSystem"
        code_system.description = f"This code system defines the concepts used in the World Health Organization SMART {self.dak_name} DAK"

        value_sets: Dict[str, ValueSet] = {}
        current_value_set: Union[ValueSet, None] = None
        if self.logical_model.data_element_records:
            for data_element in self.logical_model.data_element_records.values():
                code = Code(
                    data_element.data_element_id,
                    data_element.data_element_label,
                    data_element.description,
                )
                code_system.codes[data_element.data_element_id] = code

                if (
                    data_element.multiple_choice_type
                    and data_element.multiple_choice_type != MultipleChoiceType.OPTION
                ):
                    value_set = ValueSet(data_element.data_element_id)
                    value_set.name = data_element.data_element_id.replace(".", "")
                    value_set.title = f"{data_element.data_element_label} ValueSet"
                    if data_element.description:
                        value_set.description = f"Value set of {data_element.description[0].lower() + data_element.description[1:] if data_element.description[0].isupper() and not data_element.description.startswith('HIV') else data_element.description}"
                    value_sets[data_element.data_element_id] = current_value_set = (
                        value_set
                    )
                elif data_element.data_type == "Codes":
                    if not current_value_set:
                        print(
                            f"Attempted to create a member of a ValueSet without a ValueSet context for code {data_element.data_element_id}",
                            sys.stderr,
                        )
                    else:
                        current_value_set.codes.add(code)

        return code_system, value_sets

    @ensure_parsed
    def generate_logical_models(self) -> Dict[str, LogicalModel]:
        assert self.cover_info is not None
        assert self.dak_name is not None
        assert self.logical_model is not None

        logical_models: Dict[str, LogicalModel] = {}

        for sheet_name, sheet_description in self.cover_info:
            if not sheet_name.startswith(self.dak_name):
                continue

            sheet_key, sheet_short = sheet_name.split(" ", 1)

            # there's a case of HIV.E-F that needs to be handled as two logical models
            if "-" in sheet_key:
                sheet_key_1, part = sheet_key.split("-", 1)
                sheet_name_1 = f"{sheet_key_1} {sheet_short}"
                lm = logical_models[sheet_key_1] = LogicalModel(
                    stringcase.alphanumcase(sheet_name_1)
                )
                lm.title = sheet_name_1
                lm.description = sheet_description

                sheet_key_2 = f"{self.dak_name}.{part}"
                sheet_name_2 = stringcase.alphanumcase(f"{sheet_key_2} {sheet_short}")
                lm = logical_models[sheet_key_2] = LogicalModel(
                    stringcase.alphanumcase(sheet_name_2)
                )
                lm.title = sheet_name_2
                lm.description = sheet_description
            else:
                lm = logical_models[sheet_key] = LogicalModel(
                    stringcase.alphanumcase(sheet_name)
                )
                lm.title = sheet_name
                lm.description = sheet_description

        if self.logical_model.data_element_records:
            for (
                data_element_id,
                data_element,
            ) in self.logical_model.data_element_records.items():
                lm = logical_models[data_element_id.rsplit(".")[0]]
                if not lm:
                    print(
                        f"Could not find logical model matching data element {data_element_id}",
                        sys.stderr,
                    )
                    continue

                lme = LogicalModelElement(
                    cast(str, data_element.data_element_label_camel),
                    cast(str, data_element.data_element_label),
                    cast(str, data_element.description),
                )
                lme.cardinality.update_cardinality(
                    data_element.is_required(),
                    data_element.multiple_choice_type == MultipleChoiceType.ANY_OF,
                )
                if data_element.data_type != "Quantity":
                    lme.data_type = data_element.data_type
                elif data_element.quantity_subtype:
                    lme.data_type = data_element.quantity_subtype.value.lower()
                else:
                    lme.data_type = "integer"

                lm.elements.add(lme)
                for invariant in data_element.invariants:
                    lm.validations.add(invariant)

        return logical_models

    def _process_cover(self, cover_df) -> Dict[str, str]:
        cover_data = {}

        seen_header = False
        for i, row in cover_df.iterrows():
            if not seen_header:
                if (
                    row.iloc[0]
                    and type(row.iloc[0]) == str
                    and re.match(r"sheet\s*name", row.iloc[0], re.IGNORECASE)
                ):
                    seen_header = True
                continue

            if type(row.iloc[0]) == str and row.iloc[0] != "":
                key = row.iloc[0].upper()
                first_dot_idx = key.find(".")
                if first_dot_idx >= 0 and first_dot_idx < len(key):
                    if key[first_dot_idx + 1].isspace():
                        key = (
                            key[0:first_dot_idx]
                            + "."
                            + key[first_dot_idx + 1 :].lstrip()
                        )

                cover_data[key] = row.iloc[1]
            else:
                break

        return cover_data

    def _process_invariants(
        self, df: DataFrame, logical_model: ImplementationGuideLogicalModel
    ) -> None:
        for invariant, ids in df.groupby("Validation Condition")[
            "Data Element ID"
        ].groups.items():
            if len(ids) == 0:
                continue

            previous_ids: Dict[str, str] = {}
            for id in cast(List[int], ids):
                data_id = cast(str, df["Data Element ID"][id])
                invariant_key = data_id.split(".", 3)[:2]

                if ".".join(invariant_key) in previous_ids:
                    invariant_id = previous_ids[".".join(invariant_key)]
                    invariant = logical_model.invariants[invariant_id]
                else:
                    id = self.__invariant_ids[".".join(invariant_key)].next
                    invariant_id = previous_ids[".".join(invariant_key)] = (
                        f"{invariant_key[0]}-{invariant_key[1]}-{id}"
                    )
                    invariant = logical_model.invariants[invariant_id] = Invariant(
                        invariant_id, cast(str, invariant), "<NOT-IMPLEMENTED>"
                    )

                self.__invariant_lookup[data_id] = invariant

    def _process_label(
        self, label: str, current_valueset: Union[DataElementRecord, None]
    ) -> Tuple[str, str]:
        # Other (specify) elements come after a list as a data element to
        # contain a non-coded selection
        if label.lower() == "other (specify)":
            if current_valueset and current_valueset.data_element_label:
                label_clean = f"Other {current_valueset.data_element_label[0].upper()}{current_valueset.data_element_label[1:]}"
            else:
                label_clean = "Other Specify"
        else:
            label = (
                label.strip()
                .replace("*", "")
                .replace("[", "")
                .replace("]", "")
                .replace('"', "'")
            )

            # remove many special characters
            label_clean = (
                label.replace("(", "")
                .replace(")", "")
                .replace("'s", "")
                .replace("-", "_")
                .replace("/", "_")
                .replace(",", "")
                .replace(" ", "_")
                .replace(">=", "more than")
                .replace("<=", "less than")
                .replace(">", "more than")
                .replace("<", "less than")
                .lower()
            )

        return label, label_clean

    def _process_camel_case_label(
        self, label: str, existing_elements: defaultdict[str, Counter]
    ) -> str:
        # the label_camel property holds the name of the property in the
        # logical model which requires a few transformations
        # First: convert the string to camel case
        label_camel = camel_case(label)
        # Second: if the string starts with a number, convert it to a word
        # e.g. 1 to "one" and 23 to "twentyThree"
        if len(label_camel) > 0:
            try:
                prefix, rest = re.split(r"(?=[a-zA-Z])", label_camel, 1)
            except:
                prefix, rest = label_camel, ""

            if prefix.isnumeric():
                prefix = camel_case(
                    cast(
                        str,
                        self.__inflect_engine.number_to_words(
                            cast(Number, int(prefix))
                        ),
                    ).replace("-", "_")
                )

            label_camel = f"{prefix}{rest}"

        # Third: trim the camel label to size
        # data elements can only be 64 characters long
        # this loop is designed to obey this limit by setting a boundry at full words
        if len(label_camel):
            new_label_camel = ""
            for label_part in re.split("(?=[A-Z1-9])", label_camel):
                if len(new_label_camel) + len(label_part) > 64:
                    break
                new_label_camel += label_part
            label_camel = new_label_camel

        # data elements names must be unique per logical model
        count = existing_elements[label_camel].next

        # we have a duplicate data element
        if count > 1:
            # the first element needs no suffix
            # so the suffix is one less than the count
            suffix = str(count - 1)

            # if the data element id will still be less than 64 characters, we're ok
            if len(label_camel) + len(suffix) <= 64:
                label_camel += suffix
            # otherwise, shorten the name to include the suffix
            else:
                label_camel = label_camel[: 64 - len(suffix)] + suffix

        return label_camel
