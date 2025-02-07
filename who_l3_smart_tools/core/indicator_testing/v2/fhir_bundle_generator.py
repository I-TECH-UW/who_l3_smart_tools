from datetime import datetime, timedelta
import os
import json
import pandas as pd
import requests
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

        # Read and pre-process the phenotype excel into indicator data from first row (column names) and 2nd row (indicator values) and the patient phenotype data with headers in row 4 and data from row 5 onwards:
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
        target_profile_url = (
            f"{self.ig_root_url}/StructureDefinition-{target_profile}.json"
        )
        profile = self.get_fhir_resource(target_profile_url)
        resource_type = profile.get("type")
        # Query the default example:
        target_example_url = (
            f"{self.ig_root_url}/{resource_type}-{target_profile}Default.json"
        )
        example = self.get_fhir_resource(target_example_url)
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

    def generate_patient_bundles(self):
        """Generate and write one bundle per patient phenotype row."""
        data_bundles = []
        mapping_dak_id = self.mapping_manager.mapping.get("dak_id")
        phenotype_dak_id = self.indicator_df["DAK ID"].iloc[0]
        if phenotype_dak_id != mapping_dak_id:
            raise ValueError(
                f"Phenotype DAK ID {phenotype_dak_id} does not match mapping DAK ID {mapping_dak_id}"
            )

        # Loop over each patient phenotype row:
        for idx, row in self.phenotype_df.iterrows():
            # Make row into 1 row df with column names from original df
            row = pd.DataFrame(row).T
            row.columns = self.phenotype_df.columns

            # Get Patient example from IG based on mapping
            patient_profile_name = self.mapping_manager.mapping["patient_profile"]
            patient_resource = self.get_patient_example(patient_profile_name)
            patient_resource = self.update_patient_resource(patient_resource, row)

            # Process features grouped by grouping_id.
            grouping_resources = {}
            for column_name, cell_value in row.iloc[0].items():
                if column_name in ["Patient Phenotype ID", "Phenotype Description"]:
                    continue
                resource_mapping = self.mapping_manager.get_feature_mapping(column_name)
                if not resource_mapping:
                    continue
                grouping_id = resource_mapping.get("grouping_id")
                if grouping_id not in grouping_resources:
                    try:
                        _, example = self.get_feature_resources(resource_mapping)
                    except Exception as e:
                        print(f"Skipping grouping '{grouping_id}' for feature '{column_name}' due to error: {e}")
                        continue
                    grouping_resources[grouping_id] = {"resource": example, "exists": None}
                # Check for exists mapping from values.
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
                grouping_resources[grouping_id]["resource"] = self.update_feature_resource(
                    grouping_resources[grouping_id]["resource"],
                    resource_mapping,
                    cell_value,
                )
            # Only include resource if exists flag is not false
            feature_resources = [
                grp["resource"] for grp in grouping_resources.values() if grp["exists"] is not False
            ]
            # Build the bundle:
            bundle = self.build_bundle(patient_resource, feature_resources)
            bundle_filename = os.path.join(
                self.output_directory, f"test_data_bundle_{idx}.json"
            )
            with open(bundle_filename, "w") as f:
                f.write(json.dumps(bundle, indent=2))
            data_bundles.append(bundle)
        return data_bundles

    def generate_test_bundle(self):
        """Generate the test artifacts bundle and write to file."""
        rp = self.mapping_manager.mapping.get("reporting_period", {})
        reporting_period = (
            rp.get("start", (datetime.now() - timedelta(days=30)).isoformat()),
            rp.get("end", datetime.now().isoformat()),
        )
        test_bundle = generate_test_artifacts(self.phenotype_df, reporting_period)
        test_bundle_filename = os.path.join(self.output_directory, "test_bundle.json")
        with open(test_bundle_filename, "w") as f:
            f.write(test_bundle)
        return test_bundle

    def execute(self):
        """Run the complete process to generate patient and test artifact bundles."""
        if not os.path.isdir(self.output_directory):
            os.makedirs(self.output_directory)
        self.generate_patient_bundles()
        self.generate_test_bundle()
        print(f"FHIR resources generated in: {self.output_directory}")
