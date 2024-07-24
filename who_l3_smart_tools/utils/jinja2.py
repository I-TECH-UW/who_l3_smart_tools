import os

from jinja2 import Environment, FileSystemLoader

DATA_TYPE_MAP = {
    "Boolean": "boolean",
    "String": "string",
    "Date": "date",
    "DateTime": "dateTime",
    "Coding": "choice",
    "ID": "string",
    "Quantity": "integer",
}


def initalize_jinja_env(file_name):
    template_dir = os.path.join(
        os.path.dirname(os.path.abspath(file_name)), "templates"
    )
    return Environment(
        loader=FileSystemLoader(template_dir),
        trim_blocks=True,
        lstrip_blocks=True,
    )


def render_to_file(template, context, output_file):
    """
    Render a template to a file.
    """
    with open(output_file, "w") as f:
        f.write(template.render(context))
