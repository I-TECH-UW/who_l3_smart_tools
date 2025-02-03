def add_common_args(parser):
    """
    Add common arguments to the argument parser.

    Args:
        parser (argparse.ArgumentParser): The argument parser object.

    Returns:
        None
    """
    parser.add_argument(
        "-i",
        "--input",
        required=True,
        help="Input Data Dictionary file location",
    )
    parser.add_argument(
        "-o",
        "--output",
        default="./data/output",
        help="Output Logical Model FSH file location",
    )
