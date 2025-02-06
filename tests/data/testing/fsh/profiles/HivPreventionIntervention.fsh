Profile: HivPreventionIntervention
Parent: Observation
Description: "HIV prevention intervention"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HIV Prevention Intervention"
* code = HIVConcepts#HIV.PRV.DE2 "HIV Prevention Intervention"
* value[x] only CodeableConcept
* valueCodeableConcept from http://smart.who.int/hiv/ValueSet/HIV.PRV.DE2 (required)
* effective[x] 1..1
