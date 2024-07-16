import re

split_re = re.compile(r"[\W_]")


def camel_case(s: str) -> str:
    if s is None:
        return ""

    return "".join(
        [
            s.lower() if i == 0 else s.capitalize()
            for i, s in enumerate(split_re.split(s))
        ]
    )
