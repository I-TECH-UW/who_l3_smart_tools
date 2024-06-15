/*
HIV.IND.18
People living with HIV who know their HIV status (first 95)

NUMERATOR
COUNT of clients with "HIV status"='HIV-positive' AND "Date informed of HIV-positive diagnosis" before reporting period end date
This right now calculates cumulative number of hiv poz - up to end of reporting period. Not within measurement period.

Exclude clients who are lost to follow up, transferred out, died, or refused (stopped) ART
I DONT BELIEVE EXCLUSION BELONGS HERE

DENOMINATOR
Estimated number of people living with HIV

• Gender (female, male, other**)
• Age (0–4, 5–9, 10–14, 15–19, 20–24, 25–49, 50+ years)***
• Key populations (men who have sex with men, people living in prisons and other closed
settings, people who inject drugs, sex workers, trans and gender diverse people)****
• ANC attendees
• Cities and other administrative regions of epidemiologic importance

*/

library HIVIND18

using FHIR version '4.0.1'
 

include HIVIndicatorCommon version '0.0.1' called HIC
include FHIRHelpers version '4.0.1'
include WHOCommon called WCom
include FHIRCommon called FC

parameter "Measurement Period" Interval<Date> default Interval[@2020-01-01, @2020-01-31]
 
context Patient

define "numerator":
    exists(HIC."HIV Positive Condition" C
	where C.onset before end of "Measurement Period")
	or 
	exists(HIC."HIV Positive Observation" O
	where O.issued before end of "Measurement Period"
	) 

//define denominator?
//How to bring in data from external sources

/*
 * Disaggregators
 */

define "Administrative Gender Stratifier":
	HIC."By Administrative Gender Stratifier"

define "Age Stratifier":
	HIC."By Age Stratifier 2"

define "Geographic Region Stratifier":
	HIC."By Geographic Region Stratifier"

define "patientGroups Stratifier":
	HIC."patientGroups"

define "ANC Stratifier":
    HIC."anc"

/*
 * Combined stratifiers
 * NEED TO DISCUSS WITH BRYNN
 */

//define "Stratification":
 // HIC."By Administrative Gender Stratifier".code 
  //  + ':' + HIC."By Age Stratifier 2".code 
//	+ ':' + HIC."By Geographic Region Stratifier"
