Instance: HIVIND96
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.96 Cervical cancer survival"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Crude probability of surviving 1 year after a diagnosis of cervical cancer"
* url = "http://smart.who.int/hiv/Measure/HIVIND96"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND96"
* title = "HIV.IND.96 Cervical cancer survival"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND96Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.96.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.96.DEN"
    * description = "Number of women living with HIV who received a diagnosis of invasive cervical cancer within a 12-month cohort observation period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.96.NUM"
    * description = "Number of women living with HIV still alive 12 months after receiving a diagnosis of invasive cervical cancer"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"