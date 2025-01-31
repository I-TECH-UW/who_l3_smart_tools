Instance: HIVIND56
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.56 Retention in DSD ART models"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people retained in DSD ART models during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND56"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND56"
* title = "HIV.IND.56 Retention in DSD ART models"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND56Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.56.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.56.DEN"
    * description = "Number of people on ART enrolled in a DSD ART model 12 months ago, excluding individuals who transferred out (also 24, 36, 48, 60 months ago, etc.)"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.56.NUM"
    * description = "Number of people on ART known to be on treatment 12 months after enrolling in a DSD ART model (also at 24, 36, 48, 60 months, etc. after enrolment in the model)"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.56.S"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Stratification"