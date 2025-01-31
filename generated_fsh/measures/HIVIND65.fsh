Instance: HIVIND65
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.65 Syphilis test positivity, pregnant women, any visit"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of pregnant women who tested positive for syphilis during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND65"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND65"
* title = "HIV.IND.65 Syphilis test positivity, pregnant women, any visit"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND65Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.65.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.65.DEN"
    * description = "Number of pregnant women tested for syphilis while attending ANC services during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.65.NUM"
    * description = "Number of pregnant women who tested positive for syphilis during the reporting period (tested positive on both nontreponemal and treponemal tests or tested positive on either nontreponemal or treponemal test)"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"