Instance: HIVIND41
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.41 ART coverage in breastfeeding mothers"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of HIV-exposed breastfeeding infants whose mothers are receiving ART at 12 (and 24 months) postpartum"
* url = "http://smart.who.int/hiv/Measure/HIVIND41"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND41"
* title = "HIV.IND.41 ART coverage in breastfeeding mothers"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND41Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.41.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.41.DEN"
    * description = "Number of HIV-exposed infants attending MNCH services for a 12-month visit (and 24-month visit or first visit after the end of breastfeeding)"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.41.NUM"
    * description = "Number of HIV-exposed breastfeeding infants whose mothers are receiving ART at 12 months (and 24 months) postpartum"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"