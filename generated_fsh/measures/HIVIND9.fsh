Instance: HIVIND9
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.9 Regular NSP access"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people who inject drugs accessing a needle-syringe programme (NSP) at least once per month during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND9"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND9"
* title = "HIV.IND.9 Regular NSP access"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND9Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.9.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.9.DEN"
    * description = "a) Programme/service provider level: number of people who inject drugs accessing service | b) Population level: population-size estimate of people who inject drugs in relevant geographic area"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.9.NUM"
    * description = "Total number of people receiving needles-syringes at least once per month during the reporting period, either: | a) number of people accessing an NSP at least once in each 30-day period of the reporting period | b) number of people accessing an NSP at least once per month on average during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"