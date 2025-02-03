Instance: HIVIND24
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.24 HTS linkage to prevention"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Among those testing HIV-negative and identified as being at elevated risk for HIV acquisition, % of people who receive an HIV prevention intervention within defined period"
* url = "http://smart.who.int/hiv/Measure/HIVIND24"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND24"
* title = "HIV.IND.24 HTS linkage to prevention"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND24Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.24.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.24.DEN"
    * description = "Number of people testing negative for HIV in the reporting period and identified as being at elevated risk for HIV acquisition (includes people requesting/receiving any HIV prevention intervention, people from key populations, people with known risk factors or those assessed as being at risk of HIV acquisition)"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.24.NUM"
    * description = "Number of people who receive an HIV prevention intervention within a defined period after receiving a negative HIV test result"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.24.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"