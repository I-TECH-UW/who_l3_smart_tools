Instance: HIVIND48
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.48 TB screening coverage among new ART patients"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV newly initiated on ART who were screened for TB"
* url = "http://smart.who.int/hiv/Measure/HIVIND48"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND48"
* title = "HIV.IND.48 TB screening coverage among new ART patients"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND48Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.48.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.48.DEN"
    * description = "Number of people living with HIV who newly initiated ART during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.48.NUM"
    * description = "Number of people living with HIV newly initiated on ART who were screened for TB during the reporting period |  | 'Newly initiated' is defined as the number of people living with HIV who start ART in accordance with national treatment guidelines during the reporting period."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.48.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"