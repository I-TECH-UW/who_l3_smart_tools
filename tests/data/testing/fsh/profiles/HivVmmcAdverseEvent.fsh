Profile: HivVmmcAdverseEvent
Parent: AdverseEvent
Description: "An adverse event related to voluntary medical male circumcision"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^title = "Hiv Vmmc AdverseEvent"
* ^experimental = true
* actuality = #actual
* suspectEntity 1..* MS
* suspectEntity.instance only Reference(HivVmmcProcedure)