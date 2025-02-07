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

    def gather_cql_resources(self, mapping_dak_id):
        """
        Gather all CQL related resources from the IG:
         - Measure resource from <ig_root>/Measure-{dak_id_without_periods}.json
         - Main Library resource referenced by the Measure resource.
         - Dependent Library resources based on 'depends-on' fields in the main Library.
         
        Returns a dictionary with keys: 'measure', 'main_library', and 'dependent_libraries'.
        """
        # Construct measure URL using dak_id (strip periods)
        measure_url = f"{self.ig_root_url}/Measure-{mapping_dak_id.replace('.', '')}.json"
        measure_resource = self.get_fhir_resource(measure_url)

        # Assume the measure has a 'library' field; extract the main library identifier.
        library_id = measure_resource["library"][0].split("/")[-1]
        main_library_url = f"{self.ig_root_url}/Library-{library_id}.json"
        main_library_resource = self.get_fhir_resource(main_library_url)

        dependent_libraries = []
        for dependency in main_library_resource.get("relatedArtifact", []):
            if dependency.get("type") == "depends-on":
                dep_id = dependency["resource"].split("/")[-1]
                library_url = f"{self.ig_root_url}/Library-{dep_id}.json"
                dependent_libraries.append(self.get_fhir_resource(library_url))
        return {
            "measure": measure_resource,
            "main_library": main_library_resource,
            "dependent_libraries": dependent_libraries,
        }

    def assemble_cql_bundle(self, patient_bundles, cql_resources):
        """
        Assemble a complete encapsulated CQL Bundle with the following structure:
         - Bundle Type: collection (transaction Bundle could be used in production)
         - Bundle Entries include:
              • Measure resource
              • Main Library resource
              • Each dependent Library resource
              • All patient data bundles
              • (Placeholder for terminology resources if parsed elsewhere)
        
        Returns the assembled bundle dictionary.
        """
        entries = []
        # Add Measure
        entries.append({"resource": cql_resources["measure"]})
        # Add Main Library
        entries.append({"resource": cql_resources["main_library"]})
        # Add each Dependent Library
        for lib in cql_resources["dependent_libraries"]:
            entries.append({"resource": lib})
        # Add patient bundles (each bundle is already a resource)
        for bundle in patient_bundles:
            entries.append({"resource": bundle})
        return {
            "resourceType": "Bundle",
            "type": "collection",
            "entry": entries,
        }

    def generate_patient_bundles(self):
        """
        Generates individual patient bundles from phenotype data and assembles an 
        encapsulated CQL Bundle containing:
         1. Patient Resources updated from the phenotype XLSX.
         2. A Measure resource defining measure criteria.
         3. A primary Library resource along with its dependent libraries (via 'depends-on').
         4. Terminology resources (to be added by parsing an IG's codings documentation).

        Process:
         - Validate that the DAK ID in the phenotype data matches the mapping.
         - For each phenotype row:
             • Update a default Patient resource.
             • Process and update feature resources.
             • Build and save the patient bundle.
         - Call gather_cql_resources() to fetch CQL resources.
         - Call assemble_cql_bundle() to build a consolidated CQL bundle that
           aggregates the Measure, main Library, dependent libraries, and all patient bundles.
         - Save the CQL bundle as "cql_bundle.json" in the output directory.
        """
        data_bundles = []
        mapping_dak_id = self.mapping_manager.mapping.get("dak_id")
        # Validate mapping DAK ID matches phenotype DAK ID.
        phenotype_dak_id = self.indicator_df["DAK ID"].iloc[0]
        if phenotype_dak_id != mapping_dak_id:
            raise ValueError(
                f"Phenotype DAK ID {phenotype_dak_id} does not match mapping DAK ID {mapping_dak_id}"
            )

        # Process each patient phenotype row.
        for idx, row in self.phenotype_df.iterrows():
            # Convert row into single-row DataFrame
            row = pd.DataFrame(row).T
            row.columns = self.phenotype_df.columns

            # Retrieve and update Patient resource.
            patient_profile_name = self.mapping_manager.mapping["patient_profile"]
            patient_resource = self.get_patient_example(patient_profile_name)
            patient_resource = self.update_patient_resource(patient_resource, row)

            # Assign unique patient id.
            patient_id = str(row.iloc[0]["Patient Phenotype ID"])
            patient_resource["id"] = patient_id

            # Process feature resources for this patient.
            feature_resources = self._group_features(row)

            # Create patient bundle.
            bundle = self.build_bundle(patient_resource, feature_resources)
            bundle["id"] = str(uuid.uuid4())

            # Save the bundle to file.
            bundle_filename = os.path.join(
                self.output_directory, f"patient_data_bundle_{patient_id}.json"
            )
            with open(bundle_filename, "w") as f:
                f.write(json.dumps(bundle, indent=2))
            data_bundles.append(bundle)

        # --- CQL Bundle Assembly ---
        # 1. Fetch Measure, main Library, and dependent libraries.
        cql_resources = self.gather_cql_resources(mapping_dak_id)
        # 2. Assemble the encapsulated CQL bundle including patient bundles and CQL resources.
        cql_bundle = self.assemble_cql_bundle(data_bundles, cql_resources)
        cql_bundle_filename = os.path.join(self.output_directory, "cql_bundle.json")
        with open(cql_bundle_filename, "w") as f:
            f.write(json.dumps(cql_bundle, indent=2))
        # --- End CQL Bundle Assembly ---

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
