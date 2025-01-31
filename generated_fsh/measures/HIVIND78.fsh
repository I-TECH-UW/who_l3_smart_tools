Instance: HIVIND78
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.78 Repeat diagnosis of STI syndrome, HIV prevention services"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people attending HIV prevention services diagnosed with a particular STI syndrome who were diagnosed with the same STI syndrome two or more times during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND78"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND78"
* title = "HIV.IND.78 Repeat diagnosis of STI syndrome, HIV prevention services"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND78Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.78.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.78.DEN"
    * description = "Number of people attending HIV prevention services diagnosed with a particular STI syndrome during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.78.NUM"
    * description = "Number of people attending HIV prevention services diagnosed with a particular STI syndrome two or more times during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"