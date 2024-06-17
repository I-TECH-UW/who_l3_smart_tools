Instance: HIVIND20
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.20 Individuals testing positive for HIV"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% testing positive among people who received an HIV test in the reporting period"
* url = "http://smart.who.int/immunizations-measles/Measure/HIVIND20"
* status = #draft
* experimental = true
* date = "2024-06-14"
* name = "HIVIND20"
* title = "HIV.IND.20 Individuals testing positive for HIV"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/immunizations-measles/Library/HIVIND20Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.20.IP"
    * description = "Number in target group"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.20.DEN"
    * description = "Number of people receiving an HIV test in the reporting period"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.20.NUM"
    * description = "Number of people who test HIV-positive in the reporting period and have results returned to them*"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.20.S.AG"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Administrative Gender Stratifier"
  * stratifier[+]
    * id = "HIV.IND.20.S.A"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Age Stratifier"
  * stratifier[+]
    * id = "HIV.IND.20.S.GR"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Geographic Region Stratifier"
  * stratifier[+]
    * id = "HIV.IND.20.S.P"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "patientGroups Stratifier"