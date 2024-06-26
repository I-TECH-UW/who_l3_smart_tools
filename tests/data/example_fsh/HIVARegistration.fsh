Invariant:    HIV-A-1
Description:  "'Date of birth' OR 'Date of birth unknown' OR 'Estimated age' should be entered"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-2
Description:  "Can be a drop-down list of input options"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-3
Description:  "Can be based on the structure and format of addresses in the country"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-4
Description:  "DateTime ≤ Current DateTime"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-5
Description:  "If 'Date of birth unknown' = True, 'Estimated age' is required"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-6
Description:  "List of countries"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-7
Description:  "Minimum and maximum number of characters based on country"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-8
Description:  "Minimum and maximum number of characters based on local policy"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-9
Description:  "Minimum and maximum number of characters, based on local policy"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-10
Description:  "Must be appropriate email format with '@' sign"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Invariant:    HIV-A-11
Description:  "Only letters and special characters (period, dash) allowed"
Expression:   "<NOT-IMPLEMENTED>"
Severity:     #error

Logical: HIVARegistration
Title: "HIV.A Registration"
Description: "This tab describes the data that are collected during the registration workflow (HIV.A)"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^experimental = true
* ^name = "HIVARegistration"
* ^status = #active

* firstName 1..1 string "First name" "Client's first or given name"
  * ^code[+] = HIVConcepts#HIV.A.DE1
* familyName 1..1 string "Family name" "Client's family name or last name"
  * ^code[+] = HIVConcepts#HIV.A.DE2
* visitDate 1..1 dateTime "Visit date" "The date and time of the client's visit"
  * ^code[+] = HIVConcepts#HIV.A.DE3
* referral 1..1 boolean "Referral" "If client was referred for care"
  * ^code[+] = HIVConcepts#HIV.A.DE4
* referredBy 0..1 Coding "Referred by" "How the client was referred"
  * ^code[+] = HIVConcepts#HIV.A.DE5
* referredBy from HIV.A.DE5
* uniqueIdentifier 1..1 Identifier "Unique identifier" "Unique identifier generated for new clients or a universal ID, if used in the country"
  * ^code[+] = HIVConcepts#HIV.A.DE8
* nationalId 0..1 Identifier "National ID" "National unique identifier assigned to the client, if used in the country"
  * ^code[+] = HIVConcepts#HIV.A.DE9
* nationalHealthId 0..1 Identifier "National health ID" "National health unique identifier assigned to the client, if used in the country"
  * ^code[+] = HIVConcepts#HIV.A.DE10
* nationalProgrammeId 0..1 Identifier "National programme ID" "National programme unique identifier assigned to the client, if used in the country"
  * ^code[+] = HIVConcepts#HIV.A.DE11
* nationalHealthInsuranceId 0..1 Identifier "National health insurance ID" "National health insurance unique identifier assigned to the client, if used in the country"
  * ^code[+] = HIVConcepts#HIV.A.DE12
* countryOfBirth 1..1 Coding "Country of birth" "Country where the client was born"
  * ^code[+] = HIVConcepts#HIV.A.DE13
* countryOfBirth from HIV.A.DE13
* dateOfBirth 0..1 date "Date of birth" "The client's date of birth (DOB) if known"
  * ^code[+] = HIVConcepts#HIV.A.DE14
* dateOfBirthUnknown 0..1 boolean "Date of birth unknown" "Is the client's DOB is unknown?"
  * ^code[+] = HIVConcepts#HIV.A.DE15
* estimatedAge 0..1 integer "Estimated age" "If DOB is unknown, enter the client's estimated age. Display client's age in number of years."
  * ^code[+] = HIVConcepts#HIV.A.DE16
* age 0..1 integer "Age" "Calculated age (number of years) of the client based on date of birth"
  * ^code[+] = HIVConcepts#HIV.A.DE17
* gender 1..1 Coding "Gender" "Gender of the client"
  * ^code[+] = HIVConcepts#HIV.A.DE18
* gender from HIV.A.DE18
* otherGender 0..1 string "Other (specify)" "Additional category (please specify)"
  * ^code[+] = HIVConcepts#HIV.A.DE24
* sex 1..1 Coding "Sex" "Sex of the client assigned at birth"
  * ^code[+] = HIVConcepts#HIV.A.DE25
* sex from HIV.A.DE25
* address 1..1 string "Address" "Client's home address or address which the client is consenting to disclose"
  * ^code[+] = HIVConcepts#HIV.A.DE29
* maritalStatus 0..1 Coding "Marital Status" "Client's current marital status "
  * ^code[+] = HIVConcepts#HIV.A.DE30
* maritalStatus from HIV.A.DE30
* telephoneNumber 1..1 integer "Telephone number" "Client's telephone number (a landline or a mobile phone number)"
  * ^code[+] = HIVConcepts#HIV.A.DE42
* administrativeArea 1..1 Coding "Administrative Area" "This should be a context-specific list of administrative areas, such as villages, districts, etc. The purpose of this data element is to allow for grouping and flagging of client data to a particular facility's catchment area. This can be input into the system by the end user OR it can be automated in the database based on the end user's attributes."
  * ^code[+] = HIVConcepts#HIV.A.DE43
* administrativeArea from HIV.A.DE43
* communicationConsent 0..1 boolean "Communication consent" "Indication that client gave consent to be contacted"
  * ^code[+] = HIVConcepts#HIV.A.DE44
* reminderMessages 0..1 boolean "Reminder messages" "Whether client wants to receive text or other messages as follow-up for HIV services"
  * ^code[+] = HIVConcepts#HIV.A.DE45
* communicationPreferences 0..* Coding "Communication preference(s)" "How the client would like to receive family planning communications"
  * ^code[+] = HIVConcepts#HIV.A.DE46
* communicationPreferences from HIV.A.DE46
* clientEmail 0..1 string "Client's email" "Client's primary email account where the client can be contacted"
  * ^code[+] = HIVConcepts#HIV.A.DE49
* alternateContactName 0..1 string "Alternate contact's name" "Name of an alternate contact, which could be next of kin (e.g. partner, husband, mother, sibling, etc.). The alternate contact would be used in the case of an emergency situation."
  * ^code[+] = HIVConcepts#HIV.A.DE50
* alternateContactPhoneNumber 0..1 integer "Alternate contact's phone number" "Phone number of the alternate contact"
  * ^code[+] = HIVConcepts#HIV.A.DE51
* alternateContactAddress 0..1 string "Alternate contact's address" "Alternate contact's home address or address which the client is consenting to disclose"
  * ^code[+] = HIVConcepts#HIV.A.DE52
* alternateContactRelationship 0..1 string "Alternate contact relationship" "The alternate contact's relationship to the client (e.g. partner, husband, mother, sibling, etc.)"
  * ^code[+] = HIVConcepts#HIV.A.DE53
