Instance: HIVIND57
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.57 Viral suppression among people living with HIV engaged in DSD ART models"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV engaged in DSD ART models who have virological suppression"
* url = "http://smart.who.int/hiv/Measure/HIVIND57"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND57"
* title = "HIV.IND.57 Viral suppression among people living with HIV engaged in DSD ART models"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND57Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.57.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.57.DEN"
    * description = "Number of people enrolled in a DSD ART model with at least one routine viral load result in a medical or laboratory record during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.57.NUM"
    * description = "Number of people enrolled in a DSD ART model with at least one routine viral load test during the reporting period who have virological suppression (<1000 copies/mL) at 6 months after ART initiation and yearly thereafter (that is, at 24, 36, 48 and 60 months, etc. after ART initiation)."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.57.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"