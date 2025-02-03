Instance: HIVIND53
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.53 Multi-month ARV dispensing"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV and On ART who are receiving multi-month dispensing of ARV medicine during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND53"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND53"
* title = "HIV.IND.53 Multi-month ARV dispensing"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND53Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.53.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.53.DEN"
    * description = "Number of people living with HIV and On ART"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.53.NUM"
    * description = "Number of people living with HIV and On ART who received 3-5 or >6 months of ARV medicine at their most recent ARV medicine pick-up. |  | (The number receiving <3 months of ARV supply is also collected, for validation purposes.) |  | If countries cannot report on the number of months of ARV medicine dispensed by the disaggregations described above, they could, as an alternative, report the total number of people currently on ARV therapy and receiving ≥3 months of ARV medicine at their last medicine pick-up."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.53.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"