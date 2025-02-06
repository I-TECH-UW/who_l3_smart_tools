Profile: HivHBsAgTestD
Parent: HivLabTestObservation
Description: "A DAK-specific Hepatitis B virus test observation with possible results"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HBsAg Test"
* code = HIVConcepts#HIV.D.DE162 "HBsAg test result"
* valueCodeableConcept from HIV.D.DE162 (required)

Profile: HivHBsAgTest
Parent: HivLabTestObservation
Description: "A DAK-specific Hepatitis B virus test observation with possible results"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HBsAg Test"
* code = HIVConcepts#HIV.G.DE18 "HBsAg test result"
* valueCodeableConcept from HIV.G.DE18 (required)
