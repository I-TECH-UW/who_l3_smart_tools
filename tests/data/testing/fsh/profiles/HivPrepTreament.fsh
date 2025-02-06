Profile: HivPrepTreatment
Parent: HivTreatmentMedicationStatement
Description: "A profile for MedicationRequest representing a prescription of a PrEP product."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "PrEP Product Prescription"
* medication[x] only CodeableConcept
* medicationCodeableConcept from HIV.C.DE80 (required)
* reasonCode = HIVConcepts#HIV.C.DE76
