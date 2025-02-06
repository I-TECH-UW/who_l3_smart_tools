Profile: HivHcvViralLoadTest
Parent: HivLabTestObservation
Description: "A DAK-specific HCV Viral Load observation with possible results"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^title = "HCV Viral Load Test"
* ^description = "HCV Viral Load Test Profile"
* ^experimental = true
* code = HIVConcepts#HIV.D.DE179 "HCV viral load test result"
* valueCodeableConcept from HIV.D.DE179 (required)

Profile: HcvViralLoadTest
Parent: HivLabTestObservation
Description: "Hepatitis C viral load result"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Hepatitis C Viral Load Result"
* code = HIVConcepts#HIV.G.DE48
* valueCodeableConcept from HIV.G.DE48 (required)


