Instance: HIVIND38
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.38 Early infant diagnosis (EID) coverage"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of HIV-exposed infants who receive a virological test for HIV within two months (and 12 months) of birth"
* url = "http://smart.who.int/hiv/Measure/HIVIND38"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND38"
* title = "HIV.IND.38 Early infant diagnosis (EID) coverage"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND38Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.38.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.38.DEN"
    * description = "Estimated number of HIV-positive women who delivered during the reporting period.   |  | Note: The denominator is a proxy measure for the number of infants born to HIV-infected women."
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.38.NUM"
    * description = "Number of HIV-exposed infants born during the reporting period who received a virological HIV test within two months (and 12 months) of birth"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"
  * stratifier[+]
    * id = "HIV.IND.38.S.GR"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Geographic Region Stratifier"