/*
 * Library: HIV.IND.3
 * PrEP coverage
 * % of people prescribed PrEP among those identified as being at elevated risk for HIV acquisition
 * 
 * Numerator: Count of clients with "Date medications prescribed" within reporting period AND "Medications prescribed"='PrEP for HIV prevention'
 * Numerator Exclusions: 
 * 
 * Denominator: Programme/service provider level: 
 * COUNT of clients with "HIV test date" within reporting period AND "HIV test result"='HIV-negative' AND "At elevated risk for HIV acquisition"=True †
 *
 * Disaggregation:
 * • Age (15–19, 20–24, 25–49, 50+ years)
 * • Gender (female, male, other*)
 * • Key populations (men who have sex with men, people living in prisons and other closed settings, people who inject drugs, sex workers, trans and gender diverse people)**
 * • PrEP product and formulation (oral, long-acting device, long-acting injectable). Some people may start, continue, stop and restart, one or multiple times with different products or formulations in a given reporting period. Because of this, the percentages of recipients receiving different PrEP products may total more than 100%.
 * • Experience with PrEP (first time, continuing, or restarting following a period of not
 * taking PrEP)
 * • Provider type (key population-led or community-led organization, public sector provider, other entities such as private for-profit and not-for-profit organizations, including faith- based, international, nongovernmental)
 * • Setting: facility-based service (including hospitals, health clinics, general practice offices, etc.) or community-based service (including drop-in centres, community service delivery points, mobile clinics or vans, outreach teams, community support groups, etc.)
 * • Cities and other administrative regions of epidemiologic importance"
 * 
 * If both "Date medications dispensed" and "Date medications prescribed" are both available, then use the data element which is most widely available.  
 * 
 * 
 * Reference: Consolidated guidelines on person-centred HIV strategic information: strengthening routine data for impact. Geneva: World Health Organization; 2022 
 */

library HIVIND3

using FHIR version '4.0.1'


include HIVIndicatorCommon version '0.0.1' called HIC
include FHIRHelpers version '4.0.1'
include WHOCommon called WCom
include FHIRCommon called FC

parameter "Measurement Period" Interval<Date> default Interval[@2020-01-01, @2020-01-31]

context Patient


define "numerator":
   exists(HIC."HIV PREP Active" H
   where H.effective starts before end of "Measurement Period"
    and (H.effective ends after start of "Measurement Period"
    or end of H.effective  ~  null)
   )

define "denominator":
	exists(HIC."HIV Negative Observation" O
	where (O.issued before end of "Measurement Period"
	and O.issued after start of "Measurement Period")
	) and 
    exists(HIC."Client is at elevated risk for HIV acquisition" O
	where O.issued before end of "Measurement Period"
	and O.issued after start of "Measurement Period")

    
/*
 * Disaggregators
 */

define "Administrative Gender Stratifier":
	HIC."By Administrative Gender Stratifier"

define "Age Stratifier":
	HIC."By Age Stratifier 3"

define "Geographic Region Stratifier":
	HIC."By Geographic Region Stratifier"

define "patientGroups Stratifier":
	HIC."patientGroups"

define "Setting":
    HIC."setting"

define "prep product":
    HIC."prep_product"

define "prep_experience":
    HIC."prep_experience"

define "prep_dosing":
    HIC."prep_dosing"

// Provider type concepts are not found in DD