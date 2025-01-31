Instance: HIVIND84
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.84 HCV test coverage, HIV-positive clients"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV who were tested for HCV (HCV antibody, HCV RNA or HCV core antigen) during the reporting period (laboratory-based test or rapid test)"
* url = "http://smart.who.int/hiv/Measure/HIVIND84"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND84"
* title = "HIV.IND.84 HCV test coverage, HIV-positive clients"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND84Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.84.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.84.DEN"
    * description = "Number of people living with HIV attending HIV care and treatment services during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.84.NUM"
    * description = "Number of people living with HIV tested for HCV (HCV antibody, HCV RNA or HCV core antigen) during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"