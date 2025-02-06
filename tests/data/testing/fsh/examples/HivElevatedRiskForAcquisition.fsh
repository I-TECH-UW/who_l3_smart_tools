Instance: ExampleElevatedHivRiskCondition
InstanceOf: HivElevatedRiskForAcquisition
Title: "Example Elevated HIV Risk Condition"
Description: "This is an example of an Elevated HIV Risk Condition resource based on the HivElevatedRiskForAcquisition profile."

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code = HIVConcepts#HIV.B.DE225
* subject = Reference(Patient/ExampleHivPatient)
* onsetDateTime = "2023-01-11T10:00:00Z" 