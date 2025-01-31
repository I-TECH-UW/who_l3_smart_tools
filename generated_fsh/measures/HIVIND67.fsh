Instance: HIVIND67
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.67 Syphilis treatment coverage, HIV-positive clients"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV tested positive for syphilis who were treated based on national guidelines during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND67"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND67"
* title = "HIV.IND.67 Syphilis treatment coverage, HIV-positive clients"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND67Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.67.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.67.DEN"
    * description = "Number of people living with HIV who tested positive for syphilis during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.67.NUM"
    * description = "Number of people living with HIV who tested positive for syphilis and were treated based on national guidelines during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"