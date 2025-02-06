Profile: HivCurrentPrepRegimenPrescription
Parent: MedicationRequest
Description: "A profile for MedicationRequest representing a prescription of a current PrEP regimen."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Current PrEP Regimen Prescription"
* medication[x] only CodeableConcept
* medicationCodeableConcept from HIV.C.DE17 (required)
