import slugify
from who_l3_smart_tools.core.terminology.schema import ConceptSchema

def dash_preserving_slugify(text):
    """
    Convert the given text into a slug while preserving dashes.

    Args:
        text (str): The text to be slugified.

    Returns:
        str: The slugified text with dashes preserved.

    Example:
        >>> dash_preserving_slugify("10-Hello World")
        '10-Hello_World'
    """
    dash_replacement = "dashdash"
    text = text.replace("-", dash_replacement)
    text = slugify.slugify(text, lowercase=False, separator="_")
    return text.replace(dash_replacement, "-")

class HIVConceptSchema(ConceptSchema):
    """
    Schema for representing HIV concepts.

    Attributes:
        id (str): The ID of the data element.
        name (str): The label of the data element.
        datatype (str): The data type of the element.
        description (str): The description and definition of the element.
        format_extras_for_csv (function): A lambda function that formats the extras for CSV output.
        format_extras_for_json (function): A lambda function that formats the extras for JSON output.
    """
    id = "Data Element ID"
    name = "Data Element Label"
    datatype = "Data Type"
    description = "Description and Definition"
    format_extras_for_csv = lambda x: f"attr:{dash_preserving_slugify(x)}"
    format_extras_for_json = lambda x: f"{dash_preserving_slugify(x)}"
