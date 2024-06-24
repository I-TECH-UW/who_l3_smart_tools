library HIVIndicatorCommon version '0.0.1' 

using FHIR version '4.0.1'


codesystem "ObservationValue": 'http://terminology.hl7.org/CodeSystem/observation-value'
codesystem "HIV_DAK_Codes": 'http://fhir.org/guides/who/hiv-dak/CodeSystem/HIV-DAKConcepts'
codesystem "ConditionClinicalStatusCodes": 'http://terminology.hl7.org/CodeSystem/condition-clinical'
codesystem "ConditionCategoryCodes": 'http://terminology.hl7.org/CodeSystem/condition-category'
codesystem "ObservationStatusCodes": 'http://hl7.org/fhir/observation-status'

codesystem "Keypopulationmembertype*Codes": 'http://fhir.org/guides/who/hiv-dak/ValueSet/hiv-b-de51'
codesystem "HIVstatusCodes": 'http://fhir.org/guides/who/hiv-dak/ValueSet/hiv-b-de116'
codesystem "HIVtreatmentoutcomeCodes": 'http://fhir.org/guides/who/hiv-dak/ValueSet/hiv-h-de42'
codesystem "ObservationCategoryCodes": 'http://terminology.hl7.org/CodeSystem/observation-category'

include FHIRHelpers version '4.0.1'
include WHOCommon called WCom
include FHIRCommon called FC

parameter "Measurement Period" Interval<Date> default Interval[@2020-01-01, @2020-12-31]

code "Sex Worker": 'HIV.B.DE51' from "Keypopulationmembertype*Codes" display 'sex worker'
code "Men who have sex with men": 'HIV.B.DE52' from "Keypopulationmembertype*Codes" display 'MSM'
code "Trans and gender-diverse people": 'HIV.B.DE53' from "Keypopulationmembertype*Codes" display 'Trans'
code "People who inject drugs": 'HIV.B.DE54' from "Keypopulationmembertype*Codes" display 'PWID'
code "People living in prisons and other closed settings": 'HIV.B.DE55' from "Keypopulationmembertype*Codes" display 'Prisoner'

code "HIV-positive": 'HIV.B.DE116' from "HIVstatusCodes" display 'HIV Positive'
code "HIV-negative": 'HIV.B.DE117' from "HIVstatusCodes" display 'HIV Negative'
code "Diagnosed TB": 'HIV.D.DE940' from "HIVstatusCodes" display 'Diagnosed TB'
code "Presumptive TB": 'HIV.D.DE945' from "HIVstatusCodes" display 'Presumptive TB'

code "At elevated risk for HIV acquisition": 'HIV.B.DE225' from "HIV_DAK_Codes" display 'At elevated risk for HIV acquisition'

//code "On ART": 'HIV.D.DE38' from "HIV_DAK_Codes" display 'On ART'

codesystem ARTCodes: 'http://example.org/fhir/CodeSystem/art-codes'
valueset "On ART": 'http://example.org/fhir/ValueSet/on-art'
valueset "PREP": 'http://example.org/fhir/ValueSet/prep'

valueset "Oral PrEP": 'http://example.org/fhir/ValueSet/OralPrEP'
valueset "Dapivirine vaginal ring (DVR)": 'http://example.org/fhir/ValueSet/dvrprep'
valueset "CAB-LA": 'http://example.org/fhir/ValueSet/cablaprep'

valueset "First-time user": 'http://example.org/fhir/ValueSet/first time'
valueset "Continuing user": 'http://example.org/fhir/ValueSet/continuing'
valueset "Restarting following a period of not taking medication": 'http://example.org/fhir/ValueSet/restarting'

valueset "Daily oral PrEP": 'http://example.org/fhir/ValueSet/dailyPrEP'
valueset "Event-driven PrEP (2+1+1)": 'http://example.org/fhir/ValueSet/eventprep'
valueset "Other PrEP dosing type": 'http://example.org/fhir/ValueSet/otherprep'

