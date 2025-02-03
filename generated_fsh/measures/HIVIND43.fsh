Instance: HIVIND43
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.43 HIV prevalence among women attending ANC"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of pregnant women who are HIV-positive at the time of their first test during the current pregnancy"
* url = "http://smart.who.int/hiv/Measure/HIVIND43"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND43"
* title = "HIV.IND.43 HIV prevalence among women attending ANC"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND43Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.43.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.43.DEN"
    * description = "Number of ANC attendees receiving their first HIV test during pregnancy plus number of ANC attendees known to be HIV-positive before first ANC visit"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.43.NUM"
    * description = "Number of ANC attendees who tested HIV-positive at their first test during the current pregnancy plus number of ANC attendees known to be HIV-positive before their first ANC visit"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"