from setuptools import setup, find_packages


setup(
    name="l3_logical_model_generator",
    version="0.1.1",
    packages=find_packages(),
    install_requires=["pandas>=1.0", "xlrd>=1.2", "openpyxl>=3.0"],
    author="I-TECH-UW",
    author_email="pmanko@uw.edu",
    description="A package to generate L3 Logical models from from Excel files.",
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
            "l3_logical_model_generator = l3_logical_model_generator.__init__:main"
        ]
    },
)
