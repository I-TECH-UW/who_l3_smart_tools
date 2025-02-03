Instance: HIVIND34
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.34 Appropriate second viral load test after adherence counselling"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV receiving ART with VL ≥1000 copies/mL who received a follow-up viral load test within three months"
* url = "http://smart.who.int/hiv/Measure/HIVIND34"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND34"
* title = "HIV.IND.34 Appropriate second viral load test after adherence counselling"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND34Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.34.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.34.DEN"
    * description = "Number of people living with HIV on ART with VL ≥1000 copies/mL during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.34.NUM"
    * description = "Number of people living with HIV on ART who received a follow-up VL test three months after a VL test result of ≥1000 copies/mL during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.34.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"