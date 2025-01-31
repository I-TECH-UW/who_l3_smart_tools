Instance: HIVIND16
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.16 VMMC adverse events"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "a) Number or (b) % of adverse events during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND16"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND16"
* title = "HIV.IND.16 VMMC adverse events"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND16Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.16.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.16.DEN"
    * description = "a) 1 | b) Total number of individuals under going VMMC performed according to national standard during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.16.NUM"
    * description = "Number of people experiencing at least one moderate or severe adverse event during or following circumcision surgery during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.16.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"