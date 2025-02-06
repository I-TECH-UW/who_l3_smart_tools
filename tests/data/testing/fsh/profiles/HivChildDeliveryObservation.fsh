Profile: ChildDeliveryObservation
Parent: Observation
Title: "Child Delivery Observation"
Description: "Represents an observation indicating a child was delivered, including date/time and place of delivery."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* status 1..1 MS
* code 1..1 MS
* code.coding 1..1
* code = HIVConcepts#HIV.E.DE48
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.E.DE67
