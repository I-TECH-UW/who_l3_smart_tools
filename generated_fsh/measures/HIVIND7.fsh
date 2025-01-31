Instance: HIVIND7
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.7 HIV in PEP recipients"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of PEP recipients testing HIV-positive three months after PEP was prescribed"
* url = "http://smart.who.int/hiv/Measure/HIVIND7"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND7"
* title = "HIV.IND.7 HIV in PEP recipients"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND7Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.7.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.7.DEN"
    * description = "Number of people receiving PEP during the observation period. To allow for observation of a 3-month test result, the observation period must be set at least three months prior."
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.7.NUM"
    * description = "Number of people testing positive for HIV three months after receiving PEP during the reporting period"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.7.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"