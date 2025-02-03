Instance: HIVIND92
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.92 HCV cured among people living with HIV"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of people living with HIV and co-infected with HCV who were confirmed to be cured of HCV during the reporting period"
* url = "http://smart.who.int/hiv/Measure/HIVIND92"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND92"
* title = "HIV.IND.92 HCV cured among people living with HIV"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND92Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.92.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.92.DEN"
    * description = "Number of people living with HIV and co-infected with HCV who completed HCV treatment and were assessed for sustained virological response"
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.92.NUM"
    * description = "Number of people living with HIV diagnosed with HCV infection who have completed HCV treatment and had a sustained virological response (SVR). SVR is assessed by a viral load measurement 12–24 weeks after the end of treatment."
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"