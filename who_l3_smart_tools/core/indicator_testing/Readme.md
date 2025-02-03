# Test Data Generation Utility

## Diagram Image
![Overview](test_indicator_flow.png)

## Additional Documentation
See https://uwdigi.atlassian.net/wiki/external/MWQ4M2Q4ODNhNGM0NDZlZjgzMDg0ZjE3ODA1NjllZGU


## Revamp of the Test Data Generation Utility

In order to generate some sort of test data that can be used for iterative validation of the indicator logic, we should be able to leverage FHIR profiles and example resources. For each indicator, we need to identify the profiles that are relevant. 

The profiles that are relevant to an indicator are the ones that are used in the indicator logic. For example, if an indicator is based on the a given HIV test result, then the corresponding profile should be used as a reference for data generation, and related example resources as templates.

We still need to figure out a way to organize the data generation process so that it can be collaborative with L2-level authors. Test data and the `golden standard` labels for indicator calculations based on the test data should be generated at the L2 level and validated by domain experts in HIV care before being used for L3 translation. This approach would allow at least a base level of clinical validation of the indicator logic.

In order to demonstrate this approach, we will showcase a basic version the test data generation process that uses Excel spreadsheets to organize metadata and test data for each indicator, and allows for manual labeling of the generated test data. In future iterations, we will aim to automate the labeling process as well, as long as the input logic is clear, consistent, and computable.

## Working example based on HIV.IND.20
We will work with a simple example that requires patient-level data, with a given patient being counted or not in a binary way for a given reporting period. This will allow us to simplify data generation to determining a set of patient phenotypes, generating a test dataset based on those phenotypes, and then labeling the dataset based on the indicator logic.

Here is the description of the indicator:
```markdown
* Library: HIV.IND.20 Logic
 * Ref No: HTS.3
 * Short Name: Individuals testing positive for HIV
 *
 * Definition: % testing positive among people who received an HIV test in the reporting period
 *
 * Numerator: Number of people who test HIV-positive in the reporting period and have results returned to them*
 * Numerator Calculation: COUNT of clients with "HIV test result"='HIV-positive' AND "HIV test date" in the reporting period AND (("Date HIV test results returned" in the reporting period) OR ("HIV diagnosis date" in the reporting period))
 * Numerator Exclusions: 
 *
 * Denominator: Number of people receiving an HIV test in the reporting period
 * Denominator Calculation: COUNT of clients with "HIV test date" in the reporting period AND "Date HIV test results returned" in the reporting period
 * Denominator Exclusions: 
 *
 * Disaggregations:
 * • Gender (female, male, other**) 
 *  • Age (0–4, 5–9, 10–14, 15–19, 20–24, 25–29, 30–34, 35–39, 40–44, 45–49, 50+ years)*** 
 *  • Key populations (men who have sex with men, people living in prisons and other closed settings, people who inject drugs, sex workers, trans and gender diverse people)**** 
 *  • TB status (presumptive TB, diagnosed TB, none) 
 *  • Testing entry point: 
 *  - Facility-level testing: Provider-initiated testing and counselling in clinics or emergency facilities, ANC clinics (including labour and delivery), voluntary counselling and testing (within a health facility setting), family planning clinics (only in high HIV burden settings), TB clinics, other facility-level testing 
 *  - Community-level testing: Mobile testing (for example, through vans or temporary testing facilities), voluntary counselling and testing (VCT) centres (not within a health facility setting), other community-based testing. 
 *  • Cities and other administrative regions of epidemiologic importance
 *
 * Disaggregation Elements: Gender | Age | Key population member type | TB diagnosis result | Presumptive TB | Testing entry point
 *
 * Numerator and Denominator Elements:
 * Date HIV test results returned 
 *  HIV diagnosis date 
 *  HIV test date 
 *  HIV test result
 *
 * Reference: Consolidated guidelines on person-centred HIV strategic information: strengthening routine data for impact. Geneva: World Health Organization; 2022
 * 
 * Data Concepts:
 * HIV.A.DE17: Age | Calculated age (number of years) of the client based on date of birth
 * HIV.A.DE18: Gender* | Gender of the client*
 * HIV.A.DE19: Female | Client identifies as female
 * HIV.A.DE20: Male | Client identifies as male
 * HIV.A.DE21: Transgender male | Client identifies as transgender male
 * HIV.A.DE22: Transgender female | Client identifies as transgender female
 * HIV.A.DE23: Other | Additional category
 * HIV.B.DE15: Testing entry point | Whether testing is happening in the community or at a facility
 * HIV.B.DE16: Community-level testing | Testing is happening in the community, which includes mobile testing
 * HIV.B.DE17: Facility-level testing | Testing is happening at a facility
 * HIV.B.DE50: Key population member type* | The type of key population that the client is included in
 * HIV.B.DE51: Sex worker | Client is a sex worker
 * HIV.B.DE52: Men who have sex with men | Client is a man who has sex with men
 * HIV.B.DE53: Trans and gender-diverse people | Client identifies as trans and gender-diverse
 * HIV.B.DE54: People who inject drugs | Client is a person who injects drugs
 * HIV.B.DE55: People living in prisons and other closed settings | Client lives in a prison or another closed setting
 * HIV.B.DE60: Date HIV test results returned | Date HIV test result returned to client
 * HIV.B.DE71: HIV diagnosis date | Date diagnosis was returned to client
 * HIV.B.DE110: HIV test date | Date of the HIV test
 * HIV.B.DE111: HIV test result | The result from HIV testing after applying the testing algorithm
 * HIV.B.DE112: HIV-positive | Test result is HIV-positive
 * HIV.B.DE113: HIV-negative | Test result is HIV-negative
 * HIV.B.DE114: HIV-inconclusive | Test result is HIV-inconclusive
 * HIV.D.DE282: Presumptive TB | Client's comorbidities or coinfections or symptoms of these include presumptive TB
 * HIV.D.DE939: TB diagnosis result | Final result of the TB investigation (bacteriological and/or clinical)
 * HIV.D.DE940: Diagnosed TB | Client is diagnosed with TB disease
 * HIV.D.DE941: TB excluded | Client is not diagnosed with TB
 * HIV.D.DE945: Presumptive TB | Client has signs or symptoms of tuberculosis (TB) without laboratory confirmation
 * HIV.E.DE114: Key population member type* | The type of key population that the infant's mother is included in
 * HIV.E.DE115: Sex worker | Infant's mother is a sex worker
 * HIV.E.DE116: People who inject drugs | Infant's mother is a person who injects drugs
 * HIV.E.DE117: Trans and gender-diverse people | Infant's mother identifies as trans and gender-diverse
 * HIV.E.DE118: People living in prisons and other closed setting | Infant's mother is in a prison or closed setting
 * HIV.E.DE224: HIV test date | Date of the HIV test
 * HIV.SRV.DE1: HIV test date | Date of the HIV test
 * HIV.SRV.DE2: HIV test result | The result from HIV testing after applying the testing algorithm
 *
 * Additional Context
 * - what it measures: Measures the proportion of people testing positive for HIV. Individuals receiving more than one HIV test in the reporting period are counted only once in the denominator.
 * - rationale: Knowing the HIV test positivity among individuals by testing approach is critical to understanding the reach of HIV testing services, and the number of people aware of their status and receiving person-centred services.
 * - method: For the numerator and denominator: Patient monitoring tools, for example, HIV testing service records, HTS or lab registers, logbooks and reporting forms at facility and community levels or EMRs
 * 
 * Suggested Scoring Method: proportion | http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
 */
 ```

