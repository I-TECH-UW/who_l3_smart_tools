Profile: HivTreatmentMedicationRequest
Parent: MedicationRequest
Description: "Core profile for HIV IG Treatment Medication Statments"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HIV Treatment Medication Statement"
* medication[x] only CodeableConcept
* medicationCodeableConcept from HIV.D.DE537 (required)

