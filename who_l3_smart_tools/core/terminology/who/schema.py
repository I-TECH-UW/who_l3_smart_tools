"""
This module defines HIVschema classes for an OCL Concepts, 
    Repository and Organizations.
"""

from typing import Callable

from who_l3_smart_tools.core.terminology.schema import ConceptSchema
from who_l3_smart_tools.utils import dash_preserving_slugify


# pylint: disable=too-few-public-methods
class HIVConceptSchema(ConceptSchema):
    """
    Schema for representing HIV concepts.

    Attributes:
        id (str): The ID of the data element.
        name (str): The label of the data element.
        datatype (str): The data type of the element.
        description (str): The description and definition of the element.
        format_extras_for_csv (function): A lambda function that formats the extras
            for CSV output.
        format_extras_for_json (function): A lambda function that formats the extras
            for JSON output.
    """

    id = "Data Element ID"
    name = "Data Element Label"
    datatype = "Data Type"
    description = "Description and Definition"
    format_extras_for_csv: Callable = lambda x: f"attr:{dash_preserving_slugify(x)}"
    include_columns = ["Activity ID", "Validation Condition"]