We will assume that `Have results returned to them` indicates that the test result observation has been finalized and is available in the target dataset (EMR db, shared health record, etc.). 

 For testing the basic logic without disaggregations, we can focus on the following data elements and their corresponding profiles:
 * Patient: `HivPatient` profile
 * HIV test result: `HivHivTest` profile
  
These are the two profiles and related fsh resources:

```fsh
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
```

```fsh
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

Profile: HivHivTest
Parent: HivLabTestObservation
Description: "An DAK-specific HIV test observation with possible results"
* ^title = "HIV Test"
* code = HIVConcepts#HIV.B.DE81
* valueCodeableConcept from HIV.B.DE111 (required)

ValueSet: HIV.B.DE111
Title: "HIV test result ValueSet"
Description: "Value set of the result from HIV testing after applying the testing algorithm"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"
* ^status = #active
* ^experimental = true
* ^name = "HIVBDE111"
* ^url = "http://smart.who.int/hiv/ValueSet/HIV.B.DE111"

* HIVConcepts#HIV.B.DE112 "HIV-positive"
* HIVConcepts#HIV.B.DE113 "HIV-negative"
* HIVConcepts#HIV.B.DE114 "HIV-inconclusive"

```

Based on this type of input, I want to be able to allow a user to define various patient phenotypes that are rooted in the profiles and example resources. For example, a patient phenotype could be a `HivPatient` with a `gender` of `male`, `birthDate` of `1980-01-01`, and `address` of `country` of `Kenya` (so random demographics), and have a positive HIV test result in the given reporting period.

Here's a simple list of the various patient phenotypes that might need to be made for testing this indicator:

1. **Patient with Positive Result in Reporting Period**
2. **Patient with Negative Result in Reporting Period**
3. **Patient with Inconclusive Result in Reporting Period**
4. **Patient with No Result in Reporting Period**
5. **Patient with Positive Result Outside Reporting Period**
6. **Patient with Negative Result Outside Reporting Period**
7. **Patient with Inconclusive Result Outside Reporting Period**
8. **Patient with results in both reporting and non-reporting period**
9. etc...

We want to facilitate the ideation and creation of these patient phenotypes, and document them in a computable artifact, like an Excel sheet. Then, we want to generate a sufficient number of test patients based on these phenotypes, save them in an artifact (like excel sheet), lay out the indicator logic clearly in the artifact to facilitate labeling, and allow the domain expert to label them based on the indicator logic.

We want to then use the phenotypes and the labels in this artifact to generate prerequesite test data based on the profiles and example resources. We will then create a TestScript resource that outlines the test cases based on the generated test data and the resulting MeasureReport resource that the real indicator logic can be compared against.

