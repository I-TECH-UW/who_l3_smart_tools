import re


def to_camel_case(snake_str):
    words = re.split(r"[_\s-]", snake_str)
    first_word = words[0].lower()
    camel_case = first_word + "".join(word.capitalize() for word in words[1:])
    return camel_case


def remove_special_characters(value):
    return re.sub(r"[^A-Za-z0-9]", "", value)
