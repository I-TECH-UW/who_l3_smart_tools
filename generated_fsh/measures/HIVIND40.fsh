Instance: HIVIND40
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.40 ART coverage in pregnant women"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of HIV-positive pregnant women who received ART during pregnancy and/or at labour and delivery"
* url = "http://smart.who.int/hiv/Measure/HIVIND40"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND40"
* title = "HIV.IND.40 ART coverage in pregnant women"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND40Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.40.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.40.DEN"
    * description = "a) Programme-based/service delivery denominator | Number of HIV-positive pregnant women who delivered during the reporting period and attended ANC or had a facility-based delivery | b) Population-based denominator | Number of HIV-positive pregnant women who delivered during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.40.NUM"
    * description = "Number of HIV-positive pregnant women who delivered during the reporting period and received ART during pregnancy and/or at labour and delivery"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"