# WHO SMART Guidelines Tooling for L3 Translation


## Installation

### Host Machine

Ensure you have Python 3.6 or newer installed on your system. You can install the package using the following command:

```bash
pip3 install who_l3_smart_tools
```

### Docker

If you prefer using Docker, you can run the tool without installing Python on your host machine. First, ensure you have Docker installed on your system.

Build the Docker image with the following command from the root directory of this project:

```bash
docker build -t who_l3_smart_tools .
```

This command builds a Docker image named `who_l3_smart_tools` from the Dockerfile in the root directory of this project.

## Usage

### On Host Machine

After installation, you can run the package as a CLI tool. 


To generate FSH artifacts from an Excel file, use the following syntax:

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

**Install pipx**

*MacOS:*
```bash
brew install pipx
pipx ensurepath
sudo pipx ensurepath --global # optional to allow pipx actions with --global argument
```

*Ubuntu:*
```bash
sudo apt update
sudo apt install pipx
pipx ensurepath
sudo pipx ensurepath --global # optional to allow pipx actions with --global argument
```

**Install Poetry:**

```bash
pipx install poetry
poetry completions bash >> ~/.bash_completion
```

**Install the project dependencies:**

```bash
poetry install
```


**Run tests to ensure everything is set up correctly:**

```bash
poetry run pytest
```




## Contributing

Contributions to the project are welcome! Please fork the repository and submit pull requests with any enhancements or bug fixes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
