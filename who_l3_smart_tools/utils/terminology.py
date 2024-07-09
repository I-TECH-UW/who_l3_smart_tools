import slugify


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
