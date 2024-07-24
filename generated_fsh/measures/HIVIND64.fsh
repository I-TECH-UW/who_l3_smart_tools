Instance: HIVIND64
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.64 Syphilis test positivity, pregnant women, first visit"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of pregnant women who tested positive for syphilis during first ANC services visit in the reporting period"
* url = "http://smart.who.int/HIV/Measure/HIVIND64"
* status = #draft
* experimental = true
* date = "2024-07-22"
* name = "HIVIND64"
* title = "HIV.IND.64 Syphilis test positivity, pregnant women, first visit"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/HIV/Library/HIVIND64Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.64.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.64.DEN"
    * description = "Number of pregnant women tested for syphilis while attending first ANC services visit during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.64.NUM"
    * description = "Number of pregnant women who tested positive for syphilis on first ANC services visit during the reporting period (tested positive on both nontreponemal and treponemal tests or tested positive on either nontreponemal or treponemal test)"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"