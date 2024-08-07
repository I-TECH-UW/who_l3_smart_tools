from jinja2 import Environment, PackageLoader

DATA_TYPE_MAP = {
    "Boolean": "boolean",
    "String": "string",
    "Date": "date",
    "DateTime": "dateTime",
    "Coding": "choice",
    "ID": "string",
    "Quantity": "integer",
    "Codes": "codes",
}


def initalize_jinja_env(module):
    return Environment(
        loader=PackageLoader(module),
        trim_blocks=True,
        lstrip_blocks=True,
    )


def render_to_file(template, context, output_file):
    """
    Render a template to a file.
    """
    with open(output_file, "w") as f:
        f.write(template.render(context))
