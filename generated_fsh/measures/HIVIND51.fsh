Instance: HIVIND51
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.51 TB diagnosis among those tested for TB"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV newly initiated on ART and tested for TB who are diagnosed with active TB disease"
* url = "http://smart.who.int/hiv/Measure/HIVIND51"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND51"
* title = "HIV.IND.51 TB diagnosis among those tested for TB"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND51Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.51.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.51.DEN"
    * description = "Number of people living with HIV who newly initiated ART and screened positive for TB symptoms who had appropriate diagnostic testing during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.51.NUM"
    * description = "Number of people living with HIV newly initiated on ART who were diagnosed as having active TB disease"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.51.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"