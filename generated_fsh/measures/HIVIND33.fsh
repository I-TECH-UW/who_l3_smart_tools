Instance: HIVIND33
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.33 Early viral load testing (at six months)"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Number and % of people living with HIV on ART who had a viral load result reviewed by six months after initiation of ART"
* url = "http://smart.who.int/hiv/Measure/HIVIND33"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND33"
* title = "HIV.IND.33 Early viral load testing (at six months)"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND33Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.33.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.33.DEN"
    * description = "Number of people living with HIV on ART eligible for VL monitoring at six months after initiation of ART during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.33.NUM"
    * description = "Number of people living with HIV on ART who were eligible for VL monitoring at six months after initiation of ART during the reporting period and who had a VL test performed and result reviewed by six months after ART initiation"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.33.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"