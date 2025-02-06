Instance: ExampleHivInvasiveCervicalCancerTreatment
InstanceOf: HivInvasiveCervicalCancerTreatment
Title: "Example Invasive Cervical Cancer Treatment Procedure"
Description: "This is an example of an Invasive Cervical Cancer Treatment Procedure resource based on the HivInvasiveCervicalCancerTreatment profile."
* status = #completed
* code = HIVConcepts#HIV.D.DE734 
* subject = Reference(Patient/ExampleHivPatient)
* performer.actor = Reference(Practitioner/ExampleSurgeon)
* reasonReference = Reference(Condition/ExampleHivInvasiveCervicalCancerDiagnosis)
* performedDateTime = "2019-01-01T10:30:00Z"
