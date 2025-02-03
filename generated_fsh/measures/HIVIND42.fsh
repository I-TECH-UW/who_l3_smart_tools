Instance: HIVIND42
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.42 Final outcome of PMTCT"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of HIV-exposed infants whose final HIV outcome status is known"
* url = "http://smart.who.int/hiv/Measure/HIVIND42"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND42"
* title = "HIV.IND.42 Final outcome of PMTCT"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND42Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.42.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.42.DEN"
    * description = "a) Programme-based/service delivery denominator | Number of HIV-exposed infants who were born within the 12 months (or 24 months in breastfeeding settings) prior to the reporting period and registered in the birth cohort | For example, for the reporting period January to December 2021 the denominator would be the number of HIV-exposed infants born between January to December 2020 in non-breast feeding settings and January to December 2019 in breastfeeding settings. |  | b) Population-based denominator | Estimated number of HIV-positive women who delivered within the past 12 months | (or 24 months in breastfeeding settings)"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.42.NUM"
    * description = "HIV-exposed infants born within the past 12 months (or 24 months in breastfeeding settings) who have known final HIV outcome status"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"