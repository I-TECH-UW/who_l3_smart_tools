
Profile: HivPepBackbonePreferredTreatment
Parent: HivTreatmentMedicationStatement
Description: "A profile for MedicationRequest representing a preferred PEP backbone prescription."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Preferred PEP Backbone Treatment"
* medication[x] only CodeableConcept
* medicationCodeableConcept from HIV.C.DE91 (required)