import pandas as pd


OCL_NAME_MAP = {
    "Activity ID": "attr:Activity_ID",
    "Data Element ID": "id",
    "Data Element Label": "name[1]",
    "Description and Definition": "description[1]",
    "Multiple Choice Type (if applicable)": "attr:Multiple_Choice_Type_(if_applicable)",
    "Data Type": "datatype",
    "Calculation": "attr:Calculation",
    "Quantity Sub-Type": "attr:Quantity_Sub-Type",
    "Validation Condition": "attr:Validation_Condition",
    "Editable": "attr:Editable",
    "Required": "attr:Required",
    "Skip Logic": "attr:Skip_Logic",
    "Linkages to Aggregate Indicators": "attr:Linkages_to_Aggregate_Indicators",
    "Notes": "attr:Notes",
    "ICD-11 URI": "attr:ICD-11_URI",
    "ICD-11 Comments / Considerations": "attr:ICD-11_Comments_Considerations",
    "ICD-11 Relationship": "map_type[0]",
    "ICD-10 Comments / Considerations": "attr:ICD-10_Comments_Considerations",
    "ICD-10 Relationship": "map_type[1]",
    "ICD-9 Comments / Considerations": "attr:ICD-9_Comments_Considerations",
    "ICD-9 Relationship": "map_type[2]",
    "LOINC version 2.68 Comments / Considerations": "attr:LOINC_version_2.68_Comments_Considerations",
    "LOINC version 2.68 Relationship": "map_type[3]",
    "ICHI URI": "attr:ICHI_URI",
    "ICHI Comments / Considerations": "attr:ICHI_Comments_Considerations",
    "ICHI Relationship": "map_type[4]",
    "ICF Comments / Considerations": "attr:ICF_Comments_Considerations",
    "ICF Relationship": "map_type[5]",
    "SNOMED GPS Code Comments Considerations": "attr:SNOMED_GPS_Code_Comments_Considerations",
    "SNOMED GPS Relationship": "map_type[6]",
    "SNOMED CT International Version Comments / Considerations": "attr:Snomed_CT_International_Version_Comments_Considerations",
    "SNOMED CT Relationship": "map_type[7]",
    "HL7 FHIR R4 - Resource": "attr:HL7_FHIR_R4_Resource",
    "HL7 FHIR R4 - Values": "attr:HL7_FHIR_R4_Values",
    "HL7 FHIR R4 Relationship": "map_type[8]",
    "ICD-11 Description": "attr:ICD-11_Description",
    "WHO ATC Name": "attr:WHO_ATC_Name",
    "Origin Tab": "attr:Activity_Group",
    "Input Options": "attr:Input_Options",
    "ICD-11 Code": "map_to_concept_url[0]",
    "ICD-10 Code": "map_to_concept_url[1]",
    "ICD-9 Code": "map_to_concept_url[2]",
    "LOINC version 2.68 Code": "map_to_concept_url[3]",
    "ICHI (Beta 3) Code": "map_to_concept_url[4]",
    "ICF Code": "map_to_concept_url[5]",
    "SNOMED GPS Code": "map_to_concept_url[6]",
    "SNOMED CT International Version Code": "map_to_concept_url[7]",
    "HL7 FHIR R4 Code": "map_to_concept_url[8]",
    "WHO ATC Code": "map_to_concept_url[9]",
}

OCL_PREFIX_MAP = {
    "map_to_concept_url[0]": "/orgs/WHO/sources/ICD-11-WHO/concepts/",
    "map_to_concept_url[1]": "/orgs/WHO/sources/ICD-10-WHO/concepts/",
    "map_to_concept_url[2]": "/orgs/WHO/sources/ICD-9-WHO/concepts/",
    "map_to_concept_url[3]": "/orgs/Regenstrief/sources/LOINC/concepts/",
    "map_to_concept_url[4]": "/orgs/WHO/sources/WHO-ICHI/concepts/",
    "map_to_concept_url[5]": "/orgs/WHO/sources/WHO-ICF/concepts/",
    "map_to_concept_url[6]": "/orgs/SNOMED-International/sources/SNOMED-GPS/concepts/",
    "map_to_concept_url[7]": "/orgs/IHTSDO/sources/SNOMED-CT/concepts/",
    "map_to_concept_url[9]": "/orgs/WHO/sources/WHOATC/concepts/",
}

HL7_FHIR_CODE_MAP = {
    "male": "/orgs/HL7/sources/administrative-gender/",
    "female": "/orgs/HL7/sources/administrative-gender/",
    "other": "/orgs/HL7/sources/administrative-gender/",
    "unknown": "/orgs/HL7/sources/administrative-gender/",
    "http://hl7.org/fhir/uv/ips/ValueSet/vaccines-gps-uv-ips": "http://hl7.org/fhir/uv/ips/ValueSet/vaccines-gps-uv-ips",
    "http://hl7.org/fhir/uv/ips/ValueSet/whoatc-uv-ips": "http://hl7.org/fhir/uv/ips/ValueSet/whoatc-uv-ips",
    "http://hl7.org/fhir/ValueSet/immunization-route": "http://hl7.org/fhir/ValueSet/immunization-route",
    "complete | pending | error": "https://build.fhir.org/valueset-measure-report-status.html",
    "summary": "https://build.fhir.org/valueset-measure-report-type.html",
    "increase": "/orgs/fhir-hl7-test/sources/measure-improvement-notation/",
    "decrease": "/orgs/fhir-hl7-test/sources/measure-improvement-notation/",
    "numerator": "/orgs/fhir-hl7-test/sources/measure-population/",
    "denominator": "/orgs/fhir-hl7-test/sources/measure-population/",
}


