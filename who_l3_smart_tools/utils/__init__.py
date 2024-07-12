import re

split_re = re.compile(r"[\W_]")


def camel_case(str: str) -> str:
    if str == None:
        return ""

    return "".join(
        [
            s.lower() if i == 0 else s.capitalize()
            for i, s in enumerate(split_re.split(str))
        ]
    )