valueset "encounter-diagnosis": 'http://example.org/fhir/ValueSet/encounter-diagnosis'
valueset "social-history": 'http://example.org/fhir/ValueSet/social-history'
valueset "HIVtesttypeCodes": 'http://fhir.org/guides/who/hiv-dak/ValueSet/hiv-b-de82'
valueset "Community-level testing" : 'http://example.org/fhir/ValueSet/HIV.B.DE16'
valueset "Facility-level testing" : 'http://example.org/fhir/ValueSet/HIV.B.DE17'
valueset "ANC contact during pregnancy" : 'http://example.org/fhir/ValueSet/HIV.E.DE39'

//valueset "hiv positive": 'http://example.org/fhir/ValueSet/social-history'

code "Lost to follow-up": 'HIV.H.DE42' from "HIVtreatmentoutcomeCodes" display 'Lost to follow-up'
code "Transferred out": 'HIV.H.DE43' from "HIVtreatmentoutcomeCodes" display 'Transferred out'
code "Death (documented)": 'HIV.H.DE44' from "HIVtreatmentoutcomeCodes" display 'Death (documented)'
code "Refused (stopped) treatment": 'HIV.H.DE45' from "HIVtreatmentoutcomeCodes" display 'Refused (stopped) treatment'

codesystem "Administrative Gender Codes": 'http://hl7.org/fhir/administrative-gender'
code "Males" : 'male' from "Administrative Gender Codes" display 'Males'
code "Females" : 'female' from "Administrative Gender Codes" display 'Females'
code "Other" : 'other' from "Administrative Gender Codes" display 'Other/NA'
/* EXPANDED */
code "Trans Males" : 'transgender male' from "Administrative Gender Codes" display 'Trans Males'
code "Trans Females" : 'transgender female' from "Administrative Gender Codes" display 'Trans Females'



// Condition Clinical Status Codes - Consider value sets for these
code "active": 'active' from "ConditionClinicalStatusCodes"
code "recurrence": 'recurrence' from "ConditionClinicalStatusCodes"
code "relapse": 'relapse' from "ConditionClinicalStatusCodes"
code "inactive": 'inactive' from "ConditionClinicalStatusCodes"
code "remission": 'remission' from "ConditionClinicalStatusCodes"
code "resolved": 'resolved' from "ConditionClinicalStatusCodes"

// Condition Category Codes
code "problem-list-item": 'problem-list-item' from "ConditionCategoryCodes" display 'Problem List Item'
//code "encounter-diagnosis": 'encounter-diagnosis' from "ConditionCategoryCodes" display 'Encounter Diagnosis'

// Episode of Care Status
//code "social-history": 'social-history' from "ObservationCategoryCodes" display 'Social History'

context Patient

/*
 * HIV Positive during the measurement period
 * Does issued imply that results returned to tester
 * or should use communication or encounter resource to specify?
 */



define "HIV Positive Condition":
[Condition] C
    where C.clinicalStatus ~ "active"
    and C.category in "encounter-diagnosis"
    and C.code ~ "HIV-positive"

define "HIV Positive Observation":
[Observation] O
    where O.status in {'final', 'amended'}
    and O.code in "HIVtesttypeCodes"
    and O.value ~ "HIV-positive"

define "HIV Negative Observation":
[Observation] O
    where O.status in {'final', 'amended'}
    and O.code in "HIVtesttypeCodes"
    and O.value ~ "HIV-negative"

define "HIV test resulted":
  [Observation] O
    where O.status in {'final', 'amended'}
    and O.code in "HIVtesttypeCodes"

