Instance: HIVIND30
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cv-measure-cqfm
Title: "HIV.IND.30 New ART patients"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Number of people living with HIV who initiated ART"
* url = "http://smart.who.int/hiv/Measure/HIVIND30"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND30"
* title = "HIV.IND.30 New ART patients"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND30Logic"
* scoring = $measure-scoring#continuous-variable "Continuous Variable"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.30.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[measurePopulation]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
    * id = "HIV.IND.30.MP"
    * description = "Measure Population"
    * code = $measure-population#measure-population "Measure Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Measure Population"
  * population[measureObservation]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-criteriaReference].valueString = "measure-population"
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-aggregateMethod].valueCode = #count
    * id = "HIV.IND.30.MO"
    * description = "Measure Observation"
    * code = $measure-population#measure-observation "Measure Observation"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Measure Observation"
  * stratifier[+]
    * id = "HIV.IND.30.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"