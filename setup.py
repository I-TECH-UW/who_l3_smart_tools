
from setuptools import setup, find_packages

setup(
    name='l3_logical_model_generator',
version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "pandas",
        "xlrd",
        "openpyxl"
    ],
    author="I-TECH-UW",
    author_email="pmanko@uw.edu",
    description="A package to generate L3 Logical models from from Excel files.",
    keywords="L3 Logical Model Generator",
)
