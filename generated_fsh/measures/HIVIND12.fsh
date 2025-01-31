Instance: HIVIND12
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.12 Total person-years on OAMT"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of person-years of follow-up (PYFU) on OAMT among opioid dependent people"
* url = "http://smart.who.int/hiv/Measure/HIVIND12"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND12"
* title = "HIV.IND.12 Total person-years on OAMT"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND12Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.12.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.12.DEN"
    * description = "a) Programme/service provider level: estimated PYFU for all opioid dependent people accessing service during defined reporting period | b) Population level: estimated PYFU for total population of opioid dependent people in relevant geographic area during defined reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.12.NUM"
    * description = "Total PYFU on OAMT during defined reporting period. | Calculated from the sum of the time on OAMT of each OAMT recipient during the reporting period."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"