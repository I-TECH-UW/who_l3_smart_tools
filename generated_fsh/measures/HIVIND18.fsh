Instance: HIVIND18
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cv-measure-cqfm
Title: "HIV.IND.18 People living with HIV who know their HIV status (first 95)"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Number and % of people living with HIV who know their HIV status"
* url = "http://smart.who.int/hiv/Measure/HIVIND18"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND18"
* title = "HIV.IND.18 People living with HIV who know their HIV status (first 95)"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND18Logic"
* scoring = $measure-scoring#continuous-variable "Continuous Variable"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.18.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[measurePopulation]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
    * id = "HIV.IND.18.MP"
    * description = "Measure Population"
    * code = $measure-population#measure-population "Measure Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Measure Population"
  * population[measureObservation]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-criteriaReference].valueString = "measure-population"
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-aggregateMethod].valueCode = #count
    * id = "HIV.IND.18.MO"
    * description = "Measure Observation"
    * code = $measure-population#measure-observation "Measure Observation"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Measure Observation"
  * stratifier[+]
    * id = "HIV.IND.18.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"