define "HIV Treatment Active":
[MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "On ART"


define "HIV PREP Active":
[MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"

 define "Client is at elevated risk for HIV acquisition":
    [Observation] O
    where O.status in { 'final', 'amended', 'corrected' }
    and O.category in "social-history"
    and O.code ~ "At elevated risk for HIV acquisition"


define "Patient Deceased before end of Measurement Period":
  case 
    when Patient.deceased is FHIR.boolean and Patient.deceased ~ true then (Patient.meta.lastUpdated before end of "Measurement Period")
    when Patient.deceased is FHIR.dateTime then Patient.deceased as FHIR.dateTime before end of "Measurement Period"
    else false
  end

define "Patient Deceased during Measurement Period":
  case 
    when Patient.deceased is FHIR.boolean and Patient.deceased ~ true then Patient.meta.lastUpdated before end of  "Measurement Period" and  Patient.meta.lastUpdated after start of "Measurement Period"
    when Patient.deceased is FHIR.dateTime then Patient.deceased as FHIR.dateTime before end of  "Measurement Period" and Patient.deceased as FHIR.dateTime after start of "Measurement Period"
    else false
  end

/* End of care because of transferring out, death, lost to follow up, or stopped treatment*/

define "Stopped ART at Facility during the measurement period":
    exists(
    [EpisodeOfCare] EOS
    where EOS.type in "On ART"
    and (exists (
      EOS.statusHistory H
      where H.status = 'finished'
      and H.period ends during "Measurement Period"
    ) 
    or (
      EOS.status = 'finished'
      and EOS.period ends during "Measurement Period"
    )
    )
    )

/*
 * By Age Stratifiers
 * (0–4, 5–9, 10–14, 15–19, 20–24, 25–29, 30–34, 35–39, 40–44, 45–49, 50+ years)
 * 
 */
define "By Age Stratifier":
    case 
        when AgeInYearsAt(start of "Measurement Period") <= 4 then '0-4'
        when AgeInYearsAt(start of "Measurement Period") <= 9 then '5-9'
        when AgeInYearsAt(start of "Measurement Period") <= 14 then '10–14'
        when AgeInYearsAt(start of "Measurement Period") <= 19 then '15–19'
        when AgeInYearsAt(start of "Measurement Period") <= 24 then '20–24'
        when AgeInYearsAt(start of "Measurement Period") <= 29 then '25–29'
        when AgeInYearsAt(start of "Measurement Period") <= 34 then '30–34'
        when AgeInYearsAt(start of "Measurement Period") <= 39 then '35–39'
        when AgeInYearsAt(start of "Measurement Period") <= 44 then '40–44'
        when AgeInYearsAt(start of "Measurement Period") <= 49 then '45–49'
        when AgeInYearsAt(start of "Measurement Period") >= 50 then '50+'
        else null
    end
  
  /*
 * By Age Stratifiers
 * Age (0–4, 5–9, 10–14, 15–19, 20–24, 25–49, 50+ years)
 * 
 */
define "By Age Stratifier 2":
    case 
        when AgeInYearsAt(start of "Measurement Period") <= 4 then '0-4'
        when AgeInYearsAt(start of "Measurement Period") <= 9 then '5-9'
        when AgeInYearsAt(start of "Measurement Period") <= 14 then '10–14'
        when AgeInYearsAt(start of "Measurement Period") <= 19 then '15–19'
        when AgeInYearsAt(start of "Measurement Period") <= 24 then '20–24'
        when AgeInYearsAt(start of "Measurement Period") <= 49 then '25–49'
        when AgeInYearsAt(start of "Measurement Period") >= 50 then '50+'
        else null
    end

define "By Age Stratifier 3":
    case 
        when AgeInYearsAt(start of "Measurement Period") >= 15 and AgeInYearsAt(start of "Measurement Period") <= 19 then '15-19'
        when AgeInYearsAt(start of "Measurement Period") <= 24 then '20-24'
        when AgeInYearsAt(start of "Measurement Period") <= 49 then '25–49'
        when AgeInYearsAt(start of "Measurement Period") >= 50 then '50+'
        else null
    end

/*
 * By state stratifier
 */

define "By Geographic Region Stratifier":
    First(Patient.address A where A.use in { 'home' }).state

/*
 * By Administrative Gender of Patient Stratifier
 * Need to expand codes
 */

define "By Administrative Gender Stratifier":
    case 
        when Patient.gender = 'male' then "Males"
        when Patient.gender = 'female' then "Females"
        when Patient.gender = 'transgender female' then "Trans Females"
        when Patient.gender = 'transgender male' then "Trans Males"
        else "Other"
    end

/*
 * Key populations (men who have sex with men, people living in prisons and other closed settings, people who inject drugs, sex workers, trans and gender diverse people)
 */

 define SW:
  exists (
    [Observation] O
    where O.status in { 'final', 'amended', 'corrected' }
    and O.category in "social-history"
    and O.code ~ "Sex Worker"
  )

 define MSM:
  exists (
    [Observation] O
    where O.status in { 'final', 'amended', 'corrected' }
    and O.category in "social-history"
    and O.code ~ "Men who have sex with men"
  )

  define Trans:
  exists (
    [Observation] O
    where O.status in { 'final', 'amended', 'corrected' }
    and O.category in "social-history"
    and O.code ~ "Trans and gender-diverse people"
  )

  define PWID:
  exists (
    [Observation] O
    where O.status in { 'final', 'amended', 'corrected' }
    and O.category in "social-history"
    and O.code ~ "People who inject drugs"
  )

  define Prisoner:
  exists (
    [Observation] O
    where O.status in { 'final', 'amended', 'corrected' }
    and O.category in "social-history"
    and O.code ~ "People living in prisons and other closed settings"
  )

  define TB_diagnosed:
  exists(
    ([Condition] C
    where C.clinicalStatus ~ "active"
    and C.category in "encounter-diagnosis"
    and C.code ~ "Diagnosed TB"
    and C.onset during "Measurement Period")
  )
  
  define TB_presumptive:
  exists(
    ([Condition] C
    where C.clinicalStatus ~ "active"
    and C.category in "encounter-diagnosis"
    and C.code ~ "Presumptive TB"
    and C.onset during "Measurement Period")
  )

/*@triggeredBy Encounter with location = community level testing*/

define "Community_testing":
  exists([Observation] O
    with [Encounter] E
      such that O.encounter.references(E) and E.location.physicalType in  "Community-level testing" 
  where (O.status in { 'final', 'amended' }
  and O.code in "HIVtesttypeCodes"
  and O.issued during "Measurement Period")
  )

/*@triggeredBy Encounter with location = facility level testing*/
define "Facility_testing":
  exists([Observation] O
    with [Encounter] E
      such that O.encounter.references(E) and E.location.physicalType in  "Facility-level testing"
  where (O.status in { 'final', 'amended' }
  and O.code in "HIVtesttypeCodes"
  and O.issued during "Measurement Period")
  )

//lifted this from ANC DAK
//ANC SMART doesn't take into account time period
define "ANC_case":
exists(
    [EpisodeOfCare] EOS
    where EOS.type in "ANC contact during pregnancy"
    and (exists (
      EOS.statusHistory H
      where H.period overlaps "Measurement Period"
    ) 
    or (
      EOS.period overlaps "Measurement Period"
    )
    )
    )
  

  define "PREP Product Oral":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.medication in "Oral PrEP"
  )

  define "PREP Product long-acting device":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.medication in "Dapivirine vaginal ring (DVR)"
  )

  define "PREP Product long-acting injectable":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.medication in "CAB-LA"
  )
  
  define "PREP first time":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.statusReason in "First-time user"
  )

  define "PREP Continuing user":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.statusReason in "Continuing user"
  )
  
  define "PREP Restarting":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.statusReason in "Restarting following a period of not taking medication"
  )

  define "Daily_oral_PrEP":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.dosage.additionalInstruction in "Daily oral PrEP"
  )

  define "Event_driven_PrEP":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.dosage.additionalInstruction in "Event-driven PrEP (2+1+1)"
  )

  define "other_dosing_PrEP":
  exists([MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "PREP"
    and MS.dosage.additionalInstruction in "Other PrEP dosing type"
  )


  define patientGroups:
  List<String>{
    if SW then 'SW' else null,
    if MSM then 'MSM' else null,
    if Trans then 'Trans' else null,
    if PWID then 'PWID' else null,
    if Prisoner then 'Prisoner' else null
  }

  define setting:
  List<String>{
    if Community_testing then 'Community-level testing' else null,
    if Facility_testing then 'Facility-level testing' else null
  }

  define anc:
  List<String>{
    if ANC_case then 'ANC case' else null
  }

  define tb:
  List<String>{
    if TB_diagnosed then 'Diagnosed TB' else null,
    if TB_presumptive then 'Presumptive TB' else null
  }

  define prep_product:
  List<String>{
    if `PREP Product Oral` then 'PREP Product Oral' else null,
    if `PREP Product long-acting device` then 'PREP Product long-acting device' else null,
    if `PREP Product long-acting injectable` then 'PREP Product long-acting injectable' else null
  }

  define prep_experience:
  List<String>{
    if `PREP first time` then 'PREP first time' else null,
    if `PREP Continuing user` then 'PREP Continuing user' else null,
    if `PREP Restarting` then 'PREP Restarting' else null
  }

  define prep_dosing:
  List<String>{
    if `Daily_oral_PrEP` then 'Daily oral PrEP' else null,
    if `Event_driven_PrEP` then 'Event driven PrEP' else null,
    if `other_dosing_PrEP` then 'Other PrEP dosing type' else null
  }

//need to add Time to start ART (within 7, 30 or 90 days of diagnosis, as per country guidelines)
//need to add Disaggregation by time since diagnosis
  


/* 
* DAK has codes for HAART misspecified 
* ICD-10 Z92.2	Other prophylactic chemotherapy		
* LOINC "54825-5	"	On scheduled pain medication regimen in last 7 days
*
* Should discuss 
*/







/*
* Kenya EMR defined as HIV positive condition
* Will need to discuss if produce flags through conditions for concepts to use in indicator calculation such as HIV positive and On ART
* However, we have moved forward with a more prescriptive approach 
* Inevitably our approach requires that certain data elements be available
*/

/*
 * HIV Treatment during the measurement period
 * uses dosage and dispensation amount to estimate last day of medication
 * medication should be dispensed before end of measurement period
 * medication should last until after 28 days after the end of the measurement period
 * This takes into account lost to follow up
 */

/*
*define "HIV Treatment during the measurement period":
*   [MedicationDispense] MD
*    where MD.status in { 'final', 'amended', 'corrected' }
*    and MD.medication ~ 'Antiretroviral'
*    and MD.whenHandedOver before end of "Measurement Period"
*    and (MD.whenHandedOver + MD.dosageInstruction[0].timing.repeat.duration.value * MedicationDispense.quantity.value) after (measurementPeriod.end - 28 days)
*/ 

/*
* Immunization defines HAART as
*  exists([MedicationAdministration] A where ExtractMedicationCode(A.medication) in IMMZc."ARV Drugs" and A.status = 'in-progress')
* I believe this is the incorrect resource unless they mean to say that medication is given during a medical encounter
* would like to discuss 
*/ 

/** 
 * Patient Deceased During Measurement Period
 * Immunization defines this as true when is a boolean. This may have the effect of deleting a person from indicators in all calculations
 * Should intend to use when patient.deceased FHIR boolean was updated to TRUE if no other date is available
 * Kenya EMR example does not account for when deceased is just a boolean
 */


/* to delete*/

define "HIV Positive before end of measurement period":
   exists ([Condition] C
    where C.clinicalStatus ~ "active"
    and C.category in "encounter-diagnosis"
    and C.code ~ "HIV-positive"
    and C.onset before end of "Measurement Period")
    or 
   exists ([Observation] O
    where O.status in {'final', 'amended'}
    and O.code in "HIVtesttypeCodes"
    and O.value ~ "HIV-positive"
    and O.issued before end of "Measurement Period")

//last measurement period is defined as same length as current measurement period  
define "HIV Positive before end of last measurement period":
    exists ([Condition] C
    where C.clinicalStatus ~ "active"
    and C.category in "encounter-diagnosis"
    and C.code ~ "HIV-positive"
    and C.onset before (end of "Measurement Period" - duration in days of "Measurement Period"))
    or 
    exists ([Observation] O
    where O.status in {'final', 'amended'}
    and O.code in "HIVtesttypeCodes"
    and O.value ~ "HIV-positive"
    and O.issued before end of "Measurement Period" - duration in days of "Measurement Period")

define "HIV Treatment Active during the measurement period":
   exists(
    [MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "On ART"
    and MS.effective starts before end of "Measurement Period"
    and (MS.effective ends after start of "Measurement Period"
    or end of MS.effective  ~  null)
   )

   //last measurement period is defined as same length as current measurement period  
define "HIV Treatment Active during last measurement period":
   exists(
    [MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "On ART"
    and MS.effective starts before (end of "Measurement Period" - duration in days of "Measurement Period")
    and (MS.effective ends after (start of "Measurement Period" - duration in days of "Measurement Period")
    or end of MS.effective  ~  null)
   )


 define "HIV Treatment Started during the measurement period":
   exists(
    [MedicationStatement] MS
    where MS.status = 'recorded'
    and MS.reasonCode in "On ART"
    and MS.effective starts during "Measurement Period"
   )