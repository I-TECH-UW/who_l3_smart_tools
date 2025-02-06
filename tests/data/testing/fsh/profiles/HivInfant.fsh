Profile: HivInfantPatient
Parent: HivPatient
Title: "Infant Patient Profile"
Description: "Sub-profile of Patient specifically for infants."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true


// Invariant: infantBirthDateConstraint
// Description: "Infant's birthDate should not be more than 12 months in the past."
// Expression: "today() - birthDate <= 1 'year'"
// XPath: "some equivalent if needed"
// Severity: error

// * ^extension[0].url = "http://example.org/fhir/StructureDefinition/infant-birthdate-invariant" 
// * ^extension[0].value[x] = invariant#infantBirthDateConstraint