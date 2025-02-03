Instance: HIVIND37
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.37 Viral suppression at labour and delivery"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of HIV-positive pregnant women who are virally suppressed at labour and delivery"
* url = "http://smart.who.int/hiv/Measure/HIVIND37"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND37"
* title = "HIV.IND.37 Viral suppression at labour and delivery"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND37Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.37.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.37.DEN"
    * description = "Number of HIV-positive pregnant women on ART during pregnancy who deliver at a facility during the reporting period and had a viral load test during delivery, or the estimated total number of pregnant women living with HIV"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.37.NUM"
    * description = "Number of HIV-positive pregnant women on ART during pregnancy and delivering at a facility during the reporting period who were virally suppressed (<1000 copies/mL) at delivery"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.37.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"