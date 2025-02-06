Profile: HivAltPepBackbonePrescription
Parent: MedicationRequest
Description: "A profile for MedicationRequest representing an alternative PEP backbone prescription."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Alternative PEP Backbone Prescription"
* medication[x] only CodeableConcept
* medicationCodeableConcept from HIV.C.DE95 (required)

