Profile: HivPatient
Parent: Patient
Description: "Profile for patients requiring gender, date of birth, and geographic region."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HIV patient Profile"
* gender 1..1 MS 
  // MS = Must Support; you can also set binding, cardinalities, etc. if desired
* birthDate 1..1 MS
* address 1..* MS
  // Ensure at least one address is present
* address.country 1..1 MS
