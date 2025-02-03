Instance: HIVIND94
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.94 Pre-invasive cervical disease treatment"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of women living with HIV who screened positive for pre-invasive cervical disease and received treatment for it"
* url = "http://smart.who.int/hiv/Measure/HIVIND94"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND94"
* title = "HIV.IND.94 Pre-invasive cervical disease treatment"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND94Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.94.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.94.DEN"
    * description = "Number of women living with HIV who screened positive for pre-invasive cervical disease."
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.94.NUM"
    * description = "Number of women living with HIV who received treatment after screening positive for pre-invasive cervical disease and were deemed eligible for treatment in line with the WHO recommendations"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"