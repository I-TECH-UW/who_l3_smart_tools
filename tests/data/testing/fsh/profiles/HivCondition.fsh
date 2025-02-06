Profile: HivCondition
Parent: Condition
Description: "Core profile for HIV IG Conditions"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HIV Condition"
* onset[x] only dateTime
* onset[x] 1..1
* abatement[x] only dateTime
