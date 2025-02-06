Instance: ExampleHivOnArt
InstanceOf: HivOnArt
Title: "Example HIV On ART Medication Statement"
Description: "This is an example of an On ART Medication Statement resource based on the HivOnArtMedicationStatement profile."

* status = #active
* medicationCodeableConcept = HIVConcepts#HIV.D.DE91
* subject = Reference(Patient/ExampleHivPatient)
* effectiveDateTime = "2022-01-17T12:00:00Z" 
* reasonCode = HIVConcepts#HIV.D.DE38
