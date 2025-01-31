Instance: HIVIND54
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.54 Uptake of DSD ART models among people living with HIV"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people newly enrolled in DSD ART models among those eligible"
* url = "http://smart.who.int/hiv/Measure/HIVIND54"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND54"
* title = "HIV.IND.54 Uptake of DSD ART models among people living with HIV"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND54Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.54.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.54.DEN"
    * description = "Number of people on ART newly eligible for DSD ART models during the reporting period. For facilities with electronic health information systems, it is possible to measure uptake as a proportion of all people living with HIV eligible for DSD. |  | No denominator for facilities with paper-based reporting systems"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.54.NUM"
    * description = "Number of people on ART newly enrolled in DSD ART models during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.54.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"