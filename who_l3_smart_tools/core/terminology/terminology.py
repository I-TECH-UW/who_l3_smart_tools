import csv
import json
from typing import Optional, Union
from who_l3_smart_tools.core.terminology.schema import ConceptSchema


class ConceptRow:
    """
    Represents a row of concept data.

    Args:
        row (dict): The row data.
        schema (type[ConceptSchema]): The schema for the concept.
        **kwargs: Additional keyword arguments.

    Attributes:
        row (dict): The row data.
        schema (type[ConceptSchema]): The schema for the concept.
        converted_row (dict): The processed and converted row data.

    Methods:
        _process_row_required_fields: Processes the required fields of the row.
        process_for_csv: Processes the row for CSV output.
        process_for_json: Processes the row for JSON output.
    """

    def __init__(
        self,
        row: dict,
        schema: type[ConceptSchema],
        concept_class: str,
        values_set: Union[dict, None],
        **kwargs,
    ) -> None:
        self.row = row
        self.schema = schema
        self.concept_class = concept_class
        self.converted_row = None
        self.value_set = values_set
        self._process_row_required_fields(kwargs)
        self._process_value_set()

    def _process_row_required_fields(self, extra_args: dict):
        """
        Processes the required fields of the row.

        Args:
            extra_args (dict): Additional arguments.

        Returns:
            dict: The processed row data.
        """
        converted_row = {
            "id": self.row.pop(self.schema.id),
            "name": self.row.pop(self.schema.name),
            "datatype": self.row.pop(self.schema.datatype),
            "description": self.row.pop(self.schema.description),
            "concept_class": self.concept_class,
        }
        for index, name in enumerate(self.schema.additional_names):
            converted_row[f"name[{index+1}]"] = self.row.pop(name)
        for index, description in enumerate(self.schema.additional_descriptions):
            converted_row[f"description[{index+1}]"] = self.row.pop(description)
        converted_row.update(extra_args)
        self.converted_row = converted_row

    def _process_value_set(self):
        if self.converted_row.get("datatype").lower() == "codes":
            if not self.value_set:
                raise ValueError(f"Value set is required for datatype 'codes'. {self.converted_row}")
            codings = self.value_set["type"]["coding"]
            codings.append(
                {
                    "system": "http://hl7.org/fhir/v2/0203",
                    "code": self.converted_row["id"].replace(".", ""),
                    "display": self.converted_row["name"],
                }
            )
        elif self.converted_row.get("datatype").lower() == "coding":
            self.value_set = {
                "system": "https://fhir.staging.aws.openconceptlab.org",
                "type": {"coding": [], "text": self.converted_row["name"]},
                "value": self.converted_row["id"].replace(".", ""),
            }
        else:
            self.value_set = None

    def process_for_csv(self):
        """
        Processes the row for CSV output.
        """
        for key, value in self.row.items():
            if key in self.schema.exclude_columns:
                continue
            if self.schema.include_columns and key not in self.schema.include_columns:
                continue
            self.converted_row[self.schema.format_extras_for_csv(key)] = value

    def process_for_json(self):
        """
        Processes the row for JSON output.
        """
        self.converted_row["extras"] = {}
        for key, value in self.row.items():
            if key in self.schema.exclude_columns:
                continue
            if self.schema.include_columns and key not in self.schema.include_columns:
                continue
            self.converted_row["extras"][
                self.schema.format_extras_for_json(key)
            ] = value


class ConceptTerminology:
    """
    Represents a concept terminology.

    Args:
        owner_id (str): The ID of the owner.
        concept_class (str): The concept class.
        files (list[str]): A list of file paths.
        schema (type[ConceptSchema], optional): The concept schema type. Defaults to ConceptSchema.

    Attributes:
        files (list[str]): A list of csv file paths.
        schema (type[ConceptSchema]): The concept schema type.
        output_csv_header (list[str]): The CSV header for the output file.
        extra_args (dict): Extra arguments for processing the concept.

    """

    def __init__(
        self,
        owner_id: str,
        files: dict[str, str],
        schema: type[ConceptSchema] = ConceptSchema,
    ):
        self.files = files
        self.schema = schema
        self.extra_args = {
            "resource_type": "concept",
            "owner_type": "Organization",
            "retired": "FALSE",
            "owner_id": owner_id,
        }
        self.output_csv_header = self._get_csv_headers()
        self.value_set = None
        self.value_sets = []

    def _get_csv_headers(self) -> list[str]:
        """
        Get the CSV headers from the first file.

        Returns:
            list[str]: The CSV headers.

        """
        if not self.files:
            return []
        concept_class = list(self.files.keys())[0]
        with open(self.files[concept_class]) as f:
            reader = csv.DictReader(f)
            processed_row = ConceptRow(
                next(reader), self.schema, concept_class, None, **self.extra_args
            )
            processed_row.process_for_csv()
            return list(processed_row.converted_row.keys())

    def collect_value_sets(self, row: dict) -> None:
        """
        If we have a valueset, and the row datatype is not 'codes',
        we append the valueset to the valuesets list and reset the valueset.

        Args:
            row (dict): The row data.

        Returns:
            None
        """
        if self.value_set and row.converted_row["datatype"].lower() != "codes":
            self.value_sets.append(self.value_set)
            self.value_set = row.value_set
        if not self.value_set:
            self.value_set = row.value_set

    def process_concept_for_csv(self, write_to_path: str) -> None:
        """
        Process the concept data and write it to a CSV file.

        Args:
            write_to_path (str): The path to write the CSV file.

        """
        with open(write_to_path, "w") as f:
            writer = csv.DictWriter(f, fieldnames=self.output_csv_header)
            writer.writeheader()
            for concept_class, data_file in self.files.items():
                with open(data_file) as f:
                    reader = csv.DictReader(f)
                    for row in reader:
                        row = ConceptRow(
                            row,
                            self.schema,
                            concept_class,
                            self.value_set,
                            **self.extra_args,
                        )
                        row.process_for_csv()
                        writer.writerow(row.converted_row)
                        self.collect_value_sets(row)

    def process_concept_for_json(
        self, write_to_path: Optional[str] = None
    ) -> Optional[list[dict]]:
        """
        Process the concept data and write it to a JSON file.

        Args:
            write_to_path (str, optional): The path to write the JSON file. Defaults to None.

        Returns:
            list[dict]: The processed concept data.

        """
        output = []
        for concept_class, data_file in self.files.items():
            with open(data_file) as f:
                reader = csv.DictReader(f)
                for row in reader:
                    row = ConceptRow(
                        row,
                        self.schema,
                        concept_class,
                        self.value_set,
                        **self.extra_args,
                    )
                    row.process_for_json()
                    output.append(row.converted_row)
                    self.collect_value_sets(row)
        if write_to_path:
            with open(write_to_path, "w") as f:
                json.dump(output, f, indent=2)
        return output

    def write_value_sets(self, path: str) -> None:
        """
        Write the value sets to a JSON file.

        Args:
            path (str): The path to the JSON file.

        Returns:
            None
        """
        with open(path, "w") as f:
            json.dump(self.value_sets, f, indent=2)