class Row:
    RESOURCE_TYPE = "Concept"
    OWNER_TYPE = "Organization"
    RETIRED = "FALSE"
    NAME_TYPE = "Fully Specified"

    def __init__(
        self, environment, org, base_url, dak_source, raw_row, previous_row=None
    ) -> None:
        self.environment = environment
        self.org = org
        self.base_url = base_url
        self.dak_source = dak_source
        self.raw_row = raw_row
        self.previous_row = previous_row
        self.current_id = previous_row.current_id if previous_row else 0
        self.row = self.rename_columns()
        self.map_from_concept_url_10 = None

    def rename_columns(self):
        converted_row = {}
        for key, value in OCL_NAME_MAP.items():
            converted_row[value] = self.raw_row[key]
        converted_row["resource_type"] = self.RESOURCE_TYPE
        converted_row["source"] = self.dak_source
        converted_row["owner_id"] = self.org
        converted_row["owner_type"] = self.OWNER_TYPE
        converted_row["retired"] = self.RETIRED
        converted_row["name_type[1]"] = self.NAME_TYPE
        return converted_row

    def clean_input_options(self):
        if self.row["attr:Multiple_Choice_Type_(if_applicable)"] == "Input Option":
            self.row["attr:Input_Options"] = ""

    def clean_not_classifiable(self):
        for key, value in OCL_PREFIX_MAP.items():
            if key in self.row:
                item = self.row[key]
                if "Not Classifiable" in item or not item:
                    self.row[key] = ""
                else:
                    self.row[key] = value + item

    def clean_map_to_concept_url_8(self):
        if (
            "Not Classifiable" in self.row["map_to_concept_url[8]"]
            or not self.row["map_to_concept_url[8]"]
        ):
            self.row["map_to_concept_url[8]"] = ""
            return
        fhir_code = HL7_FHIR_CODE_MAP.get(self.row["map_to_concept_url[8]"], "")
        if not fhir_code:
            self.row["map_to_concept_url[8]"] = ""
            return
        if "/orgs/" in fhir_code:
            self.row["map_to_concept_url[8]"] = f"{fhir_code}concepts/"
        else:
            self.row["map_to_concept_url[8]"] = fhir_code

        if self.row["map_type[8]"] == "" and self.row["map_to_concept_url[8]"] != "":
            self.row["map_type[8]"] = "Related to"

    def clean_map_to_concept_url_9(self):
        self.row["map_type[9]"] = ""
        if self.row["map_to_concept_url[9]"]:
            self.row["map_type[9]"] = "Equivalent"

    def clean_id(self):
        if not self.row["id"]:
            self.row["id"] = self.current_id + 1
            self.current_id = self.row["id"]

    def clean_map_to_concept_url_10(self):
        self.row["map_from_concept_url[10]"] = str(self.row["id"])
        self.clean_id()
        self.row["map_type[10]"] = "Q-AND-A"
        self.row["map_to_concept_url[10]"] = (
            f"/orgs/{self.row['owner_id']}/sources/{self.row['source']}/concepts/{self.row['id']}/"
        )
        self.ffilled_concept_url_10 = (
            self.previous_row.ffilled_concept_url_10
            if self.previous_row and not self.row["map_from_concept_url[10]"]
            else self.row["map_from_concept_url[10]"]
        )
        self.row["map_from_concept_url[10]"] = (
            f"/orgs/{self.row['owner_id']}/sources/{self.row['source']}/concepts/{self.ffilled_concept_url_10}/"
        )
        if (
            self.row["map_from_concept_url[10]"]
            == f"/orgs/{self.row['owner_id']}/sources/{self.row['source']}/concepts/{self.row['id']}/"
        ):
            self.row["map_to_concept_url[10]"] = ""
            self.row["map_type[10]"] = ""
            self.row["map_from_concept_url[10]"] = ""

        self.row["concept_class"] = (
            "Input Option" if self.row["map_type[10]"] else "Data Element"
        )

    def process_row(self):
        self.clean_input_options()
        self.clean_not_classifiable()
        self.clean_map_to_concept_url_8()
        self.clean_map_to_concept_url_9()
        self.clean_map_to_concept_url_10()
        return self

    def to_valuesets(self, delete=False):
        _valuesets = {}
        self.process_row()
        if self.row["map_from_concept_url[10]"]:
            _valuesets["id"] = self.row["map_from_concept_url[10]"].rsplit("/", 2)[-2]
            _valuesets["lookup"] = self.row["map_from_concept_url[10]"].rsplit("/", 2)[
                -2
            ]
            _valuesets["name"] = self.row["name[1]"]
            _valuesets["full_name"] = f"Values for: {_valuesets['name']}"
            _valuesets["owner"] = self.org
            _valuesets["owner_type"] = self.OWNER_TYPE
            _valuesets["default_locale"] = "en"
            _valuesets["canonical_url"] = f"{self.base_url}{_valuesets['id']}"
            _valuesets["collection_type"] = "Value Set"
            _valuesets["type"] = "Collection"
            _valuesets["id"] = f"{_valuesets['id']}-values"
            _valuesets["name"] = f"{_valuesets['id']}: { _valuesets['name']}"
            if delete:
                _valuesets["__action"] = "DELETE"
            self.row["attr:ValueSet_URL"] = f'{self.base_url}{_valuesets["id"]}'
        return _valuesets
