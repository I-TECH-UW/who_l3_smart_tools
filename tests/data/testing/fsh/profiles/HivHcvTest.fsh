Profile: HivHcvTest
Parent: HivLabTestObservation
Description: "A DAK-specific Hepatitis C test observation with possible results"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HCV Test"
* code = HIVConcepts#HIV.D.DE170 "HCV test result"
* valueCodeableConcept from HIV.D.DE170 (required)

Profile: HivHcvTestD
Parent: HivLabTestObservation
Description: "A DAK-specific Hepatitis C test observation with possible results"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HCV Test"
* code = HIVConcepts#HIV.G.DE43 "HCV test result"
* valueCodeableConcept from HIV.G.DE43 (required)