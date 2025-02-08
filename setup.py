from setuptools import find_packages, setup

setup(
    name="who_l3_smart_tools",
    version="0.3.0",
    packages=find_packages(),
    install_requires=[
        "pandas>=1.0",
        "xlrd>=1.2",
        "openpyxl>=3.0",
        "fhirpy>=1.4",
        "fhir.resources>=7.0",
    ],
    author="I-TECH-UW",
    author_email="pmanko@uw.edu",
    description="A CLI toolset for translating WHO Smart Guidelines L2 DAK artifacts into L3 FHIR Content IGs.",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.6",
    entry_points={
        "console_scripts": [
            "logical_model_gen = who_l3_smart_tools.cli.logical_model_gen:main",
            "indicator_testing = who_l3_smart_tools.cli.indicator_testing:main",
            "terminology = who_l3_smart_tools.cli.terminology:main",
        ]
    },
)
