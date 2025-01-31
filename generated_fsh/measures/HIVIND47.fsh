Instance: HIVIND47
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.47 People living with HIV with active TB disease"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV newly initiated on ART who have active TB disease"
* url = "http://smart.who.int/hiv/Measure/HIVIND47"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND47"
* title = "HIV.IND.47 People living with HIV with active TB disease"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND47Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.47.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.47.DEN"
    * description = "Number of people living with HIV new on ART during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.47.NUM"
    * description = "Number of people living with HIV newly initiated on ART during the reporting period who have active TB disease. | 'Newly initiated on ART' is defined as the number of people living with HIV who start ART in accordance with national treatment guidelines during the reporting period."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.47.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"