/*
HIV.IND.19
HTS test volume and positivity
Number of HIV tests performed (volume) and the % of HIV-positive results returned to people (positivity)

NUMERATOR
COUNT of tests with "HIV test result"='HIV-positive' AND (("Date HIV test results returned" in the reporting period) OR ("HIV diagnosis date" in the reporting period))
Exclude Self-testing

DENOMINATOR
COUNT of tests with "HIV test date" AND "Date HIV test results returned" in the reporting period
Exclude Self-testing

• Gender (female, male, other**)
• Age (0–4, 5–9, 10–14, 15–19, 20–24, 25–29, 30–34, 35–39, 40–44, 45–49, 50+ years)**
• Key populations (men who have sex with men, people living in prisons and other closed settings, people who inject drugs, sex workers, trans and gender diverse people)***
• TB status (presumptive TB, diagnosed TB, none)
• Testing entry point:
- Facility-level testing: Provider-initiated testing and counselling in clinics or emergency facilities, ANC clinics (including labour and delivery), voluntary counselling and testing (within a health facility setting), family planning clinics (only in high HIV burden settings), TB clinics, other facility-level testing
- Community-level testing: Mobile testing (for example, through vans or temporary testing facilities), voluntary counselling and testing centres (not within a health facility setting), other community-based testing.
• Cities and other administrative regions of epidemiologic importance

*/

library HIVIND19

using FHIR version '4.0.1'
 

include HIVIndicatorCommon version '0.0.1' called HIC
include FHIRHelpers version '4.0.1'
include WHOCommon called WCom
include FHIRCommon called FC

parameter "Measurement Period" Interval<Date> default Interval[@2020-01-01, @2020-01-31]
 
context Patient

//Exclusion happens automatically through test type valueset = excludes self test
define "numerator":
    exists(HIC."HIV Positive Condition" C
	where C.onset during "Measurement Period")
	or 
	exists(HIC."HIV Positive Observation" O
	where (O.issued before end of "Measurement Period"
	and O.issued after start of "Measurement Period")
	) 

define "denominator":
    exists(HIC."HIV test resulted" T
	where T.issued before end of "Measurement Period"
	and T.issued after start of "Measurement Period")

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

define "Setting":
    HIC."setting"

define "TB Stratifier":
    HIC."tb"


