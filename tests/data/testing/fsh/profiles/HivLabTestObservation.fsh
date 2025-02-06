Profile: HivLabTestObservation
Parent: Observation
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Hiv Lab Test Observation"
* ^description = "Hiv Lab Test Observation Profile"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* effective[x] ^short = "Time at which test performed"
* effective[x] only dateTime or instant
* effective[x] ^definition = "The point in time at which the test was performed"
* issued ^short = "Time at which test results returned"
* issued ^definition = "The point in time at which the test results were returned to the patient or provider"
* value[x] only CodeableConcept
* basedOn MS
