Instance: HIVIND29
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.29 People living with HIV on ART who have suppressed viral load"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV on ART (for at least six months) who have virological suppression"
* url = "http://smart.who.int/hiv/Measure/HIVIND29"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND29"
* title = "HIV.IND.29 People living with HIV on ART who have suppressed viral load"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND29Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.29.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.29.DEN"
    * description = "Number of people living with HIV on ART at least six months with at least one routine VL result in a medical or laboratory record during the reporting period, to monitor progress towards the third 95 target |  | In addition, this can also be presented as the number with suppressed VL among all people living with HIV to calculate population-level viral suppression."
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.29.NUM"
    * description = "Number of people living with HIV on ART for at least six months and with at least one routine VL test result who have virological suppression (<1000 copies/mL) during the reporting period."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.29.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"