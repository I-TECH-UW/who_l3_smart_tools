Instance: HIVIND39
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.39 Infant ARV prophylaxis coverage"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of HIV-exposed infants who initiated ARV prophylaxis"
* url = "http://smart.who.int/hiv/Measure/HIVIND39"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND39"
* title = "HIV.IND.39 Infant ARV prophylaxis coverage"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND39Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.39.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.39.DEN"
    * description = "a) Programme-based/service delivery denominator: Number of HIV-positive women who delivered in a facility within the past 12 months. |  | B) Population-based denominator: Number of HIV-positive women who delivered within the past 12 months."
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.39.NUM"
    * description = "Number of HIV-exposed infants born within the past 12 months who were started on ARV prophylaxis at birth"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"