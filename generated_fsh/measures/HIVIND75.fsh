Instance: HIVIND75
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.75 Gonorrhoea treatment coverage, HIV-positive clients"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV tested positive for gonorrhoea who were treated based on national guidelines during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND75"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND75"
* title = "HIV.IND.75 Gonorrhoea treatment coverage, HIV-positive clients"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND75Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.75.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.75.DEN"
    * description = "Number of people living with HIV who tested positive for gonorrhoea during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.75.NUM"
    * description = "Number of people living with HIV who tested positive for gonorrhoea and were treated based on national guidelines during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"