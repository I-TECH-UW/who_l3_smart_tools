Instance: HIVIND25
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.25 HIV retesting coverage"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people testing HIV-negative who tested again within a defined period of time after their previous test"
* url = "http://smart.who.int/hiv/Measure/HIVIND25"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND25"
* title = "HIV.IND.25 HIV retesting coverage"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND25Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.25.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.25.DEN"
    * description = "Number of people assessed as being at elevated risk for HIV acquisition (includes people requesting/receiving any HIV prevention intervention, people from key populations, people with known risk factors or those assessed as being at risk of HIV acquisition) who received an HIV-negative test result in the reporting period."
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.25.NUM"
    * description = "Number of individuals who tested HIV-negative assessed to be at elevated risk for HIV acquisition who had another HIV test within a defined period after previous test."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.25.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"