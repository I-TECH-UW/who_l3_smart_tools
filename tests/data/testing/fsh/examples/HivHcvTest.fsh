Instance: ExampleHcvTestObservation
InstanceOf: HivHcvTest
Title: "Example HCV Test Observation"
Description: "An example of an HCV test observation based on the HivHcvTest profile."
* status = #final
* code = HIVConcepts#HIV.D.DE170 "HCV test result"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject = Reference(Patient/ExampleHivPatient)
* effectiveDateTime = "2023-11-01T10:00:00Z"
* issued = "2023-11-02T15:00:00Z"
* valueCodeableConcept = HIVConcepts#HIV.D.DE171 "Positive"