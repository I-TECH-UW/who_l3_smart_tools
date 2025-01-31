Instance: HIVIND3
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.3 PrEP coverage"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people prescribed PrEP among those identified as being at elevated risk for HIV acquisition"
* url = "http://smart.who.int/hiv/Measure/HIVIND3"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND3"
* title = "HIV.IND.3 PrEP coverage"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND3Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.3.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.3.DEN"
    * description = "a) Programme/service provider level: number of individuals who received a negative HIV test during the reporting period and identified as being at elevated risk for HIV acquisition (includes people requesting/receiving any HIV prevention intervention, people from key populations, people with known risk factors or assessed as being at risk of HIV acquisition) |  | b) Population level: population-level estimate of the number of people who would benefit from PrEP, for example as derived from a PrEP need estimator tool"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.3.NUM"
    * description = "Number of unique individuals prescribed or dispensed any form of PrEP at least once during the reporting period. Individuals prescribed different products or regimens at different times during the reporting period should be counted only once."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.3.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"