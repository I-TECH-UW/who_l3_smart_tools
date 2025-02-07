from datetime import datetime, timedelta
import os
import json
import pandas as pd
import requests
import uuid
from who_l3_smart_tools.core.indicator_testing.v2.fhir_mapping_manager import (
    YamlMappingManager,
)
from who_l3_smart_tools.core.indicator_testing.v2.test_artifact_generator import (
    generate_test_artifacts,
)


class FhirBundleGenerator:
    def __init__(
        self,
        phenotype_file,
        mapping_file,
        output_directory,
        ig_root_url="http://localhost:8099",
    ):
        self.phenotype_file = phenotype_file
        self.mapping_manager = YamlMappingManager(mapping_file)
        self.output_directory = output_directory
        self.ig_root_url = ig_root_url

        # Read and pre-process the phenotype excel into indicator data:
        # - First row contains column names and second row contains indicator values.
        # - Patient phenotype data starts with headers in row 4 and data from row 5 onwards.
        raw_df = pd.read_excel(self.phenotype_file, header=None)
        self.indicator_df = raw_df.iloc[1:2]
        self.indicator_df.columns = raw_df.iloc[0]  # row 0 as header

        self.phenotype_df = raw_df.iloc[4:]
        self.phenotype_df.columns = raw_df.iloc[3]  # row 4 as header

        # Simple caching for IG requests:
        self.resource_cache = {}

    def get_fhir_resource(self, resource_url):
        """Retrieve a FHIR resource from IG, with caching."""
        if resource_url in self.resource_cache:
            return self.resource_cache[resource_url]
        try:
            response = requests.get(resource_url)
            response.raise_for_status()
            resource = response.json()
            self.resource_cache[resource_url] = resource
            return resource
        except requests.RequestException as e:
            raise ValueError(
                f"Could not retrieve FHIR resource from {resource_url}: {e}"
            )

    def get_patient_example(self, patient_profile_name):
        """Retrieve the default Patient example JSON from the IG."""
        url = f"{self.ig_root_url}/Patient-{patient_profile_name}Default.json"
        return self.get_fhir_resource(url)

    def get_feature_resources(self, resource_mapping):
        """Retrieve the profile and default example resource for a given feature mapping."""
        target_profile = resource_mapping.get("target_profile")
        if not target_profile:
            raise ValueError("Missing target_profile in mapping")
        # Query the StructureDefinition:
        target_profile_url = f"{self.ig_root_url}/StructureDefinition-{target_profile}.json"
        profile = self.get_fhir_resource(target_profile_url)
        resource_type = profile.get("type")
        # Query the default example:
        target_example_url = f"{self.ig_root_url}/{resource_type}-{target_profile}Default.json"
        example = self.get_fhir_resource(target_example_url)
        # Assign a new unique id to the example resource.
        example["id"] = str(uuid.uuid4())
        return profile, example

    def update_patient_resource(self, patient_json, row):
        """Update patient example using row data."""
        for key, value in row.iloc[0].items():
            if key == "Patient Phenotype ID":
                patient_json["id"] = value
            elif key == "Phenotype Description":
                patient_json["text"] = str(value)
        return patient_json

    def update_feature_resource(self, example, resource_mapping, cell_value):
        """Update the feature resource example with cell value based on the mapping's FHIR path."""
        # Determine the FHIR path to update (supporting "target_fhir_path" or "fhir_path")
        fhir_path = resource_mapping.get("target_fhir_path") or resource_mapping.get(
            "fhir_path"
        )
        if fhir_path:
            # This simple example assumes fhir_path like 'Observation.effectiveDateTime' and
            # updates the last key in the path.
            key = fhir_path.split(".")[-1]
            example[key] = cell_value
        return example

    def build_bundle(self, patient_resource, feature_resources):
        """Construct a FHIR Bundle from patient and feature resources."""
        entries = [{"resource": patient_resource}]
        for res in feature_resources:
            entries.append({"resource": res})
        return {"resourceType": "Bundle", "type": "collection", "entry": entries}

    def _group_features(self, row):
        """
        Groups feature mappings by grouping_id, updates their resources, applies 'exists'
        flags, and ensures no conflicting exists values.
        Returns a list of updated feature resources (only those where exists is not False).
        """
        grouping_resources = {}
        for column_name, cell_value in row.iloc[0].items():
            # Skip patient-specific columns.
            if column_name in ["Patient Phenotype ID", "Phenotype Description"]:
                continue
            resource_mapping = self.mapping_manager.get_feature_mapping(column_name)
            if not resource_mapping:
                continue
            grouping_id = resource_mapping.get("grouping_id")
            if grouping_id not in grouping_resources:
                try:
                    # Retrieve default resource example for the grouping.
                    _, example = self.get_feature_resources(resource_mapping)
                except Exception as e:
                    print(f"Skipping grouping '{grouping_id}' for feature '{column_name}' due to error: {e}")
                    continue
                grouping_resources[grouping_id] = {"resource": example, "exists": None}
            # Evaluate exists flag from mapping values.
            exists_val = None
            for val_entry in resource_mapping.get("values", []):
                if str(val_entry.get("phenotype_value")) == str(cell_value):
                    if "exists" in val_entry:
                        exists_val = val_entry["exists"]
                        break
            if exists_val is not None:
                if grouping_resources[grouping_id]["exists"] is None:
                    grouping_resources[grouping_id]["exists"] = exists_val
                    grouping_resources[grouping_id]["resource"]["exists"] = exists_val
                elif grouping_resources[grouping_id]["exists"] != exists_val:
                    raise ValueError(f"Conflicting exists values for grouping {grouping_id}")
            # Update the feature resource based on FHIR path.
            grouping_resources[grouping_id]["resource"] = self.update_feature_resource(
                grouping_resources[grouping_id]["resource"],
                resource_mapping,
                cell_value,
            )
        # Return resources only if exists flag is not false.
        return [
            grp["resource"]
            for grp in grouping_resources.values()
            if grp["exists"] is not False
        ]

    def generate_patient_bundles(self):
        """
        For each patient phenotype row:
          1. Update the Patient resource using the Patient Phenotype ID and Description.
          2. Group and update feature resources.
          3. Assign a unique id to the Patient resource.
          4. Save the patient bundle to a file named 'patient_data_bundle_<Patient Phenotype ID>.json'
             within the output subfolder (named after the dak_id).
        """
        data_bundles = []
        mapping_dak_id = self.mapping_manager.mapping.get("dak_id")
        # Validate the DAK ID from phenotype indicator row against the mapping.
        phenotype_dak_id = self.indicator_df["DAK ID"].iloc[0]
        if phenotype_dak_id != mapping_dak_id:
            raise ValueError(
                f"Phenotype DAK ID {phenotype_dak_id} does not match mapping DAK ID {mapping_dak_id}"
            )

        # Iterate through each patient phenotype row.
        for idx, row in self.phenotype_df.iterrows():
            # Convert the row into a single-row DataFrame with correct headers.
            row = pd.DataFrame(row).T
            row.columns = self.phenotype_df.columns

            # Retrieve and update the Patient resource.
            patient_profile_name = self.mapping_manager.mapping["patient_profile"]
            patient_resource = self.get_patient_example(patient_profile_name)
            patient_resource = self.update_patient_resource(patient_resource, row)

            # Assign a new unique id based on the Patient Phenotype ID
            patient_id = str(row.iloc[0]["Patient Phenotype ID"])
            patient_resource["id"] = patient_id

            # Process and group feature resources.
            feature_resources = self._group_features(row)

            # Build the FHIR bundle for the patient.
            bundle = self.build_bundle(patient_resource, feature_resources)
            # Set unique id for the bundle.
            bundle["id"] = str(uuid.uuid4())

            # Save the bundle using the patient id in the filename.
            bundle_filename = os.path.join(
                self.output_directory, f"patient_data_bundle_{patient_id}.json"
            )
            with open(bundle_filename, "w") as f:
                f.write(json.dumps(bundle, indent=2))
            data_bundles.append(bundle)
        return data_bundles

    def generate_test_bundle(self):
        """
        Generates a MeasureReport as the test bundle:
          - Includes a complete population section with initial-population, numerator, and denominator.
          - Uses the total number of patient phenotype rows as the total population.
          - Assigns a unique id to the MeasureReport.
        """
        # Compute reporting period.
        rp = self.mapping_manager.mapping.get("reporting_period", {})
        reporting_period = {
            "start": rp.get("start", (datetime.now() - timedelta(days=30)).isoformat()),
            "end": rp.get("end", datetime.now().isoformat()),
        }
        # Total population is the number of phenotype rows.
        total_population = len(self.phenotype_df)
        # For simplicity, use zero for numerator and set denominator equal to total population.
        measure_report = {
            "resourceType": "MeasureReport",
            "id": str(uuid.uuid4()),
            "status": "final",
            "type": "summary",
            "date": datetime.now().isoformat(),
            "period": reporting_period,
            "group": [
                {
                    "population": [
                        {
                            "code": {"coding": [{"code": "initial-population"}]},
                            "count": total_population,
                        },
                        {
                            "code": {"coding": [{"code": "numerator"}]},
                            "count": 0,
                        },
                        {
                            "code": {"coding": [{"code": "denominator"}]},
                            "count": total_population,
                        },
                    ]
                }
            ],
        }
        test_bundle_filename = os.path.join(self.output_directory, "test_bundle.json")
        with open(test_bundle_filename, "w") as f:
            f.write(json.dumps(measure_report, indent=2))
        return measure_report

    def execute(self):
        """
        Executes the complete process:
          1. Creates an output subfolder named after the mapping dak_id.
          2. Generates patient bundles.
          3. Generates the test MeasureReport bundle.
          4. Prints the output location.
        """
        mapping_dak_id = self.mapping_manager.mapping.get("dak_id")
        # Create a subfolder in the output directory named after the DAK ID.
        self.output_directory = os.path.join(self.output_directory, mapping_dak_id)
        if not os.path.isdir(self.output_directory):
            os.makedirs(self.output_directory)
        self.generate_patient_bundles()
        self.generate_test_bundle()
        print(f"FHIR resources generated in: {self.output_directory}")
