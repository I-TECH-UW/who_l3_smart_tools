Instance: HIVIND2
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cv-measure-cqfm
Title: "HIV.IND.2 Total PrEP recipients"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Number of people who received PrEP at least once during the reporting period"
* url = "http://smart.who.int/HIV/Measure/HIVIND2"
* status = #draft
* experimental = true
* date = "2024-07-18"
* name = "HIVIND2"
* title = "HIV.IND.2 Total PrEP recipients"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/HIV/Library/HIVIND2Logic"
* scoring = $measure-scoring#continuous-variable "Continuous Variable"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.2.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[measurePopulation]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
    * id = "HIV.IND.2.MP"
    * description = "Measure Population"
    * code = $measure-population#measure-population "Measure Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Measure Population"
  * population[measureObservation]
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-criteriaReference].valueString = "measure-population"
    * extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-aggregateMethod].valueCode = #count
    * id = "HIV.IND.2.MO"
    * description = "Measure Observation"
    * code = $measure-population#measure-observation "Measure Observation"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Measure Observation"
  * stratifier[+]
    * id = "HIV.IND.2.S.AG"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Administrative Gender Stratifier"
  * stratifier[+]
    * id = "HIV.IND.2.S.A"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Age Stratifier"
  * stratifier[+]
    * id = "HIV.IND.2.S.GR"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Geographic Region Stratifier"
  * stratifier[+]
    * id = "HIV.IND.2.S.P"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "patientGroups Stratifier"