Instance: HIVIND31
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.31 Late ART initiation"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV who initiate ART with a CD4 count of <200 cells/mm3"
* url = "http://smart.who.int/hiv/Measure/HIVIND31"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND31"
* title = "HIV.IND.31 Late ART initiation"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND31Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.31.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.31.DEN"
    * description = "Number of people living with HIV initiating ART during the reporting period who have a baseline CD4 cell count"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.31.NUM"
    * description = "Number of people living with HIV initiating ART during the reporting period with a baseline CD4 count of <200 cells/mm3"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.31.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"