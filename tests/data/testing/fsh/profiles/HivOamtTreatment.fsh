
// 
// define "OAMT":
//   flatten{"OAMT status","OAMT statusHistory".statusHistory.period}

// define "OAMT status":
//     [EpisodeOfCare] EOC
//     where exists(EOC.type T where T ~ Concepts."OAMT")
//     return EOC.period

// define "OAMT statusHistory":
//     [EpisodeOfCare] EOC
//     where exists(EOC.type T where T ~ Concepts."OAMT") 
//     and (exists (
//       EOC.statusHistory H
//       where H.period is not null))

// define "OAMT status date":
//   [EpisodeOfCare] EOC
//     where exists(EOC.type T where T ~ Concepts."OAMT")
//     return start of EOC.period

// define "OAMT statusHistory date":
//     [EpisodeOfCare] EOC
//     where exists(EOC.type T where T ~ Concepts."OAMT") 
//     and (exists (
//       EOC.statusHistory H
//       where H.period is not null))

Profile: HivTreatment
Parent: HivTreatmentMedicationRequest
Description: "Medication Request for opioid agonist maintenance treatment (OAMT)"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Opioid Agonist Maintenance Treatment (OAMT)"
