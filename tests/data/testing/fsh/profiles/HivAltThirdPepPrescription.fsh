Profile: HivAltThirdPepPrescription
Parent: MedicationRequest
Description: "A profile for MedicationRequest representing an alternative Third PEP drug choice prescription."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Alternative Third PEP Prescription"
* medication[x] only CodeableConcept
* medicationCodeableConcept from HIV.C.DE101 (required)

