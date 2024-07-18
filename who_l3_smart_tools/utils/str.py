import slugify
import re

CAMEL_CASE_SPLIT_RE = re.compile(r"[\W_]")


def camel_case(str: str) -> str:
    """
    Converts the given string into a CamelCase string

    Args:
        str (str): The text to convert to camel case.

    Returns:
        str: The camel cased string.

    Example:
        >>> camel_case("my_string_to_be_camel_cased")
        MyStringToBeCamelCased
    """
    if str is None:
        return ""

    return "".join(
        [
            s.lower() if i == 0 else s.capitalize()
            for i, s in enumerate(CAMEL_CASE_SPLIT_RE.split(str))
        ]
    )


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
