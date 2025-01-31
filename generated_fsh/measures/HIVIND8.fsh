Instance: HIVIND8
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.8 NSP coverage"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people who inject drugs provided with needles-syringes during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND8"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND8"
* title = "HIV.IND.8 NSP coverage"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND8Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.8.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.8.DEN"
    * description = "a) Programme/service provider level: number of people who inject drugs who access the service | b) Population level: population size estimate of people who inject drugs in relevant geographic area"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.8.NUM"
    * description = "Number of people receiving needles-syringes during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.8.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"