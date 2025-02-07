# Test Data Generation Utility

## Table of Contents
- [Test Data Generation Utility](#test-data-generation-utility)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Overview of the Approach](#overview-of-the-approach)
    - [Key Ideas](#key-ideas)
  - [Detailed Steps](#detailed-steps)
    - [For L2 Domain Experts](#for-l2-domain-experts)
    - [For L3 Technical Experts](#for-l3-technical-experts)
  - [Using the Mapping Template Tooling](#using-the-mapping-template-tooling)
    - [1. Generating the Mapping Template](#1-generating-the-mapping-template)
    - [2. Editing the Mapping YAML](#2-editing-the-mapping-yaml)
    - [3. Linking Multiple Features to Single Resources](#3-linking-multiple-features-to-single-resources)
    - [4. Default Resource Instances](#4-default-resource-instances)
    - [5. Resource Generation Flexibility](#5-resource-generation-flexibility)
    - [6. Saving and Testing the Final Mapping](#6-saving-and-testing-the-final-mapping)
  - [Commands Summary](#commands-summary)
  - [Working Example: HIV.IND.20](#working-example-hivind20)
  - [Encapsulated CQL Bundle Generation](#encapsulated-cql-bundle-generation)
  - [File Overview](#file-overview)
    - [Folder: core/indicator\_testing/v2](#folder-coreindicator_testingv2)
    - [CLI File](#cli-file)
    - [Test Files](#test-files)
  - [Additional Documentation](#additional-documentation)

---

## Introduction
This Readme describes a method for generating test data to validate indicator logic. It focuses on a collaborative workflow between non-technical domain experts and technical FHIR experts. The overarching goal is to create test data, label it manually according to indicator criteria, and produce FHIR Bundles and MeasureReports for automated validation.

---

## Overview of the Approach
The process relies on splitting responsibilities between two types of users: 
- Non-technical domain experts, who define the indicator data requirements and label sample datasets. 
- Technical experts, who translate the labeled data into FHIR resources, produce TestScripts, and generate MeasureReports for conformance testing.

### Key Ideas
1. **FHIR Profiles & Example Resources**  
   Each indicator references relevant FHIR profiles. Example resources in those profiles guide how to structure the test data.
2. **Excel‐based Phenotype Definitions**  
   A domain expert uses XLSX templates to define patient phenotypes and label data rows as numerator and/or denominator.
3. **Mapping YAML**  
   A separate YAML file is automatically generated, then updated by FHIR experts to link each XLSX column to the proper FHIR fields.
4. **FHIR Bundle & TestScript Generation**  
   The final step creates FHIR Bundles as well as a TestScript and MeasureReport, enabling a robust testing cycle.

---

## Detailed Steps

### For L2 Domain Experts

1. **Prepare the Indicator Spreadsheet**  
   Provide the L2 indicator Excel file (e.g., `test_indicators.xlsx`) containing indicator definitions (e.g., “HIV.IND.20”).

   Run the phenotype interactive tooling:
   ```
   generate-phenotype --input test_indicators.xlsx --indicator interactive --output phenotype.xlsx
   ```
   This will:
   - Validate the provided indicator spreadsheet.
   - Prompt you to select an indicator from the “Indicator” column.
   - Generate a phenotype XLSX template pre-populated with key definition information and instructions.
   - Allow you to exit or select another indicator.

### For L3 Technical Experts

1. **Generate the XLSX Template for Mapping**  
   Once the phenotype file is complete, run:
   ```
   generate-template --input test_indicators.xlsx --indicator HIV.IND.XX --output HIV.IND.XX.phenotypes.xlsx
   ```

2. **Fill the Template**  
   Update `HIV.IND.XX.phenotypes.xlsx` with the appropriate mappings.

3. **(Optional) Generate the Random Test Dataset**  
   To create additional test rows, run:
   ```
   generate-test-dataset --phenotype HIV.IND.XX.phenotypes.xlsx --output test_dataset.xlsx --rows 1000
   ```

4. **Generate FHIR Resource Bundles and MeasureReport**  
   Finally, produce FHIR resources by executing:
   ```
   generate-fhir --template HIV.IND.XX.phenotypes.xlsx --mapping HIV.IND.XX.phenotype_template.yaml --output-dir output_folder
   ```
   This produces:
   - A separate FHIR Bundle for each phenotype row.
   - A representative MeasureReport.
   - A TestScript resource for automated testing.

---

## Using the Mapping Template Tooling

This section describes how to create and fill out a mapping template YAML file that integrates phenotype definitions with FHIR resource generation. The goal is to produce valid FHIR Bundles for each patient phenotype, modified according to the indicator features.

### 1. Generating the Mapping Template

1. Prepare a completed phenotype XLSX file with all relevant indicator features as columns and patient phenotypes as rows.
2. Run the "generate_mapping_template" command:
   ```
   generate-mapping-template --input [PHENOTYPE_XLSX] --output mapping_template.yaml
   ```
3. This creates a scaffolded YAML file under “features” for each relevant column. For each feature:  
   - “name”: name of the column.  
   - “id”: unique numeric identifier for the feature.  
   - “target_profiles” and “target_valuesets”: placeholders for FHIR profiles or valuesets.  
   - “values”: a list of possible feature states with “phenotype_value” and “fhir_value”.

### 2. Editing the Mapping YAML

Open mapping_template.yaml and add details:

1. "target_profiles": Provide the FHIR resource types or profiles this feature may require (e.g., “Observation/HIVTest”).  
2. "target_valuesets": Set any references to external code/value sets if needed.  
3. Within "values", for each “phenotype_value”:  
   - "fhir_value": Indicate how this phenotype value maps to the FHIR resource field, possibly referencing codeable concepts or direct field assignments.  

### 3. Linking Multiple Features to Single Resources

Certain columns may reference the same resource but with different properties. For instance, “Has HIV test” and “Has HIV test within reporting period” both update the same Observation resource with different date or status fields. In these cases:

1. Use a shared “target_profiles” or resource reference (e.g., “Observation/HIVTest”).  
2. Distinguish the effect of each feature by specifying unique fhir_path or extended logic in “fhir_value” (e.g., date for the reporting period if “Has HIV test within reporting period” is true).  

### 4. Default Resource Instances

Each resource type (Observation, Encounter, Condition, etc.) should have a default valid version. When the mapping script runs, it duplicates these defaults for each patient row, then applies feature-based modifications:  

1. If a feature is present, update the resource’s fields as per “fhir_value”.  
2. If the feature indicates the absence of some event, either omit the resource or set a field indicating no observation of that type.  

### 5. Resource Generation Flexibility

Because multiple features may modify the same resource, the tooling must merge these changes carefully. For example:

- If one feature says “Has HIV test” and another says “HIV test is positive,” both adjust the same Observation.  
- The date property might come from a “within reporting period” feature, driving whether the `effectiveDateTime` is within or outside the period.  

### 6. Saving and Testing the Final Mapping

1. Once the YAML is populated, save it alongside the phenotype XLSX.  
2. Run the “generate-fhir” command to produce final FHIR Bundles and measure reports:  
   ```
   generate-fhir --template [PHENOTYPE_XLSX] --mapping [MAPPING_YAML] --output-dir [OUTPUT_FOLDER]
   ```
3. Validate that the resulting resources accurately reflect your definitions.  

---

## Commands Summary

- generate-phenotype: Generates the phenotype XLSX (supports interactive indicator selection).
- generate-template: Outputs a detailed XLSX template for mapping.
- generate-test-dataset: Creates a randomized test dataset from the phenotype file.
- evaluate: Produces a MeasureReport JSON.
- generate-mapping-template: Creates a stub YAML mapping file.
- generate-fhir: Generates FHIR Bundles, a MeasureReport, and a TestScript.

---

## Working Example: HIV.IND.20
Below is a description of the indicator “Individuals testing positive for HIV”. The numeric calculations involve a numerator (patients testing positive with results returned within the reporting period) and a denominator (patients receiving an HIV test in the same period). By leveraging the approach outlined above, domain experts can label rows (e.g., “HIV-positive” or “HIV-negative”) while technical experts map those fields into a corresponding FHIR Observation resource type.

```markdown
* Short Name: Individuals testing positive for HIV
* Numerator: # of people who test HIV-positive in the reporting period
* Denominator: # of people who received an HIV test in the reporting period
* Disaggregations: Gender, Age, Key Populations, TB status
* Data Concepts: HIV test date, HIV test result, Date HIV test results returned, etc.
```

## Encapsulated CQL Bundle Generation

The generate_patient_bundles functionality has been refactored to support the creation of an encapsulated CQL test bundle. This bundle aggregates both the generated patient FHIR resources and the necessary CQL execution resources from the Implementation Guide (IG). The bundle includes:

1. **Patient Resources:**  
   Generated from the phenotype XLSX, these bundles represent individual patient data.

2. **Measure Resource:**  
   Retrieved using the IG root URL (e.g., `Measure-HIVIND20.json`). This resource defines the measure criteria.

3. **Library Resources:**  
   - The primary Library resource referenced by the Measure.  
   - Dependent Libraries specified in the `depends-on` fields within the main Library (e.g., from `Library-HIVIndicatorElements.json`).

4. **Terminology Resources:**  
   CodeSystems and ValueSets required for CQL evaluation, fetched by parsing the IG’s codings documentation (e.g., from `codings-valuesets.html`). These resources provide the necessary coding and valueset definitions for complete CQL execution.

### Bundle Structure Details

- **Bundle Type:**  
  A transaction Bundle containing all required resources.

- **Bundle Entries:**  
  - One entry for the Measure resource.
  - One entry for the main Library resource.
  - One or more entries for each dependent library.
  - Entries for each patient bundle (generated from phenotype data).
  - Entries for required CodeSystem and ValueSet resources parsed from the IG.

The resulting bundle (saved as `cql_bundle.json`) is self-contained and can be posted directly to a HAPI FHIR server with Clinical Reasoning capabilities. This facilitates testing using the `$evaluate-measure` operation and simulates a realistic CQL execution environment.

For an in-depth explanation of HAPI FHIR’s clinical reasoning capabilities, please refer to the [HAPI FHIR Clinical Reasoning Overview](https://hapifhir.io/hapi-fhir/docs/clinical_reasoning/overview.html).

### Implementation Overview in Tooling

- **Consistency Checks:**  
  Validates that the phenotype DAK ID matches the mapping DAK ID before processing.

- **Resource Retrieval:**  
  Retrieves Measure, Library, and dependent Library resources from the IG using specified URL patterns.  
  Uses caching to optimize IG resource requests.

- **Dependency Parsing:**  
  Reads `relatedArtifact` sections in the main Library to identify dependent libraries.  
  Parses the IG’s `codings-valuesets.html` to locate and include all referenced CodeSystem and ValueSet resources.

- **Bundle Assembly:**  
  Combines the patient bundles, measure, primary library, dependent libraries, and terminology resources into a single transaction Bundle saved as `cql_bundle.json`.

This encapsulated CQL bundle is crucial for enabling automated evaluation via a HAPI FHIR server's clinical reasoning module, allowing full end-to-end testing of measure logic.

---

## File Overview
Below is a brief description of the main source files for reference:

### Folder: core/indicator_testing/v2
- ▶︎ phenotype_generator.py  
  Provides functions to generate a minimal phenotype XLSX and a more complete template XLSX.  
- ▶︎ dataset_generator.py  
  Generates random datasets using the pre‐labeled phenotypes from a template.  
- ▶︎ measure_report_generator.py  
  Creates an example MeasureReport (JSON) from a given test dataset.  
- ▶︎ fhir_bundle_generator.py  
  Produces FHIR Bundles, MeasureReports, and a TestScript using a completed YAML mapping and XLSX template.  
- ▶︎ fhir_mapping_manager.py  
  Loads and processes the YAML mapping file that links phenotype columns to FHIR resource fields.  
- ▶︎ indicator_mappings.py  
  Contains a reference dictionary mapping indicators to expected fields and FHIR profile definitions.  
- ▶︎ mapping_template_generator.py  
  Creates a stub YAML mapping file from a filled phenotype XLSX.

### CLI File
- ▶︎ who_l3_smart_tools/cli/indicator_testing_v2.py  
  The main CLI entry point providing subcommands (generate-phenotype, generate-template, generate-dataset, evaluate, generate-mapping-template, and generate-fhir).

### Test Files
Any test files (e.g., in a “tests” folder) would contain unit and integration tests validating each step of the process:
- For example: “tests/test_indicator_logic.py” could test the correct extraction of numerator/denominator.
- Additional tests might ensure that generated FHIR resources conform to the expected structure.

---

## Additional Documentation
- Refer to [Consolidated Guidelines on Person-Centred HIV Strategic Information](https://uwdigi.atlassian.net/wiki/external/MWQ4M2Q4ODNhNGM0NDZlZjgzMDg0ZjE3ODA1NjllZGU) for further insights.
- Check the [diagram image](test_indicator_flow.png) for a high‐level view of data flow.

