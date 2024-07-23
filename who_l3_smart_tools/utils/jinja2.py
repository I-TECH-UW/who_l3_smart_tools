def render_to_file(template, context, output_file):
    """
    Render a template to a file.
    """
    with open(output_file, "w") as f:
        f.write(template.render(context))
