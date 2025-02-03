Instance: HIVIND62
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.62 Syphilis test positivity, HIV prevention services"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people attending HIV prevention services who were tested for syphilis and had a positive syphilis test result during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND62"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND62"
* title = "HIV.IND.62 Syphilis test positivity, HIV prevention services"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND62Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.62.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.62.DEN"
    * description = "Number of people attending HIV prevention services tested for syphilis | "
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.62.NUM"
    * description = "Number of people attending HIV prevention services who tested positive for syphilis during the reporting period (tested positive on both nontreponemal and treponemal tests or tested positive on either nontreponemal or treponemal test) | "
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.62.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"