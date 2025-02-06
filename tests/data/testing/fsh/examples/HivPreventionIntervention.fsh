Instance: ExampleHivPreventionIntervention
InstanceOf: HivPreventionIntervention
Title: "Example HIV Prevention Intervention Observation"
Description: "An example of an HIV Prevention Intervention observation resource based on the HivPreventionIntervention profile."
* status = #final
* code = HIVConcepts#HIV.PRV.DE2 "HIV Prevention Intervention"
* subject = Reference(Patient/ExampleHivPatient)
* effectiveDateTime = "2023-10-20T14:00:00Z"
* valueCodeableConcept = HIVConcepts#HIV.PRV.DE2 
