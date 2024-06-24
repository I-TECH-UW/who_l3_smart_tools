Instance: HIVIND27
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.27 People living with HIV on ART"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "Number and % of people on ART among all people living with HIV at the end of the reporting period"
* url = "http://smart.who.int/immunizations-measles/Measure/HIVIND27"
* status = #draft
* experimental = true
* date = "2024-06-14"
* name = "HIVIND27"
* title = "HIV.IND.27 People living with HIV on ART"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/immunizations-measles/Library/HIVIND27Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[denominator]
    * id = "HIV.IND.27.DEN"
    * description = "1. To determine treatment coverage: estimated number of people living with HIV (from models, such as Spectrum AIM)
2. To gauge progress toward the second 95 target: number of people living with HIV who know their HIV status (from surveys or models)"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.27.NUM"
    * description = "Number of people on ART at the end of the reporting period (HIV patient monitoring data from, for example, ART registers, patient records or EMRs). For key populations survey data may be required."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.27.S.AG"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Administrative Gender Stratifier"
  * stratifier[+]
    * id = "HIV.IND.27.S.A"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Age Stratifier"
  * stratifier[+]
    * id = "HIV.IND.27.S.GR"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Geographic Region Stratifier"
  * stratifier[+]
    * id = "HIV.IND.27.S.P"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "patientGroups Stratifier"
