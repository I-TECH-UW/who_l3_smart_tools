Instance: ExamplePrepProductPrescription
InstanceOf: HivPrepTreatment
Title: "Example PrEP Product Prescription"
Description: "This is an example of a PREP Product Prescription resource based on the PrepProductPrescription profile."

* status = #completed
* medicationCodeableConcept = HIVConcepts#HIV.C.DE81
* subject = Reference(Patient/ExampleHivPatient)
* effectiveDateTime = "2023-01-05T10:00:00Z" 

Instance: ExampleCurrentPrepRegimenPrescription
InstanceOf: HivCurrentPrepRegimenPrescription
Title: "Example Current PrEP Regimen Prescription"
Description: "This is an example of a current PrEP regimen prescription resource based on the CurrentPrepRegimen profile."

* status = #completed
* medicationCodeableConcept = HIVConcepts#HIV.C.DE19 "TDF"
* subject = Reference(Patient/ExampleHivPatient)
* intent = #order
* authoredOn = "2023-01-06T10:00:00Z" 
