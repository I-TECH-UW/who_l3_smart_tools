/*
 * Library: HIV.IND.27 Logic
 * People living with HIV on ART
 * Number and % of people on ART among all people living with HIV at the end of the reporting period
 * 
 * Numerator: COUNT of clients with "HIV status"='HIV-positive' AND "On ART"=True at reporting period end date
 * Numerator Exclusions: Clients with an "HIV treatment outcome" IN 'Lost to follow up', 'Transferred out', 'Death (documented)' at the end of the reporting period
 * Definition: Number of people on ART at the end of the reporting period (HIV patient monitoring data from, for example, ART registers, patient records or EMRs). For key populations survey data may be required.
 * 
 * Denominator: For treatment coverage: *Estimated number of people living with HIV
 * For progress towards 2nd 95 target: *Estimated number of people living with HIV who know their status
 * Denominator exclusions: Clients with an "HIV treatment outcome" IN 'Lost to follow up', 'Transferred out', 'Death (documented)' at the end of the reporting period
 * Definition: 1. To determine treatment coverage: estimated number of people living with HIV (from models, such as Spectrum AIM)
 * 2. To gauge progress toward the second 95 target: number of people living with HIV who know their HIV status (from surveys or models)
 * 
 * Disaggregation:
 *   - Gender
 *   - Age
 *   - Key population member type
 * Description:
 *   - Gender (female, male, other*)
 *   - Age (0–4, 5–9, 10–14, 15–19, 20–24, 25–29, 30–34, 35–39, 40–44, 45–49, 50+ years)**
 *   - Key populations (men who have sex with men, people living in prisons and other closed settings, people who inject drugs, sex workers, trans and gender diverse people)***
 *   - Cities and other administrative regions of epidemiologic importance
 * 
 *      * The category of other includes trans and gender diverse people who choose an identity other than male or female.
 *      ** Recommended in settings with robust electronic health information systems.
 *      *** Where feasible and data security and confidentiality can be ensured (see monitoring considerations in section 3.8 of WHO's 2022 HIV SI Guidelines on key
 *          populations for further guidance and section 6.4 on maintaining data privacy, security and confidential).
 * 
 * Data Elements: 
 *   - HIV status
 *   - On ART
 * 
 * Reference: Consolidated guidelines on person-centred HIV strategic information: strengthening routine data for impact. Geneva: World Health Organization; 2022 
 *
 * continuous-variable
 */



library HIVIND27Logic

using FHIR version '4.0.1'
 

include HIVIndicatorCommon version '0.0.1' called HIC
include FHIRHelpers version '4.0.1'
include WHOCommon called WCom
include FHIRCommon called FC

parameter "Measurement Period" Interval<Date> default Interval[@2020-01-01, @2020-01-31]
 
context Patient

/*
* Many indicator specifications in ANC and Immunization have context as patient. 
* I believe these should be unfiltered to get all observations not just those related to a current patient
* Should discuss.
*/

define "Measure Population":
   (exists(HIC."HIV Positive Condition" C
	where C.onset before end of "Measurement Period")
	or 
	exists(HIC."HIV Positive Observation" O
	where (O.issued before end of "Measurement Period")
	))
   and exists(HIC."HIV Treatment Active" H
   where H.effective starts before end of "Measurement Period"
    and (H.effective ends after start of "Measurement Period")
   )
   and not HIC."Patient Deceased before end of Measurement Period"
   and not HIC."Transfer Out at Facility during the measurement period"
   and not HIC."Lost to Follow Up during the measurement period"

/*
 * As defined by Member States
 */
define "Initial Population":
  true

/*
 * NOTE: Modeled as a Continuous Variable measure because this is an estimated denominator proportion measure
 */

define function "Measure Observation"(Patient "Patient"):
  1

/*
 * Disaggregators
 */

define "Administrative Gender Stratifier":
	HIC."By Administrative Gender Stratifier"

define "Age Stratifier":
	HIC."By Age Stratifier"

define "Geographic Region Stratifier":
	HIC."By Geographic Region Stratifier"

define "patientGroups Stratifier":
	HIC."patientGroups"

define "Stratification":
 HIC."By Administrative Gender Stratifier".code 
  + ':' + HIC."By Age Stratifier"
+ ':' + HIC."By Geographic Region Stratifier"
//Need to discuss how to add list
//+ ':' +HIC."patientGroups"