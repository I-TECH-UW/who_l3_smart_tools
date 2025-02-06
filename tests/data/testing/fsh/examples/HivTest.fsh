Instance: ExampleHivTest
InstanceOf: HivHivTest
Title: "Example HIV Test Observation for Positive Result"
Description: "This is an example of an HIV Test Observation resource based on the HivTest profile for a positive test result."

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = HIVConcepts#HIV.B.DE81 "HIV test type"
* subject = Reference(Patient/ExampleHivPatient)
 
* effectiveDateTime = "2023-01-01T14:30:00Z" 
* issued = "2023-01-03T15:00:00Z" // Example issued time
* valueCodeableConcept = HIVConcepts#HIV.B.DE112 "HIV-positive"