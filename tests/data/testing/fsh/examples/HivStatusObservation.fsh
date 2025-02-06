Instance: ExampleHivStatusPositiveObservation
InstanceOf: HivStatusObservation
Title: "Example HIV Positive Status Observation"
Description: "This is an example of an HIV Positive Status Observation resource based on the HivStatusObservation profile."

* status = #final
* code = HIVConcepts#HIV.B.DE115
* subject = Reference(Patient/ExampleHivPatient) // Reference to a Patient resource
* effectiveDateTime = "2023-01-10T09:00:00Z" // Example effective dateTime
* valueCodeableConcept = HIVConcepts#HIV.B.DE116 "HIV-positive"
