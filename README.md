# l3_logical_model_generator

# L3 Logical Model Generator

This project provides a Python package `fhir_fsh_generator` that generates FHIR Shorthand (FSH) Logical Model artifacts from WHO SMART GUIDELINES L3 documents following the SOP outlined at https://worldhealthorganization.github.io/smart-ig-starter-kit/l3_logicalmodels.html. It can be used as a CLI tool to process Excel files containing the WHO SMART DAK data dictionary and generate FSH artifacts for the logical models representing each sheet in the Excel file.

## Installation

### Host Machine

Ensure you have Python 3.6 or newer installed on your system. You can install the package using the following command:

```bash
pip3 install l3_logical_model_generator
```

### Docker

If you prefer using Docker, you can run the tool without installing Python on your host machine. First, ensure you have Docker installed on your system.

Build the Docker image with the following command from the root directory of this project:

```bash
docker build -t l3_logical_model_generator .
```

This command builds a Docker image named `l3_logical_model_generator` from the Dockerfile in the root directory of this project.

## Usage

### On Host Machine

After installation, you can run the package as a CLI tool. To generate FSH artifacts from an Excel file, use the following syntax:

```bash
fhir_fsh_generator /path/to/excel_file.xlsx
```

Replace `/path/to/excel_file.xlsx` with the actual path to your Excel data dictionary.

### Using Docker

To run the tool using Docker, use the following command:

```bash
docker run --rm -v /path/to/excel:/data fhir_fsh_generator /data/excel_file.xlsx
```

Replace `/path/to/excel` with the directory containing your Excel file and `excel_file.xlsx` with the name of your Excel file. This command mounts the directory containing the Excel file into the container and runs the tool against the specified Excel file.

## Development

To set up a development environment for contributing to this project, clone the repository and ensure you have Python 3.6 or newer installed. Install development dependencies using:

```bash
pip3 install -r requirements_dev.txt
```

Run tests to ensure everything is set up correctly:

```bash
pytest
```

## Contributing

Contributions to the `fhir_fsh_generator` project are welcome! Please fork the repository and submit pull requests with any enhancements or bug fixes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
