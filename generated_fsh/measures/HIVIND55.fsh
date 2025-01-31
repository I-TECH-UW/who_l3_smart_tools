Instance: HIVIND55
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.55 Coverage of DSD ART models among people living with HIV on ART"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV enrolled in DSD ART models among those eligible for DSD ART (for facilities with electronic HIS) or among people living with HIV On ART (facilities with paper-based systems) during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND55"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND55"
* title = "HIV.IND.55 Coverage of DSD ART models among people living with HIV on ART"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND55Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.55.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.55.DEN"
    * description = "Facilities with electronic health information systems: Number of people living with HIV on ART eligible for DSD ART models during the reporting period |  | Facilities with paper-based systems: Number of people living with HIV receiving ART at the end of the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.55.NUM"
    * description = "Number of people living with HIV enrolled in DSD ART models during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.55.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"