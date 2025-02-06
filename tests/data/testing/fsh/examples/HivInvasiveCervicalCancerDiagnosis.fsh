Instance: ExampleHivInvasiveCervicalCancerDiagnosis
InstanceOf: HivInvasiveCervicalCancerDiagnosis
Title: "Example Invasive Cervical Cancer Diagnosis"
Description: "This is an example of an Invasive Cervical Cancer Diagnosis Condition resource based on the HivInvasiveCervicalCancerDiagnosis profile."
// * meta.profile = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
// * meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* code = HIVConcepts#HIV.D.DE711 "Invasive cervical cancer"
* subject = Reference(Patient/ExampleHivPatient)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* onsetDateTime = "2023-10-01"
