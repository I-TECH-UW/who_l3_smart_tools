Instance: HIVIND14
InstanceOf: http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/proportion-measure-cqfm
Title: "HIV.IND.14 OAMT minimum dose"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"
* extension[http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis].valueCode = #boolean
* description = "% of OAMT recipients receiving a maintenance dose greater than or equal to the recommended minimum dose"
* url = "http://smart.who.int/hiv/Measure/HIVIND14"
* status = #draft
* experimental = true
* date = "2024-08-18"
* name = "HIVIND14"
* title = "HIV.IND.14 OAMT minimum dose"
* publisher = "World Health Organization (WHO)"
* library = "http://smart.who.int/hiv/Library/HIVIND14Logic"
* scoring = $measure-scoring#proportion "Proportion"
* group[+]
  * population[initialPopulation]
    * id = "HIV.IND.14.IP"
    * description = "Initial Population"
    * code = $measure-population#initial-population "Initial Population"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Initial Population"
  * population[denominator]
    * id = "HIV.IND.14.DEN"
    * description = "Number of people receiving maintenance dose of methadone or buprenorphine at a specified date, excluding: a) individuals currently being inducted on OAMT and yet to reach the maintenance dose and b) individuals on reducing doses of OAMT."
    * code = $measure-population#denominator "Denominator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Denominator"
  * population[numerator]
    * id = "HIV.IND.14.NUM"
    * description = "Number of people, at a specified date, maintained on methadone or buprenorphine receiving recommended minimum maintenance dose (WHO guidance recommends doses of ≥60 mg of methadone or ≥8 mg of buprenorphine)"
    * code = $measure-population#numerator "Numerator"
    * criteria.language = #text/cql-identifier
    * criteria.expression = "Numerator"