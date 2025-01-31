Instance: HIVIND46
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.46 TB diagnostic testing type"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV with TB symptoms who receive a rapid molecular test, for example, Xpert MTB/RIF, as a first test for diagnosis of TB"
* url = "http://smart.who.int/hiv/Measure/HIVIND46"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND46"
* title = "HIV.IND.46 TB diagnostic testing type"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND46Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.46.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.46.DEN"
    * description = "Number of people living with HIV who are screened for TB and found to have symptoms during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.46.NUM"
    * description = "Number of people living with HIV and having TB symptoms who were tested using a rapid molecular test (for example, Xpert MTB/RIF) as a first test during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.46.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"