Instance: HIVIND28
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.28 Total attrition from ART"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Number and % of people living with HIV on ART at the end of the last reporting period and those newly initiating ART during the current reporting period who were not on ART at the end of the current reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND28"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND28"
* title = "HIV.IND.28 Total attrition from ART"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND28Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.28.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.28.DEN"
    * description = "Number of people reported on ART at the end of the last reporting period | plus | those newly initiated on ART during the current reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.28.NUM"
    * description = "Number of people living with HIV reported on ART at the end of the last reporting period | plus | Number of people living with HIV newly initiated on ART during the current reporting period | minus | Total number of people living with HIV on ART at the end of the current reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.28.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"