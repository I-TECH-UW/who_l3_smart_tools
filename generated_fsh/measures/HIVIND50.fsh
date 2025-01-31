Instance: HIVIND50
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.50 TB testing among those symptom-screened positive"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV newly initiated on ART and screened positive for TB symptoms who then are tested for TB"
* url = "http://smart.who.int/hiv/Measure/HIVIND50"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND50"
* title = "HIV.IND.50 TB testing among those symptom-screened positive"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND50Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.50.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.50.DEN"
    * description = "Number of people living with HIV newly initiated on ART and screened positive for TB symptoms during the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.50.NUM"
    * description = "Number of people living with HIV newly initiated on ART who are investigated for active TB disease with appropriate diagnostic testing"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.50.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"