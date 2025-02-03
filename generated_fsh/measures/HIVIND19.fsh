Instance: HIVIND19
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.19 HTS test volume and positivity"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Number of HIV tests performed (volume) and the % of HIV-positive results returned to people (positivity)"
* url = "http://smart.who.int/hiv/Measure/HIVIND19"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND19"
* title = "HIV.IND.19 HTS test volume and positivity"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND19Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.19.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.19.DEN"
    * description = "Number of tests performed where results were returned to a person during the reporting period (testing volume)"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.19.NUM"
    * description = "Number of tests conducted in which a new HIV-positive result or diagnosis was returned to a person during the reporting period (positivity)"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.19.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"