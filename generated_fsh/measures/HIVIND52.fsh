Instance: HIVIND52
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.52 TB treatment initiation among diagnosed"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV newly initiated on ART and diagnosed with active TB who initiated TB treatment"
* url = "http://smart.who.int/hiv/Measure/HIVIND52"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND52"
* title = "HIV.IND.52 TB treatment initiation among diagnosed"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND52Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.52.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.52.DEN"
    * description = "Number of people living with HIV newly initiated on ART who were diagnosed with active TB disease"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.52.NUM"
    * description = "Number of people living with HIV newly initiated on ART who were diagnosed with TB and who started treatment for active TB disease"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.52.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"