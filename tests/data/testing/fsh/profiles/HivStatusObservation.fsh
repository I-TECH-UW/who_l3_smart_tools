Profile: HivStatusObservation
Parent: Observation
Description: "An observation representing a patient's HIV status."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HIV Status Observation"
* code = HIVConcepts#HIV.B.DE115
* value[x] only CodeableConcept
* valueCodeableConcept from http://smart.who.int/hiv/ValueSet/HIV.B.DE115 (required)
