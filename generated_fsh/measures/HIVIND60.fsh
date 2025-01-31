Instance: HIVIND60
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.60 Syphilis testing coverage, pregnant women, first ANC visit"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of pregnant women who were tested for syphilis on first ANC services visit during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND60"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND60"
* title = "HIV.IND.60 Syphilis testing coverage, pregnant women, first ANC visit"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND60Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.60.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.60.DEN"
    * description = "Number of pregnant women attending first ANC services visit"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.60.NUM"
    * description = "Number of pregnant women tested for syphilis while attending their first ANC services visit"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.60.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"