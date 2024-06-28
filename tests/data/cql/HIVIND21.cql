/*
 * Library: HIV.IND.21
 * Linkage to ART
 * % of people newly diagnosed with HIV initiated on ART
 * 
 * Numerator: COUNT of clients with "Date informed of HIV-positive diagnosis" in the reporting period AND "ART start date" in the reporting period
 * Numerator Exclusions: 
 * 
 * Denominator: COUNT of clients with "Date informed of HIV-positive diagnosis" in the reporting period
 * 
 * Disaggregation:
 *  • Gender (female, male, other*)
 *  •  Age (0–4, 5–9, 10–14, 15–19, 20–24, 25–29, 30–34, 35–39, 40–44, 45–49, 50+ years)**
 *  •  Key populations (men who have sex with men, people living in prisons and other closed settings, people who inject drugs, sex workers, trans and gender diverse people)***
 *  •  TB status (presumptive TB, diagnosed TB, none)
 *  •  Time to start ART (within 7, 30 or 90 days of diagnosis, as per country guidelines)
 *  •  Disaggregation by time since diagnosis (for example, 28 or 90 days) provides an indication of the quality of care with respect to national guidelines on when treatment should be started
 *  •  Cities and other administrative regions of epidemiologic importance
 *      * The category of other includes trans and gender diverse people who choose an identity other than male or female.
 *      ** Recommended in settings with robust electronic health information systems.
 *      *** Where feasible and data security and confidentiality can be ensured (see monitoring considerations in section 3.8 of WHO's 2022 HIV SI Guidelines on key
 *          populations for further guidance and section 6.4 on maintaining data privacy, security and confidential).
 * 
 * 
 * Reference: Consolidated guidelines on person-centred HIV strategic information: strengthening routine data for impact. Geneva: World Health Organization; 2022 
 */



library HIVIND21

using FHIR version '4.0.1'


include HIVIndicatorCommon version '0.0.1' called HIC
include FHIRHelpers version '4.0.1'
include WHOCommon called WCom
include FHIRCommon called FC

parameter "Measurement Period" Interval<Date> default Interval[@2020-01-01, @2020-01-31]

context Patient

/*
 * As defined by Member State
 */
define "Initial Population":
  true


define "numerator":
   (exists(HIC."HIV Positive Condition" C
	where C.onset during "Measurement Period")
	or 
	exists(HIC."HIV Positive Observation" O
    //during doesn't work
	where (O.issued before end of "Measurement Period" and
    O.issued after start of "Measurement Period")
	))
   and exists(HIC."HIV Treatment Active" H
   where H.effective starts before end of "Measurement Period"
    and (H.effective ends after start of "Measurement Period"
    or end of H.effective  ~  null)
   )

define "denominator":
   (exists(HIC."HIV Positive Condition" C
	where C.onset before end of "Measurement Period")
	or 
	exists(HIC."HIV Positive Observation" O
	where (O.issued before end of "Measurement Period" and
    O.issued after start of "Measurement Period")
	))

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

define "TB Stratifier":
    HIC."tb"

define "Stratification":
 HIC."By Administrative Gender Stratifier".code 
  + ':' + HIC."By Age Stratifier"
+ ':' + HIC."By Geographic Region Stratifier"
// how to add list
//+ ':' + HIC."tb"