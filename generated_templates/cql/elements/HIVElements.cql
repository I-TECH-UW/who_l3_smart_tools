library HIVElements

using FHIR version '4.0.1'

include fhir.cqf.common.FHIRHelpers called FH
include fhir.cqf.common.FHIRCommon called FC

include WHOConcepts
include WHOCommon called WC
include WHOElements called WE

include HIVConcepts called Concepts
include HIVCommon called Common

context Patient

/**
 * HIV Elements
 */

// Auto-generated Elements from DAK Data Dictionary
//   Entries based on DAK Data Dictionary for Data Elements marked as used
//   in at least one Decision Support Table or Aggregate Indicator

/*
@dataElement: HIV.A.DE3 - Visit date - HIV.A.DE3
@activity: HIV.A2 Gather client details
@description: The date and time of the client's visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Visit date - HIV.A.DE3":
  [Observation: Concepts."Visit date - HIV.A.DE3"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Visit date - HIV.A.DE3 */

/*
@dataElement: HIV.A.DE16 - Estimated age
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: If DOB is unknown, enter the client's estimated age. Display client's age in number of years.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Estimated age":
  [Observation: Concepts."Estimated age"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Estimated age */

/*
@dataElement: HIV.A.DE17 - Age
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: Calculated age (number of years) of the client based on date of birth
*/
// TODO: Replace placeholder with relevant CQL logic
define "Age":
  [Observation: Concepts."Age"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Age */

/*
@dataElement: HIV.A.DE18 - Gender*
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: Gender of the client*
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gender* Observation":
  [Observation: Concepts."Gender*"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Gender* */

/*
@dataElement: HIV.A.DE19 - Female
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: Client identifies as female
*/
// TODO: Replace placeholder with relevant CQL logic
define "Female":
  exists "Female Condition"
    or exists "Female Observation"
define "Female Condition":
  [Condition: Concepts."Female"]
define "Female Observation":
  [Observation: Concepts."Female"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Female"
/* End of Female */

/*
@dataElement: HIV.A.DE20 - Male
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: Client identifies as male
*/
// TODO: Replace placeholder with relevant CQL logic
define "Male":
  exists "Male Condition"
    or exists "Male Observation"
define "Male Condition":
  [Condition: Concepts."Male"]
define "Male Observation":
  [Observation: Concepts."Male"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Male"
/* End of Male */

/*
@dataElement: HIV.A.DE21 - Transgender male
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: Client identifies as transgender male
*/
// TODO: Replace placeholder with relevant CQL logic
define "Transgender male":
  exists "Transgender male Condition"
    or exists "Transgender male Observation"
define "Transgender male Condition":
  [Condition: Concepts."Transgender male"]
define "Transgender male Observation":
  [Observation: Concepts."Transgender male"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Transgender male"
/* End of Transgender male */

/*
@dataElement: HIV.A.DE22 - Transgender female
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: Client identifies as transgender female
*/
// TODO: Replace placeholder with relevant CQL logic
define "Transgender female":
  exists "Transgender female Condition"
    or exists "Transgender female Observation"
define "Transgender female Condition":
  [Condition: Concepts."Transgender female"]
define "Transgender female Observation":
  [Observation: Concepts."Transgender female"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Transgender female"
/* End of Transgender female */

/*
@dataElement: HIV.A.DE23 - Other - HIV.A.DE23
@activity: HIV.A6.1 Review sociodemographic data with client | HIV.A5 Create new client record
@description: Additional category
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.A.DE23":
  exists "Other - HIV.A.DE23 Condition"
    or exists "Other - HIV.A.DE23 Observation"
define "Other - HIV.A.DE23 Condition":
  [Condition: Concepts."Other - HIV.A.DE23"]
define "Other - HIV.A.DE23 Observation":
  [Observation: Concepts."Other - HIV.A.DE18"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.A.DE23"
/* End of Other - HIV.A.DE23 */

/*
@dataElement: HIV.B.DE1 - Reason for visit - HIV.B.DE1
@activity: HIV.B1 Determine reason for visit
@description: Reason for HIV testing services visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reason for visit - HIV.B.DE1 Observation":
  [Observation: Concepts."Reason for visit - HIV.B.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Reason for visit - HIV.B.DE1 */

/*
@dataElement: HIV.B.DE2 - First-time HIV test
@activity: HIV.B1 Determine reason for visit
@description: First encounter for screening for human immunodeficiency virus
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-time HIV test":
  exists "First-time HIV test Condition"
    or exists "First-time HIV test Observation"
define "First-time HIV test Condition":
  [Condition: Concepts."First-time HIV test"]
define "First-time HIV test Observation":
  [Observation: Concepts."First-time HIV test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First-time HIV test"
/* End of First-time HIV test */

/*
@dataElement: HIV.B.DE3 - Retesting for HIV - HIV.B.DE3
@activity: HIV.B1 Determine reason for visit
@description: Retesting for human immunodeficiency virus
*/
// TODO: Replace placeholder with relevant CQL logic
define "Retesting for HIV - HIV.B.DE3":
  exists "Retesting for HIV - HIV.B.DE3 Condition"
    or exists "Retesting for HIV - HIV.B.DE3 Observation"
define "Retesting for HIV - HIV.B.DE3 Condition":
  [Condition: Concepts."Retesting for HIV - HIV.B.DE3"]
define "Retesting for HIV - HIV.B.DE3 Observation":
  [Observation: Concepts."Retesting for HIV - HIV.B.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Retesting for HIV - HIV.B.DE3"
/* End of Retesting for HIV - HIV.B.DE3 */

/*
@dataElement: HIV.B.DE4 - HIV testing services visit
@activity: HIV.B1 Determine reason for visit
@description: Client attending facility for HIV testing services visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV testing services visit":
  exists "HIV testing services visit Condition"
    or exists "HIV testing services visit Observation"
define "HIV testing services visit Condition":
  [Condition: Concepts."HIV testing services visit"]
define "HIV testing services visit Observation":
  [Observation: Concepts."HIV testing services visit"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV testing services visit"
/* End of HIV testing services visit */

/*
@dataElement: HIV.B.DE5 - Referred through partner services
@activity: HIV.B1 Determine reason for visit
@description: Client reported coming to the facility after receiving a provider-assisted referral or patient referral from a contact or partner
*/
// TODO: Replace placeholder with relevant CQL logic
define "Referred through partner services Observation":
  [Observation: Concepts."Referred through partner services"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Referred through partner services */

/*
@dataElement: HIV.B.DE6 - Partner or contact of an index case
@activity: HIV.B1 Determine reason for visit
@description: The client is a contact or partner of a person diagnosed with HIV (an index case)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Partner or contact of an index case":
  exists "Partner or contact of an index case Condition"
    or exists "Partner or contact of an index case Observation"
define "Partner or contact of an index case Condition":
  [Condition: Concepts."Partner or contact of an index case"]
define "Partner or contact of an index case Observation":
  [Observation: Concepts."Partner or contact of an index case"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Partner or contact of an index case"
/* End of Partner or contact of an index case */

/*
@dataElement: HIV.B.DE7 - Partner or contact of an HIV testing client non-index case
@activity: HIV.B1 Determine reason for visit
@description: The client is a contact or partner identified through partner or social network services, but is not known to be a partner of an index-case
*/
// TODO: Replace placeholder with relevant CQL logic
define "Partner or contact of an HIV testing client non-index case":
  exists "Partner or contact of an HIV testing client non-index case Condition"
    or exists "Partner or contact of an HIV testing client non-index case Observation"
define "Partner or contact of an HIV testing client non-index case Condition":
  [Condition: Concepts."Partner or contact of an HIV testing client non-index case"]
define "Partner or contact of an HIV testing client non-index case Observation":
  [Observation: Concepts."Partner or contact of an HIV testing client non-index case"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Partner or contact of an HIV testing client non-index case"
/* End of Partner or contact of an HIV testing client non-index case */

/*
@dataElement: HIV.B.DE8 - Type of contact or partner for partner services
@activity: HIV.B1 Determine reason for visit
@description: Client's relationship to the person that referred the client for partner services or family services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of contact or partner for partner services Observation":
  [Observation: Concepts."Type of contact or partner for partner services"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of contact or partner for partner services */

/*
@dataElement: HIV.B.DE9 - Biological child
@activity: HIV.B1 Determine reason for visit
@description: Client is the biological child of the person that referred the client for family services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Biological child":
  exists "Biological child Condition"
    or exists "Biological child Observation"
define "Biological child Condition":
  [Condition: Concepts."Biological child"]
define "Biological child Observation":
  [Observation: Concepts."Biological child"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Biological child"
/* End of Biological child */

/*
@dataElement: HIV.B.DE10 - Drug-injecting partner - HIV.B.DE10
@activity: HIV.B1 Determine reason for visit
@description: Client is a drug-injecting partner of the person that referred the client for partner services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Drug-injecting partner - HIV.B.DE10":
  exists "Drug-injecting partner - HIV.B.DE10 Condition"
    or exists "Drug-injecting partner - HIV.B.DE10 Observation"
define "Drug-injecting partner - HIV.B.DE10 Condition":
  [Condition: Concepts."Drug-injecting partner - HIV.B.DE10"]
define "Drug-injecting partner - HIV.B.DE10 Observation":
  [Observation: Concepts."Drug-injecting partner - HIV.B.DE8"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Drug-injecting partner - HIV.B.DE10"
/* End of Drug-injecting partner - HIV.B.DE10 */

/*
@dataElement: HIV.B.DE11 - Sexual partner - HIV.B.DE11
@activity: HIV.B1 Determine reason for visit
@description: Client is a sexual partner of the person that referred the client for partner services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sexual partner - HIV.B.DE11":
  exists "Sexual partner - HIV.B.DE11 Condition"
    or exists "Sexual partner - HIV.B.DE11 Observation"
define "Sexual partner - HIV.B.DE11 Condition":
  [Condition: Concepts."Sexual partner - HIV.B.DE11"]
define "Sexual partner - HIV.B.DE11 Observation":
  [Observation: Concepts."Sexual partner - HIV.B.DE8"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sexual partner - HIV.B.DE11"
/* End of Sexual partner - HIV.B.DE11 */

/*
@dataElement: HIV.B.DE12 - Social contact - HIV.B.DE12
@activity: HIV.B1 Determine reason for visit
@description: Client is a social contact of the person that referred the client for social-network services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Social contact - HIV.B.DE12":
  exists "Social contact - HIV.B.DE12 Condition"
    or exists "Social contact - HIV.B.DE12 Observation"
define "Social contact - HIV.B.DE12 Condition":
  [Condition: Concepts."Social contact - HIV.B.DE12"]
define "Social contact - HIV.B.DE12 Observation":
  [Observation: Concepts."Social contact - HIV.B.DE8"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Social contact - HIV.B.DE12"
/* End of Social contact - HIV.B.DE12 */

/*
@dataElement: HIV.B.DE14 - Date/time of suspected exposure to HIV - HIV.B.DE14
@activity: HIV.B1 Determine reason for visit
@description: Date and time when the client had suspected exposure to HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date/time of suspected exposure to HIV - HIV.B.DE14":
  [Observation: Concepts."Date/time of suspected exposure to HIV - HIV.B.DE14"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date/time of suspected exposure to HIV - HIV.B.DE14 */

/*
@dataElement: HIV.B.DE15 - Testing entry point
@activity: HIV.B1 Determine reason for visit
@description: Whether testing is happening in the community or at a facility
*/
// TODO: Replace placeholder with relevant CQL logic
define "Testing entry point Observation":
  [Observation: Concepts."Testing entry point"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Testing entry point */

/*
@dataElement: HIV.B.DE16 - Community-level testing
@activity: HIV.B1 Determine reason for visit
@description: Testing is happening in the community, which includes mobile testing
*/
// TODO: Replace placeholder with relevant CQL logic
define "Community-level testing":
  exists "Community-level testing Condition"
    or exists "Community-level testing Observation"
define "Community-level testing Condition":
  [Condition: Concepts."Community-level testing"]
define "Community-level testing Observation":
  [Observation: Concepts."Community-level testing"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Community-level testing"
/* End of Community-level testing */

/*
@dataElement: HIV.B.DE17 - Facility-level testing
@activity: HIV.B1 Determine reason for visit
@description: Testing is happening at a facility
*/
// TODO: Replace placeholder with relevant CQL logic
define "Facility-level testing":
  exists "Facility-level testing Condition"
    or exists "Facility-level testing Observation"
define "Facility-level testing Condition":
  [Condition: Concepts."Facility-level testing"]
define "Facility-level testing Observation":
  [Observation: Concepts."Facility-level testing"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Facility-level testing"
/* End of Facility-level testing */

/*
@dataElement: HIV.B.DE29 - Currently pregnant - HIV.B.DE29
@activity: HIV.B6 Capture or update client history
@description: Client is currently pregnant
*/
// TODO: Replace placeholder with relevant CQL logic
define "Currently pregnant - HIV.B.DE29":
  [Observation: Concepts."Currently pregnant - HIV.B.DE29"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Currently pregnant - HIV.B.DE29 */

/*
@dataElement: HIV.B.DE32 - Breastfeeding - HIV.B.DE32
@activity: HIV.B6 Capture or update client history
@description: Infant is being breastfed by mother
*/
// TODO: Replace placeholder with relevant CQL logic
define "Breastfeeding - HIV.B.DE32":
  [Observation: Concepts."Breastfeeding - HIV.B.DE32"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Breastfeeding - HIV.B.DE32 */

/*
@dataElement: HIV.B.DE33 - Partner HIV status reported
@activity: HIV.B6 Capture or update client history
@description: The HIV status of the client's partner.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Partner HIV status reported Observation":
  [Observation: Concepts."Partner HIV status reported"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Partner HIV status reported */

/*
@dataElement: HIV.B.DE34 - HIV-positive - HIV.B.DE34
@activity: HIV.B6 Capture or update client history
@description: Client's partner is HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive - HIV.B.DE34":
  exists "HIV-positive - HIV.B.DE34 Condition"
    or exists "HIV-positive - HIV.B.DE34 Observation"
define "HIV-positive - HIV.B.DE34 Condition":
  [Condition: Concepts."HIV-positive - HIV.B.DE34"]
define "HIV-positive - HIV.B.DE34 Observation":
  [Observation: Concepts."HIV-positive - HIV.B.DE33"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive - HIV.B.DE34"
/* End of HIV-positive - HIV.B.DE34 */

/*
@dataElement: HIV.B.DE35 - HIV-negative - HIV.B.DE35
@activity: HIV.B6 Capture or update client history
@description: Client's partner is HIV-negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-negative - HIV.B.DE35":
  exists "HIV-negative - HIV.B.DE35 Condition"
    or exists "HIV-negative - HIV.B.DE35 Observation"
define "HIV-negative - HIV.B.DE35 Condition":
  [Condition: Concepts."HIV-negative - HIV.B.DE35"]
define "HIV-negative - HIV.B.DE35 Observation":
  [Observation: Concepts."HIV-negative - HIV.B.DE33"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-negative - HIV.B.DE35"
/* End of HIV-negative - HIV.B.DE35 */

/*
@dataElement: HIV.B.DE36 - Unknown - HIV.B.DE36
@activity: HIV.B6 Capture or update client history
@description: Don't know HIV status - client does not know partner's HIV status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unknown - HIV.B.DE36":
  exists "Unknown - HIV.B.DE36 Condition"
    or exists "Unknown - HIV.B.DE36 Observation"
define "Unknown - HIV.B.DE36 Condition":
  [Condition: Concepts."Unknown - HIV.B.DE36"]
define "Unknown - HIV.B.DE36 Observation":
  [Observation: Concepts."Unknown - HIV.B.DE33"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unknown - HIV.B.DE36"
/* End of Unknown - HIV.B.DE36 */

/*
@dataElement: HIV.B.DE49 - Key population member* - HIV.B.DE49
@activity: HIV.B6 Capture or update client history
@description: Client is a member of a key population that has an increased risk of HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Key population member* - HIV.B.DE49":
  [Observation: Concepts."Key population member* - HIV.B.DE49"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Key population member* - HIV.B.DE49 */

/*
@dataElement: HIV.B.DE50 - Key population member type* - HIV.B.DE50
@activity: HIV.B6 Capture or update client history
@description: The type of key population that the client is included in
*/
// TODO: Replace placeholder with relevant CQL logic
define "Key population member type* - HIV.B.DE50 Observation":
  [Observation: Concepts."Key population member type* - HIV.B.DE50"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Key population member type* - HIV.B.DE50 */

/*
@dataElement: HIV.B.DE51 - Sex worker - HIV.B.DE51
@activity: HIV.B6 Capture or update client history
@description: Client is a sex worker
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sex worker - HIV.B.DE51":
  exists "Sex worker - HIV.B.DE51 Condition"
    or exists "Sex worker - HIV.B.DE51 Observation"
define "Sex worker - HIV.B.DE51 Condition":
  [Condition: Concepts."Sex worker - HIV.B.DE51"]
define "Sex worker - HIV.B.DE51 Observation":
  [Observation: Concepts."Sex worker - HIV.B.DE50"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sex worker - HIV.B.DE51"
/* End of Sex worker - HIV.B.DE51 */

/*
@dataElement: HIV.B.DE52 - Men who have sex with men
@activity: HIV.B6 Capture or update client history
@description: Client is a man who has sex with men
*/
// TODO: Replace placeholder with relevant CQL logic
define "Men who have sex with men":
  exists "Men who have sex with men Condition"
    or exists "Men who have sex with men Observation"
define "Men who have sex with men Condition":
  [Condition: Concepts."Men who have sex with men"]
define "Men who have sex with men Observation":
  [Observation: Concepts."Men who have sex with men"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Men who have sex with men"
/* End of Men who have sex with men */

/*
@dataElement: HIV.B.DE53 - Trans and gender-diverse people - HIV.B.DE53
@activity: HIV.B6 Capture or update client history
@description: Client identifies as trans and gender-diverse
*/
// TODO: Replace placeholder with relevant CQL logic
define "Trans and gender-diverse people - HIV.B.DE53":
  exists "Trans and gender-diverse people - HIV.B.DE53 Condition"
    or exists "Trans and gender-diverse people - HIV.B.DE53 Observation"
define "Trans and gender-diverse people - HIV.B.DE53 Condition":
  [Condition: Concepts."Trans and gender-diverse people - HIV.B.DE53"]
define "Trans and gender-diverse people - HIV.B.DE53 Observation":
  [Observation: Concepts."Trans and gender-diverse people - HIV.B.DE50"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Trans and gender-diverse people - HIV.B.DE53"
/* End of Trans and gender-diverse people - HIV.B.DE53 */

/*
@dataElement: HIV.B.DE54 - People who inject drugs - HIV.B.DE54
@activity: HIV.B6 Capture or update client history
@description: Client is a person who injects drugs
*/
// TODO: Replace placeholder with relevant CQL logic
define "People who inject drugs - HIV.B.DE54":
  exists "People who inject drugs - HIV.B.DE54 Condition"
    or exists "People who inject drugs - HIV.B.DE54 Observation"
define "People who inject drugs - HIV.B.DE54 Condition":
  [Condition: Concepts."People who inject drugs - HIV.B.DE54"]
define "People who inject drugs - HIV.B.DE54 Observation":
  [Observation: Concepts."People who inject drugs - HIV.B.DE50"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."People who inject drugs - HIV.B.DE54"
/* End of People who inject drugs - HIV.B.DE54 */

/*
@dataElement: HIV.B.DE55 - People living in prisons and other closed settings
@activity: HIV.B6 Capture or update client history
@description: Client lives in a prison or another closed setting
*/
// TODO: Replace placeholder with relevant CQL logic
define "People living in prisons and other closed settings":
  exists "People living in prisons and other closed settings Condition"
    or exists "People living in prisons and other closed settings Observation"
define "People living in prisons and other closed settings Condition":
  [Condition: Concepts."People living in prisons and other closed settings"]
define "People living in prisons and other closed settings Observation":
  [Observation: Concepts."People living in prisons and other closed settings"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."People living in prisons and other closed settings"
/* End of People living in prisons and other closed settings */

/*
@dataElement: HIV.B.DE60 - Date HIV test results returned
@activity: HIV.B6 Capture or update client history
@description: Date HIV test result returned to client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date HIV test results returned":
  [Observation: Concepts."Date HIV test results returned"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date HIV test results returned */

/*
@dataElement: HIV.B.DE61 - HIV exposure type*
@activity: HIV.B6 Capture or update client history
@description: Ways in which the client was exposed to HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV exposure type* Observation":
  [Observation: Concepts."HIV exposure type*"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV exposure type* */

/*
@dataElement: HIV.B.DE62 - Occupational
@activity: HIV.B6 Capture or update client history
@description: Occupational exposure to HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Occupational":
  exists "Occupational Condition"
    or exists "Occupational Observation"
define "Occupational Condition":
  [Condition: Concepts."Occupational"]
define "Occupational Observation":
  [Observation: Concepts."Occupational"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Occupational"
/* End of Occupational */

/*
@dataElement: HIV.B.DE63 - Non-occupational violent
@activity: HIV.B6 Capture or update client history
@description: Non-occupational violent exposure to HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-occupational violent":
  exists "Non-occupational violent Condition"
    or exists "Non-occupational violent Observation"
define "Non-occupational violent Condition":
  [Condition: Concepts."Non-occupational violent"]
define "Non-occupational violent Observation":
  [Observation: Concepts."Non-occupational violent"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-occupational violent"
/* End of Non-occupational violent */

/*
@dataElement: HIV.B.DE64 - Non-occupational consensual sex
@activity: HIV.B6 Capture or update client history
@description: Exposure to HIV through non-occupational consensual sex
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-occupational consensual sex":
  exists "Non-occupational consensual sex Condition"
    or exists "Non-occupational consensual sex Observation"
define "Non-occupational consensual sex Condition":
  [Condition: Concepts."Non-occupational consensual sex"]
define "Non-occupational consensual sex Observation":
  [Observation: Concepts."Non-occupational consensual sex"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-occupational consensual sex"
/* End of Non-occupational consensual sex */

/*
@dataElement: HIV.B.DE65 - Date informed of HIV-positive diagnosis
@activity: HIV.B6 Capture or update client history
@description: The date on which the client was diagnosed with HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date informed of HIV-positive diagnosis":
  [Observation: Concepts."Date informed of HIV-positive diagnosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date informed of HIV-positive diagnosis */

/*
@dataElement: HIV.B.DE71 - HIV diagnosis date
@activity: HIV.B8 Provide post-test counselling
@description: Date diagnosis was returned to client
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV diagnosis date":
  [Observation: Concepts."HIV diagnosis date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV diagnosis date */

/*
@dataElement: HIV.B.DE72 - ART start date - HIV.B.DE72
@activity: HIV.B8 Provide post-test counselling
@description: The date on which the client started or restarted antiretroviral therapy (ART)
*/
// TODO: Replace placeholder with relevant CQL logic
define "ART start date - HIV.B.DE72":
  [Observation: Concepts."ART start date - HIV.B.DE72"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of ART start date - HIV.B.DE72 */

/*
@dataElement: HIV.B.DE80 - HIV test conducted
@activity: HIV.B7 Test for HIV using testing algorithm
@description: An HIV test was performed on the client during the visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test conducted":
  [Observation: Concepts."HIV test conducted"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV test conducted */

/*
@dataElement: HIV.B.DE81 - HIV test type - HIV.B.DE81
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Type of HIV test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test type - HIV.B.DE81 Observation":
  [Observation: Concepts."HIV test type - HIV.B.DE81"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV test type - HIV.B.DE81 */

/*
@dataElement: HIV.B.DE82 - Rapid diagnostic test for HIV - HIV.B.DE82
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Antibody test for HIV performed with a rapid diagnostic
*/
// TODO: Replace placeholder with relevant CQL logic
define "Rapid diagnostic test for HIV - HIV.B.DE82":
  exists "Rapid diagnostic test for HIV - HIV.B.DE82 Condition"
    or exists "Rapid diagnostic test for HIV - HIV.B.DE82 Observation"
define "Rapid diagnostic test for HIV - HIV.B.DE82 Condition":
  [Condition: Concepts."Rapid diagnostic test for HIV - HIV.B.DE82"]
define "Rapid diagnostic test for HIV - HIV.B.DE82 Observation":
  [Observation: Concepts."Rapid diagnostic test for HIV - HIV.B.DE81"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Rapid diagnostic test for HIV - HIV.B.DE82"
/* End of Rapid diagnostic test for HIV - HIV.B.DE82 */

/*
@dataElement: HIV.B.DE83 - Enzyme immunoassay for HIV - HIV.B.DE83
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Antibody test for HIV performed with an enzyme immunoassay
*/
// TODO: Replace placeholder with relevant CQL logic
define "Enzyme immunoassay for HIV - HIV.B.DE83":
  exists "Enzyme immunoassay for HIV - HIV.B.DE83 Condition"
    or exists "Enzyme immunoassay for HIV - HIV.B.DE83 Observation"
define "Enzyme immunoassay for HIV - HIV.B.DE83 Condition":
  [Condition: Concepts."Enzyme immunoassay for HIV - HIV.B.DE83"]
define "Enzyme immunoassay for HIV - HIV.B.DE83 Observation":
  [Observation: Concepts."Enzyme immunoassay for HIV - HIV.B.DE81"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Enzyme immunoassay for HIV - HIV.B.DE83"
/* End of Enzyme immunoassay for HIV - HIV.B.DE83 */

/*
@dataElement: HIV.B.DE84 - Nucleic acid test for HIV - HIV.B.DE84
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Virological test, which includes testing for early infant diagnosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Nucleic acid test for HIV - HIV.B.DE84":
  exists "Nucleic acid test for HIV - HIV.B.DE84 Condition"
    or exists "Nucleic acid test for HIV - HIV.B.DE84 Observation"
define "Nucleic acid test for HIV - HIV.B.DE84 Condition":
  [Condition: Concepts."Nucleic acid test for HIV - HIV.B.DE84"]
define "Nucleic acid test for HIV - HIV.B.DE84 Observation":
  [Observation: Concepts."Nucleic acid test for HIV - HIV.B.DE81"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Nucleic acid test for HIV - HIV.B.DE84"
/* End of Nucleic acid test for HIV - HIV.B.DE84 */

/*
@dataElement: HIV.B.DE85 - Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Antibody test for HIV and syphilis performed with a rapid diagnostic
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85":
  exists "Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85 Condition"
    or exists "Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85 Observation"
define "Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85 Condition":
  [Condition: Concepts."Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85"]
define "Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85 Observation":
  [Observation: Concepts."Dual HIV/syphilis rapid diagnostic test - HIV.B.DE81"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85"
/* End of Dual HIV/syphilis rapid diagnostic test - HIV.B.DE85 */

/*
@dataElement: HIV.B.DE86 - HIV self-test
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Antibody test for HIV performed by self-tester using a rapid diagnostic
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV self-test":
  exists "HIV self-test Condition"
    or exists "HIV self-test Observation"
define "HIV self-test Condition":
  [Condition: Concepts."HIV self-test"]
define "HIV self-test Observation":
  [Observation: Concepts."HIV self-test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV self-test"
/* End of HIV self-test */

/*
@dataElement: HIV.B.DE88 - Assay number in testing strategy - HIV.B.DE88
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The number of the assay (test kit) in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay number in testing strategy - HIV.B.DE88 Observation":
  [Observation: Concepts."Assay number in testing strategy - HIV.B.DE88"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Assay number in testing strategy - HIV.B.DE88 */

/*
@dataElement: HIV.B.DE89 - Assay 0 - HIV.B.DE89
@activity: HIV.B7 Test for HIV using testing algorithm
@description: A community outreach test-for-triage or self-test which is not included in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 0 - HIV.B.DE89":
  exists "Assay 0 - HIV.B.DE89 Condition"
    or exists "Assay 0 - HIV.B.DE89 Observation"
define "Assay 0 - HIV.B.DE89 Condition":
  [Condition: Concepts."Assay 0 - HIV.B.DE89"]
define "Assay 0 - HIV.B.DE89 Observation":
  [Observation: Concepts."Assay 0 - HIV.B.DE88"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 0 - HIV.B.DE89"
/* End of Assay 0 - HIV.B.DE89 */

/*
@dataElement: HIV.B.DE90 - Assay 1 - HIV.B.DE90
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The first test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 1 - HIV.B.DE90":
  exists "Assay 1 - HIV.B.DE90 Condition"
    or exists "Assay 1 - HIV.B.DE90 Observation"
define "Assay 1 - HIV.B.DE90 Condition":
  [Condition: Concepts."Assay 1 - HIV.B.DE90"]
define "Assay 1 - HIV.B.DE90 Observation":
  [Observation: Concepts."Assay 1 - HIV.B.DE88"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 1 - HIV.B.DE90"
/* End of Assay 1 - HIV.B.DE90 */

/*
@dataElement: HIV.B.DE91 - Assay 2 - HIV.B.DE91
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The second test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 2 - HIV.B.DE91":
  exists "Assay 2 - HIV.B.DE91 Condition"
    or exists "Assay 2 - HIV.B.DE91 Observation"
define "Assay 2 - HIV.B.DE91 Condition":
  [Condition: Concepts."Assay 2 - HIV.B.DE91"]
define "Assay 2 - HIV.B.DE91 Observation":
  [Observation: Concepts."Assay 2 - HIV.B.DE88"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 2 - HIV.B.DE91"
/* End of Assay 2 - HIV.B.DE91 */

/*
@dataElement: HIV.B.DE92 - Assay 3 - HIV.B.DE92
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The third test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 3 - HIV.B.DE92":
  exists "Assay 3 - HIV.B.DE92 Condition"
    or exists "Assay 3 - HIV.B.DE92 Observation"
define "Assay 3 - HIV.B.DE92 Condition":
  [Condition: Concepts."Assay 3 - HIV.B.DE92"]
define "Assay 3 - HIV.B.DE92 Observation":
  [Observation: Concepts."Assay 3 - HIV.B.DE88"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 3 - HIV.B.DE92"
/* End of Assay 3 - HIV.B.DE92 */

/*
@dataElement: HIV.B.DE93 - Assay 1 repeated - HIV.B.DE93
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The first test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 1 repeated - HIV.B.DE93":
  exists "Assay 1 repeated - HIV.B.DE93 Condition"
    or exists "Assay 1 repeated - HIV.B.DE93 Observation"
define "Assay 1 repeated - HIV.B.DE93 Condition":
  [Condition: Concepts."Assay 1 repeated - HIV.B.DE93"]
define "Assay 1 repeated - HIV.B.DE93 Observation":
  [Observation: Concepts."Assay 1 repeated - HIV.B.DE88"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 1 repeated - HIV.B.DE93"
/* End of Assay 1 repeated - HIV.B.DE93 */

/*
@dataElement: HIV.B.DE94 - Test result of HIV assay 1 - HIV.B.DE94
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the first HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 1 - HIV.B.DE94 Observation":
  [Observation: Concepts."Test result of HIV assay 1 - HIV.B.DE94"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 1 - HIV.B.DE94 */

/*
@dataElement: HIV.B.DE95 - Reactive - HIV.B.DE95
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.B.DE95":
  exists "Reactive - HIV.B.DE95 Condition"
    or exists "Reactive - HIV.B.DE95 Observation"
define "Reactive - HIV.B.DE95 Condition":
  [Condition: Concepts."Reactive - HIV.B.DE95"]
define "Reactive - HIV.B.DE95 Observation":
  [Observation: Concepts."Reactive - HIV.B.DE94"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.B.DE95"
/* End of Reactive - HIV.B.DE95 */

/*
@dataElement: HIV.B.DE96 - Non-reactive - HIV.B.DE96
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.B.DE96":
  exists "Non-reactive - HIV.B.DE96 Condition"
    or exists "Non-reactive - HIV.B.DE96 Observation"
define "Non-reactive - HIV.B.DE96 Condition":
  [Condition: Concepts."Non-reactive - HIV.B.DE96"]
define "Non-reactive - HIV.B.DE96 Observation":
  [Observation: Concepts."Non-reactive - HIV.B.DE94"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.B.DE96"
/* End of Non-reactive - HIV.B.DE96 */

/*
@dataElement: HIV.B.DE97 - Invalid - HIV.B.DE97
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.B.DE97":
  exists "Invalid - HIV.B.DE97 Condition"
    or exists "Invalid - HIV.B.DE97 Observation"
define "Invalid - HIV.B.DE97 Condition":
  [Condition: Concepts."Invalid - HIV.B.DE97"]
define "Invalid - HIV.B.DE97 Observation":
  [Observation: Concepts."Invalid - HIV.B.DE94"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.B.DE97"
/* End of Invalid - HIV.B.DE97 */

/*
@dataElement: HIV.B.DE98 - Test result of HIV assay 2 - HIV.B.DE98
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the second HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 2 - HIV.B.DE98 Observation":
  [Observation: Concepts."Test result of HIV assay 2 - HIV.B.DE98"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 2 - HIV.B.DE98 */

/*
@dataElement: HIV.B.DE99 - Reactive - HIV.B.DE99
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.B.DE99":
  exists "Reactive - HIV.B.DE99 Condition"
    or exists "Reactive - HIV.B.DE99 Observation"
define "Reactive - HIV.B.DE99 Condition":
  [Condition: Concepts."Reactive - HIV.B.DE99"]
define "Reactive - HIV.B.DE99 Observation":
  [Observation: Concepts."Reactive - HIV.B.DE98"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.B.DE99"
/* End of Reactive - HIV.B.DE99 */

/*
@dataElement: HIV.B.DE100 - Non-reactive - HIV.B.DE100
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.B.DE100":
  exists "Non-reactive - HIV.B.DE100 Condition"
    or exists "Non-reactive - HIV.B.DE100 Observation"
define "Non-reactive - HIV.B.DE100 Condition":
  [Condition: Concepts."Non-reactive - HIV.B.DE100"]
define "Non-reactive - HIV.B.DE100 Observation":
  [Observation: Concepts."Non-reactive - HIV.B.DE98"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.B.DE100"
/* End of Non-reactive - HIV.B.DE100 */

/*
@dataElement: HIV.B.DE101 - Invalid - HIV.B.DE101
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.B.DE101":
  exists "Invalid - HIV.B.DE101 Condition"
    or exists "Invalid - HIV.B.DE101 Observation"
define "Invalid - HIV.B.DE101 Condition":
  [Condition: Concepts."Invalid - HIV.B.DE101"]
define "Invalid - HIV.B.DE101 Observation":
  [Observation: Concepts."Invalid - HIV.B.DE98"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.B.DE101"
/* End of Invalid - HIV.B.DE101 */

/*
@dataElement: HIV.B.DE102 - Test result of HIV assay 3 - HIV.B.DE102
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the third HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 3 - HIV.B.DE102 Observation":
  [Observation: Concepts."Test result of HIV assay 3 - HIV.B.DE102"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 3 - HIV.B.DE102 */

/*
@dataElement: HIV.B.DE103 - Reactive - HIV.B.DE103
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.B.DE103":
  exists "Reactive - HIV.B.DE103 Condition"
    or exists "Reactive - HIV.B.DE103 Observation"
define "Reactive - HIV.B.DE103 Condition":
  [Condition: Concepts."Reactive - HIV.B.DE103"]
define "Reactive - HIV.B.DE103 Observation":
  [Observation: Concepts."Reactive - HIV.B.DE102"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.B.DE103"
/* End of Reactive - HIV.B.DE103 */

/*
@dataElement: HIV.B.DE104 - Non-reactive - HIV.B.DE104
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.B.DE104":
  exists "Non-reactive - HIV.B.DE104 Condition"
    or exists "Non-reactive - HIV.B.DE104 Observation"
define "Non-reactive - HIV.B.DE104 Condition":
  [Condition: Concepts."Non-reactive - HIV.B.DE104"]
define "Non-reactive - HIV.B.DE104 Observation":
  [Observation: Concepts."Non-reactive - HIV.B.DE102"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.B.DE104"
/* End of Non-reactive - HIV.B.DE104 */

/*
@dataElement: HIV.B.DE105 - Invalid - HIV.B.DE105
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.B.DE105":
  exists "Invalid - HIV.B.DE105 Condition"
    or exists "Invalid - HIV.B.DE105 Observation"
define "Invalid - HIV.B.DE105 Condition":
  [Condition: Concepts."Invalid - HIV.B.DE105"]
define "Invalid - HIV.B.DE105 Observation":
  [Observation: Concepts."Invalid - HIV.B.DE102"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.B.DE105"
/* End of Invalid - HIV.B.DE105 */

/*
@dataElement: HIV.B.DE106 - Test result of HIV assay 1 repeated - HIV.B.DE106
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the repeated first HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 1 repeated - HIV.B.DE106 Observation":
  [Observation: Concepts."Test result of HIV assay 1 repeated - HIV.B.DE106"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 1 repeated - HIV.B.DE106 */

/*
@dataElement: HIV.B.DE107 - Reactive - HIV.B.DE107
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.B.DE107":
  exists "Reactive - HIV.B.DE107 Condition"
    or exists "Reactive - HIV.B.DE107 Observation"
define "Reactive - HIV.B.DE107 Condition":
  [Condition: Concepts."Reactive - HIV.B.DE107"]
define "Reactive - HIV.B.DE107 Observation":
  [Observation: Concepts."Reactive - HIV.B.DE106"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.B.DE107"
/* End of Reactive - HIV.B.DE107 */

/*
@dataElement: HIV.B.DE108 - Non-reactive - HIV.B.DE108
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.B.DE108":
  exists "Non-reactive - HIV.B.DE108 Condition"
    or exists "Non-reactive - HIV.B.DE108 Observation"
define "Non-reactive - HIV.B.DE108 Condition":
  [Condition: Concepts."Non-reactive - HIV.B.DE108"]
define "Non-reactive - HIV.B.DE108 Observation":
  [Observation: Concepts."Non-reactive - HIV.B.DE106"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.B.DE108"
/* End of Non-reactive - HIV.B.DE108 */

/*
@dataElement: HIV.B.DE109 - Invalid - HIV.B.DE109
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.B.DE109":
  exists "Invalid - HIV.B.DE109 Condition"
    or exists "Invalid - HIV.B.DE109 Observation"
define "Invalid - HIV.B.DE109 Condition":
  [Condition: Concepts."Invalid - HIV.B.DE109"]
define "Invalid - HIV.B.DE109 Observation":
  [Observation: Concepts."Invalid - HIV.B.DE106"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.B.DE109"
/* End of Invalid - HIV.B.DE109 */

/*
@dataElement: HIV.B.DE110 - HIV test date - HIV.B.DE110
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Date of the HIV test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test date - HIV.B.DE110":
  [Observation: Concepts."HIV test date - HIV.B.DE110"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV test date - HIV.B.DE110 */

/*
@dataElement: HIV.B.DE111 - HIV test result - HIV.B.DE111
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result from HIV testing after applying the testing algorithm
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test result - HIV.B.DE111 Observation":
  [Observation: Concepts."HIV test result - HIV.B.DE111"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV test result - HIV.B.DE111 */

/*
@dataElement: HIV.B.DE112 - HIV-positive - HIV.B.DE112
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Test result is HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive - HIV.B.DE112":
  exists "HIV-positive - HIV.B.DE112 Condition"
    or exists "HIV-positive - HIV.B.DE112 Observation"
define "HIV-positive - HIV.B.DE112 Condition":
  [Condition: Concepts."HIV-positive - HIV.B.DE112"]
define "HIV-positive - HIV.B.DE112 Observation":
  [Observation: Concepts."HIV-positive - HIV.B.DE111"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive - HIV.B.DE112"
/* End of HIV-positive - HIV.B.DE112 */

/*
@dataElement: HIV.B.DE113 - HIV-negative - HIV.B.DE113
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Test result is HIV-negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-negative - HIV.B.DE113":
  exists "HIV-negative - HIV.B.DE113 Condition"
    or exists "HIV-negative - HIV.B.DE113 Observation"
define "HIV-negative - HIV.B.DE113 Condition":
  [Condition: Concepts."HIV-negative - HIV.B.DE113"]
define "HIV-negative - HIV.B.DE113 Observation":
  [Observation: Concepts."HIV-negative - HIV.B.DE111"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-negative - HIV.B.DE113"
/* End of HIV-negative - HIV.B.DE113 */

/*
@dataElement: HIV.B.DE114 - HIV-inconclusive
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Test result is HIV-inconclusive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-inconclusive":
  exists "HIV-inconclusive Condition"
    or exists "HIV-inconclusive Observation"
define "HIV-inconclusive Condition":
  [Condition: Concepts."HIV-inconclusive"]
define "HIV-inconclusive Observation":
  [Observation: Concepts."HIV-inconclusive"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-inconclusive"
/* End of HIV-inconclusive */

/*
@dataElement: HIV.B.DE115 - HIV status
@activity: HIV.B7 Test for HIV using testing algorithm
@description: HIV status reported after applying the national HIV testing algorithm. No single HIV test can provide an HIV-positive diagnosis.
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV status Observation":
  [Observation: Concepts."HIV status"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV status */

/*
@dataElement: HIV.B.DE116 - HIV-positive - HIV.B.DE116
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Client is HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive - HIV.B.DE116":
  exists "HIV-positive - HIV.B.DE116 Condition"
    or exists "HIV-positive - HIV.B.DE116 Observation"
define "HIV-positive - HIV.B.DE116 Condition":
  [Condition: Concepts."HIV-positive - HIV.B.DE116"]
define "HIV-positive - HIV.B.DE116 Observation":
  [Observation: Concepts."HIV-positive - HIV.B.DE115"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive - HIV.B.DE116"
/* End of HIV-positive - HIV.B.DE116 */

/*
@dataElement: HIV.B.DE117 - HIV-negative - HIV.B.DE117
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Client is HIV-negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-negative - HIV.B.DE117":
  exists "HIV-negative - HIV.B.DE117 Condition"
    or exists "HIV-negative - HIV.B.DE117 Observation"
define "HIV-negative - HIV.B.DE117 Condition":
  [Condition: Concepts."HIV-negative - HIV.B.DE117"]
define "HIV-negative - HIV.B.DE117 Observation":
  [Observation: Concepts."HIV-negative - HIV.B.DE115"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-negative - HIV.B.DE117"
/* End of HIV-negative - HIV.B.DE117 */

/*
@dataElement: HIV.B.DE118 - Unknown - HIV.B.DE118
@activity: HIV.B7 Test for HIV using testing algorithm
@description: Client has unknown HIV status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unknown - HIV.B.DE118":
  exists "Unknown - HIV.B.DE118 Condition"
    or exists "Unknown - HIV.B.DE118 Observation"
define "Unknown - HIV.B.DE118 Condition":
  [Condition: Concepts."Unknown - HIV.B.DE118"]
define "Unknown - HIV.B.DE118 Observation":
  [Observation: Concepts."Unknown - HIV.B.DE115"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unknown - HIV.B.DE118"
/* End of Unknown - HIV.B.DE118 */

/*
@dataElement: HIV.B.DE121 - Probable route of transmission*
@activity: HIV.B8 Provide post-test counselling
@description: Probable route(s) of transmission of HIV to client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Probable route of transmission* Observation":
  [Observation: Concepts."Probable route of transmission*"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Probable route of transmission* */

/*
@dataElement: HIV.B.DE122 - Heterosexual sex
@activity: HIV.B8 Provide post-test counselling
@description: Probable route of HIV transmission was through heterosexual sex
*/
// TODO: Replace placeholder with relevant CQL logic
define "Heterosexual sex":
  exists "Heterosexual sex Condition"
    or exists "Heterosexual sex Observation"
define "Heterosexual sex Condition":
  [Condition: Concepts."Heterosexual sex"]
define "Heterosexual sex Observation":
  [Observation: Concepts."Heterosexual sex"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Heterosexual sex"
/* End of Heterosexual sex */

/*
@dataElement: HIV.B.DE123 - Sex between men
@activity: HIV.B8 Provide post-test counselling
@description: Probable route of HIV transmission was through sex between men
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sex between men":
  exists "Sex between men Condition"
    or exists "Sex between men Observation"
define "Sex between men Condition":
  [Condition: Concepts."Sex between men"]
define "Sex between men Observation":
  [Observation: Concepts."Sex between men"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sex between men"
/* End of Sex between men */

/*
@dataElement: HIV.B.DE124 - Unprotected intercourse during sex work
@activity: HIV.B8 Provide post-test counselling
@description: Probable route of HIV transmission was through unprotected intercourse during sex work
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unprotected intercourse during sex work":
  exists "Unprotected intercourse during sex work Condition"
    or exists "Unprotected intercourse during sex work Observation"
define "Unprotected intercourse during sex work Condition":
  [Condition: Concepts."Unprotected intercourse during sex work"]
define "Unprotected intercourse during sex work Observation":
  [Observation: Concepts."Unprotected intercourse during sex work"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unprotected intercourse during sex work"
/* End of Unprotected intercourse during sex work */

/*
@dataElement: HIV.B.DE125 - Injecting drug use with unsterile equipment
@activity: HIV.B8 Provide post-test counselling
@description: Probable route of HIV transmission was through injecting drug use with unsterile equipment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Injecting drug use with unsterile equipment":
  exists "Injecting drug use with unsterile equipment Condition"
    or exists "Injecting drug use with unsterile equipment Observation"
define "Injecting drug use with unsterile equipment Condition":
  [Condition: Concepts."Injecting drug use with unsterile equipment"]
define "Injecting drug use with unsterile equipment Observation":
  [Observation: Concepts."Injecting drug use with unsterile equipment"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Injecting drug use with unsterile equipment"
/* End of Injecting drug use with unsterile equipment */

/*
@dataElement: HIV.B.DE126 - Nosocomial
@activity: HIV.B8 Provide post-test counselling
@description: Probable route of HIV transmission was nosocomial
*/
// TODO: Replace placeholder with relevant CQL logic
define "Nosocomial":
  exists "Nosocomial Condition"
    or exists "Nosocomial Observation"
define "Nosocomial Condition":
  [Condition: Concepts."Nosocomial"]
define "Nosocomial Observation":
  [Observation: Concepts."Nosocomial"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Nosocomial"
/* End of Nosocomial */

/*
@dataElement: HIV.B.DE127 - Vertical
@activity: HIV.B8 Provide post-test counselling
@description: Probable route of HIV transmission to an infant was during pregnancy, labour, delivery and breastfeeding (vertical transmission)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Vertical":
  exists "Vertical Condition"
    or exists "Vertical Observation"
define "Vertical Condition":
  [Condition: Concepts."Vertical"]
define "Vertical Observation":
  [Observation: Concepts."Vertical"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Vertical"
/* End of Vertical */

/*
@dataElement: HIV.B.DE128 - Other - HIV.B.DE128
@activity: HIV.B8 Provide post-test counselling
@description: Probable route of HIV transmission was other and may include needle accidents, blood transfusion, blood products or organ/tissue donations, tattoos, piercings, circumcision, or acupuncture.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.B.DE128":
  exists "Other - HIV.B.DE128 Condition"
    or exists "Other - HIV.B.DE128 Observation"
define "Other - HIV.B.DE128 Condition":
  [Condition: Concepts."Other - HIV.B.DE128"]
define "Other - HIV.B.DE128 Observation":
  [Observation: Concepts."Other - HIV.B.DE121"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.B.DE128"
/* End of Other - HIV.B.DE128 */

/*
@dataElement: HIV.B.DE141 - Partner virally suppressed on ART
@activity: HIV.B6 Capture or update client history
@description: ART and virally suppression status of a partner of the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Partner virally suppressed on ART":
  [Observation: Concepts."Partner virally suppressed on ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Partner virally suppressed on ART */

/*
@dataElement: HIV.B.DE142 - Counselling provided
@activity: HIV.B8 Provide post-test counselling
@description: Whether counselling was provided to a client during the visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Counselling provided Observation":
  [Observation: Concepts."Counselling provided"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Counselling provided */

/*
@dataElement: HIV.B.DE143 - HIV-positive counselling conducted
@activity: HIV.B8 Provide post-test counselling
@description: Whether counselling was provided to a client who has been diagnosed with HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive counselling conducted":
  exists "HIV-positive counselling conducted Condition"
    or exists "HIV-positive counselling conducted Observation"
define "HIV-positive counselling conducted Condition":
  [Condition: Concepts."HIV-positive counselling conducted"]
define "HIV-positive counselling conducted Observation":
  [Observation: Concepts."HIV-positive counselling conducted"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive counselling conducted"
/* End of HIV-positive counselling conducted */

/*
@dataElement: HIV.B.DE144 - Hepatitis B positive counselling conducted
@activity: HIV.B8 Provide post-test counselling
@description: Whether counselling was provided to a client who has been diagnosed with hepatitis B
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hepatitis B positive counselling conducted":
  exists "Hepatitis B positive counselling conducted Condition"
    or exists "Hepatitis B positive counselling conducted Observation"
define "Hepatitis B positive counselling conducted Condition":
  [Condition: Concepts."Hepatitis B positive counselling conducted"]
define "Hepatitis B positive counselling conducted Observation":
  [Observation: Concepts."Hepatitis B positive counselling conducted"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hepatitis B positive counselling conducted"
/* End of Hepatitis B positive counselling conducted */

/*
@dataElement: HIV.B.DE145 - Hepatitis C positive counselling conducted
@activity: HIV.B8 Provide post-test counselling
@description: Whether counselling was provided to a client who has been diagnosed with hepatitis C
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hepatitis C positive counselling conducted":
  exists "Hepatitis C positive counselling conducted Condition"
    or exists "Hepatitis C positive counselling conducted Observation"
define "Hepatitis C positive counselling conducted Condition":
  [Condition: Concepts."Hepatitis C positive counselling conducted"]
define "Hepatitis C positive counselling conducted Observation":
  [Observation: Concepts."Hepatitis C positive counselling conducted"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hepatitis C positive counselling conducted"
/* End of Hepatitis C positive counselling conducted */

/*
@dataElement: HIV.B.DE146 - Syphilis counselling, treatment and further testing
@activity: HIV.B8 Provide post-test counselling
@description: Whether counselling and treatment was provided to a client who has been diagnosed with syphilis. Additional testing (RPR test) recommended.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis counselling, treatment and further testing":
  exists "Syphilis counselling, treatment and further testing Condition"
    or exists "Syphilis counselling, treatment and further testing Observation"
define "Syphilis counselling, treatment and further testing Condition":
  [Condition: Concepts."Syphilis counselling, treatment and further testing"]
define "Syphilis counselling, treatment and further testing Observation":
  [Observation: Concepts."Syphilis counselling, treatment and further testing"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Syphilis counselling, treatment and further testing"
/* End of Syphilis counselling, treatment and further testing */

/*
@dataElement: HIV.B.DE147 - Linked to enrolment in care and ART initiation
@activity: HIV.B8 Provide post-test counselling
@description: Linkage made from HIV testing to enrolment in care following an HIV diagnosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Linked to enrolment in care and ART initiation":
  exists "Linked to enrolment in care and ART initiation Condition"
    or exists "Linked to enrolment in care and ART initiation Observation"
define "Linked to enrolment in care and ART initiation Condition":
  [Condition: Concepts."Linked to enrolment in care and ART initiation"]
define "Linked to enrolment in care and ART initiation Observation":
  [Observation: Concepts."Linked to enrolment in care and ART initiation"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Linked to enrolment in care and ART initiation"
/* End of Linked to enrolment in care and ART initiation */

/*
@dataElement: HIV.B.DE148 - VMMC counselling provided
@activity: HIV.B8 Provide post-test counselling
@description: Whether counselling for voluntary medical male circumcision (VMMC) was provided following an HIV-negative test
*/
// TODO: Replace placeholder with relevant CQL logic
define "VMMC counselling provided":
  exists "VMMC counselling provided Condition"
    or exists "VMMC counselling provided Observation"
define "VMMC counselling provided Condition":
  [Condition: Concepts."VMMC counselling provided"]
define "VMMC counselling provided Observation":
  [Observation: Concepts."VMMC counselling provided"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."VMMC counselling provided"
/* End of VMMC counselling provided */

/*
@dataElement: HIV.B.DE149 - Prevention services offered and referrals - HIV.B.DE149
@activity: HIV.B9 Determine recommended services
@description: Offer or refer to prevention services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Prevention services offered and referrals - HIV.B.DE149 Observation":
  [Observation: Concepts."Prevention services offered and referrals - HIV.B.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Prevention services offered and referrals - HIV.B.DE149 */

/*
@dataElement: HIV.B.DE150 - Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150
@activity: HIV.B9 Determine recommended services
@description: Offer male and female condoms and condom-compatible lubricants
*/
// TODO: Replace placeholder with relevant CQL logic
define "Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150":
  exists "Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150 Condition"
    or exists "Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150 Observation"
define "Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150 Condition":
  [Condition: Concepts."Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150"]
define "Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150 Observation":
  [Observation: Concepts."Offer male and female condoms and condom-compatible lubricants - HIV.B.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150"
/* End of Offer male and female condoms and condom-compatible lubricants - HIV.B.DE150 */

/*
@dataElement: HIV.B.DE151 - Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition
@activity: HIV.B9 Determine recommended services
@description: Offer pre-exposure prophylaxis (PrEP) to people with substantial ongoing risk of HIV infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition":
  exists "Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition Condition"
    or exists "Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition Observation"
define "Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition Condition":
  [Condition: Concepts."Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition"]
define "Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition Observation":
  [Observation: Concepts."Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition"
/* End of Offer pre-exposure prophylaxis PrEP for people at elevated risk for HIV acquisition */

/*
@dataElement: HIV.B.DE152 - Offer post-exposure prophylaxis PEP following suspected exposure
@activity: HIV.B9 Determine recommended services
@description: Offer or refer client for PEP following suspected exposure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Offer post-exposure prophylaxis PEP following suspected exposure":
  exists "Offer post-exposure prophylaxis PEP following suspected exposure Condition"
    or exists "Offer post-exposure prophylaxis PEP following suspected exposure Observation"
define "Offer post-exposure prophylaxis PEP following suspected exposure Condition":
  [Condition: Concepts."Offer post-exposure prophylaxis PEP following suspected exposure"]
define "Offer post-exposure prophylaxis PEP following suspected exposure Observation":
  [Observation: Concepts."Offer post-exposure prophylaxis PEP following suspected exposure"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Offer post-exposure prophylaxis PEP following suspected exposure"
/* End of Offer post-exposure prophylaxis PEP following suspected exposure */

/*
@dataElement: HIV.B.DE153 - Voluntary medical male circumcision VMMC
@activity: HIV.B9 Determine recommended services
@description: Offer referral for VMMC services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Voluntary medical male circumcision VMMC":
  exists "Voluntary medical male circumcision VMMC Condition"
    or exists "Voluntary medical male circumcision VMMC Observation"
define "Voluntary medical male circumcision VMMC Condition":
  [Condition: Concepts."Voluntary medical male circumcision VMMC"]
define "Voluntary medical male circumcision VMMC Observation":
  [Observation: Concepts."Voluntary medical male circumcision VMMC"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Voluntary medical male circumcision VMMC"
/* End of Voluntary medical male circumcision VMMC */

/*
@dataElement: HIV.B.DE154 - Harm reduction for people who inject drugs - HIV.B.DE154
@activity: HIV.B9 Determine recommended services
@description: Offer or refer to harm reduction services for people who inject drugs (needle and syringe programmes, opioid substitution therapy, other drug-dependence treatment and opioid overdose prevention and management)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Harm reduction for people who inject drugs - HIV.B.DE154":
  exists "Harm reduction for people who inject drugs - HIV.B.DE154 Condition"
    or exists "Harm reduction for people who inject drugs - HIV.B.DE154 Observation"
define "Harm reduction for people who inject drugs - HIV.B.DE154 Condition":
  [Condition: Concepts."Harm reduction for people who inject drugs - HIV.B.DE154"]
define "Harm reduction for people who inject drugs - HIV.B.DE154 Observation":
  [Observation: Concepts."Harm reduction for people who inject drugs - HIV.B.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Harm reduction for people who inject drugs - HIV.B.DE154"
/* End of Harm reduction for people who inject drugs - HIV.B.DE154 */

/*
@dataElement: HIV.B.DE155 - Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations
@activity: HIV.B9 Determine recommended services
@description: Offer or refer to behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations
*/
// TODO: Replace placeholder with relevant CQL logic
define "Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations":
  exists "Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations Condition"
    or exists "Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations Observation"
define "Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations Condition":
  [Condition: Concepts."Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations"]
define "Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations Observation":
  [Observation: Concepts."Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations"
/* End of Behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations */

/*
@dataElement: HIV.B.DE156 - HIV testing for partners and biological children - HIV.B.DE156
@activity: HIV.B9 Determine recommended services
@description: Offer voluntary testing for all partners and biological children of positive cases (includes partner services and index case testing), as welll as partners and social contacts of people from key populations, where appropriate
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV testing for partners and biological children - HIV.B.DE156":
  exists "HIV testing for partners and biological children - HIV.B.DE156 Condition"
    or exists "HIV testing for partners and biological children - HIV.B.DE156 Observation"
define "HIV testing for partners and biological children - HIV.B.DE156 Condition":
  [Condition: Concepts."HIV testing for partners and biological children - HIV.B.DE156"]
define "HIV testing for partners and biological children - HIV.B.DE156 Observation":
  [Observation: Concepts."HIV testing for partners and biological children - HIV.B.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV testing for partners and biological children - HIV.B.DE156"
/* End of HIV testing for partners and biological children - HIV.B.DE156 */

/*
@dataElement: HIV.B.DE157 - HIV testing for partners and social contacts of people from key populations, where appropriate
@activity: HIV.B9 Determine recommended services
@description: Offer voluntary testing for partners and social contacts of people from key populations, where appropriate
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV testing for partners and social contacts of people from key populations, where appropriate":
  exists "HIV testing for partners and social contacts of people from key populations, where appropriate Condition"
    or exists "HIV testing for partners and social contacts of people from key populations, where appropriate Observation"
define "HIV testing for partners and social contacts of people from key populations, where appropriate Condition":
  [Condition: Concepts."HIV testing for partners and social contacts of people from key populations, where appropriate"]
define "HIV testing for partners and social contacts of people from key populations, where appropriate Observation":
  [Observation: Concepts."HIV testing for partners and social contacts of people from key populations, where appropriate"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV testing for partners and social contacts of people from key populations, where appropriate"
/* End of HIV testing for partners and social contacts of people from key populations, where appropriate */

/*
@dataElement: HIV.B.DE158 - Sexual and reproductive health integrated services - HIV.B.DE158
@activity: HIV.B9 Determine recommended services
@description: Offer or refer to sexual and reproductive health services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sexual and reproductive health integrated services - HIV.B.DE158 Observation":
  [Observation: Concepts."Sexual and reproductive health integrated services - HIV.B.DE158"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Sexual and reproductive health integrated services - HIV.B.DE158 */

/*
@dataElement: HIV.B.DE159 - Contraception and family planning - HIV.B.DE159
@activity: HIV.B9 Determine recommended services
@description: Offer contraception and family planning services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Contraception and family planning - HIV.B.DE159":
  exists "Contraception and family planning - HIV.B.DE159 Condition"
    or exists "Contraception and family planning - HIV.B.DE159 Observation"
define "Contraception and family planning - HIV.B.DE159 Condition":
  [Condition: Concepts."Contraception and family planning - HIV.B.DE159"]
define "Contraception and family planning - HIV.B.DE159 Observation":
  [Observation: Concepts."Contraception and family planning - HIV.B.DE158"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Contraception and family planning - HIV.B.DE159"
/* End of Contraception and family planning - HIV.B.DE159 */

/*
@dataElement: HIV.B.DE160 - Check pregnancy status - HIV.B.DE160
@activity: HIV.B9 Determine recommended services
@description: Check women's pregnancy status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Check pregnancy status - HIV.B.DE160":
  exists "Check pregnancy status - HIV.B.DE160 Condition"
    or exists "Check pregnancy status - HIV.B.DE160 Observation"
define "Check pregnancy status - HIV.B.DE160 Condition":
  [Condition: Concepts."Check pregnancy status - HIV.B.DE160"]
define "Check pregnancy status - HIV.B.DE160 Observation":
  [Observation: Concepts."Check pregnancy status - HIV.B.DE158"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Check pregnancy status - HIV.B.DE160"
/* End of Check pregnancy status - HIV.B.DE160 */

/*
@dataElement: HIV.B.DE161 - Prevention of mother-to-child transmission counselling
@activity: HIV.B9 Determine recommended services
@description: Offer services for prevention of mother-to-child transmission (counselling)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Prevention of mother-to-child transmission counselling":
  exists "Prevention of mother-to-child transmission counselling Condition"
    or exists "Prevention of mother-to-child transmission counselling Observation"
define "Prevention of mother-to-child transmission counselling Condition":
  [Condition: Concepts."Prevention of mother-to-child transmission counselling"]
define "Prevention of mother-to-child transmission counselling Observation":
  [Observation: Concepts."Prevention of mother-to-child transmission counselling"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Prevention of mother-to-child transmission counselling"
/* End of Prevention of mother-to-child transmission counselling */

/*
@dataElement: HIV.B.DE162 - Cervical cancer screening and treatment counselling
@activity: HIV.B9 Determine recommended services
@description: Offer cervical cancer screening and treatment counselling and services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer screening and treatment counselling":
  exists "Cervical cancer screening and treatment counselling Condition"
    or exists "Cervical cancer screening and treatment counselling Observation"
define "Cervical cancer screening and treatment counselling Condition":
  [Condition: Concepts."Cervical cancer screening and treatment counselling"]
define "Cervical cancer screening and treatment counselling Observation":
  [Observation: Concepts."Cervical cancer screening and treatment counselling"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cervical cancer screening and treatment counselling"
/* End of Cervical cancer screening and treatment counselling */

/*
@dataElement: HIV.B.DE163 - Anal cancer screening for men who have sex with men - HIV.B.DE163
@activity: HIV.B9 Determine recommended services
@description: Offer services for anal cancer screening (for men who have sex with men)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Anal cancer screening for men who have sex with men - HIV.B.DE163":
  exists "Anal cancer screening for men who have sex with men - HIV.B.DE163 Condition"
    or exists "Anal cancer screening for men who have sex with men - HIV.B.DE163 Observation"
define "Anal cancer screening for men who have sex with men - HIV.B.DE163 Condition":
  [Condition: Concepts."Anal cancer screening for men who have sex with men - HIV.B.DE163"]
define "Anal cancer screening for men who have sex with men - HIV.B.DE163 Observation":
  [Observation: Concepts."Anal cancer screening for men who have sex with men - HIV.B.DE158"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Anal cancer screening for men who have sex with men - HIV.B.DE163"
/* End of Anal cancer screening for men who have sex with men - HIV.B.DE163 */

/*
@dataElement: HIV.B.DE164 - STI testing and treatment services
@activity: HIV.B9 Determine recommended services
@description: Offer sexually transmitted infection (STI) testing and treatment services
*/
// TODO: Replace placeholder with relevant CQL logic
define "STI testing and treatment services":
  exists "STI testing and treatment services Condition"
    or exists "STI testing and treatment services Observation"
define "STI testing and treatment services Condition":
  [Condition: Concepts."STI testing and treatment services"]
define "STI testing and treatment services Observation":
  [Observation: Concepts."STI testing and treatment services"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."STI testing and treatment services"
/* End of STI testing and treatment services */

/*
@dataElement: HIV.B.DE165 - Offer other clinical services - HIV.B.DE165
@activity: HIV.B9 Determine recommended services
@description: Other clinical services offered or referrals given to the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Offer other clinical services - HIV.B.DE165 Observation":
  [Observation: Concepts."Offer other clinical services - HIV.B.DE165"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Offer other clinical services - HIV.B.DE165 */

/*
@dataElement: HIV.B.DE166 - Assessment and provision of vaccinations - HIV.B.DE166
@activity: HIV.B9 Determine recommended services
@description: Assessment and provision of vaccinations, such as for people from key populations, pregnant women and infants; and, where appropriate, tetanus vaccination for adolescent boys and men receiving VMMC
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assessment and provision of vaccinations - HIV.B.DE166":
  exists "Assessment and provision of vaccinations - HIV.B.DE166 Condition"
    or exists "Assessment and provision of vaccinations - HIV.B.DE166 Observation"
define "Assessment and provision of vaccinations - HIV.B.DE166 Condition":
  [Condition: Concepts."Assessment and provision of vaccinations - HIV.B.DE166"]
define "Assessment and provision of vaccinations - HIV.B.DE166 Observation":
  [Observation: Concepts."Assessment and provision of vaccinations - HIV.B.DE165"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assessment and provision of vaccinations - HIV.B.DE166"
/* End of Assessment and provision of vaccinations - HIV.B.DE166 */

/*
@dataElement: HIV.B.DE167 - Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for HBV and/or HCV testing and treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided":
  exists "Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided Condition"
    or exists "Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided Observation"
define "Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided Condition":
  [Condition: Concepts."Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided"]
define "Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided Observation":
  [Observation: Concepts."Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided"
/* End of Hepatitis B HBV and hepatitis C virus HCV testing and treatment provided */

/*
@dataElement: HIV.B.DE168 - Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia
*/
// TODO: Replace placeholder with relevant CQL logic
define "Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided":
  exists "Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided Condition"
    or exists "Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided Observation"
define "Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided Condition":
  [Condition: Concepts."Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided"]
define "Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided Observation":
  [Observation: Concepts."Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided"
/* End of Co-trimoxazole chemoprophylaxis to prevent Pneumocystis carinii pneumonia provided */

/*
@dataElement: HIV.B.DE169 - Intensified TB case finding and linkage to TB treatment provided
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for intensified TB case finding and linkage to TB treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Intensified TB case finding and linkage to TB treatment provided":
  exists "Intensified TB case finding and linkage to TB treatment provided Condition"
    or exists "Intensified TB case finding and linkage to TB treatment provided Observation"
define "Intensified TB case finding and linkage to TB treatment provided Condition":
  [Condition: Concepts."Intensified TB case finding and linkage to TB treatment provided"]
define "Intensified TB case finding and linkage to TB treatment provided Observation":
  [Observation: Concepts."Intensified TB case finding and linkage to TB treatment provided"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Intensified TB case finding and linkage to TB treatment provided"
/* End of Intensified TB case finding and linkage to TB treatment provided */

/*
@dataElement: HIV.B.DE170 - Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for provision of isoniazid preventive therapy if person does not have TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170":
  exists "Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170 Condition"
    or exists "Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170 Observation"
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170 Condition":
  [Condition: Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170"]
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170 Observation":
  [Observation: Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE165"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170"
/* End of Provision of isoniazid preventive therapy if person does not have TB - HIV.B.DE170 */

/*
@dataElement: HIV.B.DE171 - Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for malaria prevention (such as bed nets and prophylaxis), depending on epidemiology
*/
// TODO: Replace placeholder with relevant CQL logic
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171":
  exists "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171 Condition"
    or exists "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171 Observation"
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171 Condition":
  [Condition: Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171"]
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171 Observation":
  [Observation: Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE165"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171"
/* End of Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.B.DE171 */

/*
@dataElement: HIV.B.DE172 - Other support services - HIV.B.DE172
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for other support services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other support services - HIV.B.DE172 Observation":
  [Observation: Concepts."Other support services - HIV.B.DE172"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Other support services - HIV.B.DE172 */

/*
@dataElement: HIV.B.DE173 - Mental health services - HIV.B.DE173
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for mental health services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Mental health services - HIV.B.DE173":
  exists "Mental health services - HIV.B.DE173 Condition"
    or exists "Mental health services - HIV.B.DE173 Observation"
define "Mental health services - HIV.B.DE173 Condition":
  [Condition: Concepts."Mental health services - HIV.B.DE173"]
define "Mental health services - HIV.B.DE173 Observation":
  [Observation: Concepts."Mental health services - HIV.B.DE172"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Mental health services - HIV.B.DE173"
/* End of Mental health services - HIV.B.DE173 */

/*
@dataElement: HIV.B.DE174 - Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for psychosocial counselling, support and treatment adherence counselling
*/
// TODO: Replace placeholder with relevant CQL logic
define "Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174":
  exists "Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174 Condition"
    or exists "Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174 Observation"
define "Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174 Condition":
  [Condition: Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174"]
define "Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174 Observation":
  [Observation: Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE172"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174"
/* End of Psychosocial counselling, support and treatment adherence counselling - HIV.B.DE174 */

/*
@dataElement: HIV.B.DE175 - Support for disclosure and partner services - HIV.B.DE175
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for support for disclosure and partner services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Support for disclosure and partner services - HIV.B.DE175":
  exists "Support for disclosure and partner services - HIV.B.DE175 Condition"
    or exists "Support for disclosure and partner services - HIV.B.DE175 Observation"
define "Support for disclosure and partner services - HIV.B.DE175 Condition":
  [Condition: Concepts."Support for disclosure and partner services - HIV.B.DE175"]
define "Support for disclosure and partner services - HIV.B.DE175 Observation":
  [Observation: Concepts."Support for disclosure and partner services - HIV.B.DE172"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Support for disclosure and partner services - HIV.B.DE175"
/* End of Support for disclosure and partner services - HIV.B.DE175 */

/*
@dataElement: HIV.B.DE176 - Legal and social services - HIV.B.DE176
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for legal and social services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Legal and social services - HIV.B.DE176":
  exists "Legal and social services - HIV.B.DE176 Condition"
    or exists "Legal and social services - HIV.B.DE176 Observation"
define "Legal and social services - HIV.B.DE176 Condition":
  [Condition: Concepts."Legal and social services - HIV.B.DE176"]
define "Legal and social services - HIV.B.DE176 Observation":
  [Observation: Concepts."Legal and social services - HIV.B.DE172"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Legal and social services - HIV.B.DE176"
/* End of Legal and social services - HIV.B.DE176 */

/*
@dataElement: HIV.B.DE177 - Services for responding to violence against women - HIV.B.DE177
@activity: HIV.B9 Determine recommended services
@description: Offer or refer for services for responding to violence against women, including first-line support and psychosocial support, post-rape care and other support services including shelters, legal services and women and child protection services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Services for responding to violence against women - HIV.B.DE177":
  exists "Services for responding to violence against women - HIV.B.DE177 Condition"
    or exists "Services for responding to violence against women - HIV.B.DE177 Observation"
define "Services for responding to violence against women - HIV.B.DE177 Condition":
  [Condition: Concepts."Services for responding to violence against women - HIV.B.DE177"]
define "Services for responding to violence against women - HIV.B.DE177 Observation":
  [Observation: Concepts."Services for responding to violence against women - HIV.B.DE172"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Services for responding to violence against women - HIV.B.DE177"
/* End of Services for responding to violence against women - HIV.B.DE177 */

/*
@dataElement: HIV.B.DE191 - Type of follow-up appointment - HIV.B.DE191
@activity: HIV.B20 Schedule retest
@description: Type of follow-up appointment for testing services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of follow-up appointment - HIV.B.DE191 Observation":
  [Observation: Concepts."Type of follow-up appointment - HIV.B.DE191"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of follow-up appointment - HIV.B.DE191 */

/*
@dataElement: HIV.B.DE192 - Retesting for HIV - HIV.B.DE192
@activity: HIV.B20 Schedule retest
@description: Retesting follow-up appointment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Retesting for HIV - HIV.B.DE192":
  exists "Retesting for HIV - HIV.B.DE192 Condition"
    or exists "Retesting for HIV - HIV.B.DE192 Observation"
define "Retesting for HIV - HIV.B.DE192 Condition":
  [Condition: Concepts."Retesting for HIV - HIV.B.DE192"]
define "Retesting for HIV - HIV.B.DE192 Observation":
  [Observation: Concepts."Retesting for HIV - HIV.B.DE191"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Retesting for HIV - HIV.B.DE192"
/* End of Retesting for HIV - HIV.B.DE192 */

/*
@dataElement: HIV.B.DE193 - Other - HIV.B.DE193
@activity: HIV.B20 Schedule retest
@description: Other reason for the follow-up appointment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.B.DE193":
  exists "Other - HIV.B.DE193 Condition"
    or exists "Other - HIV.B.DE193 Observation"
define "Other - HIV.B.DE193 Condition":
  [Condition: Concepts."Other - HIV.B.DE193"]
define "Other - HIV.B.DE193 Observation":
  [Observation: Concepts."Other - HIV.B.DE191"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.B.DE193"
/* End of Other - HIV.B.DE193 */

/*
@dataElement: HIV.B.DE195 - Date/time of follow-up appointment - HIV.B.DE195
@activity: HIV.B20 Schedule retest
@description: Date the patient is to return for monitoring, re-supply or any other reason
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date/time of follow-up appointment - HIV.B.DE195":
  [Observation: Concepts."Date/time of follow-up appointment - HIV.B.DE195"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date/time of follow-up appointment - HIV.B.DE195 */

/*
@dataElement: HIV.B.DE198 - VMMC procedure date
@activity: HIV.B21 Offer prevention options
@description: Date on which a voluntary medical male circumcision procedure was performed
*/
// TODO: Replace placeholder with relevant CQL logic
define "VMMC procedure date":
  [Observation: Concepts."VMMC procedure date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of VMMC procedure date */

/*
@dataElement: HIV.B.DE201 - Adverse event severity
@activity: HIV.B21 Offer prevention options
@description: Severity of the adverse event associated with voluntary medical male circumcision (VMMC) procedure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Adverse event severity Observation":
  [Observation: Concepts."Adverse event severity"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Adverse event severity */

/*
@dataElement: HIV.B.DE202 - Moderate
@activity: HIV.B21 Offer prevention options
@description: Severity of the adverse event associated with VMMC procedure was moderate
*/
// TODO: Replace placeholder with relevant CQL logic
define "Moderate":
  exists "Moderate Condition"
    or exists "Moderate Observation"
define "Moderate Condition":
  [Condition: Concepts."Moderate"]
define "Moderate Observation":
  [Observation: Concepts."Moderate"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Moderate"
/* End of Moderate */

/*
@dataElement: HIV.B.DE203 - Severe
@activity: HIV.B21 Offer prevention options
@description: Severity of the adverse event associated with VMMC procedure was severe
*/
// TODO: Replace placeholder with relevant CQL logic
define "Severe":
  exists "Severe Condition"
    or exists "Severe Observation"
define "Severe Condition":
  [Condition: Concepts."Severe"]
define "Severe Observation":
  [Observation: Concepts."Severe"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Severe"
/* End of Severe */

/*
@dataElement: HIV.B.DE204 - Timing of adverse event
@activity: HIV.B21 Offer prevention options
@description: When the adverse event associated with VMMC procedure occurred
*/
// TODO: Replace placeholder with relevant CQL logic
define "Timing of adverse event Observation":
  [Observation: Concepts."Timing of adverse event"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Timing of adverse event */

/*
@dataElement: HIV.B.DE205 - Intraoperative
@activity: HIV.B21 Offer prevention options
@description: The adverse event associated with VMMC procedure occurred during the procedure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Intraoperative":
  exists "Intraoperative Condition"
    or exists "Intraoperative Observation"
define "Intraoperative Condition":
  [Condition: Concepts."Intraoperative"]
define "Intraoperative Observation":
  [Observation: Concepts."Intraoperative"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Intraoperative"
/* End of Intraoperative */

/*
@dataElement: HIV.B.DE206 - Postoperative
@activity: HIV.B21 Offer prevention options
@description: The adverse event associated with VMMC procedure occurred within the first 30 days after the procedure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Postoperative":
  exists "Postoperative Condition"
    or exists "Postoperative Observation"
define "Postoperative Condition":
  [Condition: Concepts."Postoperative"]
define "Postoperative Observation":
  [Observation: Concepts."Postoperative"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Postoperative"
/* End of Postoperative */

/*
@dataElement: HIV.B.DE207 - Type of adverse VMMC event
@activity: HIV.B21 Offer prevention options
@description: Type of adverse event associated with voluntary medical male circumcision (VMMC) procedure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of adverse VMMC event Observation":
  [Observation: Concepts."Type of adverse VMMC event"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of adverse VMMC event */

/*
@dataElement: HIV.B.DE208 - Abnormal pain
@activity: HIV.B21 Offer prevention options
@description: Client experienced abnormal pain
*/
// TODO: Replace placeholder with relevant CQL logic
define "Abnormal pain":
  exists "Abnormal pain Condition"
    or exists "Abnormal pain Observation"
define "Abnormal pain Condition":
  [Condition: Concepts."Abnormal pain"]
define "Abnormal pain Observation":
  [Observation: Concepts."Abnormal pain"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Abnormal pain"
/* End of Abnormal pain */

/*
@dataElement: HIV.B.DE209 - Anaesthesia-related effects
@activity: HIV.B21 Offer prevention options
@description: Client had anaesthesia-related effects
*/
// TODO: Replace placeholder with relevant CQL logic
define "Anaesthesia-related effects":
  exists "Anaesthesia-related effects Condition"
    or exists "Anaesthesia-related effects Observation"
define "Anaesthesia-related effects Condition":
  [Condition: Concepts."Anaesthesia-related effects"]
define "Anaesthesia-related effects Observation":
  [Observation: Concepts."Anaesthesia-related effects"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Anaesthesia-related effects"
/* End of Anaesthesia-related effects */

/*
@dataElement: HIV.B.DE210 - Bleeding
@activity: HIV.B21 Offer prevention options
@description: Client had bleeding
*/
// TODO: Replace placeholder with relevant CQL logic
define "Bleeding":
  exists "Bleeding Condition"
    or exists "Bleeding Observation"
define "Bleeding Condition":
  [Condition: Concepts."Bleeding"]
define "Bleeding Observation":
  [Observation: Concepts."Bleeding"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Bleeding"
/* End of Bleeding */

/*
@dataElement: HIV.B.DE211 - Damage to the penis
@activity: HIV.B21 Offer prevention options
@description: Client had damage to the penis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Damage to the penis":
  exists "Damage to the penis Condition"
    or exists "Damage to the penis Observation"
define "Damage to the penis Condition":
  [Condition: Concepts."Damage to the penis"]
define "Damage to the penis Observation":
  [Observation: Concepts."Damage to the penis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Damage to the penis"
/* End of Damage to the penis */

/*
@dataElement: HIV.B.DE212 - Difficulty urinating
@activity: HIV.B21 Offer prevention options
@description: Client had difficulty urinating
*/
// TODO: Replace placeholder with relevant CQL logic
define "Difficulty urinating":
  exists "Difficulty urinating Condition"
    or exists "Difficulty urinating Observation"
define "Difficulty urinating Condition":
  [Condition: Concepts."Difficulty urinating"]
define "Difficulty urinating Observation":
  [Observation: Concepts."Difficulty urinating"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Difficulty urinating"
/* End of Difficulty urinating */

/*
@dataElement: HIV.B.DE213 - Excessive bleeding
@activity: HIV.B21 Offer prevention options
@description: Client experienced excessive bleeding
*/
// TODO: Replace placeholder with relevant CQL logic
define "Excessive bleeding":
  exists "Excessive bleeding Condition"
    or exists "Excessive bleeding Observation"
define "Excessive bleeding Condition":
  [Condition: Concepts."Excessive bleeding"]
define "Excessive bleeding Observation":
  [Observation: Concepts."Excessive bleeding"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Excessive bleeding"
/* End of Excessive bleeding */

/*
@dataElement: HIV.B.DE214 - Excessive skin removal
@activity: HIV.B21 Offer prevention options
@description: Client experienced excessive skin removal
*/
// TODO: Replace placeholder with relevant CQL logic
define "Excessive skin removal":
  exists "Excessive skin removal Condition"
    or exists "Excessive skin removal Observation"
define "Excessive skin removal Condition":
  [Condition: Concepts."Excessive skin removal"]
define "Excessive skin removal Observation":
  [Observation: Concepts."Excessive skin removal"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Excessive skin removal"
/* End of Excessive skin removal */

/*
@dataElement: HIV.B.DE215 - Excessive swelling
@activity: HIV.B21 Offer prevention options
@description: Client experienced excessive swelling
*/
// TODO: Replace placeholder with relevant CQL logic
define "Excessive swelling":
  exists "Excessive swelling Condition"
    or exists "Excessive swelling Observation"
define "Excessive swelling Condition":
  [Condition: Concepts."Excessive swelling"]
define "Excessive swelling Observation":
  [Observation: Concepts."Excessive swelling"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Excessive swelling"
/* End of Excessive swelling */

/*
@dataElement: HIV.B.DE216 - Haematoma
@activity: HIV.B21 Offer prevention options
@description: Client experienced haematoma
*/
// TODO: Replace placeholder with relevant CQL logic
define "Haematoma":
  exists "Haematoma Condition"
    or exists "Haematoma Observation"
define "Haematoma Condition":
  [Condition: Concepts."Haematoma"]
define "Haematoma Observation":
  [Observation: Concepts."Haematoma"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Haematoma"
/* End of Haematoma */

/*
@dataElement: HIV.B.DE217 - Infection
@activity: HIV.B21 Offer prevention options
@description: Client experienced infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Infection":
  exists "Infection Condition"
    or exists "Infection Observation"
define "Infection Condition":
  [Condition: Concepts."Infection"]
define "Infection Observation":
  [Observation: Concepts."Infection"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Infection"
/* End of Infection */

/*
@dataElement: HIV.B.DE218 - Injury to glans
@activity: HIV.B21 Offer prevention options
@description: Client experienced injury to glans
*/
// TODO: Replace placeholder with relevant CQL logic
define "Injury to glans":
  exists "Injury to glans Condition"
    or exists "Injury to glans Observation"
define "Injury to glans Condition":
  [Condition: Concepts."Injury to glans"]
define "Injury to glans Observation":
  [Observation: Concepts."Injury to glans"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Injury to glans"
/* End of Injury to glans */

/*
@dataElement: HIV.B.DE219 - Scar or disfigurement
@activity: HIV.B21 Offer prevention options
@description: Client experienced scar or disfigurement
*/
// TODO: Replace placeholder with relevant CQL logic
define "Scar or disfigurement":
  exists "Scar or disfigurement Condition"
    or exists "Scar or disfigurement Observation"
define "Scar or disfigurement Condition":
  [Condition: Concepts."Scar or disfigurement"]
define "Scar or disfigurement Observation":
  [Observation: Concepts."Scar or disfigurement"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Scar or disfigurement"
/* End of Scar or disfigurement */

/*
@dataElement: HIV.B.DE220 - Sharps injury to personnel
@activity: HIV.B21 Offer prevention options
@description: During VMMC procedure there was sharps injury to personnel
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sharps injury to personnel":
  exists "Sharps injury to personnel Condition"
    or exists "Sharps injury to personnel Observation"
define "Sharps injury to personnel Condition":
  [Condition: Concepts."Sharps injury to personnel"]
define "Sharps injury to personnel Observation":
  [Observation: Concepts."Sharps injury to personnel"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sharps injury to personnel"
/* End of Sharps injury to personnel */

/*
@dataElement: HIV.B.DE221 - Wound disruption
@activity: HIV.B21 Offer prevention options
@description: Client experienced wound disruption
*/
// TODO: Replace placeholder with relevant CQL logic
define "Wound disruption":
  exists "Wound disruption Condition"
    or exists "Wound disruption Observation"
define "Wound disruption Condition":
  [Condition: Concepts."Wound disruption"]
define "Wound disruption Observation":
  [Observation: Concepts."Wound disruption"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Wound disruption"
/* End of Wound disruption */

/*
@dataElement: HIV.B.DE222 - Other - HIV.B.DE222
@activity: HIV.B21 Offer prevention options
@description: Client experienced other adverse VMMC event
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.B.DE222":
  exists "Other - HIV.B.DE222 Condition"
    or exists "Other - HIV.B.DE222 Observation"
define "Other - HIV.B.DE222 Condition":
  [Condition: Concepts."Other - HIV.B.DE222"]
define "Other - HIV.B.DE222 Observation":
  [Observation: Concepts."Other - HIV.B.DE207"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.B.DE222"
/* End of Other - HIV.B.DE222 */

/*
@dataElement: HIV.B.DE224 - HIV retest prior to starting ART conducted
@activity: HIV.B20 Schedule retest
@description: HIV retest prior to starting ART conducted
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV retest prior to starting ART conducted":
  [Observation: Concepts."HIV retest prior to starting ART conducted"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV retest prior to starting ART conducted */

/*
@dataElement: HIV.B.DE225 - At elevated risk for HIV acquisition - HIV.B.DE225
@activity: HIV.B6 Capture or update client history
@description: Client is at elevated risk for HIV acquisition
*/
// TODO: Replace placeholder with relevant CQL logic
define "At elevated risk for HIV acquisition - HIV.B.DE225":
  [Observation: Concepts."At elevated risk for HIV acquisition - HIV.B.DE225"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of At elevated risk for HIV acquisition - HIV.B.DE225 */

/*
@dataElement: HIV.B.DE226 - Syndrome/STI diagnosed - HIV.B.DE226
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Syndrome or STI for which client is diagnosed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syndrome/STI diagnosed - HIV.B.DE226 Observation":
  [Observation: Concepts."Syndrome/STI diagnosed - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Syndrome/STI diagnosed - HIV.B.DE226 */

/*
@dataElement: HIV.B.DE227 - Urethral discharge syndrome - HIV.B.DE227
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Client diagnosed with urethral discharge syndrome
*/
// TODO: Replace placeholder with relevant CQL logic
define "Urethral discharge syndrome - HIV.B.DE227":
  exists "Urethral discharge syndrome - HIV.B.DE227 Condition"
    or exists "Urethral discharge syndrome - HIV.B.DE227 Observation"
define "Urethral discharge syndrome - HIV.B.DE227 Condition":
  [Condition: Concepts."Urethral discharge syndrome - HIV.B.DE227"]
define "Urethral discharge syndrome - HIV.B.DE227 Observation":
  [Observation: Concepts."Urethral discharge syndrome - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Urethral discharge syndrome - HIV.B.DE227"
/* End of Urethral discharge syndrome - HIV.B.DE227 */

/*
@dataElement: HIV.B.DE228 - Vaginal discharge syndrome - HIV.B.DE228
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Client diagnosed with vaginal discharge syndrome
*/
// TODO: Replace placeholder with relevant CQL logic
define "Vaginal discharge syndrome - HIV.B.DE228":
  exists "Vaginal discharge syndrome - HIV.B.DE228 Condition"
    or exists "Vaginal discharge syndrome - HIV.B.DE228 Observation"
define "Vaginal discharge syndrome - HIV.B.DE228 Condition":
  [Condition: Concepts."Vaginal discharge syndrome - HIV.B.DE228"]
define "Vaginal discharge syndrome - HIV.B.DE228 Observation":
  [Observation: Concepts."Vaginal discharge syndrome - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Vaginal discharge syndrome - HIV.B.DE228"
/* End of Vaginal discharge syndrome - HIV.B.DE228 */

/*
@dataElement: HIV.B.DE229 - Lower Abdominal pain  - HIV.B.DE229
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Client diagnosed with lower abdominal pain
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lower Abdominal pain  - HIV.B.DE229":
  exists "Lower Abdominal pain  - HIV.B.DE229 Condition"
    or exists "Lower Abdominal pain  - HIV.B.DE229 Observation"
define "Lower Abdominal pain  - HIV.B.DE229 Condition":
  [Condition: Concepts."Lower Abdominal pain  - HIV.B.DE229"]
define "Lower Abdominal pain  - HIV.B.DE229 Observation":
  [Observation: Concepts."Lower Abdominal pain  - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lower Abdominal pain  - HIV.B.DE229"
/* End of Lower Abdominal pain  - HIV.B.DE229 */

/*
@dataElement: HIV.B.DE230 - Genital ulcer disease syndrome - HIV.B.DE230
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Client diagnosed with genital ulcer disease syndrome
*/
// TODO: Replace placeholder with relevant CQL logic
define "Genital ulcer disease syndrome - HIV.B.DE230":
  exists "Genital ulcer disease syndrome - HIV.B.DE230 Condition"
    or exists "Genital ulcer disease syndrome - HIV.B.DE230 Observation"
define "Genital ulcer disease syndrome - HIV.B.DE230 Condition":
  [Condition: Concepts."Genital ulcer disease syndrome - HIV.B.DE230"]
define "Genital ulcer disease syndrome - HIV.B.DE230 Observation":
  [Observation: Concepts."Genital ulcer disease syndrome - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Genital ulcer disease syndrome - HIV.B.DE230"
/* End of Genital ulcer disease syndrome - HIV.B.DE230 */

/*
@dataElement: HIV.B.DE231 - Anorectal discharge - HIV.B.DE231
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Client diagnosed with anorectal discharge
*/
// TODO: Replace placeholder with relevant CQL logic
define "Anorectal discharge - HIV.B.DE231":
  exists "Anorectal discharge - HIV.B.DE231 Condition"
    or exists "Anorectal discharge - HIV.B.DE231 Observation"
define "Anorectal discharge - HIV.B.DE231 Condition":
  [Condition: Concepts."Anorectal discharge - HIV.B.DE231"]
define "Anorectal discharge - HIV.B.DE231 Observation":
  [Observation: Concepts."Anorectal discharge - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Anorectal discharge - HIV.B.DE231"
/* End of Anorectal discharge - HIV.B.DE231 */

/*
@dataElement: HIV.B.DE232 - Sent for testing - HIV.B.DE232
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Specimen sent for testing
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sent for testing - HIV.B.DE232":
  exists "Sent for testing - HIV.B.DE232 Condition"
    or exists "Sent for testing - HIV.B.DE232 Observation"
define "Sent for testing - HIV.B.DE232 Condition":
  [Condition: Concepts."Sent for testing - HIV.B.DE232"]
define "Sent for testing - HIV.B.DE232 Observation":
  [Observation: Concepts."Sent for testing - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sent for testing - HIV.B.DE232"
/* End of Sent for testing - HIV.B.DE232 */

/*
@dataElement: HIV.B.DE233 - Other - HIV.B.DE233
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Other syndrome/STI diagnosed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.B.DE233":
  exists "Other - HIV.B.DE233 Condition"
    or exists "Other - HIV.B.DE233 Observation"
define "Other - HIV.B.DE233 Condition":
  [Condition: Concepts."Other - HIV.B.DE233"]
define "Other - HIV.B.DE233 Observation":
  [Observation: Concepts."Other - HIV.B.DE226"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.B.DE233"
/* End of Other - HIV.B.DE233 */

/*
@dataElement: HIV.B.DE235 - Any STI syndrome diagnosed - HIV.B.DE235
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Was the client diagnosed with any of the five STI syndromes during this visit?
*/
// TODO: Replace placeholder with relevant CQL logic
define "Any STI syndrome diagnosed - HIV.B.DE235":
  [Observation: Concepts."Any STI syndrome diagnosed - HIV.B.DE235"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Any STI syndrome diagnosed - HIV.B.DE235 */

/*
@dataElement: HIV.B.DE249 - Syphilis test date - HIV.B.DE249
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Date of syphilis test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis test date - HIV.B.DE249":
  [Observation: Concepts."Syphilis test date - HIV.B.DE249"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Syphilis test date - HIV.B.DE249 */

/*
@dataElement: HIV.B.DE250 - Syphilis test result - HIV.B.DE250
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Result from syphilis test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis test result - HIV.B.DE250 Observation":
  [Observation: Concepts."Syphilis test result - HIV.B.DE250"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Syphilis test result - HIV.B.DE250 */

/*
@dataElement: HIV.B.DE251 - Positive - HIV.B.DE251
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Test result is positive for syphilis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.B.DE251":
  exists "Positive - HIV.B.DE251 Condition"
    or exists "Positive - HIV.B.DE251 Observation"
define "Positive - HIV.B.DE251 Condition":
  [Condition: Concepts."Positive - HIV.B.DE251"]
define "Positive - HIV.B.DE251 Observation":
  [Observation: Concepts."Positive - HIV.B.DE250"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.B.DE251"
/* End of Positive - HIV.B.DE251 */

/*
@dataElement: HIV.B.DE252 - Negative - HIV.B.DE252
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Test result is negative for syphilis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.B.DE252":
  exists "Negative - HIV.B.DE252 Condition"
    or exists "Negative - HIV.B.DE252 Observation"
define "Negative - HIV.B.DE252 Condition":
  [Condition: Concepts."Negative - HIV.B.DE252"]
define "Negative - HIV.B.DE252 Observation":
  [Observation: Concepts."Negative - HIV.B.DE250"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.B.DE252"
/* End of Negative - HIV.B.DE252 */

/*
@dataElement: HIV.B.DE253 - Inconclusive - HIV.B.DE253
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Test result is inconclusive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Inconclusive - HIV.B.DE253":
  exists "Inconclusive - HIV.B.DE253 Condition"
    or exists "Inconclusive - HIV.B.DE253 Observation"
define "Inconclusive - HIV.B.DE253 Condition":
  [Condition: Concepts."Inconclusive - HIV.B.DE253"]
define "Inconclusive - HIV.B.DE253 Observation":
  [Observation: Concepts."Inconclusive - HIV.B.DE250"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Inconclusive - HIV.B.DE253"
/* End of Inconclusive - HIV.B.DE253 */

/*
@dataElement: HIV.B.DE254 - Syphilis treatment start date - HIV.B.DE254
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Date of initiation of syphilis treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis treatment start date - HIV.B.DE254":
  [Observation: Concepts."Syphilis treatment start date - HIV.B.DE254"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Syphilis treatment start date - HIV.B.DE254 */

/*
@dataElement: HIV.B.DE255 - Gonorrhoea test date - HIV.B.DE255
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Date of Gonorrhoea test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gonorrhoea test date - HIV.B.DE255":
  [Observation: Concepts."Gonorrhoea test date - HIV.B.DE255"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Gonorrhoea test date - HIV.B.DE255 */

/*
@dataElement: HIV.B.DE256 - Gonorrhoea test result - HIV.B.DE256
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Result from Gonorrhoea test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gonorrhoea test result - HIV.B.DE256 Observation":
  [Observation: Concepts."Gonorrhoea test result - HIV.B.DE256"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Gonorrhoea test result - HIV.B.DE256 */

/*
@dataElement: HIV.B.DE257 - Positive - HIV.B.DE257
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Test result is positive for Neisseria gonorrhoeae
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.B.DE257":
  exists "Positive - HIV.B.DE257 Condition"
    or exists "Positive - HIV.B.DE257 Observation"
define "Positive - HIV.B.DE257 Condition":
  [Condition: Concepts."Positive - HIV.B.DE257"]
define "Positive - HIV.B.DE257 Observation":
  [Observation: Concepts."Positive - HIV.B.DE256"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.B.DE257"
/* End of Positive - HIV.B.DE257 */

/*
@dataElement: HIV.B.DE258 - Negative - HIV.B.DE258
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Test result is negative for Neisseria gonorrhoeae
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.B.DE258":
  exists "Negative - HIV.B.DE258 Condition"
    or exists "Negative - HIV.B.DE258 Observation"
define "Negative - HIV.B.DE258 Condition":
  [Condition: Concepts."Negative - HIV.B.DE258"]
define "Negative - HIV.B.DE258 Observation":
  [Observation: Concepts."Negative - HIV.B.DE256"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.B.DE258"
/* End of Negative - HIV.B.DE258 */

/*
@dataElement: HIV.B.DE259 - Inconclusive - HIV.B.DE259
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Test result is inconclusive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Inconclusive - HIV.B.DE259":
  exists "Inconclusive - HIV.B.DE259 Condition"
    or exists "Inconclusive - HIV.B.DE259 Observation"
define "Inconclusive - HIV.B.DE259 Condition":
  [Condition: Concepts."Inconclusive - HIV.B.DE259"]
define "Inconclusive - HIV.B.DE259 Observation":
  [Observation: Concepts."Inconclusive - HIV.B.DE256"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Inconclusive - HIV.B.DE259"
/* End of Inconclusive - HIV.B.DE259 */

/*
@dataElement: HIV.B.DE260 - Gonorrhoea treatment start date - HIV.B.DE260
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Date of initiation of Gonorrhoea treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gonorrhoea treatment start date - HIV.B.DE260":
  [Observation: Concepts."Gonorrhoea treatment start date - HIV.B.DE260"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Gonorrhoea treatment start date - HIV.B.DE260 */

/*
@dataElement: HIV.B.DE261 - Type of specimen - HIV.B.DE261
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Type of specimen to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of specimen - HIV.B.DE261 Observation":
  [Observation: Concepts."Type of specimen - HIV.B.DE261"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of specimen - HIV.B.DE261 */

/*
@dataElement: HIV.B.DE262 - Blood - HIV.B.DE262
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Blood specimen to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Blood - HIV.B.DE262":
  exists "Blood - HIV.B.DE262 Condition"
    or exists "Blood - HIV.B.DE262 Observation"
define "Blood - HIV.B.DE262 Condition":
  [Condition: Concepts."Blood - HIV.B.DE262"]
define "Blood - HIV.B.DE262 Observation":
  [Observation: Concepts."Blood - HIV.B.DE261"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Blood - HIV.B.DE262"
/* End of Blood - HIV.B.DE262 */

/*
@dataElement: HIV.B.DE263 - Urine - HIV.B.DE263
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Urine specimen to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Urine - HIV.B.DE263":
  exists "Urine - HIV.B.DE263 Condition"
    or exists "Urine - HIV.B.DE263 Observation"
define "Urine - HIV.B.DE263 Condition":
  [Condition: Concepts."Urine - HIV.B.DE263"]
define "Urine - HIV.B.DE263 Observation":
  [Observation: Concepts."Urine - HIV.B.DE261"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Urine - HIV.B.DE263"
/* End of Urine - HIV.B.DE263 */

/*
@dataElement: HIV.B.DE264 - Cervical or vaginal swab - HIV.B.DE264
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Cervical or vaginal swab to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical or vaginal swab - HIV.B.DE264":
  exists "Cervical or vaginal swab - HIV.B.DE264 Condition"
    or exists "Cervical or vaginal swab - HIV.B.DE264 Observation"
define "Cervical or vaginal swab - HIV.B.DE264 Condition":
  [Condition: Concepts."Cervical or vaginal swab - HIV.B.DE264"]
define "Cervical or vaginal swab - HIV.B.DE264 Observation":
  [Observation: Concepts."Cervical or vaginal swab - HIV.B.DE261"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cervical or vaginal swab - HIV.B.DE264"
/* End of Cervical or vaginal swab - HIV.B.DE264 */

/*
@dataElement: HIV.B.DE265 - Urethral or penile swab - HIV.B.DE265
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Urethral or penile swab to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Urethral or penile swab - HIV.B.DE265":
  exists "Urethral or penile swab - HIV.B.DE265 Condition"
    or exists "Urethral or penile swab - HIV.B.DE265 Observation"
define "Urethral or penile swab - HIV.B.DE265 Condition":
  [Condition: Concepts."Urethral or penile swab - HIV.B.DE265"]
define "Urethral or penile swab - HIV.B.DE265 Observation":
  [Observation: Concepts."Urethral or penile swab - HIV.B.DE261"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Urethral or penile swab - HIV.B.DE265"
/* End of Urethral or penile swab - HIV.B.DE265 */

/*
@dataElement: HIV.B.DE266 - Rectal swab - HIV.B.DE266
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Rectal swab to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Rectal swab - HIV.B.DE266":
  exists "Rectal swab - HIV.B.DE266 Condition"
    or exists "Rectal swab - HIV.B.DE266 Observation"
define "Rectal swab - HIV.B.DE266 Condition":
  [Condition: Concepts."Rectal swab - HIV.B.DE266"]
define "Rectal swab - HIV.B.DE266 Observation":
  [Observation: Concepts."Rectal swab - HIV.B.DE261"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Rectal swab - HIV.B.DE266"
/* End of Rectal swab - HIV.B.DE266 */

/*
@dataElement: HIV.B.DE267 - Other - HIV.B.DE267
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Other specimen type to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.B.DE267":
  exists "Other - HIV.B.DE267 Condition"
    or exists "Other - HIV.B.DE267 Observation"
define "Other - HIV.B.DE267 Condition":
  [Condition: Concepts."Other - HIV.B.DE267"]
define "Other - HIV.B.DE267 Observation":
  [Observation: Concepts."Other - HIV.B.DE261"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.B.DE267"
/* End of Other - HIV.B.DE267 */

/*
@dataElement: HIV.B.DE276 - Neisseria gonorrhoeae test type - HIV.B.DE276
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Type of diagnostic test used for Neisseria gonorrhoeae
*/
// TODO: Replace placeholder with relevant CQL logic
define "Neisseria gonorrhoeae test type - HIV.B.DE276 Observation":
  [Observation: Concepts."Neisseria gonorrhoeae test type - HIV.B.DE276"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Neisseria gonorrhoeae test type - HIV.B.DE276 */

/*
@dataElement: HIV.B.DE277 - NAAT - HIV.B.DE277
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Nucleic Acid Amplification Test (NAAT) used
*/
// TODO: Replace placeholder with relevant CQL logic
define "NAAT - HIV.B.DE277":
  exists "NAAT - HIV.B.DE277 Condition"
    or exists "NAAT - HIV.B.DE277 Observation"
define "NAAT - HIV.B.DE277 Condition":
  [Condition: Concepts."NAAT - HIV.B.DE277"]
define "NAAT - HIV.B.DE277 Observation":
  [Observation: Concepts."NAAT - HIV.B.DE276"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."NAAT - HIV.B.DE277"
/* End of NAAT - HIV.B.DE277 */

/*
@dataElement: HIV.B.DE278 - POC Test - HIV.B.DE278
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Point-of-care (POC) test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "POC Test - HIV.B.DE278":
  exists "POC Test - HIV.B.DE278 Condition"
    or exists "POC Test - HIV.B.DE278 Observation"
define "POC Test - HIV.B.DE278 Condition":
  [Condition: Concepts."POC Test - HIV.B.DE278"]
define "POC Test - HIV.B.DE278 Observation":
  [Observation: Concepts."POC Test - HIV.B.DE276"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."POC Test - HIV.B.DE278"
/* End of POC Test - HIV.B.DE278 */

/*
@dataElement: HIV.B.DE279 - Culture - HIV.B.DE279
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Culture test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "Culture - HIV.B.DE279":
  exists "Culture - HIV.B.DE279 Condition"
    or exists "Culture - HIV.B.DE279 Observation"
define "Culture - HIV.B.DE279 Condition":
  [Condition: Concepts."Culture - HIV.B.DE279"]
define "Culture - HIV.B.DE279 Observation":
  [Observation: Concepts."Culture - HIV.B.DE276"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Culture - HIV.B.DE279"
/* End of Culture - HIV.B.DE279 */

/*
@dataElement: HIV.B.DE280 - Microscopy - HIV.B.DE280
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Microscopy test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "Microscopy - HIV.B.DE280":
  exists "Microscopy - HIV.B.DE280 Condition"
    or exists "Microscopy - HIV.B.DE280 Observation"
define "Microscopy - HIV.B.DE280 Condition":
  [Condition: Concepts."Microscopy - HIV.B.DE280"]
define "Microscopy - HIV.B.DE280 Observation":
  [Observation: Concepts."Microscopy - HIV.B.DE276"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Microscopy - HIV.B.DE280"
/* End of Microscopy - HIV.B.DE280 */

/*
@dataElement: HIV.B.DE281 - Other - HIV.B.DE281
@activity: HIV.B23 Offer sexual and reproductive health services
@description: Other type of test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.B.DE281":
  exists "Other - HIV.B.DE281 Condition"
    or exists "Other - HIV.B.DE281 Observation"
define "Other - HIV.B.DE281 Condition":
  [Condition: Concepts."Other - HIV.B.DE281"]
define "Other - HIV.B.DE281 Observation":
  [Observation: Concepts."Other - HIV.B.DE276"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.B.DE281"
/* End of Other - HIV.B.DE281 */

/*
@dataElement: HIV.C.DE9 - Date/time of suspected exposure to HIV - HIV.C.DE9
@activity: HIV.C3 Capture or update client history
@description: When the suspect exposure to HIV took place
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date/time of suspected exposure to HIV - HIV.C.DE9":
  [Observation: Concepts."Date/time of suspected exposure to HIV - HIV.C.DE9"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date/time of suspected exposure to HIV - HIV.C.DE9 */

/*
@dataElement: HIV.C.DE10 - Currently on PrEP
@activity: HIV.C3 Capture or update client history
@description: The client is currently taking PrEP. Oral pre-exposure prophylaxis (PrEP) of HIV is the use of ARV drugs by people who are not infected with HIV to block the acquisition of HIV.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Currently on PrEP":
  [Observation: Concepts."Currently on PrEP"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Currently on PrEP */

/*
@dataElement: HIV.C.DE11 - PrEP dosing type
@activity: HIV.C3 Capture or update client history
@description: Way in which pre-exposure prophylaxis (PrEP) is taken (daily or event-driven)
*/
// TODO: Replace placeholder with relevant CQL logic
define "PrEP dosing type Observation":
  [Observation: Concepts."PrEP dosing type"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of PrEP dosing type */

/*
@dataElement: HIV.C.DE12 - Daily oral PrEP
@activity: HIV.C3 Capture or update client history
@description: Pre-exposure prophylaxis (PrEP) is taken every day
*/
// TODO: Replace placeholder with relevant CQL logic
define "Daily oral PrEP":
  exists "Daily oral PrEP Condition"
    or exists "Daily oral PrEP Observation"
define "Daily oral PrEP Condition":
  [Condition: Concepts."Daily oral PrEP"]
define "Daily oral PrEP Observation":
  [Observation: Concepts."Daily oral PrEP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Daily oral PrEP"
/* End of Daily oral PrEP */

/*
@dataElement: HIV.C.DE13 - Event-driven PrEP 2+1+1
@activity: HIV.C3 Capture or update client history
@description: Event-driven pre-exposure prophylaxis (PrEP) is taken on an even-driven basis (2+1+1)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Event-driven PrEP 2+1+1":
  exists "Event-driven PrEP 2+1+1 Condition"
    or exists "Event-driven PrEP 2+1+1 Observation"
define "Event-driven PrEP 2+1+1 Condition":
  [Condition: Concepts."Event-driven PrEP 2+1+1"]
define "Event-driven PrEP 2+1+1 Observation":
  [Observation: Concepts."Event-driven PrEP 2+1+1"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Event-driven PrEP 2+1+1"
/* End of Event-driven PrEP 2+1+1 */

/*
@dataElement: HIV.C.DE14 - Other PrEP dosing type
@activity: HIV.C3 Capture or update client history
@description: Other PrEP dosing type
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other PrEP dosing type":
  exists "Other PrEP dosing type Condition"
    or exists "Other PrEP dosing type Observation"
define "Other PrEP dosing type Condition":
  [Condition: Concepts."Other PrEP dosing type"]
define "Other PrEP dosing type Observation":
  [Observation: Concepts."Other PrEP dosing type"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other PrEP dosing type"
/* End of Other PrEP dosing type */

/*
@dataElement: HIV.C.DE17 - Current PrEP regimen
@activity: HIV.C3 Capture or update client history
@description: HIV pre-exposure prophylaxis (PrEP) regimen
*/
// TODO: Replace placeholder with relevant CQL logic
define "Current PrEP regimen Observation":
  [Observation: Concepts."Current PrEP regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Current PrEP regimen */

/*
@dataElement: HIV.C.DE18 - TDF + FTC - HIV.C.DE18
@activity: HIV.C3 Capture or update client history
@description: Treated with tenofovir disoproxil fumarate (TDF) and emtricitabine (FTC) pre-exposure prophylaxis (PrEP) regimen (oral PrEP)
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF + FTC - HIV.C.DE18":
  exists "TDF + FTC - HIV.C.DE18 Condition"
    or exists "TDF + FTC - HIV.C.DE18 Observation"
define "TDF + FTC - HIV.C.DE18 Condition":
  [Condition: Concepts."TDF + FTC - HIV.C.DE18"]
define "TDF + FTC - HIV.C.DE18 Observation":
  [Observation: Concepts."TDF + FTC - HIV.C.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF + FTC - HIV.C.DE18"
/* End of TDF + FTC - HIV.C.DE18 */

/*
@dataElement: HIV.C.DE19 - TDF - HIV.C.DE19
@activity: HIV.C3 Capture or update client history
@description: Treated with single-agent tenofovir disoproxil fumarate (TDF) pre-exposure prophylaxis (PrEP) regimen (oral PrEP)
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF - HIV.C.DE19":
  exists "TDF - HIV.C.DE19 Condition"
    or exists "TDF - HIV.C.DE19 Observation"
define "TDF - HIV.C.DE19 Condition":
  [Condition: Concepts."TDF - HIV.C.DE19"]
define "TDF - HIV.C.DE19 Observation":
  [Observation: Concepts."TDF - HIV.C.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF - HIV.C.DE19"
/* End of TDF - HIV.C.DE19 */

/*
@dataElement: HIV.C.DE20 - TDF + 3TC - HIV.C.DE20
@activity: HIV.C3 Capture or update client history
@description: Treated with tenofovir disoproxil fumarate (TDF) and lamivudine (3TC) pre-exposure prophylaxis (PrEP) regimen (oral PrEP)
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF + 3TC - HIV.C.DE20":
  exists "TDF + 3TC - HIV.C.DE20 Condition"
    or exists "TDF + 3TC - HIV.C.DE20 Observation"
define "TDF + 3TC - HIV.C.DE20 Condition":
  [Condition: Concepts."TDF + 3TC - HIV.C.DE20"]
define "TDF + 3TC - HIV.C.DE20 Observation":
  [Observation: Concepts."TDF + 3TC - HIV.C.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF + 3TC - HIV.C.DE20"
/* End of TDF + 3TC - HIV.C.DE20 */

/*
@dataElement: HIV.C.DE21 - Other TDF-based regimen
@activity: HIV.C3 Capture or update client history
@description: Treated with other tenofovir disoproxil fumarate (TDF)-based regimen (oral PrEP)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other TDF-based regimen":
  exists "Other TDF-based regimen Condition"
    or exists "Other TDF-based regimen Observation"
define "Other TDF-based regimen Condition":
  [Condition: Concepts."Other TDF-based regimen"]
define "Other TDF-based regimen Observation":
  [Observation: Concepts."Other TDF-based regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other TDF-based regimen"
/* End of Other TDF-based regimen */

/*
@dataElement: HIV.C.DE22 - Dapivirine vaginal ring DVR - HIV.C.DE22
@activity: HIV.C3 Capture or update client history
@description: Dapivirine vaginal ring (DVR) for HIV prevention
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dapivirine vaginal ring DVR - HIV.C.DE22":
  exists "Dapivirine vaginal ring DVR - HIV.C.DE22 Condition"
    or exists "Dapivirine vaginal ring DVR - HIV.C.DE22 Observation"
define "Dapivirine vaginal ring DVR - HIV.C.DE22 Condition":
  [Condition: Concepts."Dapivirine vaginal ring DVR - HIV.C.DE22"]
define "Dapivirine vaginal ring DVR - HIV.C.DE22 Observation":
  [Observation: Concepts."Dapivirine vaginal ring DVR - HIV.C.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Dapivirine vaginal ring DVR - HIV.C.DE22"
/* End of Dapivirine vaginal ring DVR - HIV.C.DE22 */

/*
@dataElement: HIV.C.DE23 - CAB-LA - HIV.C.DE23
@activity: HIV.C3 Capture or update client history
@description: Long-acting injectable cabotegravir
*/
// TODO: Replace placeholder with relevant CQL logic
define "CAB-LA - HIV.C.DE23":
  exists "CAB-LA - HIV.C.DE23 Condition"
    or exists "CAB-LA - HIV.C.DE23 Observation"
define "CAB-LA - HIV.C.DE23 Condition":
  [Condition: Concepts."CAB-LA - HIV.C.DE23"]
define "CAB-LA - HIV.C.DE23 Observation":
  [Observation: Concepts."CAB-LA - HIV.C.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."CAB-LA - HIV.C.DE23"
/* End of CAB-LA - HIV.C.DE23 */

/*
@dataElement: HIV.C.DE24 - Experience with PrEP
@activity: HIV.C3 Capture or update client history
@description: The client's experience in taking PrEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Experience with PrEP Observation":
  [Observation: Concepts."Experience with PrEP"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Experience with PrEP */

/*
@dataElement: HIV.C.DE25 - First-time user - HIV.C.DE25
@activity: HIV.C3 Capture or update client history
@description: The client has never used pre-exposure prophylaxis (PrEP) before (naive)
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-time user - HIV.C.DE25":
  exists "First-time user - HIV.C.DE25 Condition"
    or exists "First-time user - HIV.C.DE25 Observation"
define "First-time user - HIV.C.DE25 Condition":
  [Condition: Concepts."First-time user - HIV.C.DE25"]
define "First-time user - HIV.C.DE25 Observation":
  [Observation: Concepts."First-time user - HIV.C.DE24"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First-time user - HIV.C.DE25"
/* End of First-time user - HIV.C.DE25 */

/*
@dataElement: HIV.C.DE26 - Continuing user
@activity: HIV.C3 Capture or update client history
@description: The client has used PrEP before and is continuing to use PrEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Continuing user":
  exists "Continuing user Condition"
    or exists "Continuing user Observation"
define "Continuing user Condition":
  [Condition: Concepts."Continuing user"]
define "Continuing user Observation":
  [Observation: Concepts."Continuing user"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Continuing user"
/* End of Continuing user */

/*
@dataElement: HIV.C.DE27 - Restarting following a period of not taking PrEP
@activity: HIV.C3 Capture or update client history
@description: The client is restarting PrEP following a period of not taking PrEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Restarting following a period of not taking PrEP":
  exists "Restarting following a period of not taking PrEP Condition"
    or exists "Restarting following a period of not taking PrEP Observation"
define "Restarting following a period of not taking PrEP Condition":
  [Condition: Concepts."Restarting following a period of not taking PrEP"]
define "Restarting following a period of not taking PrEP Observation":
  [Observation: Concepts."Restarting following a period of not taking PrEP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Restarting following a period of not taking PrEP"
/* End of Restarting following a period of not taking PrEP */

/*
@dataElement: HIV.C.DE31 - PEP history
@activity: HIV.C3 Capture or update client history
@description: The client's history in taking post-exposure prophylaxis (PEP) for HIV prevention
*/
// TODO: Replace placeholder with relevant CQL logic
define "PEP history Observation":
  [Observation: Concepts."PEP history"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of PEP history */

/*
@dataElement: HIV.C.DE32 - First-time user - HIV.C.DE32
@activity: HIV.C3 Capture or update client history
@description: The client has never used post-exposure prophylaxis (PEP) before
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-time user - HIV.C.DE32":
  exists "First-time user - HIV.C.DE32 Condition"
    or exists "First-time user - HIV.C.DE32 Observation"
define "First-time user - HIV.C.DE32 Condition":
  [Condition: Concepts."First-time user - HIV.C.DE32"]
define "First-time user - HIV.C.DE32 Observation":
  [Observation: Concepts."First-time user - HIV.C.DE31"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First-time user - HIV.C.DE32"
/* End of First-time user - HIV.C.DE32 */

/*
@dataElement: HIV.C.DE33 - Repeat user
@activity: HIV.C3 Capture or update client history
@description: The client has used post-exposure prophylaxis (PEP) before
*/
// TODO: Replace placeholder with relevant CQL logic
define "Repeat user":
  exists "Repeat user Condition"
    or exists "Repeat user Observation"
define "Repeat user Condition":
  [Condition: Concepts."Repeat user"]
define "Repeat user Observation":
  [Observation: Concepts."Repeat user"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Repeat user"
/* End of Repeat user */

/*
@dataElement: HIV.C.DE35 - Date client completes PEP course
@activity: HIV.C3 Capture or update client history
@description: Date client completes PEP course
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date client completes PEP course":
  [Observation: Concepts."Date client completes PEP course"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date client completes PEP course */

/*
@dataElement: HIV.C.DE36 - Signs of substantial risk of HIV infection - HIV.C.DE36
@activity: HIV.C3 Capture or update client history
@description: Signs the client is at a substantial risk of HIV infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Signs of substantial risk of HIV infection - HIV.C.DE36 Observation":
  [Observation: Concepts."Signs of substantial risk of HIV infection - HIV.C.DE36"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Signs of substantial risk of HIV infection - HIV.C.DE36 */

/*
@dataElement: HIV.C.DE37 - No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37
@activity: HIV.C3 Capture or update client history
@description: Recent vaginal or anal sexual intercourse without a condom with more than one partner
*/
// TODO: Replace placeholder with relevant CQL logic
define "No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37":
  exists "No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37 Condition"
    or exists "No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37 Observation"
define "No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37 Condition":
  [Condition: Concepts."No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37"]
define "No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37 Observation":
  [Observation: Concepts."No condom use during sex with more than one partner in the past 6 months - HIV.C.DE36"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37"
/* End of No condom use during sex with more than one partner in the past 6 months - HIV.C.DE37 */

/*
@dataElement: HIV.C.DE38 - STI in the past 6 months - HIV.C.DE38
@activity: HIV.C3 Capture or update client history
@description: A recent history (in the last 6 months) of a sexually transmitted infection (STI ) by laboratory testing, self-report or syndromic STI treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "STI in the past 6 months - HIV.C.DE38":
  exists "STI in the past 6 months - HIV.C.DE38 Condition"
    or exists "STI in the past 6 months - HIV.C.DE38 Observation"
define "STI in the past 6 months - HIV.C.DE38 Condition":
  [Condition: Concepts."STI in the past 6 months - HIV.C.DE38"]
define "STI in the past 6 months - HIV.C.DE38 Observation":
  [Observation: Concepts."STI in the past 6 months - HIV.C.DE36"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."STI in the past 6 months - HIV.C.DE38"
/* End of STI in the past 6 months - HIV.C.DE38 */

/*
@dataElement: HIV.C.DE39 - A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39
@activity: HIV.C3 Capture or update client history
@description: A recent sex partner of the client had HIV risk factors
*/
// TODO: Replace placeholder with relevant CQL logic
define "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39":
  exists "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39 Condition"
    or exists "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39 Observation"
define "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39 Condition":
  [Condition: Concepts."A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39"]
define "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39 Observation":
  [Observation: Concepts."A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE36"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39"
/* End of A sexual partner in the past 6 months had one or more HIV risk factors - HIV.C.DE39 */

/*
@dataElement: HIV.C.DE40 - PrEP requested by client - HIV.C.DE40
@activity: HIV.C3 Capture or update client history
@description: Client is requesting PrEP, reflecting a decision-making process has already taken place and suggesting of substantial risk of HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "PrEP requested by client - HIV.C.DE40":
  exists "PrEP requested by client - HIV.C.DE40 Condition"
    or exists "PrEP requested by client - HIV.C.DE40 Observation"
define "PrEP requested by client - HIV.C.DE40 Condition":
  [Condition: Concepts."PrEP requested by client - HIV.C.DE40"]
define "PrEP requested by client - HIV.C.DE40 Observation":
  [Observation: Concepts."PrEP requested by client - HIV.C.DE36"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."PrEP requested by client - HIV.C.DE40"
/* End of PrEP requested by client - HIV.C.DE40 */

/*
@dataElement: HIV.C.DE46 - Acute HIV infection symptoms - HIV.C.DE46
@activity: HIV.C3 Capture or update client history
@description: Symptoms that could suggest an acute HIV infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Acute HIV infection symptoms - HIV.C.DE46 Observation":
  [Observation: Concepts."Acute HIV infection symptoms - HIV.C.DE46"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Acute HIV infection symptoms - HIV.C.DE46 */

/*
@dataElement: HIV.C.DE47 - Fever
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include a fever
*/
// TODO: Replace placeholder with relevant CQL logic
define "Fever":
  exists "Fever Condition"
    or exists "Fever Observation"
define "Fever Condition":
  [Condition: Concepts."Fever"]
define "Fever Observation":
  [Observation: Concepts."Fever"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Fever"
/* End of Fever */

/*
@dataElement: HIV.C.DE48 - Sore throat
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include a sore throat
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sore throat":
  exists "Sore throat Condition"
    or exists "Sore throat Observation"
define "Sore throat Condition":
  [Condition: Concepts."Sore throat"]
define "Sore throat Observation":
  [Observation: Concepts."Sore throat"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sore throat"
/* End of Sore throat */

/*
@dataElement: HIV.C.DE49 - Aches
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include aches
*/
// TODO: Replace placeholder with relevant CQL logic
define "Aches":
  exists "Aches Condition"
    or exists "Aches Observation"
define "Aches Condition":
  [Condition: Concepts."Aches"]
define "Aches Observation":
  [Observation: Concepts."Aches"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Aches"
/* End of Aches */

/*
@dataElement: HIV.C.DE50 - Pains
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include pains
*/
// TODO: Replace placeholder with relevant CQL logic
define "Pains":
  exists "Pains Condition"
    or exists "Pains Observation"
define "Pains Condition":
  [Condition: Concepts."Pains"]
define "Pains Observation":
  [Observation: Concepts."Pains"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Pains"
/* End of Pains */

/*
@dataElement: HIV.C.DE51 - Swollen glands
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include swollen glands
*/
// TODO: Replace placeholder with relevant CQL logic
define "Swollen glands":
  exists "Swollen glands Condition"
    or exists "Swollen glands Observation"
define "Swollen glands Condition":
  [Condition: Concepts."Swollen glands"]
define "Swollen glands Observation":
  [Observation: Concepts."Swollen glands"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Swollen glands"
/* End of Swollen glands */

/*
@dataElement: HIV.C.DE52 - Mouth sores
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include a mouth sores
*/
// TODO: Replace placeholder with relevant CQL logic
define "Mouth sores":
  exists "Mouth sores Condition"
    or exists "Mouth sores Observation"
define "Mouth sores Condition":
  [Condition: Concepts."Mouth sores"]
define "Mouth sores Observation":
  [Observation: Concepts."Mouth sores"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Mouth sores"
/* End of Mouth sores */

/*
@dataElement: HIV.C.DE53 - Headaches
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include a headaches
*/
// TODO: Replace placeholder with relevant CQL logic
define "Headaches":
  exists "Headaches Condition"
    or exists "Headaches Observation"
define "Headaches Condition":
  [Condition: Concepts."Headaches"]
define "Headaches Observation":
  [Observation: Concepts."Headaches"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Headaches"
/* End of Headaches */

/*
@dataElement: HIV.C.DE54 - Rash
@activity: HIV.C3 Capture or update client history
@description: Client's symptoms include a rash
*/
// TODO: Replace placeholder with relevant CQL logic
define "Rash":
  exists "Rash Condition"
    or exists "Rash Observation"
define "Rash Condition":
  [Condition: Concepts."Rash"]
define "Rash Observation":
  [Observation: Concepts."Rash"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Rash"
/* End of Rash */

/*
@dataElement: HIV.C.DE55 - Sex partners HIV treatment status
@activity: HIV.C3 Capture or update client history
@description: Treatment adherence of client's sex partner for partners that are HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sex partners HIV treatment status Observation":
  [Observation: Concepts."Sex partners HIV treatment status"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Sex partners HIV treatment status */

/*
@dataElement: HIV.C.DE56 - Not on ART
@activity: HIV.C3 Capture or update client history
@description: Sex partner is HIV-positive and not on ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Not on ART":
  exists "Not on ART Condition"
    or exists "Not on ART Observation"
define "Not on ART Condition":
  [Condition: Concepts."Not on ART"]
define "Not on ART Observation":
  [Observation: Concepts."Not on ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Not on ART"
/* End of Not on ART */

/*
@dataElement: HIV.C.DE57 - On ART less than 6 months
@activity: HIV.C3 Capture or update client history
@description: Sex partner is HIV-positive and is on ART less than 6 months. ART may take up to 6 months to suppress viral load. In studies of serodiscordant couples, pre-exposure prophylaxis (PrEP) has provided a useful bridge to full viral suppression by the partner during that time.
*/
// TODO: Replace placeholder with relevant CQL logic
define "On ART less than 6 months":
  exists "On ART less than 6 months Condition"
    or exists "On ART less than 6 months Observation"
define "On ART less than 6 months Condition":
  [Condition: Concepts."On ART less than 6 months"]
define "On ART less than 6 months Observation":
  [Observation: Concepts."On ART less than 6 months"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."On ART less than 6 months"
/* End of On ART less than 6 months */

/*
@dataElement: HIV.C.DE58 - Partner has suspected low adherence to ART
@activity: HIV.C3 Capture or update client history
@description: Sex partner is HIV-positive and is suspected to have low adherence to ART. There have been gaps in the partner's treatment adherence or the couple is not communicating openly about treatment adherence and viral load test results.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Partner has suspected low adherence to ART":
  exists "Partner has suspected low adherence to ART Condition"
    or exists "Partner has suspected low adherence to ART Observation"
define "Partner has suspected low adherence to ART Condition":
  [Condition: Concepts."Partner has suspected low adherence to ART"]
define "Partner has suspected low adherence to ART Observation":
  [Observation: Concepts."Partner has suspected low adherence to ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Partner has suspected low adherence to ART"
/* End of Partner has suspected low adherence to ART */

/*
@dataElement: HIV.C.DE59 - Partner is not virally suppressed
@activity: HIV.C3 Capture or update client history
@description: Sex partner is HIV-positive and not virally suppressed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Partner is not virally suppressed":
  exists "Partner is not virally suppressed Condition"
    or exists "Partner is not virally suppressed Observation"
define "Partner is not virally suppressed Condition":
  [Condition: Concepts."Partner is not virally suppressed"]
define "Partner is not virally suppressed Observation":
  [Observation: Concepts."Partner is not virally suppressed"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Partner is not virally suppressed"
/* End of Partner is not virally suppressed */

/*
@dataElement: HIV.C.DE60 - Partner is virally suppressed and has been on ART for 6 months or more
@activity: HIV.C3 Capture or update client history
@description: Sex partner is HIV-positive and virally suppressed with 6 months or more on ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Partner is virally suppressed and has been on ART for 6 months or more":
  exists "Partner is virally suppressed and has been on ART for 6 months or more Condition"
    or exists "Partner is virally suppressed and has been on ART for 6 months or more Observation"
define "Partner is virally suppressed and has been on ART for 6 months or more Condition":
  [Condition: Concepts."Partner is virally suppressed and has been on ART for 6 months or more"]
define "Partner is virally suppressed and has been on ART for 6 months or more Observation":
  [Observation: Concepts."Partner is virally suppressed and has been on ART for 6 months or more"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Partner is virally suppressed and has been on ART for 6 months or more"
/* End of Partner is virally suppressed and has been on ART for 6 months or more */

/*
@dataElement: HIV.C.DE61 - Suitable for PrEP
@activity: HIV.C8 Suitable for PrEP or PEP?
@description: The client is suitable for PrEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Suitable for PrEP":
  [Observation: Concepts."Suitable for PrEP"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Suitable for PrEP */

/*
@dataElement: HIV.C.DE74 - Date medications prescribed - HIV.C.DE74
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Date the client was prescribed medications
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date medications prescribed - HIV.C.DE74":
  [Observation: Concepts."Date medications prescribed - HIV.C.DE74"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date medications prescribed - HIV.C.DE74 */

/*
@dataElement: HIV.C.DE75 - Medications prescribed - HIV.C.DE75
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Medications the client was prescribed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Medications prescribed - HIV.C.DE75 Observation":
  [Observation: Concepts."Medications prescribed - HIV.C.DE75"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Medications prescribed - HIV.C.DE75 */

/*
@dataElement: HIV.C.DE76 - PrEP for HIV prevention
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client was prescribed pre-exposure prophylaxis (PrEP) for HIV prevention
*/
// TODO: Replace placeholder with relevant CQL logic
define "PrEP for HIV prevention":
  exists "PrEP for HIV prevention Condition"
    or exists "PrEP for HIV prevention Observation"
define "PrEP for HIV prevention Condition":
  [Condition: Concepts."PrEP for HIV prevention"]
define "PrEP for HIV prevention Observation":
  [Observation: Concepts."PrEP for HIV prevention"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."PrEP for HIV prevention"
/* End of PrEP for HIV prevention */

/*
@dataElement: HIV.C.DE77 - PEP for HIV prevention
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client was prescribed post-exposure prophylaxis (PEP) for HIV prevention
*/
// TODO: Replace placeholder with relevant CQL logic
define "PEP for HIV prevention":
  exists "PEP for HIV prevention Condition"
    or exists "PEP for HIV prevention Observation"
define "PEP for HIV prevention Condition":
  [Condition: Concepts."PEP for HIV prevention"]
define "PEP for HIV prevention Observation":
  [Observation: Concepts."PEP for HIV prevention"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."PEP for HIV prevention"
/* End of PEP for HIV prevention */

/*
@dataElement: HIV.C.DE78 - Other - HIV.C.DE78
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client was prescribed other medications
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.C.DE78":
  exists "Other - HIV.C.DE78 Condition"
    or exists "Other - HIV.C.DE78 Observation"
define "Other - HIV.C.DE78 Condition":
  [Condition: Concepts."Other - HIV.C.DE78"]
define "Other - HIV.C.DE78 Observation":
  [Observation: Concepts."Other - HIV.C.DE75"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.C.DE78"
/* End of Other - HIV.C.DE78 */

/*
@dataElement: HIV.C.DE80 - PrEP product prescribed
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: PrEP product that the client was prescribed
*/
// TODO: Replace placeholder with relevant CQL logic
define "PrEP product prescribed Observation":
  [Observation: Concepts."PrEP product prescribed"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of PrEP product prescribed */

/*
@dataElement: HIV.C.DE81 - Oral PrEP
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client was prescribed oral PrEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Oral PrEP":
  exists "Oral PrEP Condition"
    or exists "Oral PrEP Observation"
define "Oral PrEP Condition":
  [Condition: Concepts."Oral PrEP"]
define "Oral PrEP Observation":
  [Observation: Concepts."Oral PrEP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Oral PrEP"
/* End of Oral PrEP */

/*
@dataElement: HIV.C.DE82 - Dapivirine vaginal ring DVR - HIV.C.DE82
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client was prescribed dapivirine vaginal ring (DVR)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dapivirine vaginal ring DVR - HIV.C.DE82":
  exists "Dapivirine vaginal ring DVR - HIV.C.DE82 Condition"
    or exists "Dapivirine vaginal ring DVR - HIV.C.DE82 Observation"
define "Dapivirine vaginal ring DVR - HIV.C.DE82 Condition":
  [Condition: Concepts."Dapivirine vaginal ring DVR - HIV.C.DE82"]
define "Dapivirine vaginal ring DVR - HIV.C.DE82 Observation":
  [Observation: Concepts."Dapivirine vaginal ring DVR - HIV.C.DE80"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Dapivirine vaginal ring DVR - HIV.C.DE82"
/* End of Dapivirine vaginal ring DVR - HIV.C.DE82 */

/*
@dataElement: HIV.C.DE83 - CAB-LA - HIV.C.DE83
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client was prescribed long-acting cabotegravir (CAB-LA)
*/
// TODO: Replace placeholder with relevant CQL logic
define "CAB-LA - HIV.C.DE83":
  exists "CAB-LA - HIV.C.DE83 Condition"
    or exists "CAB-LA - HIV.C.DE83 Observation"
define "CAB-LA - HIV.C.DE83 Condition":
  [Condition: Concepts."CAB-LA - HIV.C.DE83"]
define "CAB-LA - HIV.C.DE83 Observation":
  [Observation: Concepts."CAB-LA - HIV.C.DE80"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."CAB-LA - HIV.C.DE83"
/* End of CAB-LA - HIV.C.DE83 */

/*
@dataElement: HIV.C.DE84 - Other - HIV.C.DE84
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client was prescribed other PrEP product
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.C.DE84":
  exists "Other - HIV.C.DE84 Condition"
    or exists "Other - HIV.C.DE84 Observation"
define "Other - HIV.C.DE84 Condition":
  [Condition: Concepts."Other - HIV.C.DE84"]
define "Other - HIV.C.DE84 Observation":
  [Observation: Concepts."Other - HIV.C.DE80"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.C.DE84"
/* End of Other - HIV.C.DE84 */

/*
@dataElement: HIV.C.DE91 - Preferred PEP backbone regimen
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Preferred backbone regimen for PEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Preferred PEP backbone regimen Observation":
  [Observation: Concepts."Preferred PEP backbone regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Preferred PEP backbone regimen */

/*
@dataElement: HIV.C.DE92 - TDF + 3TC - HIV.C.DE92
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Preferred backbone containing tenofovir disoproxil fumarate and lamivudine
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF + 3TC - HIV.C.DE92":
  exists "TDF + 3TC - HIV.C.DE92 Condition"
    or exists "TDF + 3TC - HIV.C.DE92 Observation"
define "TDF + 3TC - HIV.C.DE92 Condition":
  [Condition: Concepts."TDF + 3TC - HIV.C.DE92"]
define "TDF + 3TC - HIV.C.DE92 Observation":
  [Observation: Concepts."TDF + 3TC - HIV.C.DE91"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF + 3TC - HIV.C.DE92"
/* End of TDF + 3TC - HIV.C.DE92 */

/*
@dataElement: HIV.C.DE93 - TDF + FTC - HIV.C.DE93
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Preferred backbone containing tenofovir disoproxil fumarate and emtricitabine
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF + FTC - HIV.C.DE93":
  exists "TDF + FTC - HIV.C.DE93 Condition"
    or exists "TDF + FTC - HIV.C.DE93 Observation"
define "TDF + FTC - HIV.C.DE93 Condition":
  [Condition: Concepts."TDF + FTC - HIV.C.DE93"]
define "TDF + FTC - HIV.C.DE93 Observation":
  [Observation: Concepts."TDF + FTC - HIV.C.DE91"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF + FTC - HIV.C.DE93"
/* End of TDF + FTC - HIV.C.DE93 */

/*
@dataElement: HIV.C.DE94 - AZT + 3TC
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Preferred backbone containing zidovudine and lamivudine
*/
// TODO: Replace placeholder with relevant CQL logic
define "AZT + 3TC":
  exists "AZT + 3TC Condition"
    or exists "AZT + 3TC Observation"
define "AZT + 3TC Condition":
  [Condition: Concepts."AZT + 3TC"]
define "AZT + 3TC Observation":
  [Observation: Concepts."AZT + 3TC"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."AZT + 3TC"
/* End of AZT + 3TC */

/*
@dataElement: HIV.C.DE95 - Alternative PEP backbone regimen
@activity: HIV.C3 Capture or update client history
@description: Alternative backbone regimen for PEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Alternative PEP backbone regimen Observation":
  [Observation: Concepts."Alternative PEP backbone regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Alternative PEP backbone regimen */

/*
@dataElement: HIV.C.DE96 - ABC + 3TC
@activity: HIV.C3 Capture or update client history
@description: Alternative backbone containing abacavir and lamivudine
*/
// TODO: Replace placeholder with relevant CQL logic
define "ABC + 3TC":
  exists "ABC + 3TC Condition"
    or exists "ABC + 3TC Observation"
define "ABC + 3TC Condition":
  [Condition: Concepts."ABC + 3TC"]
define "ABC + 3TC Observation":
  [Observation: Concepts."ABC + 3TC"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."ABC + 3TC"
/* End of ABC + 3TC */

/*
@dataElement: HIV.C.DE97 - TDF + 3TC - HIV.C.DE97
@activity: HIV.C3 Capture or update client history
@description: Alternative backbone containing tenofovir disoproxil fumarate and lamivudine
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF + 3TC - HIV.C.DE97":
  exists "TDF + 3TC - HIV.C.DE97 Condition"
    or exists "TDF + 3TC - HIV.C.DE97 Observation"
define "TDF + 3TC - HIV.C.DE97 Condition":
  [Condition: Concepts."TDF + 3TC - HIV.C.DE97"]
define "TDF + 3TC - HIV.C.DE97 Observation":
  [Observation: Concepts."TDF + 3TC - HIV.C.DE95"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF + 3TC - HIV.C.DE97"
/* End of TDF + 3TC - HIV.C.DE97 */

/*
@dataElement: HIV.C.DE98 - TDF + FTC - HIV.C.DE98
@activity: HIV.C3 Capture or update client history
@description: Alternative backbone containing tenofovir disoproxil fumarate and emtricitabine
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF + FTC - HIV.C.DE98":
  exists "TDF + FTC - HIV.C.DE98 Condition"
    or exists "TDF + FTC - HIV.C.DE98 Observation"
define "TDF + FTC - HIV.C.DE98 Condition":
  [Condition: Concepts."TDF + FTC - HIV.C.DE98"]
define "TDF + FTC - HIV.C.DE98 Observation":
  [Observation: Concepts."TDF + FTC - HIV.C.DE95"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF + FTC - HIV.C.DE98"
/* End of TDF + FTC - HIV.C.DE98 */

/*
@dataElement: HIV.C.DE99 - Preferred third PEP drug
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Preferred third drug for PEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Preferred third PEP drug Observation":
  [Observation: Concepts."Preferred third PEP drug"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Preferred third PEP drug */

/*
@dataElement: HIV.C.DE100 - DTG - HIV.C.DE100
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Preferred third drug of dolutegravir
*/
// TODO: Replace placeholder with relevant CQL logic
define "DTG - HIV.C.DE100":
  exists "DTG - HIV.C.DE100 Condition"
    or exists "DTG - HIV.C.DE100 Observation"
define "DTG - HIV.C.DE100 Condition":
  [Condition: Concepts."DTG - HIV.C.DE100"]
define "DTG - HIV.C.DE100 Observation":
  [Observation: Concepts."DTG - HIV.C.DE99"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."DTG - HIV.C.DE100"
/* End of DTG - HIV.C.DE100 */

/*
@dataElement: HIV.C.DE101 - Alternative third PEP drug
@activity: HIV.C3 Capture or update client history
@description: Alternative third drug for PEP
*/
// TODO: Replace placeholder with relevant CQL logic
define "Alternative third PEP drug Observation":
  [Observation: Concepts."Alternative third PEP drug"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Alternative third PEP drug */

/*
@dataElement: HIV.C.DE102 - ATV/r - HIV.C.DE102
@activity: HIV.C3 Capture or update client history
@description: Alternative third drug of atazanavir/ritonavir (ATV/r)
*/
// TODO: Replace placeholder with relevant CQL logic
define "ATV/r - HIV.C.DE102":
  exists "ATV/r - HIV.C.DE102 Condition"
    or exists "ATV/r - HIV.C.DE102 Observation"
define "ATV/r - HIV.C.DE102 Condition":
  [Condition: Concepts."ATV/r - HIV.C.DE102"]
define "ATV/r - HIV.C.DE102 Observation":
  [Observation: Concepts."ATV/r - HIV.C.DE101"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."ATV/r - HIV.C.DE102"
/* End of ATV/r - HIV.C.DE102 */

/*
@dataElement: HIV.C.DE103 - DRV/r - HIV.C.DE103
@activity: HIV.C3 Capture or update client history
@description: Alternative third drug of darunavir/ritonavir (DRV/r)
*/
// TODO: Replace placeholder with relevant CQL logic
define "DRV/r - HIV.C.DE103":
  exists "DRV/r - HIV.C.DE103 Condition"
    or exists "DRV/r - HIV.C.DE103 Observation"
define "DRV/r - HIV.C.DE103 Condition":
  [Condition: Concepts."DRV/r - HIV.C.DE103"]
define "DRV/r - HIV.C.DE103 Observation":
  [Observation: Concepts."DRV/r - HIV.C.DE101"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."DRV/r - HIV.C.DE103"
/* End of DRV/r - HIV.C.DE103 */

/*
@dataElement: HIV.C.DE104 - LPV/r - HIV.C.DE104
@activity: HIV.C3 Capture or update client history
@description: Alternative third drug of lopinavir/ritonavir (LPV/r)
*/
// TODO: Replace placeholder with relevant CQL logic
define "LPV/r - HIV.C.DE104":
  exists "LPV/r - HIV.C.DE104 Condition"
    or exists "LPV/r - HIV.C.DE104 Observation"
define "LPV/r - HIV.C.DE104 Condition":
  [Condition: Concepts."LPV/r - HIV.C.DE104"]
define "LPV/r - HIV.C.DE104 Observation":
  [Observation: Concepts."LPV/r - HIV.C.DE101"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."LPV/r - HIV.C.DE104"
/* End of LPV/r - HIV.C.DE104 */

/*
@dataElement: HIV.C.DE105 - RAL - HIV.C.DE105
@activity: HIV.C3 Capture or update client history
@description: Alternative third drug of raltegravir (RAL)
*/
// TODO: Replace placeholder with relevant CQL logic
define "RAL - HIV.C.DE105":
  exists "RAL - HIV.C.DE105 Condition"
    or exists "RAL - HIV.C.DE105 Observation"
define "RAL - HIV.C.DE105 Condition":
  [Condition: Concepts."RAL - HIV.C.DE105"]
define "RAL - HIV.C.DE105 Observation":
  [Observation: Concepts."RAL - HIV.C.DE101"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."RAL - HIV.C.DE105"
/* End of RAL - HIV.C.DE105 */

/*
@dataElement: HIV.C.DE106 - Estimated creatinine clearance
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Estimated creatinine clearance of the client returned from lab in mL/min
*/
// TODO: Replace placeholder with relevant CQL logic
define "Estimated creatinine clearance":
  [Observation: Concepts."Estimated creatinine clearance"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Estimated creatinine clearance */

/*
@dataElement: HIV.C.DE112 - Contraindications to PrEP usage
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Listing of contraindications to pre-exposure prophylaxis (PrEP)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Contraindications to PrEP usage Observation":
  [Observation: Concepts."Contraindications to PrEP usage"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Contraindications to PrEP usage */

/*
@dataElement: HIV.C.DE113 - Tenofovir disoproxil fumarate TDF allergy or contraindication
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Allergy to pre-exposure prophylaxis (PrEP) tenofovir disoproxil fumarate (TDF)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Tenofovir disoproxil fumarate TDF allergy or contraindication":
  exists "Tenofovir disoproxil fumarate TDF allergy or contraindication Condition"
    or exists "Tenofovir disoproxil fumarate TDF allergy or contraindication Observation"
define "Tenofovir disoproxil fumarate TDF allergy or contraindication Condition":
  [Condition: Concepts."Tenofovir disoproxil fumarate TDF allergy or contraindication"]
define "Tenofovir disoproxil fumarate TDF allergy or contraindication Observation":
  [Observation: Concepts."Tenofovir disoproxil fumarate TDF allergy or contraindication"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Tenofovir disoproxil fumarate TDF allergy or contraindication"
/* End of Tenofovir disoproxil fumarate TDF allergy or contraindication */

/*
@dataElement: HIV.C.DE114 - HIV-positive - HIV.C.DE114
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client is HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive - HIV.C.DE114":
  exists "HIV-positive - HIV.C.DE114 Condition"
    or exists "HIV-positive - HIV.C.DE114 Observation"
define "HIV-positive - HIV.C.DE114 Condition":
  [Condition: Concepts."HIV-positive - HIV.C.DE114"]
define "HIV-positive - HIV.C.DE114 Observation":
  [Observation: Concepts."HIV-positive - HIV.C.DE112"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive - HIV.C.DE114"
/* End of HIV-positive - HIV.C.DE114 */

/*
@dataElement: HIV.C.DE115 - Low estimated creatinine clearance
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Estimated creatinine clearance of less than 60 ml/min (if known)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Low estimated creatinine clearance":
  exists "Low estimated creatinine clearance Condition"
    or exists "Low estimated creatinine clearance Observation"
define "Low estimated creatinine clearance Condition":
  [Condition: Concepts."Low estimated creatinine clearance"]
define "Low estimated creatinine clearance Observation":
  [Observation: Concepts."Low estimated creatinine clearance"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Low estimated creatinine clearance"
/* End of Low estimated creatinine clearance */

/*
@dataElement: HIV.C.DE116 - Acute HIV infection symptoms - HIV.C.DE116
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Symptoms that could suggest an acute HIV infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Acute HIV infection symptoms - HIV.C.DE116":
  exists "Acute HIV infection symptoms - HIV.C.DE116 Condition"
    or exists "Acute HIV infection symptoms - HIV.C.DE116 Observation"
define "Acute HIV infection symptoms - HIV.C.DE116 Condition":
  [Condition: Concepts."Acute HIV infection symptoms - HIV.C.DE116"]
define "Acute HIV infection symptoms - HIV.C.DE116 Observation":
  [Observation: Concepts."Acute HIV infection symptoms - HIV.C.DE112"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Acute HIV infection symptoms - HIV.C.DE116"
/* End of Acute HIV infection symptoms - HIV.C.DE116 */

/*
@dataElement: HIV.C.DE117 - Probable recent exposure to HIV
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: When the client is reported to have had probable recent exposure to HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Probable recent exposure to HIV":
  exists "Probable recent exposure to HIV Condition"
    or exists "Probable recent exposure to HIV Observation"
define "Probable recent exposure to HIV Condition":
  [Condition: Concepts."Probable recent exposure to HIV"]
define "Probable recent exposure to HIV Observation":
  [Observation: Concepts."Probable recent exposure to HIV"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Probable recent exposure to HIV"
/* End of Probable recent exposure to HIV */

/*
@dataElement: HIV.C.DE118 - Other allergy or contraindication to a medicine in the PrEP regimen
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Client has another allergy or contraindication to a medicine in the pre-exposure prophylaxis (PrEP) regimen
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other allergy or contraindication to a medicine in the PrEP regimen":
  exists "Other allergy or contraindication to a medicine in the PrEP regimen Condition"
    or exists "Other allergy or contraindication to a medicine in the PrEP regimen Observation"
define "Other allergy or contraindication to a medicine in the PrEP regimen Condition":
  [Condition: Concepts."Other allergy or contraindication to a medicine in the PrEP regimen"]
define "Other allergy or contraindication to a medicine in the PrEP regimen Observation":
  [Observation: Concepts."Other allergy or contraindication to a medicine in the PrEP regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other allergy or contraindication to a medicine in the PrEP regimen"
/* End of Other allergy or contraindication to a medicine in the PrEP regimen */

/*
@dataElement: HIV.C.DE121 - Number of days prescribed - HIV.C.DE121
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Days of medication client has been prescribed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Number of days prescribed - HIV.C.DE121":
  [Observation: Concepts."Number of days prescribed - HIV.C.DE121"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Number of days prescribed - HIV.C.DE121 */

/*
@dataElement: HIV.C.DE123 - Adherence counselling provided - HIV.C.DE123
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Whether adherence counselling was provided
*/
// TODO: Replace placeholder with relevant CQL logic
define "Adherence counselling provided - HIV.C.DE123":
  [Observation: Concepts."Adherence counselling provided - HIV.C.DE123"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Adherence counselling provided - HIV.C.DE123 */

/*
@dataElement: HIV.C.DE124 - Date/time of follow-up appointment - HIV.C.DE124
@activity: HIV.C24 Schedule follow-up
@description: Date the client is to return for monitoring, re-supply, or any other reason
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date/time of follow-up appointment - HIV.C.DE124":
  [Observation: Concepts."Date/time of follow-up appointment - HIV.C.DE124"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date/time of follow-up appointment - HIV.C.DE124 */

/*
@dataElement: HIV.C.DE125 - Type of follow-up appointment - HIV.C.DE125
@activity: HIV.C24 Schedule follow-up
@description: Type of follow-up appointment for testing services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of follow-up appointment - HIV.C.DE125 Observation":
  [Observation: Concepts."Type of follow-up appointment - HIV.C.DE125"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of follow-up appointment - HIV.C.DE125 */

/*
@dataElement: HIV.C.DE126 - Retesting for HIV - HIV.C.DE126
@activity: HIV.C24 Schedule follow-up
@description: Retesting follow-up appointment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Retesting for HIV - HIV.C.DE126":
  exists "Retesting for HIV - HIV.C.DE126 Condition"
    or exists "Retesting for HIV - HIV.C.DE126 Observation"
define "Retesting for HIV - HIV.C.DE126 Condition":
  [Condition: Concepts."Retesting for HIV - HIV.C.DE126"]
define "Retesting for HIV - HIV.C.DE126 Observation":
  [Observation: Concepts."Retesting for HIV - HIV.C.DE125"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Retesting for HIV - HIV.C.DE126"
/* End of Retesting for HIV - HIV.C.DE126 */

/*
@dataElement: HIV.C.DE127 - Follow-up appointment for PrEP
@activity: HIV.C24 Schedule follow-up
@description: Retesting follow-up appointment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Follow-up appointment for PrEP":
  exists "Follow-up appointment for PrEP Condition"
    or exists "Follow-up appointment for PrEP Observation"
define "Follow-up appointment for PrEP Condition":
  [Condition: Concepts."Follow-up appointment for PrEP"]
define "Follow-up appointment for PrEP Observation":
  [Observation: Concepts."Follow-up appointment for PrEP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Follow-up appointment for PrEP"
/* End of Follow-up appointment for PrEP */

/*
@dataElement: HIV.C.DE128 - Other - HIV.C.DE128
@activity: HIV.C24 Schedule follow-up
@description: Other reason for the follow-up appointment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.C.DE128":
  exists "Other - HIV.C.DE128 Condition"
    or exists "Other - HIV.C.DE128 Observation"
define "Other - HIV.C.DE128 Condition":
  [Condition: Concepts."Other - HIV.C.DE128"]
define "Other - HIV.C.DE128 Observation":
  [Observation: Concepts."Other - HIV.C.DE125"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.C.DE128"
/* End of Other - HIV.C.DE128 */

/*
@dataElement: HIV.C.DE131 - Prevention services offered and referrals - HIV.C.DE131
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer to prevention services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Prevention services offered and referrals - HIV.C.DE131 Observation":
  [Observation: Concepts."Prevention services offered and referrals - HIV.C.DE131"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Prevention services offered and referrals - HIV.C.DE131 */

/*
@dataElement: HIV.C.DE132 - Male and female condoms and condom-compatible lubricants offered
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer male and female condoms and condom-compatible lubricants
*/
// TODO: Replace placeholder with relevant CQL logic
define "Male and female condoms and condom-compatible lubricants offered":
  exists "Male and female condoms and condom-compatible lubricants offered Condition"
    or exists "Male and female condoms and condom-compatible lubricants offered Observation"
define "Male and female condoms and condom-compatible lubricants offered Condition":
  [Condition: Concepts."Male and female condoms and condom-compatible lubricants offered"]
define "Male and female condoms and condom-compatible lubricants offered Observation":
  [Observation: Concepts."Male and female condoms and condom-compatible lubricants offered"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Male and female condoms and condom-compatible lubricants offered"
/* End of Male and female condoms and condom-compatible lubricants offered */

/*
@dataElement: HIV.C.DE133 - Voluntary medical male circumcision VMMC referral
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer referral for VMMC services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Voluntary medical male circumcision VMMC referral":
  exists "Voluntary medical male circumcision VMMC referral Condition"
    or exists "Voluntary medical male circumcision VMMC referral Observation"
define "Voluntary medical male circumcision VMMC referral Condition":
  [Condition: Concepts."Voluntary medical male circumcision VMMC referral"]
define "Voluntary medical male circumcision VMMC referral Observation":
  [Observation: Concepts."Voluntary medical male circumcision VMMC referral"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Voluntary medical male circumcision VMMC referral"
/* End of Voluntary medical male circumcision VMMC referral */

/*
@dataElement: HIV.C.DE134 - Harm reduction for people who inject drugs - HIV.C.DE134
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer to harm reduction for people who inject drugs (needle and syringe programmes, opioid substitution therapy, other drug-dependence treatment and opioid overdose prevention and management) services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Harm reduction for people who inject drugs - HIV.C.DE134":
  exists "Harm reduction for people who inject drugs - HIV.C.DE134 Condition"
    or exists "Harm reduction for people who inject drugs - HIV.C.DE134 Observation"
define "Harm reduction for people who inject drugs - HIV.C.DE134 Condition":
  [Condition: Concepts."Harm reduction for people who inject drugs - HIV.C.DE134"]
define "Harm reduction for people who inject drugs - HIV.C.DE134 Observation":
  [Observation: Concepts."Harm reduction for people who inject drugs - HIV.C.DE131"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Harm reduction for people who inject drugs - HIV.C.DE134"
/* End of Harm reduction for people who inject drugs - HIV.C.DE134 */

/*
@dataElement: HIV.C.DE135 - Behavioural interventions to support risk reduction - HIV.C.DE135
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer to services for behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations
*/
// TODO: Replace placeholder with relevant CQL logic
define "Behavioural interventions to support risk reduction - HIV.C.DE135":
  exists "Behavioural interventions to support risk reduction - HIV.C.DE135 Condition"
    or exists "Behavioural interventions to support risk reduction - HIV.C.DE135 Observation"
define "Behavioural interventions to support risk reduction - HIV.C.DE135 Condition":
  [Condition: Concepts."Behavioural interventions to support risk reduction - HIV.C.DE135"]
define "Behavioural interventions to support risk reduction - HIV.C.DE135 Observation":
  [Observation: Concepts."Behavioural interventions to support risk reduction - HIV.C.DE131"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Behavioural interventions to support risk reduction - HIV.C.DE135"
/* End of Behavioural interventions to support risk reduction - HIV.C.DE135 */

/*
@dataElement: HIV.C.DE138 - Condom type
@activity: HIV.C10 Counsel on risk and prevention
@description: Type of condom provided to client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Condom type Observation":
  [Observation: Concepts."Condom type"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Condom type */

/*
@dataElement: HIV.C.DE139 - Male condom
@activity: HIV.C10 Counsel on risk and prevention
@description: Male condoms were provided to the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Male condom":
  exists "Male condom Condition"
    or exists "Male condom Observation"
define "Male condom Condition":
  [Condition: Concepts."Male condom"]
define "Male condom Observation":
  [Observation: Concepts."Male condom"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Male condom"
/* End of Male condom */

/*
@dataElement: HIV.C.DE140 - Female condom
@activity: HIV.C10 Counsel on risk and prevention
@description: Female condoms were provided to the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Female condom":
  exists "Female condom Condition"
    or exists "Female condom Observation"
define "Female condom Condition":
  [Condition: Concepts."Female condom"]
define "Female condom Observation":
  [Observation: Concepts."Female condom"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Female condom"
/* End of Female condom */

/*
@dataElement: HIV.C.DE142 - Number of HIV self-test kits distributed
@activity: HIV.C10 Counsel on risk and prevention
@description: Number of HIV self-test kits distributed to the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Number of HIV self-test kits distributed":
  [Observation: Concepts."Number of HIV self-test kits distributed"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Number of HIV self-test kits distributed */

/*
@dataElement: HIV.C.DE143 - HIV self-test distributed for use by
@activity: HIV.C10 Counsel on risk and prevention
@description: Whom the client plans to give the HIV self-test kit (self, sexual partner, social contact, etc.)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV self-test distributed for use by Observation":
  [Observation: Concepts."HIV self-test distributed for use by"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV self-test distributed for use by */

/*
@dataElement: HIV.C.DE144 - Self
@activity: HIV.C10 Counsel on risk and prevention
@description: Client plans to use the self-test kit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Self":
  exists "Self Condition"
    or exists "Self Observation"
define "Self Condition":
  [Condition: Concepts."Self"]
define "Self Observation":
  [Observation: Concepts."Self"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Self"
/* End of Self */

/*
@dataElement: HIV.C.DE145 - Family member
@activity: HIV.C10 Counsel on risk and prevention
@description: Client plans to give the self-test kit to a family member to use
*/
// TODO: Replace placeholder with relevant CQL logic
define "Family member":
  exists "Family member Condition"
    or exists "Family member Observation"
define "Family member Condition":
  [Condition: Concepts."Family member"]
define "Family member Observation":
  [Observation: Concepts."Family member"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Family member"
/* End of Family member */

/*
@dataElement: HIV.C.DE146 - Drug-injecting partner - HIV.C.DE146
@activity: HIV.C10 Counsel on risk and prevention
@description: Client plans to give the self-test kit to a drug-injecting partner
*/
// TODO: Replace placeholder with relevant CQL logic
define "Drug-injecting partner - HIV.C.DE146":
  exists "Drug-injecting partner - HIV.C.DE146 Condition"
    or exists "Drug-injecting partner - HIV.C.DE146 Observation"
define "Drug-injecting partner - HIV.C.DE146 Condition":
  [Condition: Concepts."Drug-injecting partner - HIV.C.DE146"]
define "Drug-injecting partner - HIV.C.DE146 Observation":
  [Observation: Concepts."Drug-injecting partner - HIV.C.DE143"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Drug-injecting partner - HIV.C.DE146"
/* End of Drug-injecting partner - HIV.C.DE146 */

/*
@dataElement: HIV.C.DE147 - Sexual partner - HIV.C.DE147
@activity: HIV.C10 Counsel on risk and prevention
@description: Client plans to give the self-test kit to a sexual partner
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sexual partner - HIV.C.DE147":
  exists "Sexual partner - HIV.C.DE147 Condition"
    or exists "Sexual partner - HIV.C.DE147 Observation"
define "Sexual partner - HIV.C.DE147 Condition":
  [Condition: Concepts."Sexual partner - HIV.C.DE147"]
define "Sexual partner - HIV.C.DE147 Observation":
  [Observation: Concepts."Sexual partner - HIV.C.DE143"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sexual partner - HIV.C.DE147"
/* End of Sexual partner - HIV.C.DE147 */

/*
@dataElement: HIV.C.DE148 - Social contact - HIV.C.DE148
@activity: HIV.C10 Counsel on risk and prevention
@description: Client plans to give the self-test kit to a social contact
*/
// TODO: Replace placeholder with relevant CQL logic
define "Social contact - HIV.C.DE148":
  exists "Social contact - HIV.C.DE148 Condition"
    or exists "Social contact - HIV.C.DE148 Observation"
define "Social contact - HIV.C.DE148 Condition":
  [Condition: Concepts."Social contact - HIV.C.DE148"]
define "Social contact - HIV.C.DE148 Observation":
  [Observation: Concepts."Social contact - HIV.C.DE143"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Social contact - HIV.C.DE148"
/* End of Social contact - HIV.C.DE148 */

/*
@dataElement: HIV.C.DE149 - Sexual and reproductive health integrated services - HIV.C.DE149
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer to sexual and reproductive health services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sexual and reproductive health integrated services - HIV.C.DE149 Observation":
  [Observation: Concepts."Sexual and reproductive health integrated services - HIV.C.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Sexual and reproductive health integrated services - HIV.C.DE149 */

/*
@dataElement: HIV.C.DE150 - Contraception and family planning - HIV.C.DE150
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer contraception and family planning services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Contraception and family planning - HIV.C.DE150":
  exists "Contraception and family planning - HIV.C.DE150 Condition"
    or exists "Contraception and family planning - HIV.C.DE150 Observation"
define "Contraception and family planning - HIV.C.DE150 Condition":
  [Condition: Concepts."Contraception and family planning - HIV.C.DE150"]
define "Contraception and family planning - HIV.C.DE150 Observation":
  [Observation: Concepts."Contraception and family planning - HIV.C.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Contraception and family planning - HIV.C.DE150"
/* End of Contraception and family planning - HIV.C.DE150 */

/*
@dataElement: HIV.C.DE151 - Check pregnancy status - HIV.C.DE151
@activity: HIV.C10 Counsel on risk and prevention
@description: Check woman's pregnancy status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Check pregnancy status - HIV.C.DE151":
  exists "Check pregnancy status - HIV.C.DE151 Condition"
    or exists "Check pregnancy status - HIV.C.DE151 Observation"
define "Check pregnancy status - HIV.C.DE151 Condition":
  [Condition: Concepts."Check pregnancy status - HIV.C.DE151"]
define "Check pregnancy status - HIV.C.DE151 Observation":
  [Observation: Concepts."Check pregnancy status - HIV.C.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Check pregnancy status - HIV.C.DE151"
/* End of Check pregnancy status - HIV.C.DE151 */

/*
@dataElement: HIV.C.DE152 - Prevent mother-to-child transmission
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer services (counselling) to help prevent of mother-to-child transmission
*/
// TODO: Replace placeholder with relevant CQL logic
define "Prevent mother-to-child transmission":
  exists "Prevent mother-to-child transmission Condition"
    or exists "Prevent mother-to-child transmission Observation"
define "Prevent mother-to-child transmission Condition":
  [Condition: Concepts."Prevent mother-to-child transmission"]
define "Prevent mother-to-child transmission Observation":
  [Observation: Concepts."Prevent mother-to-child transmission"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Prevent mother-to-child transmission"
/* End of Prevent mother-to-child transmission */

/*
@dataElement: HIV.C.DE153 - Cervical cancer screening and treatment
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer cervical cancer screening and treatment services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer screening and treatment":
  exists "Cervical cancer screening and treatment Condition"
    or exists "Cervical cancer screening and treatment Observation"
define "Cervical cancer screening and treatment Condition":
  [Condition: Concepts."Cervical cancer screening and treatment"]
define "Cervical cancer screening and treatment Observation":
  [Observation: Concepts."Cervical cancer screening and treatment"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cervical cancer screening and treatment"
/* End of Cervical cancer screening and treatment */

/*
@dataElement: HIV.C.DE154 - Anal cancer screening for men who have sex with men - HIV.C.DE154
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer anal cancer screening (for men who have sex with men) services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Anal cancer screening for men who have sex with men - HIV.C.DE154":
  exists "Anal cancer screening for men who have sex with men - HIV.C.DE154 Condition"
    or exists "Anal cancer screening for men who have sex with men - HIV.C.DE154 Observation"
define "Anal cancer screening for men who have sex with men - HIV.C.DE154 Condition":
  [Condition: Concepts."Anal cancer screening for men who have sex with men - HIV.C.DE154"]
define "Anal cancer screening for men who have sex with men - HIV.C.DE154 Observation":
  [Observation: Concepts."Anal cancer screening for men who have sex with men - HIV.C.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Anal cancer screening for men who have sex with men - HIV.C.DE154"
/* End of Anal cancer screening for men who have sex with men - HIV.C.DE154 */

/*
@dataElement: HIV.C.DE155 - STI testing and treatment - HIV.C.DE155
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer STI testing and treatment services
*/
// TODO: Replace placeholder with relevant CQL logic
define "STI testing and treatment - HIV.C.DE155":
  exists "STI testing and treatment - HIV.C.DE155 Condition"
    or exists "STI testing and treatment - HIV.C.DE155 Observation"
define "STI testing and treatment - HIV.C.DE155 Condition":
  [Condition: Concepts."STI testing and treatment - HIV.C.DE155"]
define "STI testing and treatment - HIV.C.DE155 Observation":
  [Observation: Concepts."STI testing and treatment - HIV.C.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."STI testing and treatment - HIV.C.DE155"
/* End of STI testing and treatment - HIV.C.DE155 */

/*
@dataElement: HIV.C.DE156 - HIV testing for partners and biological children - HIV.C.DE156
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer testing for all partners and biological children of positive cases (includes partner services and index case testing), as well as partners and social contacts of people from key populations, where appropriate
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV testing for partners and biological children - HIV.C.DE156":
  exists "HIV testing for partners and biological children - HIV.C.DE156 Condition"
    or exists "HIV testing for partners and biological children - HIV.C.DE156 Observation"
define "HIV testing for partners and biological children - HIV.C.DE156 Condition":
  [Condition: Concepts."HIV testing for partners and biological children - HIV.C.DE156"]
define "HIV testing for partners and biological children - HIV.C.DE156 Observation":
  [Observation: Concepts."HIV testing for partners and biological children - HIV.C.DE149"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV testing for partners and biological children - HIV.C.DE156"
/* End of HIV testing for partners and biological children - HIV.C.DE156 */

/*
@dataElement: HIV.C.DE157 - Offer other clinical services - HIV.C.DE157
@activity: HIV.C10 Counsel on risk and prevention
@description: Other clinical services offered or referrals given to the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Offer other clinical services - HIV.C.DE157 Observation":
  [Observation: Concepts."Offer other clinical services - HIV.C.DE157"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Offer other clinical services - HIV.C.DE157 */

/*
@dataElement: HIV.C.DE158 - Assessment and provision of vaccinations - HIV.C.DE158
@activity: HIV.C10 Counsel on risk and prevention
@description: Assessment and provision of vaccinations, such as for people from key populations, pregnant women and infants; and, where appropriate, tetanus vaccination for adolescent boys and men receiving VMMC
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assessment and provision of vaccinations - HIV.C.DE158":
  exists "Assessment and provision of vaccinations - HIV.C.DE158 Condition"
    or exists "Assessment and provision of vaccinations - HIV.C.DE158 Observation"
define "Assessment and provision of vaccinations - HIV.C.DE158 Condition":
  [Condition: Concepts."Assessment and provision of vaccinations - HIV.C.DE158"]
define "Assessment and provision of vaccinations - HIV.C.DE158 Observation":
  [Observation: Concepts."Assessment and provision of vaccinations - HIV.C.DE157"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assessment and provision of vaccinations - HIV.C.DE158"
/* End of Assessment and provision of vaccinations - HIV.C.DE158 */

/*
@dataElement: HIV.C.DE159 - Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for HBV testing and vaccination and HCV testing and treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment":
  exists "Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment Condition"
    or exists "Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment Observation"
define "Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment Condition":
  [Condition: Concepts."Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment"]
define "Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment Observation":
  [Observation: Concepts."Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment"
/* End of Hepatitis B virus HBV and hepatitis C virus HCV testing and treatment */

/*
@dataElement: HIV.C.DE160 - Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia
*/
// TODO: Replace placeholder with relevant CQL logic
define "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160":
  exists "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160 Condition"
    or exists "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160 Observation"
define "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160 Condition":
  [Condition: Concepts."Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160"]
define "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160 Observation":
  [Observation: Concepts."Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE157"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160"
/* End of Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.C.DE160 */

/*
@dataElement: HIV.C.DE161 - Intensified TB case finding and linkage to TB treatment - HIV.C.DE161
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for TB case finding and linkage to TB treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Intensified TB case finding and linkage to TB treatment - HIV.C.DE161":
  exists "Intensified TB case finding and linkage to TB treatment - HIV.C.DE161 Condition"
    or exists "Intensified TB case finding and linkage to TB treatment - HIV.C.DE161 Observation"
define "Intensified TB case finding and linkage to TB treatment - HIV.C.DE161 Condition":
  [Condition: Concepts."Intensified TB case finding and linkage to TB treatment - HIV.C.DE161"]
define "Intensified TB case finding and linkage to TB treatment - HIV.C.DE161 Observation":
  [Observation: Concepts."Intensified TB case finding and linkage to TB treatment - HIV.C.DE157"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Intensified TB case finding and linkage to TB treatment - HIV.C.DE161"
/* End of Intensified TB case finding and linkage to TB treatment - HIV.C.DE161 */

/*
@dataElement: HIV.C.DE162 - Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for provision of isoniazid preventive therapy if person does not have TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162":
  exists "Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162 Condition"
    or exists "Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162 Observation"
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162 Condition":
  [Condition: Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162"]
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162 Observation":
  [Observation: Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE157"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162"
/* End of Provision of isoniazid preventive therapy if person does not have TB - HIV.C.DE162 */

/*
@dataElement: HIV.C.DE163 - Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for malaria prevention (such as bed nets and prophylaxis), depending on epidemiology
*/
// TODO: Replace placeholder with relevant CQL logic
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163":
  exists "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163 Condition"
    or exists "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163 Observation"
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163 Condition":
  [Condition: Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163"]
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163 Observation":
  [Observation: Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE157"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163"
/* End of Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.C.DE163 */

/*
@dataElement: HIV.C.DE164 - Other support services - HIV.C.DE164
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for other support services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other support services - HIV.C.DE164 Observation":
  [Observation: Concepts."Other support services - HIV.C.DE164"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Other support services - HIV.C.DE164 */

/*
@dataElement: HIV.C.DE165 - Mental health services - HIV.C.DE165
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for mental health services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Mental health services - HIV.C.DE165":
  exists "Mental health services - HIV.C.DE165 Condition"
    or exists "Mental health services - HIV.C.DE165 Observation"
define "Mental health services - HIV.C.DE165 Condition":
  [Condition: Concepts."Mental health services - HIV.C.DE165"]
define "Mental health services - HIV.C.DE165 Observation":
  [Observation: Concepts."Mental health services - HIV.C.DE164"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Mental health services - HIV.C.DE165"
/* End of Mental health services - HIV.C.DE165 */

/*
@dataElement: HIV.C.DE166 - Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for psychosocial counselling, support and treatment adherence counselling
*/
// TODO: Replace placeholder with relevant CQL logic
define "Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166":
  exists "Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166 Condition"
    or exists "Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166 Observation"
define "Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166 Condition":
  [Condition: Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166"]
define "Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166 Observation":
  [Observation: Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE164"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166"
/* End of Psychosocial counselling, support and treatment adherence counselling - HIV.C.DE166 */

/*
@dataElement: HIV.C.DE167 - Support for disclosure and partner services - HIV.C.DE167
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for support for disclosure and partner services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Support for disclosure and partner services - HIV.C.DE167":
  exists "Support for disclosure and partner services - HIV.C.DE167 Condition"
    or exists "Support for disclosure and partner services - HIV.C.DE167 Observation"
define "Support for disclosure and partner services - HIV.C.DE167 Condition":
  [Condition: Concepts."Support for disclosure and partner services - HIV.C.DE167"]
define "Support for disclosure and partner services - HIV.C.DE167 Observation":
  [Observation: Concepts."Support for disclosure and partner services - HIV.C.DE164"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Support for disclosure and partner services - HIV.C.DE167"
/* End of Support for disclosure and partner services - HIV.C.DE167 */

/*
@dataElement: HIV.C.DE168 - Legal and social services - HIV.C.DE168
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for legal and social services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Legal and social services - HIV.C.DE168":
  exists "Legal and social services - HIV.C.DE168 Condition"
    or exists "Legal and social services - HIV.C.DE168 Observation"
define "Legal and social services - HIV.C.DE168 Condition":
  [Condition: Concepts."Legal and social services - HIV.C.DE168"]
define "Legal and social services - HIV.C.DE168 Observation":
  [Observation: Concepts."Legal and social services - HIV.C.DE164"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Legal and social services - HIV.C.DE168"
/* End of Legal and social services - HIV.C.DE168 */

/*
@dataElement: HIV.C.DE169 - Services for responding to violence against women - HIV.C.DE169
@activity: HIV.C10 Counsel on risk and prevention
@description: Offer or refer for services for responding to violence against women, including first-line support and psychosocial support, post-rape care and other support services including shelters, legal services and women and child protection services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Services for responding to violence against women - HIV.C.DE169":
  exists "Services for responding to violence against women - HIV.C.DE169 Condition"
    or exists "Services for responding to violence against women - HIV.C.DE169 Observation"
define "Services for responding to violence against women - HIV.C.DE169 Condition":
  [Condition: Concepts."Services for responding to violence against women - HIV.C.DE169"]
define "Services for responding to violence against women - HIV.C.DE169 Observation":
  [Observation: Concepts."Services for responding to violence against women - HIV.C.DE164"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Services for responding to violence against women - HIV.C.DE169"
/* End of Services for responding to violence against women - HIV.C.DE169 */

/*
@dataElement: HIV.D.DE1 - Reason for visit - HIV.D.DE1
@activity: HIV.D1 Determine reason for visit
@description: Whether visit was scheduled or unscheduled, clinical only, or for ARV drug pick-up
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reason for visit - HIV.D.DE1 Observation":
  [Observation: Concepts."Reason for visit - HIV.D.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Reason for visit - HIV.D.DE1 */

/*
@dataElement: HIV.D.DE2 - First clinical visit
@activity: HIV.D1 Determine reason for visit
@description: The client's first appointment for clinical care by a provider at the facility
*/
// TODO: Replace placeholder with relevant CQL logic
define "First clinical visit":
  exists "First clinical visit Condition"
    or exists "First clinical visit Observation"
define "First clinical visit Condition":
  [Condition: Concepts."First clinical visit"]
define "First clinical visit Observation":
  [Observation: Concepts."First clinical visit"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First clinical visit"
/* End of First clinical visit */

/*
@dataElement: HIV.D.DE3 - Clinical visit - HIV.D.DE3
@activity: HIV.D1 Determine reason for visit
@description: Appointment for clinical care by a provider
*/
// TODO: Replace placeholder with relevant CQL logic
define "Clinical visit - HIV.D.DE3":
  exists "Clinical visit - HIV.D.DE3 Condition"
    or exists "Clinical visit - HIV.D.DE3 Observation"
define "Clinical visit - HIV.D.DE3 Condition":
  [Condition: Concepts."Clinical visit - HIV.D.DE3"]
define "Clinical visit - HIV.D.DE3 Observation":
  [Observation: Concepts."Clinical visit - HIV.D.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Clinical visit - HIV.D.DE3"
/* End of Clinical visit - HIV.D.DE3 */

/*
@dataElement: HIV.D.DE4 - ART initiation
@activity: HIV.D1 Determine reason for visit
@description: Appointment for initiation of ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "ART initiation":
  exists "ART initiation Condition"
    or exists "ART initiation Observation"
define "ART initiation Condition":
  [Condition: Concepts."ART initiation"]
define "ART initiation Observation":
  [Observation: Concepts."ART initiation"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."ART initiation"
/* End of ART initiation */

/*
@dataElement: HIV.D.DE5 - ART drug pick up
@activity: HIV.D1 Determine reason for visit
@description: Appointment for an antiretroviral drug pick up
*/
// TODO: Replace placeholder with relevant CQL logic
define "ART drug pick up":
  exists "ART drug pick up Condition"
    or exists "ART drug pick up Observation"
define "ART drug pick up Condition":
  [Condition: Concepts."ART drug pick up"]
define "ART drug pick up Observation":
  [Observation: Concepts."ART drug pick up"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."ART drug pick up"
/* End of ART drug pick up */

/*
@dataElement: HIV.D.DE6 - Issues and concerns
@activity: HIV.D1 Determine reason for visit
@description: Visit to address issues and concerns
*/
// TODO: Replace placeholder with relevant CQL logic
define "Issues and concerns":
  exists "Issues and concerns Condition"
    or exists "Issues and concerns Observation"
define "Issues and concerns Condition":
  [Condition: Concepts."Issues and concerns"]
define "Issues and concerns Observation":
  [Observation: Concepts."Issues and concerns"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Issues and concerns"
/* End of Issues and concerns */

/*
@dataElement: HIV.D.DE7 - Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7
@activity: HIV.D1 Determine reason for visit
@description: Appointment for a post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7":
  exists "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7 Condition"
    or exists "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7 Observation"
define "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7 Condition":
  [Condition: Concepts."Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7"]
define "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7 Observation":
  [Observation: Concepts."Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7"
/* End of Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE7 */

/*
@dataElement: HIV.D.DE9 - Body temperature
@activity: HIV.D2 Take vital signs
@description: Temperature of the client in Celsius
*/
// TODO: Replace placeholder with relevant CQL logic
define "Body temperature":
  [Observation: Concepts."Body temperature"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Body temperature */

/*
@dataElement: HIV.D.DE13 - Body weight
@activity: HIV.D2 Take vital signs
@description: The client's current weight in kilograms
*/
// TODO: Replace placeholder with relevant CQL logic
define "Body weight":
  [Observation: Concepts."Body weight"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Body weight */

/*
@dataElement: HIV.D.DE17 - Signs of serious illness
@activity: HIV.D3 Check for signs of serious illness
@description: Signs that may indicate the client has a serious illness and needs triage or an emergency referral
*/
// TODO: Replace placeholder with relevant CQL logic
define "Signs of serious illness Observation":
  [Observation: Concepts."Signs of serious illness"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Signs of serious illness */

/*
@dataElement: HIV.D.DE18 - Fever of 39 C or greater
@activity: HIV.D3 Check for signs of serious illness
@description: Client has a fever with a measured temperature of 102.2 F/39 C or greater
*/
// TODO: Replace placeholder with relevant CQL logic
define "Fever of 39 C or greater":
  exists "Fever of 39 C or greater Condition"
    or exists "Fever of 39 C or greater Observation"
define "Fever of 39 C or greater Condition":
  [Condition: Concepts."Fever of 39 C or greater"]
define "Fever of 39 C or greater Observation":
  [Observation: Concepts."Fever of 39 C or greater"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Fever of 39 C or greater"
/* End of Fever of 39 C or greater */

/*
@dataElement: HIV.D.DE19 - Tachycardia
@activity: HIV.D3 Check for signs of serious illness
@description: Heart rate above a rate per minute based on age
*/
// TODO: Replace placeholder with relevant CQL logic
define "Tachycardia":
  exists "Tachycardia Condition"
    or exists "Tachycardia Observation"
define "Tachycardia Condition":
  [Condition: Concepts."Tachycardia"]
define "Tachycardia Observation":
  [Observation: Concepts."Tachycardia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Tachycardia"
/* End of Tachycardia */

/*
@dataElement: HIV.D.DE20 - Tachypnea
@activity: HIV.D3 Check for signs of serious illness
@description: Respiratory rate above a number of breaths per minute based on age
*/
// TODO: Replace placeholder with relevant CQL logic
define "Tachypnea":
  exists "Tachypnea Condition"
    or exists "Tachypnea Observation"
define "Tachypnea Condition":
  [Condition: Concepts."Tachypnea"]
define "Tachypnea Observation":
  [Observation: Concepts."Tachypnea"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Tachypnea"
/* End of Tachypnea */

/*
@dataElement: HIV.D.DE21 - Unable to walk unaided
@activity: HIV.D3 Check for signs of serious illness
@description: Client is not able to walk without help
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unable to walk unaided":
  exists "Unable to walk unaided Condition"
    or exists "Unable to walk unaided Observation"
define "Unable to walk unaided Condition":
  [Condition: Concepts."Unable to walk unaided"]
define "Unable to walk unaided Observation":
  [Observation: Concepts."Unable to walk unaided"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unable to walk unaided"
/* End of Unable to walk unaided */

/*
@dataElement: HIV.D.DE22 - Lethargy - HIV.D.DE22
@activity: HIV.D3 Check for signs of serious illness
@description: Client is exhibiting lethargy as a sign of serious illness
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lethargy - HIV.D.DE22":
  exists "Lethargy - HIV.D.DE22 Condition"
    or exists "Lethargy - HIV.D.DE22 Observation"
define "Lethargy - HIV.D.DE22 Condition":
  [Condition: Concepts."Lethargy - HIV.D.DE22"]
define "Lethargy - HIV.D.DE22 Observation":
  [Observation: Concepts."Lethargy - HIV.D.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lethargy - HIV.D.DE22"
/* End of Lethargy - HIV.D.DE22 */

/*
@dataElement: HIV.D.DE23 - Unconsciousness
@activity: HIV.D3 Check for signs of serious illness
@description: Client is currently unconscious
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unconsciousness":
  exists "Unconsciousness Condition"
    or exists "Unconsciousness Observation"
define "Unconsciousness Condition":
  [Condition: Concepts."Unconsciousness"]
define "Unconsciousness Observation":
  [Observation: Concepts."Unconsciousness"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unconsciousness"
/* End of Unconsciousness */

/*
@dataElement: HIV.D.DE24 - Convulsions
@activity: HIV.D3 Check for signs of serious illness
@description: Client is convulsing
*/
// TODO: Replace placeholder with relevant CQL logic
define "Convulsions":
  exists "Convulsions Condition"
    or exists "Convulsions Observation"
define "Convulsions Condition":
  [Condition: Concepts."Convulsions"]
define "Convulsions Observation":
  [Observation: Concepts."Convulsions"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Convulsions"
/* End of Convulsions */

/*
@dataElement: HIV.D.DE25 - Unable to drink
@activity: HIV.D3 Check for signs of serious illness
@description: Child is not able to drink
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unable to drink":
  exists "Unable to drink Condition"
    or exists "Unable to drink Observation"
define "Unable to drink Condition":
  [Condition: Concepts."Unable to drink"]
define "Unable to drink Observation":
  [Observation: Concepts."Unable to drink"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unable to drink"
/* End of Unable to drink */

/*
@dataElement: HIV.D.DE26 - Unable to breastfeed
@activity: HIV.D3 Check for signs of serious illness
@description: Infant or child is not able to breastfeed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unable to breastfeed":
  exists "Unable to breastfeed Condition"
    or exists "Unable to breastfeed Observation"
define "Unable to breastfeed Condition":
  [Condition: Concepts."Unable to breastfeed"]
define "Unable to breastfeed Observation":
  [Observation: Concepts."Unable to breastfeed"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unable to breastfeed"
/* End of Unable to breastfeed */

/*
@dataElement: HIV.D.DE27 - Repeated vomiting
@activity: HIV.D3 Check for signs of serious illness
@description: Client is repeatedly vomiting
*/
// TODO: Replace placeholder with relevant CQL logic
define "Repeated vomiting":
  exists "Repeated vomiting Condition"
    or exists "Repeated vomiting Observation"
define "Repeated vomiting Condition":
  [Condition: Concepts."Repeated vomiting"]
define "Repeated vomiting Observation":
  [Observation: Concepts."Repeated vomiting"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Repeated vomiting"
/* End of Repeated vomiting */

/*
@dataElement: HIV.D.DE28 - Headache - HIV.D.DE28
@activity: HIV.D3 Check for signs of serious illness
@description: Client is exhibiting a headache
*/
// TODO: Replace placeholder with relevant CQL logic
define "Headache - HIV.D.DE28":
  exists "Headache - HIV.D.DE28 Condition"
    or exists "Headache - HIV.D.DE28 Observation"
define "Headache - HIV.D.DE28 Condition":
  [Condition: Concepts."Headache - HIV.D.DE28"]
define "Headache - HIV.D.DE28 Observation":
  [Observation: Concepts."Headache - HIV.D.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Headache - HIV.D.DE28"
/* End of Headache - HIV.D.DE28 */

/*
@dataElement: HIV.D.DE29 - Other sign of serious illness
@activity: HIV.D3 Check for signs of serious illness
@description: Client is exhibiting another sign of a serious illness
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other sign of serious illness":
  exists "Other sign of serious illness Condition"
    or exists "Other sign of serious illness Observation"
define "Other sign of serious illness Condition":
  [Condition: Concepts."Other sign of serious illness"]
define "Other sign of serious illness Observation":
  [Observation: Concepts."Other sign of serious illness"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other sign of serious illness"
/* End of Other sign of serious illness */

/*
@dataElement: HIV.D.DE31 - Currently pregnant - HIV.D.DE31
@activity: HIV.D8 Capture or update client history
@description: Client is currently pregnant
*/
// TODO: Replace placeholder with relevant CQL logic
define "Currently pregnant - HIV.D.DE31":
  [Observation: Concepts."Currently pregnant - HIV.D.DE31"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Currently pregnant - HIV.D.DE31 */

/*
@dataElement: HIV.D.DE32 - Breastfeeding - HIV.D.DE32
@activity: HIV.D8 Capture or update client history
@description: Client is giving infant breast milk
*/
// TODO: Replace placeholder with relevant CQL logic
define "Breastfeeding - HIV.D.DE32":
  [Observation: Concepts."Breastfeeding - HIV.D.DE32"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Breastfeeding - HIV.D.DE32 */

/*
@dataElement: HIV.D.DE37 - Serodiscordant partner - HIV.D.DE37
@activity: HIV.D8 Capture or update client history
@description: Client's HIV status is different from a current partner's HIV status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Serodiscordant partner - HIV.D.DE37":
  [Observation: Concepts."Serodiscordant partner - HIV.D.DE37"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Serodiscordant partner - HIV.D.DE37 */

/*
@dataElement: HIV.D.DE38 - On ART - HIV.D.DE38
@activity: HIV.D8 Capture or update client history
@description: Client is currently taking ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "On ART - HIV.D.DE38":
  [Observation: Concepts."On ART - HIV.D.DE38"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of On ART - HIV.D.DE38 */

/*
@dataElement: HIV.D.DE39 - ART start date - HIV.D.DE39
@activity: HIV.D8 Capture or update client history
@description: The date on which the client started or restarted ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "ART start date - HIV.D.DE39":
  [Observation: Concepts."ART start date - HIV.D.DE39"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of ART start date - HIV.D.DE39 */

/*
@dataElement: HIV.D.DE41 - Date ART stopped - HIV.D.DE41
@activity: HIV.D8 Capture or update client history
@description: Date on which client stopped ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date ART stopped - HIV.D.DE41":
  [Observation: Concepts."Date ART stopped - HIV.D.DE41"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date ART stopped - HIV.D.DE41 */

/*
@dataElement: HIV.D.DE42 - Established on ART
@activity: HIV.D8 Capture or update client history
@description: Is the client successfully established on ART?
*/
// TODO: Replace placeholder with relevant CQL logic
define "Established on ART":
  [Observation: Concepts."Established on ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Established on ART */

/*
@dataElement: HIV.D.DE43 - ART start type
@activity: HIV.D8 Capture or update client history
@description: Whether the client is ART naive or is restarting ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "ART start type Observation":
  [Observation: Concepts."ART start type"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of ART start type */

/*
@dataElement: HIV.D.DE44 - First-time user of ART
@activity: HIV.D8 Capture or update client history
@description: Client is ART naive, having never taken ART to treat HIV before
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-time user of ART":
  exists "First-time user of ART Condition"
    or exists "First-time user of ART Observation"
define "First-time user of ART Condition":
  [Condition: Concepts."First-time user of ART"]
define "First-time user of ART Observation":
  [Observation: Concepts."First-time user of ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First-time user of ART"
/* End of First-time user of ART */

/*
@dataElement: HIV.D.DE45 - Restarting ART
@activity: HIV.D8 Capture or update client history
@description: Client is restarting ART after stopping treatment for any reason
*/
// TODO: Replace placeholder with relevant CQL logic
define "Restarting ART":
  exists "Restarting ART Condition"
    or exists "Restarting ART Observation"
define "Restarting ART Condition":
  [Condition: Concepts."Restarting ART"]
define "Restarting ART Observation":
  [Observation: Concepts."Restarting ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Restarting ART"
/* End of Restarting ART */

/*
@dataElement: HIV.D.DE75 - Current ART regimen
@activity: HIV.D8 Capture or update client history
@description: The current ART regimen the client is taking
*/
// TODO: Replace placeholder with relevant CQL logic
define "Current ART regimen Observation":
  [Observation: Concepts."Current ART regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Current ART regimen */

/*
@dataElement: HIV.D.DE77 - Preferred first-line ART regimen
@activity: HIV.D8 Capture or update client history
@description: The preferred first-line ART regimen for the client according to WHO (or national) guidelines
*/
// TODO: Replace placeholder with relevant CQL logic
define "Preferred first-line ART regimen Observation":
  [Observation: Concepts."Preferred first-line ART regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Preferred first-line ART regimen */

/*
@dataElement: HIV.D.DE78 - Alternative first-line ART regimen
@activity: HIV.D8 Capture or update client history
@description: The alternative first-line ART regimen for the client according to WHO (or national) guidelines
*/
// TODO: Replace placeholder with relevant CQL logic
define "Alternative first-line ART regimen Observation":
  [Observation: Concepts."Alternative first-line ART regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Alternative first-line ART regimen */

/*
@dataElement: HIV.D.DE79 - First-line ART regimen under special circumstances
@activity: HIV.D8 Capture or update client history
@description: The first-line ART regimen for the client under special circumstances according to WHO (or national) guidelines
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-line ART regimen under special circumstances Observation":
  [Observation: Concepts."First-line ART regimen under special circumstances"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of First-line ART regimen under special circumstances */

/*
@dataElement: HIV.D.DE80 - Preferred second-line ART regimen
@activity: HIV.D8 Capture or update client history
@description: The preferred second-line ART regimen for the client according to WHO (or national) guidelines
*/
// TODO: Replace placeholder with relevant CQL logic
define "Preferred second-line ART regimen Observation":
  [Observation: Concepts."Preferred second-line ART regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Preferred second-line ART regimen */

/*
@dataElement: HIV.D.DE81 - Alternative second-line ART regimen
@activity: HIV.D8 Capture or update client history
@description: The alternative second-line ART regimen for the client according to WHO (or national) guidelines
*/
// TODO: Replace placeholder with relevant CQL logic
define "Alternative second-line ART regimen Observation":
  [Observation: Concepts."Alternative second-line ART regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Alternative second-line ART regimen */

/*
@dataElement: HIV.D.DE82 - Optimal regimen for transition
@activity: HIV.D8 Capture or update client history
@description: The optimal regimen for transition to DTG-based regimens for children established on ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Optimal regimen for transition Observation":
  [Observation: Concepts."Optimal regimen for transition"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Optimal regimen for transition */

/*
@dataElement: HIV.D.DE83 - Current ART regimen first-, second-, or third-line
@activity: HIV.D8 Capture or update client history
@description: ART regimen for treating clients living with HIV, based on national guidance
*/
// TODO: Replace placeholder with relevant CQL logic
define "Current ART regimen first-, second-, or third-line Observation":
  [Observation: Concepts."Current ART regimen first-, second-, or third-line"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Current ART regimen first-, second-, or third-line */

/*
@dataElement: HIV.D.DE84 - First-line ART regimen for adults and adolescents
@activity: HIV.D8 Capture or update client history
@description: First-line ART regimen for adults and adolescents living with HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-line ART regimen for adults and adolescents":
  exists "First-line ART regimen for adults and adolescents Condition"
    or exists "First-line ART regimen for adults and adolescents Observation"
define "First-line ART regimen for adults and adolescents Condition":
  [Condition: Concepts."First-line ART regimen for adults and adolescents"]
define "First-line ART regimen for adults and adolescents Observation":
  [Observation: Concepts."First-line ART regimen for adults and adolescents"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First-line ART regimen for adults and adolescents"
/* End of First-line ART regimen for adults and adolescents */

/*
@dataElement: HIV.D.DE85 - First-line ART regimen for children
@activity: HIV.D8 Capture or update client history
@description: First-line ART regimen for children living with HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-line ART regimen for children":
  exists "First-line ART regimen for children Condition"
    or exists "First-line ART regimen for children Observation"
define "First-line ART regimen for children Condition":
  [Condition: Concepts."First-line ART regimen for children"]
define "First-line ART regimen for children Observation":
  [Observation: Concepts."First-line ART regimen for children"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First-line ART regimen for children"
/* End of First-line ART regimen for children */

/*
@dataElement: HIV.D.DE86 - First-line ART regimen for neonates
@activity: HIV.D8 Capture or update client history
@description: First-line ART regimen for neonates living with HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "First-line ART regimen for neonates":
  exists "First-line ART regimen for neonates Condition"
    or exists "First-line ART regimen for neonates Observation"
define "First-line ART regimen for neonates Condition":
  [Condition: Concepts."First-line ART regimen for neonates"]
define "First-line ART regimen for neonates Observation":
  [Observation: Concepts."First-line ART regimen for neonates"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First-line ART regimen for neonates"
/* End of First-line ART regimen for neonates */

/*
@dataElement: HIV.D.DE87 - Second-line ART regimen for adults and adolescents
@activity: HIV.D8 Capture or update client history
@description: Second-line ART regimen for adults and adolescents living with HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Second-line ART regimen for adults and adolescents":
  exists "Second-line ART regimen for adults and adolescents Condition"
    or exists "Second-line ART regimen for adults and adolescents Observation"
define "Second-line ART regimen for adults and adolescents Condition":
  [Condition: Concepts."Second-line ART regimen for adults and adolescents"]
define "Second-line ART regimen for adults and adolescents Observation":
  [Observation: Concepts."Second-line ART regimen for adults and adolescents"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Second-line ART regimen for adults and adolescents"
/* End of Second-line ART regimen for adults and adolescents */

/*
@dataElement: HIV.D.DE88 - Second-line ART regimen for children
@activity: HIV.D8 Capture or update client history
@description: Second-line ART regimen for children living with HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Second-line ART regimen for children":
  exists "Second-line ART regimen for children Condition"
    or exists "Second-line ART regimen for children Observation"
define "Second-line ART regimen for children Condition":
  [Condition: Concepts."Second-line ART regimen for children"]
define "Second-line ART regimen for children Observation":
  [Observation: Concepts."Second-line ART regimen for children"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Second-line ART regimen for children"
/* End of Second-line ART regimen for children */

/*
@dataElement: HIV.D.DE89 - Third-line ART regimen
@activity: HIV.D8 Capture or update client history
@description: Third-line ART regimen for people living with HIV (Not defined by WHO. National programmes should develop policies for third-line ART)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Third-line ART regimen":
  exists "Third-line ART regimen Condition"
    or exists "Third-line ART regimen Observation"
define "Third-line ART regimen Condition":
  [Condition: Concepts."Third-line ART regimen"]
define "Third-line ART regimen Observation":
  [Observation: Concepts."Third-line ART regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Third-line ART regimen"
/* End of Third-line ART regimen */

/*
@dataElement: HIV.D.DE128 - ART regimen composition
@activity: HIV.D8 Capture or update client history
@description: Drug composition of client's current ART regimen
*/
// TODO: Replace placeholder with relevant CQL logic
define "ART regimen composition Observation":
  [Observation: Concepts."ART regimen composition"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of ART regimen composition */

/*
@dataElement: HIV.D.DE129 - ABC
@activity: HIV.D8 Capture or update client history
@description: Treated with abacavir (ABC)
*/
// TODO: Replace placeholder with relevant CQL logic
define "ABC":
  exists "ABC Condition"
    or exists "ABC Observation"
define "ABC Condition":
  [Condition: Concepts."ABC"]
define "ABC Observation":
  [Observation: Concepts."ABC"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."ABC"
/* End of ABC */

/*
@dataElement: HIV.D.DE130 - FTC
@activity: HIV.D8 Capture or update client history
@description: Treated with emtricitabine (FTC)
*/
// TODO: Replace placeholder with relevant CQL logic
define "FTC":
  exists "FTC Condition"
    or exists "FTC Observation"
define "FTC Condition":
  [Condition: Concepts."FTC"]
define "FTC Observation":
  [Observation: Concepts."FTC"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."FTC"
/* End of FTC */

/*
@dataElement: HIV.D.DE131 - 3TC
@activity: HIV.D8 Capture or update client history
@description: Treated with lamivudine (3TC)
*/
// TODO: Replace placeholder with relevant CQL logic
define "3TC":
  exists "3TC Condition"
    or exists "3TC Observation"
define "3TC Condition":
  [Condition: Concepts."3TC"]
define "3TC Observation":
  [Observation: Concepts."3TC"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."3TC"
/* End of 3TC */

/*
@dataElement: HIV.D.DE132 - AZT
@activity: HIV.D8 Capture or update client history
@description: Treated with zidovudine (AZT)
*/
// TODO: Replace placeholder with relevant CQL logic
define "AZT":
  exists "AZT Condition"
    or exists "AZT Observation"
define "AZT Condition":
  [Condition: Concepts."AZT"]
define "AZT Observation":
  [Observation: Concepts."AZT"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."AZT"
/* End of AZT */

/*
@dataElement: HIV.D.DE133 - DDI
@activity: HIV.D8 Capture or update client history
@description: Treated with didanosine (DDI)
*/
// TODO: Replace placeholder with relevant CQL logic
define "DDI":
  exists "DDI Condition"
    or exists "DDI Observation"
define "DDI Condition":
  [Condition: Concepts."DDI"]
define "DDI Observation":
  [Observation: Concepts."DDI"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."DDI"
/* End of DDI */

/*
@dataElement: HIV.D.DE134 - D4T
@activity: HIV.D8 Capture or update client history
@description: Treated with stavudine (D4T)
*/
// TODO: Replace placeholder with relevant CQL logic
define "D4T":
  exists "D4T Condition"
    or exists "D4T Observation"
define "D4T Condition":
  [Condition: Concepts."D4T"]
define "D4T Observation":
  [Observation: Concepts."D4T"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."D4T"
/* End of D4T */

/*
@dataElement: HIV.D.DE135 - TDF - HIV.D.DE135
@activity: HIV.D8 Capture or update client history
@description: Treated with tenofovir (TDF)
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF - HIV.D.DE135":
  exists "TDF - HIV.D.DE135 Condition"
    or exists "TDF - HIV.D.DE135 Observation"
define "TDF - HIV.D.DE135 Condition":
  [Condition: Concepts."TDF - HIV.D.DE135"]
define "TDF - HIV.D.DE135 Observation":
  [Observation: Concepts."TDF - HIV.D.DE128"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF - HIV.D.DE135"
/* End of TDF - HIV.D.DE135 */

/*
@dataElement: HIV.D.DE136 - EFV
@activity: HIV.D8 Capture or update client history
@description: Treated with efavirenz (EFV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "EFV":
  exists "EFV Condition"
    or exists "EFV Observation"
define "EFV Condition":
  [Condition: Concepts."EFV"]
define "EFV Observation":
  [Observation: Concepts."EFV"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."EFV"
/* End of EFV */

/*
@dataElement: HIV.D.DE137 - ETV
@activity: HIV.D8 Capture or update client history
@description: Treated with etravirine (ETV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "ETV":
  exists "ETV Condition"
    or exists "ETV Observation"
define "ETV Condition":
  [Condition: Concepts."ETV"]
define "ETV Observation":
  [Observation: Concepts."ETV"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."ETV"
/* End of ETV */

/*
@dataElement: HIV.D.DE138 - NVP
@activity: HIV.D8 Capture or update client history
@description: Treated with nevirapine (NVP)
*/
// TODO: Replace placeholder with relevant CQL logic
define "NVP":
  exists "NVP Condition"
    or exists "NVP Observation"
define "NVP Condition":
  [Condition: Concepts."NVP"]
define "NVP Observation":
  [Observation: Concepts."NVP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."NVP"
/* End of NVP */

/*
@dataElement: HIV.D.DE139 - RIL
@activity: HIV.D8 Capture or update client history
@description: Treated with rilpivirine (RIL)
*/
// TODO: Replace placeholder with relevant CQL logic
define "RIL":
  exists "RIL Condition"
    or exists "RIL Observation"
define "RIL Condition":
  [Condition: Concepts."RIL"]
define "RIL Observation":
  [Observation: Concepts."RIL"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."RIL"
/* End of RIL */

/*
@dataElement: HIV.D.DE140 - ATV/r - HIV.D.DE140
@activity: HIV.D8 Capture or update client history
@description: Treated with atazanavir/ritonavir (ATV/r)
*/
// TODO: Replace placeholder with relevant CQL logic
define "ATV/r - HIV.D.DE140":
  exists "ATV/r - HIV.D.DE140 Condition"
    or exists "ATV/r - HIV.D.DE140 Observation"
define "ATV/r - HIV.D.DE140 Condition":
  [Condition: Concepts."ATV/r - HIV.D.DE140"]
define "ATV/r - HIV.D.DE140 Observation":
  [Observation: Concepts."ATV/r - HIV.D.DE128"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."ATV/r - HIV.D.DE140"
/* End of ATV/r - HIV.D.DE140 */

/*
@dataElement: HIV.D.DE141 - LPV/r - HIV.D.DE141
@activity: HIV.D8 Capture or update client history
@description: Treated with lopinavir/ritonavir (LPV/r)
*/
// TODO: Replace placeholder with relevant CQL logic
define "LPV/r - HIV.D.DE141":
  exists "LPV/r - HIV.D.DE141 Condition"
    or exists "LPV/r - HIV.D.DE141 Observation"
define "LPV/r - HIV.D.DE141 Condition":
  [Condition: Concepts."LPV/r - HIV.D.DE141"]
define "LPV/r - HIV.D.DE141 Observation":
  [Observation: Concepts."LPV/r - HIV.D.DE128"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."LPV/r - HIV.D.DE141"
/* End of LPV/r - HIV.D.DE141 */

/*
@dataElement: HIV.D.DE142 - DRV/r - HIV.D.DE142
@activity: HIV.D8 Capture or update client history
@description: Treated with darunavir/ritonavir (DRV/r)
*/
// TODO: Replace placeholder with relevant CQL logic
define "DRV/r - HIV.D.DE142":
  exists "DRV/r - HIV.D.DE142 Condition"
    or exists "DRV/r - HIV.D.DE142 Observation"
define "DRV/r - HIV.D.DE142 Condition":
  [Condition: Concepts."DRV/r - HIV.D.DE142"]
define "DRV/r - HIV.D.DE142 Observation":
  [Observation: Concepts."DRV/r - HIV.D.DE128"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."DRV/r - HIV.D.DE142"
/* End of DRV/r - HIV.D.DE142 */

/*
@dataElement: HIV.D.DE143 - RTV
@activity: HIV.D8 Capture or update client history
@description: Treated with ritonavir (RTV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "RTV":
  exists "RTV Condition"
    or exists "RTV Observation"
define "RTV Condition":
  [Condition: Concepts."RTV"]
define "RTV Observation":
  [Observation: Concepts."RTV"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."RTV"
/* End of RTV */

/*
@dataElement: HIV.D.DE144 - DTG - HIV.D.DE144
@activity: HIV.D8 Capture or update client history
@description: Treated with dolutegravir (DTG)
*/
// TODO: Replace placeholder with relevant CQL logic
define "DTG - HIV.D.DE144":
  exists "DTG - HIV.D.DE144 Condition"
    or exists "DTG - HIV.D.DE144 Observation"
define "DTG - HIV.D.DE144 Condition":
  [Condition: Concepts."DTG - HIV.D.DE144"]
define "DTG - HIV.D.DE144 Observation":
  [Observation: Concepts."DTG - HIV.D.DE128"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."DTG - HIV.D.DE144"
/* End of DTG - HIV.D.DE144 */

/*
@dataElement: HIV.D.DE145 - RAL - HIV.D.DE145
@activity: HIV.D8 Capture or update client history
@description: Treated with raltegravir (RAL)
*/
// TODO: Replace placeholder with relevant CQL logic
define "RAL - HIV.D.DE145":
  exists "RAL - HIV.D.DE145 Condition"
    or exists "RAL - HIV.D.DE145 Observation"
define "RAL - HIV.D.DE145 Condition":
  [Condition: Concepts."RAL - HIV.D.DE145"]
define "RAL - HIV.D.DE145 Observation":
  [Observation: Concepts."RAL - HIV.D.DE128"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."RAL - HIV.D.DE145"
/* End of RAL - HIV.D.DE145 */

/*
@dataElement: HIV.D.DE152 - Prevention services offered and referrals - HIV.D.DE152
@activity: HIV.D12 Determine recommended screenings and tests
@description: Offer or refer for prevention services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Prevention services offered and referrals - HIV.D.DE152 Observation":
  [Observation: Concepts."Prevention services offered and referrals - HIV.D.DE152"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Prevention services offered and referrals - HIV.D.DE152 */

/*
@dataElement: HIV.D.DE153 - Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Offer male and female condoms and condom-compatible lubricants
*/
// TODO: Replace placeholder with relevant CQL logic
define "Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153":
  exists "Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153 Condition"
    or exists "Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153 Observation"
define "Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153 Condition":
  [Condition: Concepts."Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153"]
define "Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153 Observation":
  [Observation: Concepts."Offer male and female condoms and condom-compatible lubricants - HIV.D.DE152"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153"
/* End of Offer male and female condoms and condom-compatible lubricants - HIV.D.DE153 */

/*
@dataElement: HIV.D.DE154 - Harm reduction for people who inject drugs - HIV.D.DE154
@activity: HIV.D12 Determine recommended screenings and tests
@description: Offer or refer people who inject drugs to harm reduction services (needle and syringe programmes, opioid substitution therapy, other drug-dependence treatment and opioid overdose prevention and management)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Harm reduction for people who inject drugs - HIV.D.DE154":
  exists "Harm reduction for people who inject drugs - HIV.D.DE154 Condition"
    or exists "Harm reduction for people who inject drugs - HIV.D.DE154 Observation"
define "Harm reduction for people who inject drugs - HIV.D.DE154 Condition":
  [Condition: Concepts."Harm reduction for people who inject drugs - HIV.D.DE154"]
define "Harm reduction for people who inject drugs - HIV.D.DE154 Observation":
  [Observation: Concepts."Harm reduction for people who inject drugs - HIV.D.DE152"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Harm reduction for people who inject drugs - HIV.D.DE154"
/* End of Harm reduction for people who inject drugs - HIV.D.DE154 */

/*
@dataElement: HIV.D.DE155 - Behavioural interventions to support risk reduction - HIV.D.DE155
@activity: HIV.D12 Determine recommended screenings and tests
@description: Offer or refer to services for behavioural interventions to support risk reduction, particularly for people with HIV and members of key populations
*/
// TODO: Replace placeholder with relevant CQL logic
define "Behavioural interventions to support risk reduction - HIV.D.DE155":
  exists "Behavioural interventions to support risk reduction - HIV.D.DE155 Condition"
    or exists "Behavioural interventions to support risk reduction - HIV.D.DE155 Observation"
define "Behavioural interventions to support risk reduction - HIV.D.DE155 Condition":
  [Condition: Concepts."Behavioural interventions to support risk reduction - HIV.D.DE155"]
define "Behavioural interventions to support risk reduction - HIV.D.DE155 Observation":
  [Observation: Concepts."Behavioural interventions to support risk reduction - HIV.D.DE152"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Behavioural interventions to support risk reduction - HIV.D.DE155"
/* End of Behavioural interventions to support risk reduction - HIV.D.DE155 */

/*
@dataElement: HIV.D.DE156 - Sexual and reproductive health integrated services - HIV.D.DE156
@activity: HIV.D12 Determine recommended screenings and tests
@description: Offer or refer to sexual and reproductive health services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sexual and reproductive health integrated services - HIV.D.DE156 Observation":
  [Observation: Concepts."Sexual and reproductive health integrated services - HIV.D.DE156"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Sexual and reproductive health integrated services - HIV.D.DE156 */

/*
@dataElement: HIV.D.DE157 - Contraception and family planning - HIV.D.DE157
@activity: HIV.D12 Determine recommended screenings and tests
@description: Offer contraception and family planning services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Contraception and family planning - HIV.D.DE157":
  exists "Contraception and family planning - HIV.D.DE157 Condition"
    or exists "Contraception and family planning - HIV.D.DE157 Observation"
define "Contraception and family planning - HIV.D.DE157 Condition":
  [Condition: Concepts."Contraception and family planning - HIV.D.DE157"]
define "Contraception and family planning - HIV.D.DE157 Observation":
  [Observation: Concepts."Contraception and family planning - HIV.D.DE156"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Contraception and family planning - HIV.D.DE157"
/* End of Contraception and family planning - HIV.D.DE157 */

/*
@dataElement: HIV.D.DE158 - Check pregnancy status - HIV.D.DE158
@activity: HIV.D12 Determine recommended screenings and tests
@description: Check woman's pregnancy status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Check pregnancy status - HIV.D.DE158":
  exists "Check pregnancy status - HIV.D.DE158 Condition"
    or exists "Check pregnancy status - HIV.D.DE158 Observation"
define "Check pregnancy status - HIV.D.DE158 Condition":
  [Condition: Concepts."Check pregnancy status - HIV.D.DE158"]
define "Check pregnancy status - HIV.D.DE158 Observation":
  [Observation: Concepts."Check pregnancy status - HIV.D.DE156"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Check pregnancy status - HIV.D.DE158"
/* End of Check pregnancy status - HIV.D.DE158 */

/*
@dataElement: HIV.D.DE159 - Prevention of mother-to-child transmission
@activity: HIV.D12 Determine recommended screenings and tests
@description: Offer prevention of mother-to-child transmission services (counselling)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Prevention of mother-to-child transmission":
  exists "Prevention of mother-to-child transmission Condition"
    or exists "Prevention of mother-to-child transmission Observation"
define "Prevention of mother-to-child transmission Condition":
  [Condition: Concepts."Prevention of mother-to-child transmission"]
define "Prevention of mother-to-child transmission Observation":
  [Observation: Concepts."Prevention of mother-to-child transmission"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Prevention of mother-to-child transmission"
/* End of Prevention of mother-to-child transmission */

/*
@dataElement: HIV.D.DE160 - STI testing and treatment - HIV.D.DE160
@activity: HIV.D12 Determine recommended screenings and tests
@description: Offer STI testing and treatment services
*/
// TODO: Replace placeholder with relevant CQL logic
define "STI testing and treatment - HIV.D.DE160":
  exists "STI testing and treatment - HIV.D.DE160 Condition"
    or exists "STI testing and treatment - HIV.D.DE160 Observation"
define "STI testing and treatment - HIV.D.DE160 Condition":
  [Condition: Concepts."STI testing and treatment - HIV.D.DE160"]
define "STI testing and treatment - HIV.D.DE160 Observation":
  [Observation: Concepts."STI testing and treatment - HIV.D.DE156"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."STI testing and treatment - HIV.D.DE160"
/* End of STI testing and treatment - HIV.D.DE160 */

/*
@dataElement: HIV.D.DE161 - HBsAg test date - HIV.D.DE161
@activity: HIV.D12 Determine recommended screenings and tests
@description: Date client was tested for hepatitis B virus (HBV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HBsAg test date - HIV.D.DE161":
  [Observation: Concepts."HBsAg test date - HIV.D.DE161"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HBsAg test date - HIV.D.DE161 */

/*
@dataElement: HIV.D.DE162 - HBsAg test result - HIV.D.DE162
@activity: HIV.D12 Determine recommended screenings and tests
@description: Hepatitis B virus test result (HBsAg)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HBsAg test result - HIV.D.DE162 Observation":
  [Observation: Concepts."HBsAg test result - HIV.D.DE162"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HBsAg test result - HIV.D.DE162 */

/*
@dataElement: HIV.D.DE163 - Positive - HIV.D.DE163
@activity: HIV.D12 Determine recommended screenings and tests
@description: HBsAg test result was positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.D.DE163":
  exists "Positive - HIV.D.DE163 Condition"
    or exists "Positive - HIV.D.DE163 Observation"
define "Positive - HIV.D.DE163 Condition":
  [Condition: Concepts."Positive - HIV.D.DE163"]
define "Positive - HIV.D.DE163 Observation":
  [Observation: Concepts."Positive - HIV.D.DE162"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.D.DE163"
/* End of Positive - HIV.D.DE163 */

/*
@dataElement: HIV.D.DE164 - Negative - HIV.D.DE164
@activity: HIV.D12 Determine recommended screenings and tests
@description: HBsAg test result was negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.D.DE164":
  exists "Negative - HIV.D.DE164 Condition"
    or exists "Negative - HIV.D.DE164 Observation"
define "Negative - HIV.D.DE164 Condition":
  [Condition: Concepts."Negative - HIV.D.DE164"]
define "Negative - HIV.D.DE164 Observation":
  [Observation: Concepts."Negative - HIV.D.DE162"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.D.DE164"
/* End of Negative - HIV.D.DE164 */

/*
@dataElement: HIV.D.DE165 - Indeterminate - HIV.D.DE165
@activity: HIV.D12 Determine recommended screenings and tests
@description: HBsAg test result was indeterminate
*/
// TODO: Replace placeholder with relevant CQL logic
define "Indeterminate - HIV.D.DE165":
  exists "Indeterminate - HIV.D.DE165 Condition"
    or exists "Indeterminate - HIV.D.DE165 Observation"
define "Indeterminate - HIV.D.DE165 Condition":
  [Condition: Concepts."Indeterminate - HIV.D.DE165"]
define "Indeterminate - HIV.D.DE165 Observation":
  [Observation: Concepts."Indeterminate - HIV.D.DE162"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Indeterminate - HIV.D.DE165"
/* End of Indeterminate - HIV.D.DE165 */

/*
@dataElement: HIV.D.DE167 - HBV treatment TDF start date
@activity: HIV.D12 Determine recommended screenings and tests
@description: Date when client started treatment (TDF) for hepatitis B virus (HBV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HBV treatment TDF start date":
  [Observation: Concepts."HBV treatment TDF start date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HBV treatment TDF start date */

/*
@dataElement: HIV.D.DE169 - HCV test date - HIV.D.DE169
@activity: HIV.D12 Determine recommended screenings and tests
@description: Date client was tested for hepatitis C virus (HCV antibody, HCV RNA or HCV core antigen)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV test date - HIV.D.DE169":
  [Observation: Concepts."HCV test date - HIV.D.DE169"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HCV test date - HIV.D.DE169 */

/*
@dataElement: HIV.D.DE170 - HCV test result - HIV.D.DE170
@activity: HIV.D12 Determine recommended screenings and tests
@description: Hepatitis C virus test result (HCV antibody, HCV RNA or HCV core antigen)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV test result - HIV.D.DE170 Observation":
  [Observation: Concepts."HCV test result - HIV.D.DE170"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HCV test result - HIV.D.DE170 */

/*
@dataElement: HIV.D.DE171 - Positive - HIV.D.DE171
@activity: HIV.D12 Determine recommended screenings and tests
@description: HCV test result was positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.D.DE171":
  exists "Positive - HIV.D.DE171 Condition"
    or exists "Positive - HIV.D.DE171 Observation"
define "Positive - HIV.D.DE171 Condition":
  [Condition: Concepts."Positive - HIV.D.DE171"]
define "Positive - HIV.D.DE171 Observation":
  [Observation: Concepts."Positive - HIV.D.DE170"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.D.DE171"
/* End of Positive - HIV.D.DE171 */

/*
@dataElement: HIV.D.DE172 - Negative - HIV.D.DE172
@activity: HIV.D12 Determine recommended screenings and tests
@description: HCV test result was negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.D.DE172":
  exists "Negative - HIV.D.DE172 Condition"
    or exists "Negative - HIV.D.DE172 Observation"
define "Negative - HIV.D.DE172 Condition":
  [Condition: Concepts."Negative - HIV.D.DE172"]
define "Negative - HIV.D.DE172 Observation":
  [Observation: Concepts."Negative - HIV.D.DE170"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.D.DE172"
/* End of Negative - HIV.D.DE172 */

/*
@dataElement: HIV.D.DE173 - Indeterminate - HIV.D.DE173
@activity: HIV.D12 Determine recommended screenings and tests
@description: HCV test result was indeterminate
*/
// TODO: Replace placeholder with relevant CQL logic
define "Indeterminate - HIV.D.DE173":
  exists "Indeterminate - HIV.D.DE173 Condition"
    or exists "Indeterminate - HIV.D.DE173 Observation"
define "Indeterminate - HIV.D.DE173 Condition":
  [Condition: Concepts."Indeterminate - HIV.D.DE173"]
define "Indeterminate - HIV.D.DE173 Observation":
  [Observation: Concepts."Indeterminate - HIV.D.DE170"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Indeterminate - HIV.D.DE173"
/* End of Indeterminate - HIV.D.DE173 */

/*
@dataElement: HIV.D.DE175 - HCV treatment start date
@activity: HIV.D12 Determine recommended screenings and tests
@description: Date when client started treatment for hepatitis C virus (HCV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV treatment start date":
  [Observation: Concepts."HCV treatment start date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HCV treatment start date */

/*
@dataElement: HIV.D.DE176 - HCV treatment completion date
@activity: HIV.D12 Determine recommended screenings and tests
@description: Date when client completed treatment for hepatitis C virus (HCV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV treatment completion date":
  [Observation: Concepts."HCV treatment completion date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HCV treatment completion date */

/*
@dataElement: HIV.D.DE178 - HCV viral load test date - HIV.D.DE178
@activity: HIV.D12 Determine recommended screenings and tests
@description: Hepatitis C viral load test date
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV viral load test date - HIV.D.DE178":
  [Observation: Concepts."HCV viral load test date - HIV.D.DE178"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HCV viral load test date - HIV.D.DE178 */

/*
@dataElement: HIV.D.DE179 - HCV viral load test result - HIV.D.DE179
@activity: HIV.D12 Determine recommended screenings and tests
@description: Hepatitis C viral load test result (qualitative)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV viral load test result - HIV.D.DE179 Observation":
  [Observation: Concepts."HCV viral load test result - HIV.D.DE179"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HCV viral load test result - HIV.D.DE179 */

/*
@dataElement: HIV.D.DE180 - Detected - HIV.D.DE180
@activity: HIV.D12 Determine recommended screenings and tests
@description: HCV was detected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Detected - HIV.D.DE180":
  exists "Detected - HIV.D.DE180 Condition"
    or exists "Detected - HIV.D.DE180 Observation"
define "Detected - HIV.D.DE180 Condition":
  [Condition: Concepts."Detected - HIV.D.DE180"]
define "Detected - HIV.D.DE180 Observation":
  [Observation: Concepts."Detected - HIV.D.DE179"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Detected - HIV.D.DE180"
/* End of Detected - HIV.D.DE180 */

/*
@dataElement: HIV.D.DE181 - Not detected - HIV.D.DE181
@activity: HIV.D12 Determine recommended screenings and tests
@description: HCV was not detected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Not detected - HIV.D.DE181":
  exists "Not detected - HIV.D.DE181 Condition"
    or exists "Not detected - HIV.D.DE181 Observation"
define "Not detected - HIV.D.DE181 Condition":
  [Condition: Concepts."Not detected - HIV.D.DE181"]
define "Not detected - HIV.D.DE181 Observation":
  [Observation: Concepts."Not detected - HIV.D.DE179"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Not detected - HIV.D.DE181"
/* End of Not detected - HIV.D.DE181 */

/*
@dataElement: HIV.D.DE182 - HCV medicine type
@activity: HIV.D12 Determine recommended screenings and tests
@description: Type of medicine client is prescribed
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV medicine type Observation":
  [Observation: Concepts."HCV medicine type"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HCV medicine type */

/*
@dataElement: HIV.D.DE183 - Interferon
@activity: HIV.D12 Determine recommended screenings and tests
@description: Client is prescribed interferon
*/
// TODO: Replace placeholder with relevant CQL logic
define "Interferon":
  exists "Interferon Condition"
    or exists "Interferon Observation"
define "Interferon Condition":
  [Condition: Concepts."Interferon"]
define "Interferon Observation":
  [Observation: Concepts."Interferon"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Interferon"
/* End of Interferon */

/*
@dataElement: HIV.D.DE184 - Direct acting antivirals
@activity: HIV.D12 Determine recommended screenings and tests
@description: Client is prescribed direct acting antivirals
*/
// TODO: Replace placeholder with relevant CQL logic
define "Direct acting antivirals":
  exists "Direct acting antivirals Condition"
    or exists "Direct acting antivirals Observation"
define "Direct acting antivirals Condition":
  [Condition: Concepts."Direct acting antivirals"]
define "Direct acting antivirals Observation":
  [Observation: Concepts."Direct acting antivirals"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Direct acting antivirals"
/* End of Direct acting antivirals */

/*
@dataElement: HIV.D.DE185 - Currently on TDF-based ART
@activity: HIV.D12 Determine recommended screenings and tests
@description: Client is currently on TDF-based ART regimen
*/
// TODO: Replace placeholder with relevant CQL logic
define "Currently on TDF-based ART":
  [Observation: Concepts."Currently on TDF-based ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Currently on TDF-based ART */

/*
@dataElement: HIV.D.DE186 - HIV clinical stage - HIV.D.DE186
@activity: HIV.D8 Capture or update client history
@description: WHO clinical stage of client based on signs and symptoms. WHO clinical staging is a way to categorize HIV disease severity based on new or recurrent clinical events. There are 4 WHO clinical stages that range from mild symptoms (WHO clinical stage 1) to severe symptoms (WHO clinical stage 4).
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV clinical stage - HIV.D.DE186 Observation":
  [Observation: Concepts."HIV clinical stage - HIV.D.DE186"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV clinical stage - HIV.D.DE186 */

/*
@dataElement: HIV.D.DE187 - WHO HIV clinical stage 1
@activity: HIV.D8 Capture or update client history
@description: Client is currently assessed to be at a clinical stage 1, based on clinical assessment and diagnostics
*/
// TODO: Replace placeholder with relevant CQL logic
define "WHO HIV clinical stage 1":
  exists "WHO HIV clinical stage 1 Condition"
    or exists "WHO HIV clinical stage 1 Observation"
define "WHO HIV clinical stage 1 Condition":
  [Condition: Concepts."WHO HIV clinical stage 1"]
define "WHO HIV clinical stage 1 Observation":
  [Observation: Concepts."WHO HIV clinical stage 1"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."WHO HIV clinical stage 1"
/* End of WHO HIV clinical stage 1 */

/*
@dataElement: HIV.D.DE188 - WHO HIV clinical stage 2
@activity: HIV.D8 Capture or update client history
@description: Client is currently assessed to be at a clinical stage 2, based on clinical assessment and diagnostics
*/
// TODO: Replace placeholder with relevant CQL logic
define "WHO HIV clinical stage 2":
  exists "WHO HIV clinical stage 2 Condition"
    or exists "WHO HIV clinical stage 2 Observation"
define "WHO HIV clinical stage 2 Condition":
  [Condition: Concepts."WHO HIV clinical stage 2"]
define "WHO HIV clinical stage 2 Observation":
  [Observation: Concepts."WHO HIV clinical stage 2"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."WHO HIV clinical stage 2"
/* End of WHO HIV clinical stage 2 */

/*
@dataElement: HIV.D.DE189 - WHO HIV clinical stage 3
@activity: HIV.D8 Capture or update client history
@description: Client is currently assessed to be at a clinical stage 3, based on clinical assessment and diagnostics
*/
// TODO: Replace placeholder with relevant CQL logic
define "WHO HIV clinical stage 3":
  exists "WHO HIV clinical stage 3 Condition"
    or exists "WHO HIV clinical stage 3 Observation"
define "WHO HIV clinical stage 3 Condition":
  [Condition: Concepts."WHO HIV clinical stage 3"]
define "WHO HIV clinical stage 3 Observation":
  [Observation: Concepts."WHO HIV clinical stage 3"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."WHO HIV clinical stage 3"
/* End of WHO HIV clinical stage 3 */

/*
@dataElement: HIV.D.DE190 - WHO HIV clinical stage 4
@activity: HIV.D8 Capture or update client history
@description: Client is currently assessed to be at a clinical stage 4, based on clinical assessment and diagnostics
*/
// TODO: Replace placeholder with relevant CQL logic
define "WHO HIV clinical stage 4":
  exists "WHO HIV clinical stage 4 Condition"
    or exists "WHO HIV clinical stage 4 Observation"
define "WHO HIV clinical stage 4 Condition":
  [Condition: Concepts."WHO HIV clinical stage 4"]
define "WHO HIV clinical stage 4 Observation":
  [Observation: Concepts."WHO HIV clinical stage 4"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."WHO HIV clinical stage 4"
/* End of WHO HIV clinical stage 4 */

/*
@dataElement: HIV.D.DE193 - Date viral load test results received by client - HIV.D.DE193
@activity: HIV.D10 Counsel returning client
@description: The date on which the client received results from viral load test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date viral load test results received by client - HIV.D.DE193":
  [Observation: Concepts."Date viral load test results received by client - HIV.D.DE193"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date viral load test results received by client - HIV.D.DE193 */

/*
@dataElement: HIV.D.DE194 - Date of viral load sample collection - HIV.D.DE194
@activity: HIV.D10 Counsel returning client
@description: Date and time when the sample was collected to test the client's HIV viral load
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of viral load sample collection - HIV.D.DE194":
  [Observation: Concepts."Date of viral load sample collection - HIV.D.DE194"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of viral load sample collection - HIV.D.DE194 */

/*
@dataElement: HIV.D.DE195 - Date of scheduled review of viral load test results
@activity: HIV.D10 Counsel returning client
@description: Expected date when client's viral load test results will be returned and reviewed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of scheduled review of viral load test results":
  [Observation: Concepts."Date of scheduled review of viral load test results"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of scheduled review of viral load test results */

/*
@dataElement: HIV.D.DE217 - Reason ART stopped - HIV.D.DE217
@activity: HIV.D10 Counsel returning client
@description: Reason client intentionally stopped ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reason ART stopped - HIV.D.DE217 Observation":
  [Observation: Concepts."Reason ART stopped - HIV.D.DE217"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Reason ART stopped - HIV.D.DE217 */

/*
@dataElement: HIV.D.DE218 - Toxicity/side effects - HIV.D.DE218
@activity: HIV.D10 Counsel returning client
@description: Client stopped ART because of toxicity/side effects
*/
// TODO: Replace placeholder with relevant CQL logic
define "Toxicity/side effects - HIV.D.DE218":
  exists "Toxicity/side effects - HIV.D.DE218 Condition"
    or exists "Toxicity/side effects - HIV.D.DE218 Observation"
define "Toxicity/side effects - HIV.D.DE218 Condition":
  [Condition: Concepts."Toxicity/side effects - HIV.D.DE218"]
define "Toxicity/side effects - HIV.D.DE218 Observation":
  [Observation: Concepts."Toxicity/side effects - HIV.D.DE217"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Toxicity/side effects - HIV.D.DE218"
/* End of Toxicity/side effects - HIV.D.DE218 */

/*
@dataElement: HIV.D.DE219 - Severe illness, hospitalization - HIV.D.DE219
@activity: HIV.D10 Counsel returning client
@description: Client stopped ART because of severe illness, hospitalization
*/
// TODO: Replace placeholder with relevant CQL logic
define "Severe illness, hospitalization - HIV.D.DE219":
  exists "Severe illness, hospitalization - HIV.D.DE219 Condition"
    or exists "Severe illness, hospitalization - HIV.D.DE219 Observation"
define "Severe illness, hospitalization - HIV.D.DE219 Condition":
  [Condition: Concepts."Severe illness, hospitalization - HIV.D.DE219"]
define "Severe illness, hospitalization - HIV.D.DE219 Observation":
  [Observation: Concepts."Severe illness, hospitalization - HIV.D.DE217"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Severe illness, hospitalization - HIV.D.DE219"
/* End of Severe illness, hospitalization - HIV.D.DE219 */

/*
@dataElement: HIV.D.DE220 - Drugs out of stock
@activity: HIV.D10 Counsel returning client
@description: Client stopped ART because drugs were out of stock
*/
// TODO: Replace placeholder with relevant CQL logic
define "Drugs out of stock":
  exists "Drugs out of stock Condition"
    or exists "Drugs out of stock Observation"
define "Drugs out of stock Condition":
  [Condition: Concepts."Drugs out of stock"]
define "Drugs out of stock Observation":
  [Observation: Concepts."Drugs out of stock"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Drugs out of stock"
/* End of Drugs out of stock */

/*
@dataElement: HIV.D.DE221 - Client lacks finances
@activity: HIV.D10 Counsel returning client
@description: Client stopped ART because of lack of finances
*/
// TODO: Replace placeholder with relevant CQL logic
define "Client lacks finances":
  exists "Client lacks finances Condition"
    or exists "Client lacks finances Observation"
define "Client lacks finances Condition":
  [Condition: Concepts."Client lacks finances"]
define "Client lacks finances Observation":
  [Observation: Concepts."Client lacks finances"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Client lacks finances"
/* End of Client lacks finances */

/*
@dataElement: HIV.D.DE222 - Excluded HIV infection in infant - HIV.D.DE222
@activity: HIV.D10 Counsel returning client
@description: Client stopped ART because HIV infection in infant was excluded
*/
// TODO: Replace placeholder with relevant CQL logic
define "Excluded HIV infection in infant - HIV.D.DE222":
  exists "Excluded HIV infection in infant - HIV.D.DE222 Condition"
    or exists "Excluded HIV infection in infant - HIV.D.DE222 Observation"
define "Excluded HIV infection in infant - HIV.D.DE222 Condition":
  [Condition: Concepts."Excluded HIV infection in infant - HIV.D.DE222"]
define "Excluded HIV infection in infant - HIV.D.DE222 Observation":
  [Observation: Concepts."Excluded HIV infection in infant - HIV.D.DE217"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Excluded HIV infection in infant - HIV.D.DE222"
/* End of Excluded HIV infection in infant - HIV.D.DE222 */

/*
@dataElement: HIV.D.DE223 - Other reason for stopping ART - HIV.D.DE223
@activity: HIV.D10 Counsel returning client
@description: Client stopped ART because of other reason
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other reason for stopping ART - HIV.D.DE223":
  exists "Other reason for stopping ART - HIV.D.DE223 Condition"
    or exists "Other reason for stopping ART - HIV.D.DE223 Observation"
define "Other reason for stopping ART - HIV.D.DE223 Condition":
  [Condition: Concepts."Other reason for stopping ART - HIV.D.DE223"]
define "Other reason for stopping ART - HIV.D.DE223 Observation":
  [Observation: Concepts."Other reason for stopping ART - HIV.D.DE217"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other reason for stopping ART - HIV.D.DE223"
/* End of Other reason for stopping ART - HIV.D.DE223 */

/*
@dataElement: HIV.D.DE225 - Treatment failure
@activity: HIV.D17 Check for signs of treatment failure
@description: ART treatment failure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Treatment failure Observation":
  [Observation: Concepts."Treatment failure"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Treatment failure */

/*
@dataElement: HIV.D.DE226 - Clinical failure
@activity: HIV.D17 Check for signs of treatment failure
@description: New or recurrent clinical event indicating severe immunodeficiency in adults or advanced or severe immunodeficiency in children
*/
// TODO: Replace placeholder with relevant CQL logic
define "Clinical failure":
  exists "Clinical failure Condition"
    or exists "Clinical failure Observation"
define "Clinical failure Condition":
  [Condition: Concepts."Clinical failure"]
define "Clinical failure Observation":
  [Observation: Concepts."Clinical failure"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Clinical failure"
/* End of Clinical failure */

/*
@dataElement: HIV.D.DE227 - Immunological failure
@activity: HIV.D17 Check for signs of treatment failure
@description: CD4 count at or below 250 cells/mm3 following clinical failure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Immunological failure":
  exists "Immunological failure Condition"
    or exists "Immunological failure Observation"
define "Immunological failure Condition":
  [Condition: Concepts."Immunological failure"]
define "Immunological failure Observation":
  [Observation: Concepts."Immunological failure"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Immunological failure"
/* End of Immunological failure */

/*
@dataElement: HIV.D.DE228 - Virological failure
@activity: HIV.D17 Check for signs of treatment failure
@description: The inability to achieve or maintain viral suppression below a certain threshold indicated by viral load above 1000 copies/mL based on two consecutive viral load measurements in 3 months, with adherence support following the first viral load test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Virological failure":
  exists "Virological failure Condition"
    or exists "Virological failure Observation"
define "Virological failure Condition":
  [Condition: Concepts."Virological failure"]
define "Virological failure Observation":
  [Observation: Concepts."Virological failure"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Virological failure"
/* End of Virological failure */

/*
@dataElement: HIV.D.DE282 - Presumptive TB - HIV.D.DE282
@activity: HIV.D14 Prevent, screen, and manage comorbidities and coinfections
@description: Client's comorbidities or coinfections or symptoms of these include presumptive TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Presumptive TB - HIV.D.DE282":
  exists "Presumptive TB - HIV.D.DE282 Condition"
    or exists "Presumptive TB - HIV.D.DE282 Observation"
define "Presumptive TB - HIV.D.DE282 Condition":
  [Condition: Concepts."Presumptive TB - HIV.D.DE282"]
define "Presumptive TB - HIV.D.DE282 Observation":
  [Observation: Concepts."Presumptive TB - HIV.D.DE259"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Presumptive TB - HIV.D.DE282"
/* End of Presumptive TB - HIV.D.DE282 */

/*
@dataElement: HIV.D.DE289 - WHO HIV clinical stage condition or symptom - HIV.D.DE289
@activity: HIV.D15 Determine clinical stage of HIV
@description: New or recurrent clinical events used to categorize HIV disease severity based at baseline and follow up
*/
// TODO: Replace placeholder with relevant CQL logic
define "WHO HIV clinical stage condition or symptom - HIV.D.DE289 Observation":
  [Observation: Concepts."WHO HIV clinical stage condition or symptom - HIV.D.DE289"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of WHO HIV clinical stage condition or symptom - HIV.D.DE289 */

/*
@dataElement: HIV.D.DE290 - Asymptomatic
@activity: HIV.D15 Determine clinical stage of HIV
@description: No HIV-related symptoms reported and no clinical signs on examination
*/
// TODO: Replace placeholder with relevant CQL logic
define "Asymptomatic":
  exists "Asymptomatic Condition"
    or exists "Asymptomatic Observation"
define "Asymptomatic Condition":
  [Condition: Concepts."Asymptomatic"]
define "Asymptomatic Observation":
  [Observation: Concepts."Asymptomatic"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Asymptomatic"
/* End of Asymptomatic */

/*
@dataElement: HIV.D.DE291 - Persistent generalized lymphadenopathy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Persistent enlarged lymph nodes >1 cm at two or more non-contiguous sites (excluding inguinal) without known cause
*/
// TODO: Replace placeholder with relevant CQL logic
define "Persistent generalized lymphadenopathy":
  exists "Persistent generalized lymphadenopathy Condition"
    or exists "Persistent generalized lymphadenopathy Observation"
define "Persistent generalized lymphadenopathy Condition":
  [Condition: Concepts."Persistent generalized lymphadenopathy"]
define "Persistent generalized lymphadenopathy Observation":
  [Observation: Concepts."Persistent generalized lymphadenopathy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Persistent generalized lymphadenopathy"
/* End of Persistent generalized lymphadenopathy */

/*
@dataElement: HIV.D.DE292 - Moderate unexplained weight loss
@activity: HIV.D15 Determine clinical stage of HIV
@description: Moderate unexplained weight loss (<10% of presumed or measured body weight)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Moderate unexplained weight loss":
  exists "Moderate unexplained weight loss Condition"
    or exists "Moderate unexplained weight loss Observation"
define "Moderate unexplained weight loss Condition":
  [Condition: Concepts."Moderate unexplained weight loss"]
define "Moderate unexplained weight loss Observation":
  [Observation: Concepts."Moderate unexplained weight loss"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Moderate unexplained weight loss"
/* End of Moderate unexplained weight loss */

/*
@dataElement: HIV.D.DE293 - Recurrent respiratory tract infections
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent respiratory tract infections including sinusitis, tonsillitis, otitis media or pharyngitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Recurrent respiratory tract infections":
  exists "Recurrent respiratory tract infections Condition"
    or exists "Recurrent respiratory tract infections Observation"
define "Recurrent respiratory tract infections Condition":
  [Condition: Concepts."Recurrent respiratory tract infections"]
define "Recurrent respiratory tract infections Observation":
  [Observation: Concepts."Recurrent respiratory tract infections"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Recurrent respiratory tract infections"
/* End of Recurrent respiratory tract infections */

/*
@dataElement: HIV.D.DE294 - Unexplained persistent hepatosplenomegaly
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include unexplained persistent hepatosplenomegaly
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained persistent hepatosplenomegaly":
  exists "Unexplained persistent hepatosplenomegaly Condition"
    or exists "Unexplained persistent hepatosplenomegaly Observation"
define "Unexplained persistent hepatosplenomegaly Condition":
  [Condition: Concepts."Unexplained persistent hepatosplenomegaly"]
define "Unexplained persistent hepatosplenomegaly Observation":
  [Observation: Concepts."Unexplained persistent hepatosplenomegaly"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained persistent hepatosplenomegaly"
/* End of Unexplained persistent hepatosplenomegaly */

/*
@dataElement: HIV.D.DE295 - Herpes zoster
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include herpes zoster
*/
// TODO: Replace placeholder with relevant CQL logic
define "Herpes zoster":
  exists "Herpes zoster Condition"
    or exists "Herpes zoster Observation"
define "Herpes zoster Condition":
  [Condition: Concepts."Herpes zoster"]
define "Herpes zoster Observation":
  [Observation: Concepts."Herpes zoster"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Herpes zoster"
/* End of Herpes zoster */

/*
@dataElement: HIV.D.DE296 - Angular cheilitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include angular cheilitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Angular cheilitis":
  exists "Angular cheilitis Condition"
    or exists "Angular cheilitis Observation"
define "Angular cheilitis Condition":
  [Condition: Concepts."Angular cheilitis"]
define "Angular cheilitis Observation":
  [Observation: Concepts."Angular cheilitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Angular cheilitis"
/* End of Angular cheilitis */

/*
@dataElement: HIV.D.DE297 - Linear gingival erythema
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include linear gingival erythema
*/
// TODO: Replace placeholder with relevant CQL logic
define "Linear gingival erythema":
  exists "Linear gingival erythema Condition"
    or exists "Linear gingival erythema Observation"
define "Linear gingival erythema Condition":
  [Condition: Concepts."Linear gingival erythema"]
define "Linear gingival erythema Observation":
  [Observation: Concepts."Linear gingival erythema"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Linear gingival erythema"
/* End of Linear gingival erythema */

/*
@dataElement: HIV.D.DE298 - Recurrent oral ulceration
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent oral ulceration
*/
// TODO: Replace placeholder with relevant CQL logic
define "Recurrent oral ulceration":
  exists "Recurrent oral ulceration Condition"
    or exists "Recurrent oral ulceration Observation"
define "Recurrent oral ulceration Condition":
  [Condition: Concepts."Recurrent oral ulceration"]
define "Recurrent oral ulceration Observation":
  [Observation: Concepts."Recurrent oral ulceration"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Recurrent oral ulceration"
/* End of Recurrent oral ulceration */

/*
@dataElement: HIV.D.DE299 - Papular pruritic eruption
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include papular pruritic eruption
*/
// TODO: Replace placeholder with relevant CQL logic
define "Papular pruritic eruption":
  exists "Papular pruritic eruption Condition"
    or exists "Papular pruritic eruption Observation"
define "Papular pruritic eruption Condition":
  [Condition: Concepts."Papular pruritic eruption"]
define "Papular pruritic eruption Observation":
  [Observation: Concepts."Papular pruritic eruption"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Papular pruritic eruption"
/* End of Papular pruritic eruption */

/*
@dataElement: HIV.D.DE300 - Fungal nail infections
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include fungal nail infections
*/
// TODO: Replace placeholder with relevant CQL logic
define "Fungal nail infections":
  exists "Fungal nail infections Condition"
    or exists "Fungal nail infections Observation"
define "Fungal nail infections Condition":
  [Condition: Concepts."Fungal nail infections"]
define "Fungal nail infections Observation":
  [Observation: Concepts."Fungal nail infections"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Fungal nail infections"
/* End of Fungal nail infections */

/*
@dataElement: HIV.D.DE301 - Seborrhoeic dermatitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include seborrhoeic dermatitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Seborrhoeic dermatitis":
  exists "Seborrhoeic dermatitis Condition"
    or exists "Seborrhoeic dermatitis Observation"
define "Seborrhoeic dermatitis Condition":
  [Condition: Concepts."Seborrhoeic dermatitis"]
define "Seborrhoeic dermatitis Observation":
  [Observation: Concepts."Seborrhoeic dermatitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Seborrhoeic dermatitis"
/* End of Seborrhoeic dermatitis */

/*
@dataElement: HIV.D.DE302 - Extensive wart virus infection
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include extensive wart virus infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Extensive wart virus infection":
  exists "Extensive wart virus infection Condition"
    or exists "Extensive wart virus infection Observation"
define "Extensive wart virus infection Condition":
  [Condition: Concepts."Extensive wart virus infection"]
define "Extensive wart virus infection Observation":
  [Observation: Concepts."Extensive wart virus infection"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Extensive wart virus infection"
/* End of Extensive wart virus infection */

/*
@dataElement: HIV.D.DE303 - Extensive molluscum contagiosum
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include extensive molluscum contagiosum
*/
// TODO: Replace placeholder with relevant CQL logic
define "Extensive molluscum contagiosum":
  exists "Extensive molluscum contagiosum Condition"
    or exists "Extensive molluscum contagiosum Observation"
define "Extensive molluscum contagiosum Condition":
  [Condition: Concepts."Extensive molluscum contagiosum"]
define "Extensive molluscum contagiosum Observation":
  [Observation: Concepts."Extensive molluscum contagiosum"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Extensive molluscum contagiosum"
/* End of Extensive molluscum contagiosum */

/*
@dataElement: HIV.D.DE304 - Unexplained persistent parotid enlargement
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include unexplained persistent parotid enlargement
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained persistent parotid enlargement":
  exists "Unexplained persistent parotid enlargement Condition"
    or exists "Unexplained persistent parotid enlargement Observation"
define "Unexplained persistent parotid enlargement Condition":
  [Condition: Concepts."Unexplained persistent parotid enlargement"]
define "Unexplained persistent parotid enlargement Observation":
  [Observation: Concepts."Unexplained persistent parotid enlargement"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained persistent parotid enlargement"
/* End of Unexplained persistent parotid enlargement */

/*
@dataElement: HIV.D.DE305 - Unexplained severe weight loss in adults
@activity: HIV.D15 Determine clinical stage of HIV
@description: Unexplained severe weight loss (>10% of presumed or measured body weight)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained severe weight loss in adults":
  exists "Unexplained severe weight loss in adults Condition"
    or exists "Unexplained severe weight loss in adults Observation"
define "Unexplained severe weight loss in adults Condition":
  [Condition: Concepts."Unexplained severe weight loss in adults"]
define "Unexplained severe weight loss in adults Observation":
  [Observation: Concepts."Unexplained severe weight loss in adults"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained severe weight loss in adults"
/* End of Unexplained severe weight loss in adults */

/*
@dataElement: HIV.D.DE306 - Unexplained moderate malnutrition not adequately responding to standard therapy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Defined as weight-for-height < - 2 z-score or mid-upper arm circumference 115 mm to <125 mm. For children younger than five years of age: stunting is defined as severe acute malnutrition - either weight for height < -3 z-score or mid-upper arm circumference <115 mm or the presence of oedema.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained moderate malnutrition not adequately responding to standard therapy":
  exists "Unexplained moderate malnutrition not adequately responding to standard therapy Condition"
    or exists "Unexplained moderate malnutrition not adequately responding to standard therapy Observation"
define "Unexplained moderate malnutrition not adequately responding to standard therapy Condition":
  [Condition: Concepts."Unexplained moderate malnutrition not adequately responding to standard therapy"]
define "Unexplained moderate malnutrition not adequately responding to standard therapy Observation":
  [Observation: Concepts."Unexplained moderate malnutrition not adequately responding to standard therapy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained moderate malnutrition not adequately responding to standard therapy"
/* End of Unexplained moderate malnutrition not adequately responding to standard therapy */

/*
@dataElement: HIV.D.DE307 - Unexplained chronic diarrhoea for longer than 1 month
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include unexplained chronic diarrhoea for longer than 1 month
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained chronic diarrhoea for longer than 1 month":
  exists "Unexplained chronic diarrhoea for longer than 1 month Condition"
    or exists "Unexplained chronic diarrhoea for longer than 1 month Observation"
define "Unexplained chronic diarrhoea for longer than 1 month Condition":
  [Condition: Concepts."Unexplained chronic diarrhoea for longer than 1 month"]
define "Unexplained chronic diarrhoea for longer than 1 month Observation":
  [Observation: Concepts."Unexplained chronic diarrhoea for longer than 1 month"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained chronic diarrhoea for longer than 1 month"
/* End of Unexplained chronic diarrhoea for longer than 1 month */

/*
@dataElement: HIV.D.DE308 - Unexplained persistent diarrhoea 14 days or more
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include unexplained persistent diarrhoea (14 days or more)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained persistent diarrhoea 14 days or more":
  exists "Unexplained persistent diarrhoea 14 days or more Condition"
    or exists "Unexplained persistent diarrhoea 14 days or more Observation"
define "Unexplained persistent diarrhoea 14 days or more Condition":
  [Condition: Concepts."Unexplained persistent diarrhoea 14 days or more"]
define "Unexplained persistent diarrhoea 14 days or more Observation":
  [Observation: Concepts."Unexplained persistent diarrhoea 14 days or more"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained persistent diarrhoea 14 days or more"
/* End of Unexplained persistent diarrhoea 14 days or more */

/*
@dataElement: HIV.D.DE309 - Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include unexplained persistent fever (above 37.5 C, intermittent or constant, for longer than one 1 month)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month":
  exists "Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month Condition"
    or exists "Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month Observation"
define "Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month Condition":
  [Condition: Concepts."Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month"]
define "Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month Observation":
  [Observation: Concepts."Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month"
/* End of Unexplained persistent fever above 37.5 C, intermittent or constant, for longer than one 1 month */

/*
@dataElement: HIV.D.DE310 - Persistent oral candidiasis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include persistent oral candidiasis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Persistent oral candidiasis":
  exists "Persistent oral candidiasis Condition"
    or exists "Persistent oral candidiasis Observation"
define "Persistent oral candidiasis Condition":
  [Condition: Concepts."Persistent oral candidiasis"]
define "Persistent oral candidiasis Observation":
  [Observation: Concepts."Persistent oral candidiasis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Persistent oral candidiasis"
/* End of Persistent oral candidiasis */

/*
@dataElement: HIV.D.DE311 - Oral hairy leukoplakia
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client has fine white small linear or corrugated lesions on lateral borders of the tongue that do not scrape off
*/
// TODO: Replace placeholder with relevant CQL logic
define "Oral hairy leukoplakia":
  exists "Oral hairy leukoplakia Condition"
    or exists "Oral hairy leukoplakia Observation"
define "Oral hairy leukoplakia Condition":
  [Condition: Concepts."Oral hairy leukoplakia"]
define "Oral hairy leukoplakia Observation":
  [Observation: Concepts."Oral hairy leukoplakia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Oral hairy leukoplakia"
/* End of Oral hairy leukoplakia */

/*
@dataElement: HIV.D.DE312 - Pulmonary TB - HIV.D.DE312
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include pulmonary TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Pulmonary TB - HIV.D.DE312":
  exists "Pulmonary TB - HIV.D.DE312 Condition"
    or exists "Pulmonary TB - HIV.D.DE312 Observation"
define "Pulmonary TB - HIV.D.DE312 Condition":
  [Condition: Concepts."Pulmonary TB - HIV.D.DE312"]
define "Pulmonary TB - HIV.D.DE312 Observation":
  [Observation: Concepts."Pulmonary TB - HIV.D.DE289"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Pulmonary TB - HIV.D.DE312"
/* End of Pulmonary TB - HIV.D.DE312 */

/*
@dataElement: HIV.D.DE313 - Lymph node TB - HIV.D.DE313
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include lymph node TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lymph node TB - HIV.D.DE313":
  exists "Lymph node TB - HIV.D.DE313 Condition"
    or exists "Lymph node TB - HIV.D.DE313 Observation"
define "Lymph node TB - HIV.D.DE313 Condition":
  [Condition: Concepts."Lymph node TB - HIV.D.DE313"]
define "Lymph node TB - HIV.D.DE313 Observation":
  [Observation: Concepts."Lymph node TB - HIV.D.DE289"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lymph node TB - HIV.D.DE313"
/* End of Lymph node TB - HIV.D.DE313 */

/*
@dataElement: HIV.D.DE314 - Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include severe bacterial infections (such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia":
  exists "Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia Condition"
    or exists "Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia Observation"
define "Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia Condition":
  [Condition: Concepts."Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia"]
define "Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia Observation":
  [Observation: Concepts."Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia"
/* End of Severe bacterial infections such as pneumonia, empyema, pyomyositis, bone or joint infection, meningitis, bacteraemia */

/*
@dataElement: HIV.D.DE315 - Severe recurrent bacterial pneumonia
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include severe recurrent bacterial pneumonia
*/
// TODO: Replace placeholder with relevant CQL logic
define "Severe recurrent bacterial pneumonia":
  exists "Severe recurrent bacterial pneumonia Condition"
    or exists "Severe recurrent bacterial pneumonia Observation"
define "Severe recurrent bacterial pneumonia Condition":
  [Condition: Concepts."Severe recurrent bacterial pneumonia"]
define "Severe recurrent bacterial pneumonia Observation":
  [Observation: Concepts."Severe recurrent bacterial pneumonia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Severe recurrent bacterial pneumonia"
/* End of Severe recurrent bacterial pneumonia */

/*
@dataElement: HIV.D.DE316 - Acute necrotizing ulcerative stomatitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include acute necrotizing ulcerative stomatitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Acute necrotizing ulcerative stomatitis":
  exists "Acute necrotizing ulcerative stomatitis Condition"
    or exists "Acute necrotizing ulcerative stomatitis Observation"
define "Acute necrotizing ulcerative stomatitis Condition":
  [Condition: Concepts."Acute necrotizing ulcerative stomatitis"]
define "Acute necrotizing ulcerative stomatitis Observation":
  [Observation: Concepts."Acute necrotizing ulcerative stomatitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Acute necrotizing ulcerative stomatitis"
/* End of Acute necrotizing ulcerative stomatitis */

/*
@dataElement: HIV.D.DE317 - Acute necrotizing ulcerative gingivitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include acute necrotizing ulcerative gingivitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Acute necrotizing ulcerative gingivitis":
  exists "Acute necrotizing ulcerative gingivitis Condition"
    or exists "Acute necrotizing ulcerative gingivitis Observation"
define "Acute necrotizing ulcerative gingivitis Condition":
  [Condition: Concepts."Acute necrotizing ulcerative gingivitis"]
define "Acute necrotizing ulcerative gingivitis Observation":
  [Observation: Concepts."Acute necrotizing ulcerative gingivitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Acute necrotizing ulcerative gingivitis"
/* End of Acute necrotizing ulcerative gingivitis */

/*
@dataElement: HIV.D.DE318 - Acute necrotizing ulcerative periodontitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include acute necrotizing ulcerative periodontitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Acute necrotizing ulcerative periodontitis":
  exists "Acute necrotizing ulcerative periodontitis Condition"
    or exists "Acute necrotizing ulcerative periodontitis Observation"
define "Acute necrotizing ulcerative periodontitis Condition":
  [Condition: Concepts."Acute necrotizing ulcerative periodontitis"]
define "Acute necrotizing ulcerative periodontitis Observation":
  [Observation: Concepts."Acute necrotizing ulcerative periodontitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Acute necrotizing ulcerative periodontitis"
/* End of Acute necrotizing ulcerative periodontitis */

/*
@dataElement: HIV.D.DE319 - Unexplained anaemia <8 g/dL
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include unexplained anaemia (<8 g/dL)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained anaemia <8 g/dL":
  exists "Unexplained anaemia <8 g/dL Condition"
    or exists "Unexplained anaemia <8 g/dL Observation"
define "Unexplained anaemia <8 g/dL Condition":
  [Condition: Concepts."Unexplained anaemia <8 g/dL"]
define "Unexplained anaemia <8 g/dL Observation":
  [Observation: Concepts."Unexplained anaemia <8 g/dL"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained anaemia <8 g/dL"
/* End of Unexplained anaemia <8 g/dL */

/*
@dataElement: HIV.D.DE320 - Neutropaenia <0.5 x 10^9/L
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include neutropaenia (<0.5 x 10^9/L)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Neutropaenia <0.5 x 10^9/L":
  exists "Neutropaenia <0.5 x 10^9/L Condition"
    or exists "Neutropaenia <0.5 x 10^9/L Observation"
define "Neutropaenia <0.5 x 10^9/L Condition":
  [Condition: Concepts."Neutropaenia <0.5 x 10^9/L"]
define "Neutropaenia <0.5 x 10^9/L Observation":
  [Observation: Concepts."Neutropaenia <0.5 x 10^9/L"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Neutropaenia <0.5 x 10^9/L"
/* End of Neutropaenia <0.5 x 10^9/L */

/*
@dataElement: HIV.D.DE321 - Chronic thrombocytopaenia <50 x 10^9/L
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include chronic thrombocytopaenia (<50 x 10^9/L)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chronic thrombocytopaenia <50 x 10^9/L":
  exists "Chronic thrombocytopaenia <50 x 10^9/L Condition"
    or exists "Chronic thrombocytopaenia <50 x 10^9/L Observation"
define "Chronic thrombocytopaenia <50 x 10^9/L Condition":
  [Condition: Concepts."Chronic thrombocytopaenia <50 x 10^9/L"]
define "Chronic thrombocytopaenia <50 x 10^9/L Observation":
  [Observation: Concepts."Chronic thrombocytopaenia <50 x 10^9/L"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chronic thrombocytopaenia <50 x 10^9/L"
/* End of Chronic thrombocytopaenia <50 x 10^9/L */

/*
@dataElement: HIV.D.DE322 - Symptomatic lymphoid interstitial pneumonitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include symptomatic lymphoid interstitial pneumonitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Symptomatic lymphoid interstitial pneumonitis":
  exists "Symptomatic lymphoid interstitial pneumonitis Condition"
    or exists "Symptomatic lymphoid interstitial pneumonitis Observation"
define "Symptomatic lymphoid interstitial pneumonitis Condition":
  [Condition: Concepts."Symptomatic lymphoid interstitial pneumonitis"]
define "Symptomatic lymphoid interstitial pneumonitis Observation":
  [Observation: Concepts."Symptomatic lymphoid interstitial pneumonitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Symptomatic lymphoid interstitial pneumonitis"
/* End of Symptomatic lymphoid interstitial pneumonitis */

/*
@dataElement: HIV.D.DE323 - Chronic HIV-associated lung disease, including bronchiectasis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include chronic HIV-associated lung disease, including bronchiectasis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chronic HIV-associated lung disease, including bronchiectasis":
  exists "Chronic HIV-associated lung disease, including bronchiectasis Condition"
    or exists "Chronic HIV-associated lung disease, including bronchiectasis Observation"
define "Chronic HIV-associated lung disease, including bronchiectasis Condition":
  [Condition: Concepts."Chronic HIV-associated lung disease, including bronchiectasis"]
define "Chronic HIV-associated lung disease, including bronchiectasis Observation":
  [Observation: Concepts."Chronic HIV-associated lung disease, including bronchiectasis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chronic HIV-associated lung disease, including bronchiectasis"
/* End of Chronic HIV-associated lung disease, including bronchiectasis */

/*
@dataElement: HIV.D.DE324 - HIV wasting syndrome
@activity: HIV.D15 Determine clinical stage of HIV
@description: Unexplained involuntary weight loss (>10% baseline body weight), with obvious wasting or body mass index <18.5; PLUS EITHER unexplained chronic reported for longer than one month; OR reports of fever or night sweats for more than one month without other cause and lack of response to antibiotics or antimalarial agents; malaria must be excluded in malarious areas.
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV wasting syndrome":
  exists "HIV wasting syndrome Condition"
    or exists "HIV wasting syndrome Observation"
define "HIV wasting syndrome Condition":
  [Condition: Concepts."HIV wasting syndrome"]
define "HIV wasting syndrome Observation":
  [Observation: Concepts."HIV wasting syndrome"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV wasting syndrome"
/* End of HIV wasting syndrome */

/*
@dataElement: HIV.D.DE325 - Unexplained severe wasting not responding to standard therapy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client has unexplained severe wasting not responding to standard therapy . For under 5 years old, defined as weight-for-height < -3 z-score
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained severe wasting not responding to standard therapy":
  exists "Unexplained severe wasting not responding to standard therapy Condition"
    or exists "Unexplained severe wasting not responding to standard therapy Observation"
define "Unexplained severe wasting not responding to standard therapy Condition":
  [Condition: Concepts."Unexplained severe wasting not responding to standard therapy"]
define "Unexplained severe wasting not responding to standard therapy Observation":
  [Observation: Concepts."Unexplained severe wasting not responding to standard therapy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained severe wasting not responding to standard therapy"
/* End of Unexplained severe wasting not responding to standard therapy */

/*
@dataElement: HIV.D.DE326 - Unexplained stunting not responding to standard therapy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client has unexplained stunting not responding to standard therapy . For under 5 years old, defined as length-for- age/height-for-age < -2 z-score
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained stunting not responding to standard therapy":
  exists "Unexplained stunting not responding to standard therapy Condition"
    or exists "Unexplained stunting not responding to standard therapy Observation"
define "Unexplained stunting not responding to standard therapy Condition":
  [Condition: Concepts."Unexplained stunting not responding to standard therapy"]
define "Unexplained stunting not responding to standard therapy Observation":
  [Observation: Concepts."Unexplained stunting not responding to standard therapy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained stunting not responding to standard therapy"
/* End of Unexplained stunting not responding to standard therapy */

/*
@dataElement: HIV.D.DE327 - Unexplained severe malnutrition not responding to standard therapy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client has unexplained severe malnutrition not responding to standard therapy . For under 5 years old, weight for height < -3 z-score or mid-upper arm circumference <115 mm or the presence of oedema
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexplained severe malnutrition not responding to standard therapy":
  exists "Unexplained severe malnutrition not responding to standard therapy Condition"
    or exists "Unexplained severe malnutrition not responding to standard therapy Observation"
define "Unexplained severe malnutrition not responding to standard therapy Condition":
  [Condition: Concepts."Unexplained severe malnutrition not responding to standard therapy"]
define "Unexplained severe malnutrition not responding to standard therapy Observation":
  [Observation: Concepts."Unexplained severe malnutrition not responding to standard therapy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexplained severe malnutrition not responding to standard therapy"
/* End of Unexplained severe malnutrition not responding to standard therapy */

/*
@dataElement: HIV.D.DE328 - Pneumocystis jirovecii pneumonia
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include pneumocystis (jirovecii) pneumonia
*/
// TODO: Replace placeholder with relevant CQL logic
define "Pneumocystis jirovecii pneumonia":
  exists "Pneumocystis jirovecii pneumonia Condition"
    or exists "Pneumocystis jirovecii pneumonia Observation"
define "Pneumocystis jirovecii pneumonia Condition":
  [Condition: Concepts."Pneumocystis jirovecii pneumonia"]
define "Pneumocystis jirovecii pneumonia Observation":
  [Observation: Concepts."Pneumocystis jirovecii pneumonia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Pneumocystis jirovecii pneumonia"
/* End of Pneumocystis jirovecii pneumonia */

/*
@dataElement: HIV.D.DE329 - Recurrent severe bacterial pneumonia
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent severe bacterial pneumonia
*/
// TODO: Replace placeholder with relevant CQL logic
define "Recurrent severe bacterial pneumonia":
  exists "Recurrent severe bacterial pneumonia Condition"
    or exists "Recurrent severe bacterial pneumonia Observation"
define "Recurrent severe bacterial pneumonia Condition":
  [Condition: Concepts."Recurrent severe bacterial pneumonia"]
define "Recurrent severe bacterial pneumonia Observation":
  [Observation: Concepts."Recurrent severe bacterial pneumonia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Recurrent severe bacterial pneumonia"
/* End of Recurrent severe bacterial pneumonia */

/*
@dataElement: HIV.D.DE330 - Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent severe bacterial infections (such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia":
  exists "Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia Condition"
    or exists "Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia Observation"
define "Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia Condition":
  [Condition: Concepts."Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia"]
define "Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia Observation":
  [Observation: Concepts."Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia"
/* End of Recurrent severe bacterial infections such as empyema, pyomyositis, bone or joint infection, meningitis, but excluding pneumonia */

/*
@dataElement: HIV.D.DE331 - Empyema
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent empyema
*/
// TODO: Replace placeholder with relevant CQL logic
define "Empyema":
  exists "Empyema Condition"
    or exists "Empyema Observation"
define "Empyema Condition":
  [Condition: Concepts."Empyema"]
define "Empyema Observation":
  [Observation: Concepts."Empyema"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Empyema"
/* End of Empyema */

/*
@dataElement: HIV.D.DE332 - Pyomyositis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent pyomyositis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Pyomyositis":
  exists "Pyomyositis Condition"
    or exists "Pyomyositis Observation"
define "Pyomyositis Condition":
  [Condition: Concepts."Pyomyositis"]
define "Pyomyositis Observation":
  [Observation: Concepts."Pyomyositis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Pyomyositis"
/* End of Pyomyositis */

/*
@dataElement: HIV.D.DE333 - Bone or joint infection
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent bone or joint infections
*/
// TODO: Replace placeholder with relevant CQL logic
define "Bone or joint infection":
  exists "Bone or joint infection Condition"
    or exists "Bone or joint infection Observation"
define "Bone or joint infection Condition":
  [Condition: Concepts."Bone or joint infection"]
define "Bone or joint infection Observation":
  [Observation: Concepts."Bone or joint infection"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Bone or joint infection"
/* End of Bone or joint infection */

/*
@dataElement: HIV.D.DE334 - Meningitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent meningitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Meningitis":
  exists "Meningitis Condition"
    or exists "Meningitis Observation"
define "Meningitis Condition":
  [Condition: Concepts."Meningitis"]
define "Meningitis Observation":
  [Observation: Concepts."Meningitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Meningitis"
/* End of Meningitis */

/*
@dataElement: HIV.D.DE335 - Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include chronic herpes simplex infection (orolabial or cutaneous of more than 1 month duration or visceral at any site)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site":
  exists "Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site Condition"
    or exists "Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site Observation"
define "Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site Condition":
  [Condition: Concepts."Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site"]
define "Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site Observation":
  [Observation: Concepts."Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site"
/* End of Chronic herpes simplex infection orolabial or cutaneous of more than 1 month duration or visceral at any site */

/*
@dataElement: HIV.D.DE336 - Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include chronic herpes simplex infection (orolabial, genital or anorectal of more than one month in duration or visceral at any site)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site":
  exists "Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site Condition"
    or exists "Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site Observation"
define "Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site Condition":
  [Condition: Concepts."Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site"]
define "Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site Observation":
  [Observation: Concepts."Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site"
/* End of Chronic herpes simplex infection orolabial, genital or anorectal of more than 1 month in duration or visceral at any site */

/*
@dataElement: HIV.D.DE337 - Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include oesophageal candidiasis (or candidiasis of trachea, bronchi or lungs)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs":
  exists "Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs Condition"
    or exists "Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs Observation"
define "Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs Condition":
  [Condition: Concepts."Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs"]
define "Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs Observation":
  [Observation: Concepts."Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs"
/* End of Oesophageal candidiasis or candidiasis of trachea, bronchi or lungs */

/*
@dataElement: HIV.D.DE338 - Extrapulmonary TB - HIV.D.DE338
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include extrapulmonary tuberculosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Extrapulmonary TB - HIV.D.DE338":
  exists "Extrapulmonary TB - HIV.D.DE338 Condition"
    or exists "Extrapulmonary TB - HIV.D.DE338 Observation"
define "Extrapulmonary TB - HIV.D.DE338 Condition":
  [Condition: Concepts."Extrapulmonary TB - HIV.D.DE338"]
define "Extrapulmonary TB - HIV.D.DE338 Observation":
  [Observation: Concepts."Extrapulmonary TB - HIV.D.DE289"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Extrapulmonary TB - HIV.D.DE338"
/* End of Extrapulmonary TB - HIV.D.DE338 */

/*
@dataElement: HIV.D.DE339 - Kaposi sarcoma
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include Kaposi sarcoma
*/
// TODO: Replace placeholder with relevant CQL logic
define "Kaposi sarcoma":
  exists "Kaposi sarcoma Condition"
    or exists "Kaposi sarcoma Observation"
define "Kaposi sarcoma Condition":
  [Condition: Concepts."Kaposi sarcoma"]
define "Kaposi sarcoma Observation":
  [Observation: Concepts."Kaposi sarcoma"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Kaposi sarcoma"
/* End of Kaposi sarcoma */

/*
@dataElement: HIV.D.DE340 - Cytomegalovirus infection retinitis or infection of other organs
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include cytomegalovirus infection (retinitis or infection of other organs)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cytomegalovirus infection retinitis or infection of other organs":
  exists "Cytomegalovirus infection retinitis or infection of other organs Condition"
    or exists "Cytomegalovirus infection retinitis or infection of other organs Observation"
define "Cytomegalovirus infection retinitis or infection of other organs Condition":
  [Condition: Concepts."Cytomegalovirus infection retinitis or infection of other organs"]
define "Cytomegalovirus infection retinitis or infection of other organs Observation":
  [Observation: Concepts."Cytomegalovirus infection retinitis or infection of other organs"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cytomegalovirus infection retinitis or infection of other organs"
/* End of Cytomegalovirus infection retinitis or infection of other organs */

/*
@dataElement: HIV.D.DE341 - Central nervous system toxoplasmosis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include central nervous system toxoplasmosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Central nervous system toxoplasmosis":
  exists "Central nervous system toxoplasmosis Condition"
    or exists "Central nervous system toxoplasmosis Observation"
define "Central nervous system toxoplasmosis Condition":
  [Condition: Concepts."Central nervous system toxoplasmosis"]
define "Central nervous system toxoplasmosis Observation":
  [Observation: Concepts."Central nervous system toxoplasmosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Central nervous system toxoplasmosis"
/* End of Central nervous system toxoplasmosis */

/*
@dataElement: HIV.D.DE342 - HIV encephalopathy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include HIV encephalopathy
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV encephalopathy":
  exists "HIV encephalopathy Condition"
    or exists "HIV encephalopathy Observation"
define "HIV encephalopathy Condition":
  [Condition: Concepts."HIV encephalopathy"]
define "HIV encephalopathy Observation":
  [Observation: Concepts."HIV encephalopathy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV encephalopathy"
/* End of HIV encephalopathy */

/*
@dataElement: HIV.D.DE343 - Extrapulmonary cryptococcosis, including meningitis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include extrapulmonary cryptococcosis, including meningitis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Extrapulmonary cryptococcosis, including meningitis":
  exists "Extrapulmonary cryptococcosis, including meningitis Condition"
    or exists "Extrapulmonary cryptococcosis, including meningitis Observation"
define "Extrapulmonary cryptococcosis, including meningitis Condition":
  [Condition: Concepts."Extrapulmonary cryptococcosis, including meningitis"]
define "Extrapulmonary cryptococcosis, including meningitis Observation":
  [Observation: Concepts."Extrapulmonary cryptococcosis, including meningitis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Extrapulmonary cryptococcosis, including meningitis"
/* End of Extrapulmonary cryptococcosis, including meningitis */

/*
@dataElement: HIV.D.DE344 - Disseminated nontuberculous mycobacterial infection
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include disseminated nontuberculous mycobacterial infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Disseminated nontuberculous mycobacterial infection":
  exists "Disseminated nontuberculous mycobacterial infection Condition"
    or exists "Disseminated nontuberculous mycobacterial infection Observation"
define "Disseminated nontuberculous mycobacterial infection Condition":
  [Condition: Concepts."Disseminated nontuberculous mycobacterial infection"]
define "Disseminated nontuberculous mycobacterial infection Observation":
  [Observation: Concepts."Disseminated nontuberculous mycobacterial infection"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Disseminated nontuberculous mycobacterial infection"
/* End of Disseminated nontuberculous mycobacterial infection */

/*
@dataElement: HIV.D.DE345 - Progressive multifocal leukoencephalopathy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include progressive multifocal leukoencephalopathy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Progressive multifocal leukoencephalopathy":
  exists "Progressive multifocal leukoencephalopathy Condition"
    or exists "Progressive multifocal leukoencephalopathy Observation"
define "Progressive multifocal leukoencephalopathy Condition":
  [Condition: Concepts."Progressive multifocal leukoencephalopathy"]
define "Progressive multifocal leukoencephalopathy Observation":
  [Observation: Concepts."Progressive multifocal leukoencephalopathy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Progressive multifocal leukoencephalopathy"
/* End of Progressive multifocal leukoencephalopathy */

/*
@dataElement: HIV.D.DE346 - Chronic cryptosporidiosis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include chronic cryptosporidiosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chronic cryptosporidiosis":
  exists "Chronic cryptosporidiosis Condition"
    or exists "Chronic cryptosporidiosis Observation"
define "Chronic cryptosporidiosis Condition":
  [Condition: Concepts."Chronic cryptosporidiosis"]
define "Chronic cryptosporidiosis Observation":
  [Observation: Concepts."Chronic cryptosporidiosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chronic cryptosporidiosis"
/* End of Chronic cryptosporidiosis */

/*
@dataElement: HIV.D.DE347 - Chronic cryptosporidiosis with diarrhoea
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include chronic cryptosporidiosis (with diarrhoea)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chronic cryptosporidiosis with diarrhoea":
  exists "Chronic cryptosporidiosis with diarrhoea Condition"
    or exists "Chronic cryptosporidiosis with diarrhoea Observation"
define "Chronic cryptosporidiosis with diarrhoea Condition":
  [Condition: Concepts."Chronic cryptosporidiosis with diarrhoea"]
define "Chronic cryptosporidiosis with diarrhoea Observation":
  [Observation: Concepts."Chronic cryptosporidiosis with diarrhoea"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chronic cryptosporidiosis with diarrhoea"
/* End of Chronic cryptosporidiosis with diarrhoea */

/*
@dataElement: HIV.D.DE348 - Chronic isosporiasis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include chronic isosporiasis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chronic isosporiasis":
  exists "Chronic isosporiasis Condition"
    or exists "Chronic isosporiasis Observation"
define "Chronic isosporiasis Condition":
  [Condition: Concepts."Chronic isosporiasis"]
define "Chronic isosporiasis Observation":
  [Observation: Concepts."Chronic isosporiasis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chronic isosporiasis"
/* End of Chronic isosporiasis */

/*
@dataElement: HIV.D.DE349 - Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include disseminated mycosis (extrapulmonary histoplasmosis, coccidioidomycosis)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis":
  exists "Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis Condition"
    or exists "Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis Observation"
define "Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis Condition":
  [Condition: Concepts."Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis"]
define "Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis Observation":
  [Observation: Concepts."Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis"
/* End of Disseminated mycosis extrapulmonary histoplasmosis, coccidioidomycosis */

/*
@dataElement: HIV.D.DE350 - Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include disseminated endemic mycosis (extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis":
  exists "Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis Condition"
    or exists "Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis Observation"
define "Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis Condition":
  [Condition: Concepts."Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis"]
define "Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis Observation":
  [Observation: Concepts."Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis"
/* End of Disseminated endemic mycosis extrapulmonary histoplasmosis, coccidioidomycosis, penicilliosis */

/*
@dataElement: HIV.D.DE351 - Cerebral lymphoma
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include cerebral lymphoma
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cerebral lymphoma":
  exists "Cerebral lymphoma Condition"
    or exists "Cerebral lymphoma Observation"
define "Cerebral lymphoma Condition":
  [Condition: Concepts."Cerebral lymphoma"]
define "Cerebral lymphoma Observation":
  [Observation: Concepts."Cerebral lymphoma"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cerebral lymphoma"
/* End of Cerebral lymphoma */

/*
@dataElement: HIV.D.DE352 - B-cell non-Hodgkin lymphoma
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include b-cell non-Hodgkin lymphoma
*/
// TODO: Replace placeholder with relevant CQL logic
define "B-cell non-Hodgkin lymphoma":
  exists "B-cell non-Hodgkin lymphoma Condition"
    or exists "B-cell non-Hodgkin lymphoma Observation"
define "B-cell non-Hodgkin lymphoma Condition":
  [Condition: Concepts."B-cell non-Hodgkin lymphoma"]
define "B-cell non-Hodgkin lymphoma Observation":
  [Observation: Concepts."B-cell non-Hodgkin lymphoma"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."B-cell non-Hodgkin lymphoma"
/* End of B-cell non-Hodgkin lymphoma */

/*
@dataElement: HIV.D.DE353 - HIV-associated nephropathy or cardiomyopathy
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include HIV- associated nephropathy or cardiomyopathy
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-associated nephropathy or cardiomyopathy":
  exists "HIV-associated nephropathy or cardiomyopathy Condition"
    or exists "HIV-associated nephropathy or cardiomyopathy Observation"
define "HIV-associated nephropathy or cardiomyopathy Condition":
  [Condition: Concepts."HIV-associated nephropathy or cardiomyopathy"]
define "HIV-associated nephropathy or cardiomyopathy Observation":
  [Observation: Concepts."HIV-associated nephropathy or cardiomyopathy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-associated nephropathy or cardiomyopathy"
/* End of HIV-associated nephropathy or cardiomyopathy */

/*
@dataElement: HIV.D.DE354 - Recurrent septicaemia including nontyphoidal Salmonella
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include recurrent bacteraemia (septicaemia) (including nontyphoidal salmonella)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Recurrent septicaemia including nontyphoidal Salmonella":
  exists "Recurrent septicaemia including nontyphoidal Salmonella Condition"
    or exists "Recurrent septicaemia including nontyphoidal Salmonella Observation"
define "Recurrent septicaemia including nontyphoidal Salmonella Condition":
  [Condition: Concepts."Recurrent septicaemia including nontyphoidal Salmonella"]
define "Recurrent septicaemia including nontyphoidal Salmonella Observation":
  [Observation: Concepts."Recurrent septicaemia including nontyphoidal Salmonella"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Recurrent septicaemia including nontyphoidal Salmonella"
/* End of Recurrent septicaemia including nontyphoidal Salmonella */

/*
@dataElement: HIV.D.DE355 - Invasive cervical carcinoma
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include invasive cervical carcinoma
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invasive cervical carcinoma":
  exists "Invasive cervical carcinoma Condition"
    or exists "Invasive cervical carcinoma Observation"
define "Invasive cervical carcinoma Condition":
  [Condition: Concepts."Invasive cervical carcinoma"]
define "Invasive cervical carcinoma Observation":
  [Observation: Concepts."Invasive cervical carcinoma"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invasive cervical carcinoma"
/* End of Invasive cervical carcinoma */

/*
@dataElement: HIV.D.DE356 - Atypical disseminated leishmaniasis
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include atypical disseminated leishmaniasis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Atypical disseminated leishmaniasis":
  exists "Atypical disseminated leishmaniasis Condition"
    or exists "Atypical disseminated leishmaniasis Observation"
define "Atypical disseminated leishmaniasis Condition":
  [Condition: Concepts."Atypical disseminated leishmaniasis"]
define "Atypical disseminated leishmaniasis Observation":
  [Observation: Concepts."Atypical disseminated leishmaniasis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Atypical disseminated leishmaniasis"
/* End of Atypical disseminated leishmaniasis */

/*
@dataElement: HIV.D.DE357 - Neutropenia
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include neutropenia, an abnormally low count of a type of white blood cell (neutrophils)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Neutropenia":
  exists "Neutropenia Condition"
    or exists "Neutropenia Observation"
define "Neutropenia Condition":
  [Condition: Concepts."Neutropenia"]
define "Neutropenia Observation":
  [Observation: Concepts."Neutropenia"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Neutropenia"
/* End of Neutropenia */

/*
@dataElement: HIV.D.DE364 - CD4 count - HIV.D.DE364
@activity: HIV.D20 Diagnostics
@description: CD4 cell count in cells/mm^3
*/
// TODO: Replace placeholder with relevant CQL logic
define "CD4 count - HIV.D.DE364":
  [Observation: Concepts."CD4 count - HIV.D.DE364"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of CD4 count - HIV.D.DE364 */

/*
@dataElement: HIV.D.DE367 - Baseline CD4 count - HIV.D.DE367
@activity: HIV.D20 Diagnostics
@description: CD4 count performed at HIV diagnosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Baseline CD4 count - HIV.D.DE367":
  [Observation: Concepts."Baseline CD4 count - HIV.D.DE367"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Baseline CD4 count - HIV.D.DE367 */

/*
@dataElement: HIV.D.DE368 - Date of baseline CD4 count test - HIV.D.DE368
@activity: HIV.D20 Diagnostics
@description: Date and time when baseline CD4 count test was conducted
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of baseline CD4 count test - HIV.D.DE368":
  [Observation: Concepts."Date of baseline CD4 count test - HIV.D.DE368"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of baseline CD4 count test - HIV.D.DE368 */

/*
@dataElement: HIV.D.DE383 - Time to start ART
@activity: HIV.D8 Capture or update client history
@description: Time from HIV diagnosis to when client started ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Time to start ART Observation":
  [Observation: Concepts."Time to start ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Time to start ART */

/*
@dataElement: HIV.D.DE384 - Within 7 days of HIV diagnosis
@activity: HIV.D8 Capture or update client history
@description: Client started ART within 7 days
*/
// TODO: Replace placeholder with relevant CQL logic
define "Within 7 days of HIV diagnosis":
  exists "Within 7 days of HIV diagnosis Condition"
    or exists "Within 7 days of HIV diagnosis Observation"
define "Within 7 days of HIV diagnosis Condition":
  [Condition: Concepts."Within 7 days of HIV diagnosis"]
define "Within 7 days of HIV diagnosis Observation":
  [Observation: Concepts."Within 7 days of HIV diagnosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Within 7 days of HIV diagnosis"
/* End of Within 7 days of HIV diagnosis */

/*
@dataElement: HIV.D.DE385 - Within 30 days of HIV diagnosis
@activity: HIV.D8 Capture or update client history
@description: Client started ART within 30 days of ART initiation (but over 7 days)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Within 30 days of HIV diagnosis":
  exists "Within 30 days of HIV diagnosis Condition"
    or exists "Within 30 days of HIV diagnosis Observation"
define "Within 30 days of HIV diagnosis Condition":
  [Condition: Concepts."Within 30 days of HIV diagnosis"]
define "Within 30 days of HIV diagnosis Observation":
  [Observation: Concepts."Within 30 days of HIV diagnosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Within 30 days of HIV diagnosis"
/* End of Within 30 days of HIV diagnosis */

/*
@dataElement: HIV.D.DE386 - Within 90 days of HIV diagnosis
@activity: HIV.D8 Capture or update client history
@description: Client started ART within 90 days of ART initiation (but over 30 days)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Within 90 days of HIV diagnosis":
  exists "Within 90 days of HIV diagnosis Condition"
    or exists "Within 90 days of HIV diagnosis Observation"
define "Within 90 days of HIV diagnosis Condition":
  [Condition: Concepts."Within 90 days of HIV diagnosis"]
define "Within 90 days of HIV diagnosis Observation":
  [Observation: Concepts."Within 90 days of HIV diagnosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Within 90 days of HIV diagnosis"
/* End of Within 90 days of HIV diagnosis */

/*
@dataElement: HIV.D.DE387 - Viral load test result - HIV.D.DE387
@activity: HIV.D20 Diagnostics
@description: Result from the viral load test in number of copies/mL
*/
// TODO: Replace placeholder with relevant CQL logic
define "Viral load test result - HIV.D.DE387":
  [Observation: Concepts."Viral load test result - HIV.D.DE387"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Viral load test result - HIV.D.DE387 */

/*
@dataElement: HIV.D.DE391 - Reason for HIV viral load test
@activity: HIV.D20 Diagnostics
@description: Whether the viral load is being tested for routine monitoring on a set schedule or for targeted monitoring for suspected treatment failure
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reason for HIV viral load test Observation":
  [Observation: Concepts."Reason for HIV viral load test"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Reason for HIV viral load test */

/*
@dataElement: HIV.D.DE392 - Routine viral load test
@activity: HIV.D20 Diagnostics
@description: Routine refers to viral load tests obtained at standard intervals following ART initiation to monitor viral load response to ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Routine viral load test":
  exists "Routine viral load test Condition"
    or exists "Routine viral load test Observation"
define "Routine viral load test Condition":
  [Condition: Concepts."Routine viral load test"]
define "Routine viral load test Observation":
  [Observation: Concepts."Routine viral load test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Routine viral load test"
/* End of Routine viral load test */

/*
@dataElement: HIV.D.DE393 - Targeted viral load monitoring
@activity: HIV.D20 Diagnostics
@description: Targeted refers to viral load tests obtained based on a specific clinical indication (such as concern about disease progression or failure to respond to ART)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Targeted viral load monitoring":
  exists "Targeted viral load monitoring Condition"
    or exists "Targeted viral load monitoring Observation"
define "Targeted viral load monitoring Condition":
  [Condition: Concepts."Targeted viral load monitoring"]
define "Targeted viral load monitoring Observation":
  [Observation: Concepts."Targeted viral load monitoring"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Targeted viral load monitoring"
/* End of Targeted viral load monitoring */

/*
@dataElement: HIV.D.DE394 - Initial viral load test
@activity: HIV.D20 Diagnostics
@description: The first viral load test of the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Initial viral load test":
  exists "Initial viral load test Condition"
    or exists "Initial viral load test Observation"
define "Initial viral load test Condition":
  [Condition: Concepts."Initial viral load test"]
define "Initial viral load test Observation":
  [Observation: Concepts."Initial viral load test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Initial viral load test"
/* End of Initial viral load test */

/*
@dataElement: HIV.D.DE395 - Follow-up viral load test after receiving enhanced adherence counselling
@activity: HIV.D20 Diagnostics
@description: A follow-up viral load test within 3-6 months after enhanced adherence counselling after client received a high viral load test result
*/
// TODO: Replace placeholder with relevant CQL logic
define "Follow-up viral load test after receiving enhanced adherence counselling":
  exists "Follow-up viral load test after receiving enhanced adherence counselling Condition"
    or exists "Follow-up viral load test after receiving enhanced adherence counselling Observation"
define "Follow-up viral load test after receiving enhanced adherence counselling Condition":
  [Condition: Concepts."Follow-up viral load test after receiving enhanced adherence counselling"]
define "Follow-up viral load test after receiving enhanced adherence counselling Observation":
  [Observation: Concepts."Follow-up viral load test after receiving enhanced adherence counselling"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Follow-up viral load test after receiving enhanced adherence counselling"
/* End of Follow-up viral load test after receiving enhanced adherence counselling */

/*
@dataElement: HIV.D.DE399 - Monitoring examinations
@activity: HIV.D20 Diagnostics
@description: Name of examinations, test and results for any relevant investigations carried out for client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Monitoring examinations Observation":
  [Observation: Concepts."Monitoring examinations"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Monitoring examinations */

/*
@dataElement: HIV.D.DE400 - Haemoglobin Hb
@activity: HIV.D20 Diagnostics
@description: Provider ordered a Haemoglobin (Hb) test, number in g/dL test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Haemoglobin Hb":
  exists "Haemoglobin Hb Condition"
    or exists "Haemoglobin Hb Observation"
define "Haemoglobin Hb Condition":
  [Condition: Concepts."Haemoglobin Hb"]
define "Haemoglobin Hb Observation":
  [Observation: Concepts."Haemoglobin Hb"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Haemoglobin Hb"
/* End of Haemoglobin Hb */

/*
@dataElement: HIV.D.DE401 - Pregnancy test
@activity: HIV.D20 Diagnostics
@description: Provider ordered a pregnancy test for client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Pregnancy test":
  exists "Pregnancy test Condition"
    or exists "Pregnancy test Observation"
define "Pregnancy test Condition":
  [Condition: Concepts."Pregnancy test"]
define "Pregnancy test Observation":
  [Observation: Concepts."Pregnancy test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Pregnancy test"
/* End of Pregnancy test */

/*
@dataElement: HIV.D.DE402 - Syphilis test
@activity: HIV.D20 Diagnostics
@description: Provider ordered a syphilis test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis test":
  exists "Syphilis test Condition"
    or exists "Syphilis test Observation"
define "Syphilis test Condition":
  [Condition: Concepts."Syphilis test"]
define "Syphilis test Observation":
  [Observation: Concepts."Syphilis test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Syphilis test"
/* End of Syphilis test */

/*
@dataElement: HIV.D.DE403 - Chest X-ray CXR
@activity: HIV.D20 Diagnostics
@description: Provider ordered a chest X-ray (CXR)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chest X-ray CXR":
  exists "Chest X-ray CXR Condition"
    or exists "Chest X-ray CXR Observation"
define "Chest X-ray CXR Condition":
  [Condition: Concepts."Chest X-ray CXR"]
define "Chest X-ray CXR Observation":
  [Observation: Concepts."Chest X-ray CXR"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chest X-ray CXR"
/* End of Chest X-ray CXR */

/*
@dataElement: HIV.D.DE404 - Sputum or culture for TB
@activity: HIV.D20 Diagnostics
@description: Provider ordered sputum or culture for TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sputum or culture for TB":
  exists "Sputum or culture for TB Condition"
    or exists "Sputum or culture for TB Observation"
define "Sputum or culture for TB Condition":
  [Condition: Concepts."Sputum or culture for TB"]
define "Sputum or culture for TB Observation":
  [Observation: Concepts."Sputum or culture for TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sputum or culture for TB"
/* End of Sputum or culture for TB */

/*
@dataElement: HIV.D.DE405 - HBsAg test HBV
@activity: HIV.D20 Diagnostics
@description: Provider ordered an HBsAg test (HBV) test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HBsAg test HBV":
  exists "HBsAg test HBV Condition"
    or exists "HBsAg test HBV Observation"
define "HBsAg test HBV Condition":
  [Condition: Concepts."HBsAg test HBV"]
define "HBsAg test HBV Observation":
  [Observation: Concepts."HBsAg test HBV"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HBsAg test HBV"
/* End of HBsAg test HBV */

/*
@dataElement: HIV.D.DE406 - HIV viral load test ordered
@activity: HIV.D20 Diagnostics
@description: Provider ordered an HIV viral load test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV viral load test ordered":
  exists "HIV viral load test ordered Condition"
    or exists "HIV viral load test ordered Observation"
define "HIV viral load test ordered Condition":
  [Condition: Concepts."HIV viral load test ordered"]
define "HIV viral load test ordered Observation":
  [Observation: Concepts."HIV viral load test ordered"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV viral load test ordered"
/* End of HIV viral load test ordered */

/*
@dataElement: HIV.D.DE407 - HIV viral load test scheduled
@activity: HIV.D20 Diagnostics
@description: Scheduled an HIV viral load test with client
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV viral load test scheduled":
  exists "HIV viral load test scheduled Condition"
    or exists "HIV viral load test scheduled Observation"
define "HIV viral load test scheduled Condition":
  [Condition: Concepts."HIV viral load test scheduled"]
define "HIV viral load test scheduled Observation":
  [Observation: Concepts."HIV viral load test scheduled"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV viral load test scheduled"
/* End of HIV viral load test scheduled */

/*
@dataElement: HIV.D.DE408 - CD4 count ordered
@activity: HIV.D20 Diagnostics
@description: Provider ordered a CD4 cell count
*/
// TODO: Replace placeholder with relevant CQL logic
define "CD4 count ordered":
  exists "CD4 count ordered Condition"
    or exists "CD4 count ordered Observation"
define "CD4 count ordered Condition":
  [Condition: Concepts."CD4 count ordered"]
define "CD4 count ordered Observation":
  [Observation: Concepts."CD4 count ordered"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."CD4 count ordered"
/* End of CD4 count ordered */

/*
@dataElement: HIV.D.DE409 - CD4 count test scheduled
@activity: HIV.D20 Diagnostics
@description: Scheduled a CD4 test with client
*/
// TODO: Replace placeholder with relevant CQL logic
define "CD4 count test scheduled":
  exists "CD4 count test scheduled Condition"
    or exists "CD4 count test scheduled Observation"
define "CD4 count test scheduled Condition":
  [Condition: Concepts."CD4 count test scheduled"]
define "CD4 count test scheduled Observation":
  [Observation: Concepts."CD4 count test scheduled"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."CD4 count test scheduled"
/* End of CD4 count test scheduled */

/*
@dataElement: HIV.D.DE410 - Cryptococcal antigen test
@activity: HIV.D20 Diagnostics
@description: Provider ordered a cryptococcal antigen test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cryptococcal antigen test":
  exists "Cryptococcal antigen test Condition"
    or exists "Cryptococcal antigen test Observation"
define "Cryptococcal antigen test Condition":
  [Condition: Concepts."Cryptococcal antigen test"]
define "Cryptococcal antigen test Observation":
  [Observation: Concepts."Cryptococcal antigen test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cryptococcal antigen test"
/* End of Cryptococcal antigen test */

/*
@dataElement: HIV.D.DE411 - Histoplasmosis antigen test
@activity: HIV.D20 Diagnostics
@description: Provider ordered a histoplasmosis antigen test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Histoplasmosis antigen test":
  exists "Histoplasmosis antigen test Condition"
    or exists "Histoplasmosis antigen test Observation"
define "Histoplasmosis antigen test Condition":
  [Condition: Concepts."Histoplasmosis antigen test"]
define "Histoplasmosis antigen test Observation":
  [Observation: Concepts."Histoplasmosis antigen test"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Histoplasmosis antigen test"
/* End of Histoplasmosis antigen test */

/*
@dataElement: HIV.D.DE412 - Cervical cancer screening scheduled
@activity: HIV.D28 Offer other services
@description: Scheduled cervical cancer screening with client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer screening scheduled":
  exists "Cervical cancer screening scheduled Condition"
    or exists "Cervical cancer screening scheduled Observation"
define "Cervical cancer screening scheduled Condition":
  [Condition: Concepts."Cervical cancer screening scheduled"]
define "Cervical cancer screening scheduled Observation":
  [Observation: Concepts."Cervical cancer screening scheduled"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cervical cancer screening scheduled"
/* End of Cervical cancer screening scheduled */

/*
@dataElement: HIV.D.DE413 - Date of scheduled monitoring examination
@activity: HIV.D28 Offer other services
@description: Date of scheduled monitoring examination
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of scheduled monitoring examination":
  [Observation: Concepts."Date of scheduled monitoring examination"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of scheduled monitoring examination */

/*
@dataElement: HIV.D.DE417 - Date viral load test results received by client - HIV.D.DE417
@activity: HIV.D20 Diagnostics
@description: The date on which the client received results from a viral load test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date viral load test results received by client - HIV.D.DE417":
  [Observation: Concepts."Date viral load test results received by client - HIV.D.DE417"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date viral load test results received by client - HIV.D.DE417 */

/*
@dataElement: HIV.D.DE418 - Reason for ARV drug regimen substitution
@activity: HIV.D21 Determine regimen and treatment options
@description: Reason why a substitution was made to the antiretroviral (ARV) drug regimen
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reason for ARV drug regimen substitution Observation":
  [Observation: Concepts."Reason for ARV drug regimen substitution"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Reason for ARV drug regimen substitution */

/*
@dataElement: HIV.D.DE419 - Toxicity/side effects - HIV.D.DE419
@activity: HIV.D21 Determine regimen and treatment options
@description: A substitution was made to the regimen because of toxicity/side effects
*/
// TODO: Replace placeholder with relevant CQL logic
define "Toxicity/side effects - HIV.D.DE419":
  exists "Toxicity/side effects - HIV.D.DE419 Condition"
    or exists "Toxicity/side effects - HIV.D.DE419 Observation"
define "Toxicity/side effects - HIV.D.DE419 Condition":
  [Condition: Concepts."Toxicity/side effects - HIV.D.DE419"]
define "Toxicity/side effects - HIV.D.DE419 Observation":
  [Observation: Concepts."Toxicity/side effects - HIV.D.DE418"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Toxicity/side effects - HIV.D.DE419"
/* End of Toxicity/side effects - HIV.D.DE419 */

/*
@dataElement: HIV.D.DE420 - Drug-drug interaction
@activity: HIV.D21 Determine regimen and treatment options
@description: A substitution was made to the regimen because of a drug-drug interaction
*/
// TODO: Replace placeholder with relevant CQL logic
define "Drug-drug interaction":
  exists "Drug-drug interaction Condition"
    or exists "Drug-drug interaction Observation"
define "Drug-drug interaction Condition":
  [Condition: Concepts."Drug-drug interaction"]
define "Drug-drug interaction Observation":
  [Observation: Concepts."Drug-drug interaction"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Drug-drug interaction"
/* End of Drug-drug interaction */

/*
@dataElement: HIV.D.DE421 - Pregnancy
@activity: HIV.D21 Determine regimen and treatment options
@description: A substitution was made to the regimen because of pregnancy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Pregnancy":
  exists "Pregnancy Condition"
    or exists "Pregnancy Observation"
define "Pregnancy Condition":
  [Condition: Concepts."Pregnancy"]
define "Pregnancy Observation":
  [Observation: Concepts."Pregnancy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Pregnancy"
/* End of Pregnancy */

/*
@dataElement: HIV.D.DE422 - New TB
@activity: HIV.D21 Determine regimen and treatment options
@description: A substitution was made to the regimen because of new tuberculosis (TB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "New TB":
  exists "New TB Condition"
    or exists "New TB Observation"
define "New TB Condition":
  [Condition: Concepts."New TB"]
define "New TB Observation":
  [Observation: Concepts."New TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."New TB"
/* End of New TB */

/*
@dataElement: HIV.D.DE423 - New drug available
@activity: HIV.D21 Determine regimen and treatment options
@description: A substitution was made to the regimen because a new drug was available
*/
// TODO: Replace placeholder with relevant CQL logic
define "New drug available":
  exists "New drug available Condition"
    or exists "New drug available Observation"
define "New drug available Condition":
  [Condition: Concepts."New drug available"]
define "New drug available Observation":
  [Observation: Concepts."New drug available"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."New drug available"
/* End of New drug available */

/*
@dataElement: HIV.D.DE424 - Drug out of stock
@activity: HIV.D21 Determine regimen and treatment options
@description: A substitution was made to the regimen because drug was out of stock
*/
// TODO: Replace placeholder with relevant CQL logic
define "Drug out of stock":
  exists "Drug out of stock Condition"
    or exists "Drug out of stock Observation"
define "Drug out of stock Condition":
  [Condition: Concepts."Drug out of stock"]
define "Drug out of stock Observation":
  [Observation: Concepts."Drug out of stock"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Drug out of stock"
/* End of Drug out of stock */

/*
@dataElement: HIV.D.DE425 - Other reason for regimen substitution
@activity: HIV.D21 Determine regimen and treatment options
@description: A substitution was made for another reason
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other reason for regimen substitution":
  exists "Other reason for regimen substitution Condition"
    or exists "Other reason for regimen substitution Observation"
define "Other reason for regimen substitution Condition":
  [Condition: Concepts."Other reason for regimen substitution"]
define "Other reason for regimen substitution Observation":
  [Observation: Concepts."Other reason for regimen substitution"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other reason for regimen substitution"
/* End of Other reason for regimen substitution */

/*
@dataElement: HIV.D.DE427 - Switch to second-line ART regimen recommended
@activity: HIV.D21 Determine regimen and treatment options
@description: A switch to second-line ART regimen is recommended
*/
// TODO: Replace placeholder with relevant CQL logic
define "Switch to second-line ART regimen recommended":
  [Observation: Concepts."Switch to second-line ART regimen recommended"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Switch to second-line ART regimen recommended */

/*
@dataElement: HIV.D.DE436 - Regimen substitution recommended
@activity: HIV.D23 Prescribe
@description: A drug substitution is recommended
*/
// TODO: Replace placeholder with relevant CQL logic
define "Regimen substitution recommended":
  [Observation: Concepts."Regimen substitution recommended"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Regimen substitution recommended */

/*
@dataElement: HIV.D.DE437 - Dose adjustment recommended
@activity: HIV.D23 Prescribe
@description: A dosage change is recommended
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dose adjustment recommended":
  [Observation: Concepts."Dose adjustment recommended"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Dose adjustment recommended */

/*
@dataElement: HIV.D.DE443 - Suspicion of treatment failure or interruption
@activity: HIV.D23 Prescribe
@description: Client has been on ART, but has stopped taking it or a treatment failure is suspected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Suspicion of treatment failure or interruption":
  [Observation: Concepts."Suspicion of treatment failure or interruption"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Suspicion of treatment failure or interruption */

/*
@dataElement: HIV.D.DE457 - Medications prescribed - HIV.D.DE457
@activity: HIV.D23 Prescribe
@description: Name or regimen code of all other medications prescribed during the visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Medications prescribed - HIV.D.DE457 Observation":
  [Observation: Concepts."Medications prescribed - HIV.D.DE457"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Medications prescribed - HIV.D.DE457 */

/*
@dataElement: HIV.D.DE458 - Date medications prescribed - HIV.D.DE458
@activity: HIV.D23 Prescribe
@description: Date the medications were prescribed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date medications prescribed - HIV.D.DE458":
  [Observation: Concepts."Date medications prescribed - HIV.D.DE458"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date medications prescribed - HIV.D.DE458 */

/*
@dataElement: HIV.D.DE459 - Dose of medications prescribed
@activity: HIV.D23 Prescribe
@description: Number of doses (quantity taken at a single point in time) of drugs prescribed/dispensed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dose of medications prescribed":
  [Observation: Concepts."Dose of medications prescribed"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Dose of medications prescribed */

/*
@dataElement: HIV.D.DE460 - Number of days medications prescribed
@activity: HIV.D23 Prescribe
@description: Number of days supply of each medication or regimen prescribed during the visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Number of days medications prescribed":
  [Observation: Concepts."Number of days medications prescribed"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Number of days medications prescribed */

/*
@dataElement: HIV.D.DE465 - Adherence counselling provided - HIV.D.DE465
@activity: HIV.D24 Counsel
@description: Counselling was carried out during visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Adherence counselling provided - HIV.D.DE465":
  [Observation: Concepts."Adherence counselling provided - HIV.D.DE465"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Adherence counselling provided - HIV.D.DE465 */

/*
@dataElement: HIV.D.DE466 - Type of treatment-limiting toxicity
@activity: HIV.D21 Determine regimen and treatment options
@description: Type of treatment-limiting toxicity experienced by client. Treatment-limiting toxicity is defined as a serious adverse drug reaction that results in drug discontinuation or substitution. In addition, any reaction that leads to treatment interruption or requires changing the drug or regimen because of an adverse drug reaction is also considered a serious adverse drug reaction.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of treatment-limiting toxicity Observation":
  [Observation: Concepts."Type of treatment-limiting toxicity"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of treatment-limiting toxicity */

/*
@dataElement: HIV.D.DE467 - Gastrointestinal
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to GI issues (nausea, diarrhoea, abdominal pain, vomiting)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gastrointestinal":
  exists "Gastrointestinal Condition"
    or exists "Gastrointestinal Observation"
define "Gastrointestinal Condition":
  [Condition: Concepts."Gastrointestinal"]
define "Gastrointestinal Observation":
  [Observation: Concepts."Gastrointestinal"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Gastrointestinal"
/* End of Gastrointestinal */

/*
@dataElement: HIV.D.DE468 - Skin issues
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to skin issues (rash, hypersensitivity reaction)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Skin issues":
  exists "Skin issues Condition"
    or exists "Skin issues Observation"
define "Skin issues Condition":
  [Condition: Concepts."Skin issues"]
define "Skin issues Observation":
  [Observation: Concepts."Skin issues"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Skin issues"
/* End of Skin issues */

/*
@dataElement: HIV.D.DE469 - Peripheral neuropathy
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to peripheral neuropathy (burning/numbness/ tingling)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Peripheral neuropathy":
  exists "Peripheral neuropathy Condition"
    or exists "Peripheral neuropathy Observation"
define "Peripheral neuropathy Condition":
  [Condition: Concepts."Peripheral neuropathy"]
define "Peripheral neuropathy Observation":
  [Observation: Concepts."Peripheral neuropathy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Peripheral neuropathy"
/* End of Peripheral neuropathy */

/*
@dataElement: HIV.D.DE470 - Central nervous system symptoms
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to central nervous system symptoms (dizzy, anxiety, nightmare, depression, seizures)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Central nervous system symptoms":
  exists "Central nervous system symptoms Condition"
    or exists "Central nervous system symptoms Observation"
define "Central nervous system symptoms Condition":
  [Condition: Concepts."Central nervous system symptoms"]
define "Central nervous system symptoms Observation":
  [Observation: Concepts."Central nervous system symptoms"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Central nervous system symptoms"
/* End of Central nervous system symptoms */

/*
@dataElement: HIV.D.DE471 - Weight gain
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to weight gain
*/
// TODO: Replace placeholder with relevant CQL logic
define "Weight gain":
  exists "Weight gain Condition"
    or exists "Weight gain Observation"
define "Weight gain Condition":
  [Condition: Concepts."Weight gain"]
define "Weight gain Observation":
  [Observation: Concepts."Weight gain"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Weight gain"
/* End of Weight gain */

/*
@dataElement: HIV.D.DE472 - Hepatic dysfunction
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to hepatic dysfunction (jaundice)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hepatic dysfunction":
  exists "Hepatic dysfunction Condition"
    or exists "Hepatic dysfunction Observation"
define "Hepatic dysfunction Condition":
  [Condition: Concepts."Hepatic dysfunction"]
define "Hepatic dysfunction Observation":
  [Observation: Concepts."Hepatic dysfunction"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hepatic dysfunction"
/* End of Hepatic dysfunction */

/*
@dataElement: HIV.D.DE473 - Haematological disorders
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to haematological (anaemia, neutropenia) disorders
*/
// TODO: Replace placeholder with relevant CQL logic
define "Haematological disorders":
  exists "Haematological disorders Condition"
    or exists "Haematological disorders Observation"
define "Haematological disorders Condition":
  [Condition: Concepts."Haematological disorders"]
define "Haematological disorders Observation":
  [Observation: Concepts."Haematological disorders"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Haematological disorders"
/* End of Haematological disorders */

/*
@dataElement: HIV.D.DE474 - Fatigue
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to fatigue
*/
// TODO: Replace placeholder with relevant CQL logic
define "Fatigue":
  exists "Fatigue Condition"
    or exists "Fatigue Observation"
define "Fatigue Condition":
  [Condition: Concepts."Fatigue"]
define "Fatigue Observation":
  [Observation: Concepts."Fatigue"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Fatigue"
/* End of Fatigue */

/*
@dataElement: HIV.D.DE475 - Headache - HIV.D.DE475
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to headache
*/
// TODO: Replace placeholder with relevant CQL logic
define "Headache - HIV.D.DE475":
  exists "Headache - HIV.D.DE475 Condition"
    or exists "Headache - HIV.D.DE475 Observation"
define "Headache - HIV.D.DE475 Condition":
  [Condition: Concepts."Headache - HIV.D.DE475"]
define "Headache - HIV.D.DE475 Observation":
  [Observation: Concepts."Headache - HIV.D.DE466"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Headache - HIV.D.DE475"
/* End of Headache - HIV.D.DE475 */

/*
@dataElement: HIV.D.DE476 - Bone dysfunction
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to bone dysfunction (fractures, osteopenia)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Bone dysfunction":
  exists "Bone dysfunction Condition"
    or exists "Bone dysfunction Observation"
define "Bone dysfunction Condition":
  [Condition: Concepts."Bone dysfunction"]
define "Bone dysfunction Observation":
  [Observation: Concepts."Bone dysfunction"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Bone dysfunction"
/* End of Bone dysfunction */

/*
@dataElement: HIV.D.DE477 - Metabolic symptoms
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to metabolic symptoms (body fat changes, hyperglycaemia, dyslipidaemia)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Metabolic symptoms":
  exists "Metabolic symptoms Condition"
    or exists "Metabolic symptoms Observation"
define "Metabolic symptoms Condition":
  [Condition: Concepts."Metabolic symptoms"]
define "Metabolic symptoms Observation":
  [Observation: Concepts."Metabolic symptoms"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Metabolic symptoms"
/* End of Metabolic symptoms */

/*
@dataElement: HIV.D.DE478 - Kidney dysfunction
@activity: HIV.D21 Determine regimen and treatment options
@description: Treatment-limiting toxicity due to kidney dysfunction (nephrolithiasis, renal insufficiency)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Kidney dysfunction":
  exists "Kidney dysfunction Condition"
    or exists "Kidney dysfunction Observation"
define "Kidney dysfunction Condition":
  [Condition: Concepts."Kidney dysfunction"]
define "Kidney dysfunction Observation":
  [Observation: Concepts."Kidney dysfunction"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Kidney dysfunction"
/* End of Kidney dysfunction */

/*
@dataElement: HIV.D.DE479 - Unexpected adverse drug reaction
@activity: HIV.D21 Determine regimen and treatment options
@description: Client experienced an unexpected adverse drug reaction
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unexpected adverse drug reaction":
  exists "Unexpected adverse drug reaction Condition"
    or exists "Unexpected adverse drug reaction Observation"
define "Unexpected adverse drug reaction Condition":
  [Condition: Concepts."Unexpected adverse drug reaction"]
define "Unexpected adverse drug reaction Observation":
  [Observation: Concepts."Unexpected adverse drug reaction"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unexpected adverse drug reaction"
/* End of Unexpected adverse drug reaction */

/*
@dataElement: HIV.D.DE487 - Dates of substitution within second-line regimen
@activity: HIV.D21 Determine regimen and treatment options
@description: Date on which ARV drug regimen for client was changed within the second-line regimen (substitution)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dates of substitution within second-line regimen":
  [Observation: Concepts."Dates of substitution within second-line regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Dates of substitution within second-line regimen */

/*
@dataElement: HIV.D.DE493 - Dates of substitution within third-line regimen
@activity: HIV.D21 Determine regimen and treatment options
@description: Date on which ARV drug regimen for client was changed within the third-line (substitution)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dates of substitution within third-line regimen":
  [Observation: Concepts."Dates of substitution within third-line regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Dates of substitution within third-line regimen */

/*
@dataElement: HIV.D.DE496 - Enhanced adherence counselling provided
@activity: HIV.D24 Counsel
@description: Enhanced adherence counselling was provided to the client during the visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Enhanced adherence counselling provided":
  [Observation: Concepts."Enhanced adherence counselling provided"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Enhanced adherence counselling provided */

/*
@dataElement: HIV.D.DE507 - Counselling provided on diagnoses
@activity: HIV.D24 Counsel
@description: Counselling provided on diagnoses
*/
// TODO: Replace placeholder with relevant CQL logic
define "Counselling provided on diagnoses":
  [Observation: Concepts."Counselling provided on diagnoses"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Counselling provided on diagnoses */

/*
@dataElement: HIV.D.DE510 - Syphilis counselling and treatment
@activity: HIV.D24 Counsel
@description: Whether counselling and treatment was provided to a client who has been diagnosed with syphilis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis counselling and treatment":
  [Observation: Concepts."Syphilis counselling and treatment"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Syphilis counselling and treatment */

/*
@dataElement: HIV.D.DE519 - Other support services - HIV.D.DE519
@activity: HIV.D28 Offer other services
@description: Offer or refer for other support services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other support services - HIV.D.DE519 Observation":
  [Observation: Concepts."Other support services - HIV.D.DE519"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Other support services - HIV.D.DE519 */

/*
@dataElement: HIV.D.DE520 - Mental health services - HIV.D.DE520
@activity: HIV.D28 Offer other services
@description: Offer or refer for mental health services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Mental health services - HIV.D.DE520":
  exists "Mental health services - HIV.D.DE520 Condition"
    or exists "Mental health services - HIV.D.DE520 Observation"
define "Mental health services - HIV.D.DE520 Condition":
  [Condition: Concepts."Mental health services - HIV.D.DE520"]
define "Mental health services - HIV.D.DE520 Observation":
  [Observation: Concepts."Mental health services - HIV.D.DE519"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Mental health services - HIV.D.DE520"
/* End of Mental health services - HIV.D.DE520 */

/*
@dataElement: HIV.D.DE521 - Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521
@activity: HIV.D28 Offer other services
@description: Offer or refer for psychosocial counselling, support and treatment adherence counselling
*/
// TODO: Replace placeholder with relevant CQL logic
define "Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521":
  exists "Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521 Condition"
    or exists "Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521 Observation"
define "Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521 Condition":
  [Condition: Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521"]
define "Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521 Observation":
  [Observation: Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE519"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521"
/* End of Psychosocial counselling, support and treatment adherence counselling - HIV.D.DE521 */

/*
@dataElement: HIV.D.DE522 - Legal and social services - HIV.D.DE522
@activity: HIV.D28 Offer other services
@description: Offer or refer for legal and social services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Legal and social services - HIV.D.DE522":
  exists "Legal and social services - HIV.D.DE522 Condition"
    or exists "Legal and social services - HIV.D.DE522 Observation"
define "Legal and social services - HIV.D.DE522 Condition":
  [Condition: Concepts."Legal and social services - HIV.D.DE522"]
define "Legal and social services - HIV.D.DE522 Observation":
  [Observation: Concepts."Legal and social services - HIV.D.DE519"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Legal and social services - HIV.D.DE522"
/* End of Legal and social services - HIV.D.DE522 */

/*
@dataElement: HIV.D.DE523 - Services for responding to violence against women - HIV.D.DE523
@activity: HIV.D28 Offer other services
@description: Offer or refer for services for responding to violence against women, including first-line support and psychosocial support, post-rape care and other support services including shelters, legal services and women and child protection services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Services for responding to violence against women - HIV.D.DE523":
  exists "Services for responding to violence against women - HIV.D.DE523 Condition"
    or exists "Services for responding to violence against women - HIV.D.DE523 Observation"
define "Services for responding to violence against women - HIV.D.DE523 Condition":
  [Condition: Concepts."Services for responding to violence against women - HIV.D.DE523"]
define "Services for responding to violence against women - HIV.D.DE523 Observation":
  [Observation: Concepts."Services for responding to violence against women - HIV.D.DE519"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Services for responding to violence against women - HIV.D.DE523"
/* End of Services for responding to violence against women - HIV.D.DE523 */

/*
@dataElement: HIV.D.DE524 - Date/time of follow-up appointment - HIV.D.DE524
@activity: HIV.D29 Schedule follow-up
@description: Date the client is to return for monitoring, re-supply or any other reason
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date/time of follow-up appointment - HIV.D.DE524":
  [Observation: Concepts."Date/time of follow-up appointment - HIV.D.DE524"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date/time of follow-up appointment - HIV.D.DE524 */

/*
@dataElement: HIV.D.DE525 - Type of follow-up appointment - HIV.D.DE525
@activity: HIV.D29 Schedule follow-up
@description: Whether the visit will be clinical only, ARV drug pick-up or other. Client may have multiple follow-ups scheduled.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of follow-up appointment - HIV.D.DE525 Observation":
  [Observation: Concepts."Type of follow-up appointment - HIV.D.DE525"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of follow-up appointment - HIV.D.DE525 */

/*
@dataElement: HIV.D.DE526 - Clinical visit - HIV.D.DE526
@activity: HIV.D29 Schedule follow-up
@description: Appointment for clinical care by a provider
*/
// TODO: Replace placeholder with relevant CQL logic
define "Clinical visit - HIV.D.DE526":
  exists "Clinical visit - HIV.D.DE526 Condition"
    or exists "Clinical visit - HIV.D.DE526 Observation"
define "Clinical visit - HIV.D.DE526 Condition":
  [Condition: Concepts."Clinical visit - HIV.D.DE526"]
define "Clinical visit - HIV.D.DE526 Observation":
  [Observation: Concepts."Clinical visit - HIV.D.DE525"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Clinical visit - HIV.D.DE526"
/* End of Clinical visit - HIV.D.DE526 */

/*
@dataElement: HIV.D.DE527 - Antiretroviral drug pick up
@activity: HIV.D29 Schedule follow-up
@description: Appointment for a drug pick up
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antiretroviral drug pick up":
  exists "Antiretroviral drug pick up Condition"
    or exists "Antiretroviral drug pick up Observation"
define "Antiretroviral drug pick up Condition":
  [Condition: Concepts."Antiretroviral drug pick up"]
define "Antiretroviral drug pick up Observation":
  [Observation: Concepts."Antiretroviral drug pick up"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antiretroviral drug pick up"
/* End of Antiretroviral drug pick up */

/*
@dataElement: HIV.D.DE528 - Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528
@activity: HIV.D29 Schedule follow-up
@description: Appointment for a post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528":
  exists "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528 Condition"
    or exists "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528 Observation"
define "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528 Condition":
  [Condition: Concepts."Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528"]
define "Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528 Observation":
  [Observation: Concepts."Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE525"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528"
/* End of Post-treatment follow-up visit for cervical precancer lesions or invasive cervical cancer - HIV.D.DE528 */

/*
@dataElement: HIV.D.DE529 - Other - HIV.D.DE529
@activity: HIV.D29 Schedule follow-up
@description: Other reason for the follow-up appointment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.D.DE529":
  exists "Other - HIV.D.DE529 Condition"
    or exists "Other - HIV.D.DE529 Observation"
define "Other - HIV.D.DE529 Condition":
  [Condition: Concepts."Other - HIV.D.DE529"]
define "Other - HIV.D.DE529 Observation":
  [Observation: Concepts."Other - HIV.D.DE525"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.D.DE529"
/* End of Other - HIV.D.DE529 */

/*
@dataElement: HIV.D.DE531 - Follow-up test recommended date
@activity: HIV.D29 Schedule follow-up
@description: A test or screening recommended for the client's care plan at a future date
*/
// TODO: Replace placeholder with relevant CQL logic
define "Follow-up test recommended date":
  [Observation: Concepts."Follow-up test recommended date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Follow-up test recommended date */

/*
@dataElement: HIV.D.DE537 - Current medications
@activity: HIV.D8 Capture or update client history
@description: List of all of the medications the client is currently taking
*/
// TODO: Replace placeholder with relevant CQL logic
define "Current medications Observation":
  [Observation: Concepts."Current medications"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Current medications */

/*
@dataElement: HIV.D.DE538 - No medications
@activity: HIV.D8 Capture or update client history
@description: The client is currently not on any medications
*/
// TODO: Replace placeholder with relevant CQL logic
define "No medications":
  exists "No medications Condition"
    or exists "No medications Observation"
define "No medications Condition":
  [Condition: Concepts."No medications"]
define "No medications Observation":
  [Observation: Concepts."No medications"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."No medications"
/* End of No medications */

/*
@dataElement: HIV.D.DE539 - Dont know of any current medications
@activity: HIV.D8 Capture or update client history
@description: The client does not know if she is on any medications
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dont know of any current medications":
  exists "Dont know of any current medications Condition"
    or exists "Dont know of any current medications Observation"
define "Dont know of any current medications Condition":
  [Condition: Concepts."Dont know of any current medications"]
define "Dont know of any current medications Observation":
  [Observation: Concepts."Dont know of any current medications"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Dont know of any current medications"
/* End of Dont know of any current medications */

/*
@dataElement: HIV.D.DE540 - Analgesic
@activity: HIV.D8 Capture or update client history
@description: Analgesic medication (painkiller)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Analgesic":
  exists "Analgesic Condition"
    or exists "Analgesic Observation"
define "Analgesic Condition":
  [Condition: Concepts."Analgesic"]
define "Analgesic Observation":
  [Observation: Concepts."Analgesic"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Analgesic"
/* End of Analgesic */

/*
@dataElement: HIV.D.DE541 - Antacids
@activity: HIV.D8 Capture or update client history
@description: Antacids
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antacids":
  exists "Antacids Condition"
    or exists "Antacids Observation"
define "Antacids Condition":
  [Condition: Concepts."Antacids"]
define "Antacids Observation":
  [Observation: Concepts."Antacids"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antacids"
/* End of Antacids */

/*
@dataElement: HIV.D.DE542 - Antibiotics broad-spectrum
@activity: HIV.D8 Capture or update client history
@description: Client is currently taking broad-spectrum antibiotics
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antibiotics broad-spectrum":
  exists "Antibiotics broad-spectrum Condition"
    or exists "Antibiotics broad-spectrum Observation"
define "Antibiotics broad-spectrum Condition":
  [Condition: Concepts."Antibiotics broad-spectrum"]
define "Antibiotics broad-spectrum Observation":
  [Observation: Concepts."Antibiotics broad-spectrum"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antibiotics broad-spectrum"
/* End of Antibiotics broad-spectrum */

/*
@dataElement: HIV.D.DE543 - Anticonvulsive
@activity: HIV.D8 Capture or update client history
@description: Anticonvulsive medication
*/
// TODO: Replace placeholder with relevant CQL logic
define "Anticonvulsive":
  exists "Anticonvulsive Condition"
    or exists "Anticonvulsive Observation"
define "Anticonvulsive Condition":
  [Condition: Concepts."Anticonvulsive"]
define "Anticonvulsive Observation":
  [Observation: Concepts."Anticonvulsive"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Anticonvulsive"
/* End of Anticonvulsive */

/*
@dataElement: HIV.D.DE544 - Antidiabetic
@activity: HIV.D8 Capture or update client history
@description: Antidiabetic medication
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antidiabetic":
  exists "Antidiabetic Condition"
    or exists "Antidiabetic Observation"
define "Antidiabetic Condition":
  [Condition: Concepts."Antidiabetic"]
define "Antidiabetic Observation":
  [Observation: Concepts."Antidiabetic"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antidiabetic"
/* End of Antidiabetic */

/*
@dataElement: HIV.D.DE545 - Antifungals
@activity: HIV.D8 Capture or update client history
@description: Client is currently taking antifungals
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antifungals":
  exists "Antifungals Condition"
    or exists "Antifungals Observation"
define "Antifungals Condition":
  [Condition: Concepts."Antifungals"]
define "Antifungals Observation":
  [Observation: Concepts."Antifungals"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antifungals"
/* End of Antifungals */

/*
@dataElement: HIV.D.DE546 - Antihelmintic
@activity: HIV.D8 Capture or update client history
@description: Antihelmintic or antiparasitic medication
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antihelmintic":
  exists "Antihelmintic Condition"
    or exists "Antihelmintic Observation"
define "Antihelmintic Condition":
  [Condition: Concepts."Antihelmintic"]
define "Antihelmintic Observation":
  [Observation: Concepts."Antihelmintic"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antihelmintic"
/* End of Antihelmintic */

/*
@dataElement: HIV.D.DE547 - Antihypertensive
@activity: HIV.D8 Capture or update client history
@description: Antihypertensive medication
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antihypertensive":
  exists "Antihypertensive Condition"
    or exists "Antihypertensive Observation"
define "Antihypertensive Condition":
  [Condition: Concepts."Antihypertensive"]
define "Antihypertensive Observation":
  [Observation: Concepts."Antihypertensive"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antihypertensive"
/* End of Antihypertensive */

/*
@dataElement: HIV.D.DE548 - Antimalarials
@activity: HIV.D8 Capture or update client history
@description: Antimalarial medication
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antimalarials":
  exists "Antimalarials Condition"
    or exists "Antimalarials Observation"
define "Antimalarials Condition":
  [Condition: Concepts."Antimalarials"]
define "Antimalarials Observation":
  [Observation: Concepts."Antimalarials"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antimalarials"
/* End of Antimalarials */

/*
@dataElement: HIV.D.DE549 - Antiretrovirals ARVs
@activity: HIV.D8 Capture or update client history
@description: Antiretrovirals (ARVs)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antiretrovirals ARVs":
  exists "Antiretrovirals ARVs Condition"
    or exists "Antiretrovirals ARVs Observation"
define "Antiretrovirals ARVs Condition":
  [Condition: Concepts."Antiretrovirals ARVs"]
define "Antiretrovirals ARVs Observation":
  [Observation: Concepts."Antiretrovirals ARVs"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antiretrovirals ARVs"
/* End of Antiretrovirals ARVs */

/*
@dataElement: HIV.D.DE550 - Antiparasitics
@activity: HIV.D8 Capture or update client history
@description: Client is currently taking antiparasitics
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antiparasitics":
  exists "Antiparasitics Condition"
    or exists "Antiparasitics Observation"
define "Antiparasitics Condition":
  [Condition: Concepts."Antiparasitics"]
define "Antiparasitics Observation":
  [Observation: Concepts."Antiparasitics"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antiparasitics"
/* End of Antiparasitics */

/*
@dataElement: HIV.D.DE551 - Antivirals
@activity: HIV.D8 Capture or update client history
@description: Antiviral medication
*/
// TODO: Replace placeholder with relevant CQL logic
define "Antivirals":
  exists "Antivirals Condition"
    or exists "Antivirals Observation"
define "Antivirals Condition":
  [Condition: Concepts."Antivirals"]
define "Antivirals Observation":
  [Observation: Concepts."Antivirals"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Antivirals"
/* End of Antivirals */

/*
@dataElement: HIV.D.DE552 - Buprenorphine - HIV.D.DE552
@activity: HIV.D8 Capture or update client history
@description: Opioid substitution to treat opioid dependence
*/
// TODO: Replace placeholder with relevant CQL logic
define "Buprenorphine - HIV.D.DE552":
  exists "Buprenorphine - HIV.D.DE552 Condition"
    or exists "Buprenorphine - HIV.D.DE552 Observation"
define "Buprenorphine - HIV.D.DE552 Condition":
  [Condition: Concepts."Buprenorphine - HIV.D.DE552"]
define "Buprenorphine - HIV.D.DE552 Observation":
  [Observation: Concepts."Buprenorphine - HIV.D.DE537"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Buprenorphine - HIV.D.DE552"
/* End of Buprenorphine - HIV.D.DE552 */

/*
@dataElement: HIV.D.DE553 - Co-trimoxazole preventive therapy CPT
@activity: HIV.D8 Capture or update client history
@description: Combination of two antimicrobial drugs (sulfamethoxazole and trimethoprim) that covers a variety of bacterial, fungal and protozoan infections
*/
// TODO: Replace placeholder with relevant CQL logic
define "Co-trimoxazole preventive therapy CPT":
  exists "Co-trimoxazole preventive therapy CPT Condition"
    or exists "Co-trimoxazole preventive therapy CPT Observation"
define "Co-trimoxazole preventive therapy CPT Condition":
  [Condition: Concepts."Co-trimoxazole preventive therapy CPT"]
define "Co-trimoxazole preventive therapy CPT Observation":
  [Observation: Concepts."Co-trimoxazole preventive therapy CPT"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Co-trimoxazole preventive therapy CPT"
/* End of Co-trimoxazole preventive therapy CPT */

/*
@dataElement: HIV.D.DE554 - Hormonal family planning method
@activity: HIV.D8 Capture or update client history
@description: Hormonal family planning method
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hormonal family planning method":
  exists "Hormonal family planning method Condition"
    or exists "Hormonal family planning method Observation"
define "Hormonal family planning method Condition":
  [Condition: Concepts."Hormonal family planning method"]
define "Hormonal family planning method Observation":
  [Observation: Concepts."Hormonal family planning method"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hormonal family planning method"
/* End of Hormonal family planning method */

/*
@dataElement: HIV.D.DE555 - Methadone - HIV.D.DE555
@activity: HIV.D8 Capture or update client history
@description: Opioid substitution to treat opioid dependence
*/
// TODO: Replace placeholder with relevant CQL logic
define "Methadone - HIV.D.DE555":
  exists "Methadone - HIV.D.DE555 Condition"
    or exists "Methadone - HIV.D.DE555 Observation"
define "Methadone - HIV.D.DE555 Condition":
  [Condition: Concepts."Methadone - HIV.D.DE555"]
define "Methadone - HIV.D.DE555 Observation":
  [Observation: Concepts."Methadone - HIV.D.DE537"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Methadone - HIV.D.DE555"
/* End of Methadone - HIV.D.DE555 */

/*
@dataElement: HIV.D.DE556 - PrEP to prevent HIV
@activity: HIV.D8 Capture or update client history
@description: Pre-exposure prophylaxis (PrEP) medication for preventing the acquisition of HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "PrEP to prevent HIV":
  exists "PrEP to prevent HIV Condition"
    or exists "PrEP to prevent HIV Observation"
define "PrEP to prevent HIV Condition":
  [Condition: Concepts."PrEP to prevent HIV"]
define "PrEP to prevent HIV Observation":
  [Observation: Concepts."PrEP to prevent HIV"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."PrEP to prevent HIV"
/* End of PrEP to prevent HIV */

/*
@dataElement: HIV.D.DE557 - Other antibiotics
@activity: HIV.D8 Capture or update client history
@description: Other antibiotics not listed above
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other antibiotics":
  exists "Other antibiotics Condition"
    or exists "Other antibiotics Observation"
define "Other antibiotics Condition":
  [Condition: Concepts."Other antibiotics"]
define "Other antibiotics Observation":
  [Observation: Concepts."Other antibiotics"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other antibiotics"
/* End of Other antibiotics */

/*
@dataElement: HIV.D.DE558 - Other medications
@activity: HIV.D8 Capture or update client history
@description: Other medications or supplements that are not listed above
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other medications":
  exists "Other medications Condition"
    or exists "Other medications Observation"
define "Other medications Condition":
  [Condition: Concepts."Other medications"]
define "Other medications Observation":
  [Observation: Concepts."Other medications"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other medications"
/* End of Other medications */

/*
@dataElement: HIV.D.DE656 - Date of cervical cancer screening test
@activity: HIV.D28 Offer other services
@description: Date of cervical cancer screening test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of cervical cancer screening test":
  [Observation: Concepts."Date of cervical cancer screening test"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of cervical cancer screening test */

/*
@dataElement: HIV.D.DE657 - Lifetime screening test number
@activity: HIV.D28 Offer other services
@description: Client's lifetime number of screenings for cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lifetime screening test number":
  [Observation: Concepts."Lifetime screening test number"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Lifetime screening test number */

/*
@dataElement: HIV.D.DE658 - Cervical cancer primary screening test type
@activity: HIV.D28 Offer other services
@description: Type of cervical cancer screening test used in primary screening
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer primary screening test type Observation":
  [Observation: Concepts."Cervical cancer primary screening test type"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Cervical cancer primary screening test type */

/*
@dataElement: HIV.D.DE659 - HPV-DNA
@activity: HIV.D28 Offer other services
@description: Screened for cervical cancer using HPV-DNA test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HPV-DNA":
  exists "HPV-DNA Condition"
    or exists "HPV-DNA Observation"
define "HPV-DNA Condition":
  [Condition: Concepts."HPV-DNA"]
define "HPV-DNA Observation":
  [Observation: Concepts."HPV-DNA"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HPV-DNA"
/* End of HPV-DNA */

/*
@dataElement: HIV.D.DE660 - VIA
@activity: HIV.D28 Offer other services
@description: Screened for cervical cancer using visual inspection with acetic acid (VIA)
*/
// TODO: Replace placeholder with relevant CQL logic
define "VIA":
  exists "VIA Condition"
    or exists "VIA Observation"
define "VIA Condition":
  [Condition: Concepts."VIA"]
define "VIA Observation":
  [Observation: Concepts."VIA"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."VIA"
/* End of VIA */

/*
@dataElement: HIV.D.DE661 - Cervical cytology
@activity: HIV.D28 Offer other services
@description: Screened for cervical cancer using cervical cytology
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cytology":
  exists "Cervical cytology Condition"
    or exists "Cervical cytology Observation"
define "Cervical cytology Condition":
  [Condition: Concepts."Cervical cytology"]
define "Cervical cytology Observation":
  [Observation: Concepts."Cervical cytology"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cervical cytology"
/* End of Cervical cytology */

/*
@dataElement: HIV.D.DE662 - Other - HIV.D.DE662
@activity: HIV.D28 Offer other services
@description: Screened for cervical cancer using other method
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.D.DE662":
  exists "Other - HIV.D.DE662 Condition"
    or exists "Other - HIV.D.DE662 Observation"
define "Other - HIV.D.DE662 Condition":
  [Condition: Concepts."Other - HIV.D.DE662"]
define "Other - HIV.D.DE662 Observation":
  [Observation: Concepts."Other - HIV.D.DE658"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.D.DE662"
/* End of Other - HIV.D.DE662 */

/*
@dataElement: HIV.D.DE705 - Date of diagnosis of cervical precancer lesions or invasive cervical cancer
@activity: HIV.D28 Offer other services
@description: Date of diagnosis of cervical precancer lesions or invasive cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of diagnosis of cervical precancer lesions or invasive cervical cancer":
  [Observation: Concepts."Date of diagnosis of cervical precancer lesions or invasive cervical cancer"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of diagnosis of cervical precancer lesions or invasive cervical cancer */

/*
@dataElement: HIV.D.DE706 - Cervical cancer screening outcome
@activity: HIV.D28 Offer other services
@description: Client's screening outcome for cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer screening outcome Observation":
  [Observation: Concepts."Cervical cancer screening outcome"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Cervical cancer screening outcome */

/*
@dataElement: HIV.D.DE707 - Positive for cervical precancer lesions
@activity: HIV.D28 Offer other services
@description: Screening outcome for cervical precancer lesions is positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive for cervical precancer lesions":
  exists "Positive for cervical precancer lesions Condition"
    or exists "Positive for cervical precancer lesions Observation"
define "Positive for cervical precancer lesions Condition":
  [Condition: Concepts."Positive for cervical precancer lesions"]
define "Positive for cervical precancer lesions Observation":
  [Observation: Concepts."Positive for cervical precancer lesions"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive for cervical precancer lesions"
/* End of Positive for cervical precancer lesions */

/*
@dataElement: HIV.D.DE708 - Negative for cervical precancer lesions
@activity: HIV.D28 Offer other services
@description: Screening outcome for cervical precancer lesions is negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative for cervical precancer lesions":
  exists "Negative for cervical precancer lesions Condition"
    or exists "Negative for cervical precancer lesions Observation"
define "Negative for cervical precancer lesions Condition":
  [Condition: Concepts."Negative for cervical precancer lesions"]
define "Negative for cervical precancer lesions Observation":
  [Observation: Concepts."Negative for cervical precancer lesions"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative for cervical precancer lesions"
/* End of Negative for cervical precancer lesions */

/*
@dataElement: HIV.D.DE709 - Cervical cancer diagnosis
@activity: HIV.D28 Offer other services
@description: Type of cervical cancer diagnosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer diagnosis Observation":
  [Observation: Concepts."Cervical cancer diagnosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Cervical cancer diagnosis */

/*
@dataElement: HIV.D.DE710 - Cervical precancer lesions
@activity: HIV.D28 Offer other services
@description: Client is diagnosed with cervical precancer lesions
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical precancer lesions":
  exists "Cervical precancer lesions Condition"
    or exists "Cervical precancer lesions Observation"
define "Cervical precancer lesions Condition":
  [Condition: Concepts."Cervical precancer lesions"]
define "Cervical precancer lesions Observation":
  [Observation: Concepts."Cervical precancer lesions"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cervical precancer lesions"
/* End of Cervical precancer lesions */

/*
@dataElement: HIV.D.DE711 - Invasive cervical cancer
@activity: HIV.D28 Offer other services
@description: Client is diagnosed with invasive cervical cancer disease
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invasive cervical cancer":
  exists "Invasive cervical cancer Condition"
    or exists "Invasive cervical cancer Observation"
define "Invasive cervical cancer Condition":
  [Condition: Concepts."Invasive cervical cancer"]
define "Invasive cervical cancer Observation":
  [Observation: Concepts."Invasive cervical cancer"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invasive cervical cancer"
/* End of Invasive cervical cancer */

/*
@dataElement: HIV.D.DE712 - Cervical cancer stage at diagnosis
@activity: HIV.D28 Offer other services
@description: Cervical cancer stage at diagnosis of cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer stage at diagnosis Observation":
  [Observation: Concepts."Cervical cancer stage at diagnosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Cervical cancer stage at diagnosis */

/*
@dataElement: HIV.D.DE713 - Stage 0
@activity: HIV.D28 Offer other services
@description: Stage 0 cervical cancer at diagnosis of cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Stage 0":
  exists "Stage 0 Condition"
    or exists "Stage 0 Observation"
define "Stage 0 Condition":
  [Condition: Concepts."Stage 0"]
define "Stage 0 Observation":
  [Observation: Concepts."Stage 0"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Stage 0"
/* End of Stage 0 */

/*
@dataElement: HIV.D.DE714 - Stage I
@activity: HIV.D28 Offer other services
@description: Stage I cervical cancer at diagnosis of cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Stage I":
  exists "Stage I Condition"
    or exists "Stage I Observation"
define "Stage I Condition":
  [Condition: Concepts."Stage I"]
define "Stage I Observation":
  [Observation: Concepts."Stage I"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Stage I"
/* End of Stage I */

/*
@dataElement: HIV.D.DE715 - Stage II
@activity: HIV.D28 Offer other services
@description: Stage II cervical cancer at diagnosis of cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Stage II":
  exists "Stage II Condition"
    or exists "Stage II Observation"
define "Stage II Condition":
  [Condition: Concepts."Stage II"]
define "Stage II Observation":
  [Observation: Concepts."Stage II"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Stage II"
/* End of Stage II */

/*
@dataElement: HIV.D.DE716 - Stage III
@activity: HIV.D28 Offer other services
@description: Stage III cervical cancer at diagnosis of cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Stage III":
  exists "Stage III Condition"
    or exists "Stage III Observation"
define "Stage III Condition":
  [Condition: Concepts."Stage III"]
define "Stage III Observation":
  [Observation: Concepts."Stage III"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Stage III"
/* End of Stage III */

/*
@dataElement: HIV.D.DE717 - Stage IV
@activity: HIV.D28 Offer other services
@description: Stage IV cervical cancer at diagnosis of cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Stage IV":
  exists "Stage IV Condition"
    or exists "Stage IV Observation"
define "Stage IV Condition":
  [Condition: Concepts."Stage IV"]
define "Stage IV Observation":
  [Observation: Concepts."Stage IV"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Stage IV"
/* End of Stage IV */

/*
@dataElement: HIV.D.DE718 - Date of treatment for cervical precancer lesions
@activity: HIV.D28 Offer other services
@description: Date of treatment for cervical precancer lesions
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of treatment for cervical precancer lesions":
  [Observation: Concepts."Date of treatment for cervical precancer lesions"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of treatment for cervical precancer lesions */

/*
@dataElement: HIV.D.DE730 - Invasive cervical cancer treatment episode
@activity: HIV.D28 Offer other services
@description: Client's lifetime number of treatments for invasive cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invasive cervical cancer treatment episode":
  [Observation: Concepts."Invasive cervical cancer treatment episode"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Invasive cervical cancer treatment episode */

/*
@dataElement: HIV.D.DE731 - Invasive cervical cancer treatment method
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invasive cervical cancer treatment method Observation":
  [Observation: Concepts."Invasive cervical cancer treatment method"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Invasive cervical cancer treatment method */

/*
@dataElement: HIV.D.DE732 - Conization
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is a conization
*/
// TODO: Replace placeholder with relevant CQL logic
define "Conization":
  exists "Conization Condition"
    or exists "Conization Observation"
define "Conization Condition":
  [Condition: Concepts."Conization"]
define "Conization Observation":
  [Observation: Concepts."Conization"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Conization"
/* End of Conization */

/*
@dataElement: HIV.D.DE733 - Trachelectomy
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is a trachelectomy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Trachelectomy":
  exists "Trachelectomy Condition"
    or exists "Trachelectomy Observation"
define "Trachelectomy Condition":
  [Condition: Concepts."Trachelectomy"]
define "Trachelectomy Observation":
  [Observation: Concepts."Trachelectomy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Trachelectomy"
/* End of Trachelectomy */

/*
@dataElement: HIV.D.DE734 - Hysterectomy
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is a hysterectomy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hysterectomy":
  exists "Hysterectomy Condition"
    or exists "Hysterectomy Observation"
define "Hysterectomy Condition":
  [Condition: Concepts."Hysterectomy"]
define "Hysterectomy Observation":
  [Observation: Concepts."Hysterectomy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hysterectomy"
/* End of Hysterectomy */

/*
@dataElement: HIV.D.DE735 - Management of invasive cervical cancer
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is management of invasive cervical cancer
*/
// TODO: Replace placeholder with relevant CQL logic
define "Management of invasive cervical cancer":
  exists "Management of invasive cervical cancer Condition"
    or exists "Management of invasive cervical cancer Observation"
define "Management of invasive cervical cancer Condition":
  [Condition: Concepts."Management of invasive cervical cancer"]
define "Management of invasive cervical cancer Observation":
  [Observation: Concepts."Management of invasive cervical cancer"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Management of invasive cervical cancer"
/* End of Management of invasive cervical cancer */

/*
@dataElement: HIV.D.DE736 - Radiotherapy
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is a radiotherapy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Radiotherapy":
  exists "Radiotherapy Condition"
    or exists "Radiotherapy Observation"
define "Radiotherapy Condition":
  [Condition: Concepts."Radiotherapy"]
define "Radiotherapy Observation":
  [Observation: Concepts."Radiotherapy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Radiotherapy"
/* End of Radiotherapy */

/*
@dataElement: HIV.D.DE737 - Chemotherapy
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is a chemotherapy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chemotherapy":
  exists "Chemotherapy Condition"
    or exists "Chemotherapy Observation"
define "Chemotherapy Condition":
  [Condition: Concepts."Chemotherapy"]
define "Chemotherapy Observation":
  [Observation: Concepts."Chemotherapy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chemotherapy"
/* End of Chemotherapy */

/*
@dataElement: HIV.D.DE738 - Chemoradiation
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is a chemoradiation
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chemoradiation":
  exists "Chemoradiation Condition"
    or exists "Chemoradiation Observation"
define "Chemoradiation Condition":
  [Condition: Concepts."Chemoradiation"]
define "Chemoradiation Observation":
  [Observation: Concepts."Chemoradiation"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chemoradiation"
/* End of Chemoradiation */

/*
@dataElement: HIV.D.DE739 - Other - HIV.D.DE739
@activity: HIV.D28 Offer other services
@description: Invasive cervical cancer treatment method is a not in list
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.D.DE739":
  exists "Other - HIV.D.DE739 Condition"
    or exists "Other - HIV.D.DE739 Observation"
define "Other - HIV.D.DE739 Condition":
  [Condition: Concepts."Other - HIV.D.DE739"]
define "Other - HIV.D.DE739 Observation":
  [Observation: Concepts."Other - HIV.D.DE731"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.D.DE739"
/* End of Other - HIV.D.DE739 */

/*
@dataElement: HIV.D.DE745 - Cervical cancer screening interval amongst WLHIV
@activity: HIV.D28 Offer other services
@description: Country-specific interval between cancer screenings amongst women living with HIV (typically 3 or 5 years)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical cancer screening interval amongst WLHIV":
  [Observation: Concepts."Cervical cancer screening interval amongst WLHIV"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Cervical cancer screening interval amongst WLHIV */

/*
@dataElement: HIV.D.DE753 - Offer other clinical services - HIV.D.DE753
@activity: HIV.D28 Offer other services
@description: Other clinical services offered or referrals given to the client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Offer other clinical services - HIV.D.DE753 Observation":
  [Observation: Concepts."Offer other clinical services - HIV.D.DE753"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Offer other clinical services - HIV.D.DE753 */

/*
@dataElement: HIV.D.DE754 - Assessment and provision of vaccinations - HIV.D.DE754
@activity: HIV.D28 Offer other services
@description: Assessment and provision of vaccinations, such as for people from Key population member type, pregnant women and infants; and, where appropriate, tetanus vaccination for adolescent boys and men receiving VMMC
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assessment and provision of vaccinations - HIV.D.DE754":
  exists "Assessment and provision of vaccinations - HIV.D.DE754 Condition"
    or exists "Assessment and provision of vaccinations - HIV.D.DE754 Observation"
define "Assessment and provision of vaccinations - HIV.D.DE754 Condition":
  [Condition: Concepts."Assessment and provision of vaccinations - HIV.D.DE754"]
define "Assessment and provision of vaccinations - HIV.D.DE754 Observation":
  [Observation: Concepts."Assessment and provision of vaccinations - HIV.D.DE753"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assessment and provision of vaccinations - HIV.D.DE754"
/* End of Assessment and provision of vaccinations - HIV.D.DE754 */

/*
@dataElement: HIV.D.DE755 - Hepatitis B HBV and hepatitis C virus HCV testing and treatment
@activity: HIV.D28 Offer other services
@description: Offer or refer for HBV and/or HCV testing and treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hepatitis B HBV and hepatitis C virus HCV testing and treatment":
  exists "Hepatitis B HBV and hepatitis C virus HCV testing and treatment Condition"
    or exists "Hepatitis B HBV and hepatitis C virus HCV testing and treatment Observation"
define "Hepatitis B HBV and hepatitis C virus HCV testing and treatment Condition":
  [Condition: Concepts."Hepatitis B HBV and hepatitis C virus HCV testing and treatment"]
define "Hepatitis B HBV and hepatitis C virus HCV testing and treatment Observation":
  [Observation: Concepts."Hepatitis B HBV and hepatitis C virus HCV testing and treatment"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hepatitis B HBV and hepatitis C virus HCV testing and treatment"
/* End of Hepatitis B HBV and hepatitis C virus HCV testing and treatment */

/*
@dataElement: HIV.D.DE756 - Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756
@activity: HIV.D28 Offer other services
@description: Offer or refer for co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia
*/
// TODO: Replace placeholder with relevant CQL logic
define "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756":
  exists "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756 Condition"
    or exists "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756 Observation"
define "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756 Condition":
  [Condition: Concepts."Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756"]
define "Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756 Observation":
  [Observation: Concepts."Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE753"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756"
/* End of Co-trimoxazole chemoprophylaxis to prevent pneumocystis carinii pneumonia - HIV.D.DE756 */

/*
@dataElement: HIV.D.DE757 - Intensified TB case finding and linkage to TB treatment - HIV.D.DE757
@activity: HIV.D28 Offer other services
@description: Offer or refer for intensified TB case finding and linkage to TB treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Intensified TB case finding and linkage to TB treatment - HIV.D.DE757":
  exists "Intensified TB case finding and linkage to TB treatment - HIV.D.DE757 Condition"
    or exists "Intensified TB case finding and linkage to TB treatment - HIV.D.DE757 Observation"
define "Intensified TB case finding and linkage to TB treatment - HIV.D.DE757 Condition":
  [Condition: Concepts."Intensified TB case finding and linkage to TB treatment - HIV.D.DE757"]
define "Intensified TB case finding and linkage to TB treatment - HIV.D.DE757 Observation":
  [Observation: Concepts."Intensified TB case finding and linkage to TB treatment - HIV.D.DE753"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Intensified TB case finding and linkage to TB treatment - HIV.D.DE757"
/* End of Intensified TB case finding and linkage to TB treatment - HIV.D.DE757 */

/*
@dataElement: HIV.D.DE758 - Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758
@activity: HIV.D28 Offer other services
@description: Offer or refer for provision of isoniazid preventive therapy if person does not have TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758":
  exists "Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758 Condition"
    or exists "Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758 Observation"
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758 Condition":
  [Condition: Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758"]
define "Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758 Observation":
  [Observation: Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE753"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758"
/* End of Provision of isoniazid preventive therapy if person does not have TB - HIV.D.DE758 */

/*
@dataElement: HIV.D.DE759 - Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759
@activity: HIV.D28 Offer other services
@description: Offer or refer for malaria prevention (such as bed nets and prophylaxis), depending on epidemiology
*/
// TODO: Replace placeholder with relevant CQL logic
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759":
  exists "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759 Condition"
    or exists "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759 Observation"
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759 Condition":
  [Condition: Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759"]
define "Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759 Observation":
  [Observation: Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE753"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759"
/* End of Malaria prevention such as bed nets and prophylaxis, depending on epidemiology - HIV.D.DE759 */

/*
@dataElement: HIV.D.DE760 - Eligible for DSD ART
@activity: HIV.D21 Determine regimen and treatment options
@description: Client is eligible for differentiated service delivery (DSD) for ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Eligible for DSD ART":
  [Observation: Concepts."Eligible for DSD ART"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Eligible for DSD ART */

/*
@dataElement: HIV.D.DE761 - Date DSD ART eligibility assessed
@activity: HIV.D21 Determine regimen and treatment options
@description: Date client was assessed for eligibility for differentiated service delivery (DSD) for ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date DSD ART eligibility assessed":
  [Observation: Concepts."Date DSD ART eligibility assessed"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date DSD ART eligibility assessed */

/*
@dataElement: HIV.D.DE762 - Currently enrolled in DSD ART model
@activity: HIV.D21 Determine regimen and treatment options
@description: Client currently enrolled in differentiated service delivery (DSD) ART model
*/
// TODO: Replace placeholder with relevant CQL logic
define "Currently enrolled in DSD ART model":
  [Observation: Concepts."Currently enrolled in DSD ART model"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Currently enrolled in DSD ART model */

/*
@dataElement: HIV.D.DE763 - DSD ART start date
@activity: HIV.D21 Determine regimen and treatment options
@description: Date client started on differentiated service delivery (DSD) for ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "DSD ART start date":
  [Observation: Concepts."DSD ART start date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of DSD ART start date */

/*
@dataElement: HIV.D.DE764 - DSD ART models
@activity: HIV.D21 Determine regimen and treatment options
@description: Type of DSD ART model client is enrolled in (country-specific)
*/
// TODO: Replace placeholder with relevant CQL logic
define "DSD ART models Observation":
  [Observation: Concepts."DSD ART models"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of DSD ART models */

/*
@dataElement: HIV.D.DE765 - Fast track ART refill
@activity: HIV.D21 Determine regimen and treatment options
@description: Client is enrolled in fast track ART refill (DSD ART model)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Fast track ART refill":
  exists "Fast track ART refill Condition"
    or exists "Fast track ART refill Observation"
define "Fast track ART refill Condition":
  [Condition: Concepts."Fast track ART refill"]
define "Fast track ART refill Observation":
  [Observation: Concepts."Fast track ART refill"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Fast track ART refill"
/* End of Fast track ART refill */

/*
@dataElement: HIV.D.DE766 - Facility adherence club
@activity: HIV.D21 Determine regimen and treatment options
@description: Client is enrolled in facility adherence club (DSD ART model)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Facility adherence club":
  exists "Facility adherence club Condition"
    or exists "Facility adherence club Observation"
define "Facility adherence club Condition":
  [Condition: Concepts."Facility adherence club"]
define "Facility adherence club Observation":
  [Observation: Concepts."Facility adherence club"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Facility adherence club"
/* End of Facility adherence club */

/*
@dataElement: HIV.D.DE767 - Community ART distribution point
@activity: HIV.D21 Determine regimen and treatment options
@description: Client is enrolled in community ART distribution point (DSD ART model)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Community ART distribution point":
  exists "Community ART distribution point Condition"
    or exists "Community ART distribution point Observation"
define "Community ART distribution point Condition":
  [Condition: Concepts."Community ART distribution point"]
define "Community ART distribution point Observation":
  [Observation: Concepts."Community ART distribution point"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Community ART distribution point"
/* End of Community ART distribution point */

/*
@dataElement: HIV.D.DE768 - CHW/peer educator community ART group
@activity: HIV.D21 Determine regimen and treatment options
@description: Client is enrolled in community health worker/peer educator community ART group (DSD ART model)
*/
// TODO: Replace placeholder with relevant CQL logic
define "CHW/peer educator community ART group":
  exists "CHW/peer educator community ART group Condition"
    or exists "CHW/peer educator community ART group Observation"
define "CHW/peer educator community ART group Condition":
  [Condition: Concepts."CHW/peer educator community ART group"]
define "CHW/peer educator community ART group Observation":
  [Observation: Concepts."CHW/peer educator community ART group"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."CHW/peer educator community ART group"
/* End of CHW/peer educator community ART group */

/*
@dataElement: HIV.D.DE769 - Patient/client community ART group
@activity: HIV.D21 Determine regimen and treatment options
@description: Client is enrolled in patient/client community ART group (DSD ART model)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Patient/client community ART group":
  exists "Patient/client community ART group Condition"
    or exists "Patient/client community ART group Observation"
define "Patient/client community ART group Condition":
  [Condition: Concepts."Patient/client community ART group"]
define "Patient/client community ART group Observation":
  [Observation: Concepts."Patient/client community ART group"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Patient/client community ART group"
/* End of Patient/client community ART group */

/*
@dataElement: HIV.D.DE770 - Other DSD ART model
@activity: HIV.D21 Determine regimen and treatment options
@description: Client is enrolled in another DSD ART model
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other DSD ART model":
  exists "Other DSD ART model Condition"
    or exists "Other DSD ART model Observation"
define "Other DSD ART model Condition":
  [Condition: Concepts."Other DSD ART model"]
define "Other DSD ART model Observation":
  [Observation: Concepts."Other DSD ART model"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other DSD ART model"
/* End of Other DSD ART model */

/*
@dataElement: HIV.D.DE778 - Syndrome/STI diagnosed - HIV.D.DE778
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Syndrome or STI for which client is diagnosed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syndrome/STI diagnosed - HIV.D.DE778 Observation":
  [Observation: Concepts."Syndrome/STI diagnosed - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Syndrome/STI diagnosed - HIV.D.DE778 */

/*
@dataElement: HIV.D.DE779 - Urethral discharge syndrome - HIV.D.DE779
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Client diagnosed with urethral discharge syndrome
*/
// TODO: Replace placeholder with relevant CQL logic
define "Urethral discharge syndrome - HIV.D.DE779":
  exists "Urethral discharge syndrome - HIV.D.DE779 Condition"
    or exists "Urethral discharge syndrome - HIV.D.DE779 Observation"
define "Urethral discharge syndrome - HIV.D.DE779 Condition":
  [Condition: Concepts."Urethral discharge syndrome - HIV.D.DE779"]
define "Urethral discharge syndrome - HIV.D.DE779 Observation":
  [Observation: Concepts."Urethral discharge syndrome - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Urethral discharge syndrome - HIV.D.DE779"
/* End of Urethral discharge syndrome - HIV.D.DE779 */

/*
@dataElement: HIV.D.DE780 - Vaginal discharge syndrome - HIV.D.DE780
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Client diagnosed with vaginal discharge syndrome
*/
// TODO: Replace placeholder with relevant CQL logic
define "Vaginal discharge syndrome - HIV.D.DE780":
  exists "Vaginal discharge syndrome - HIV.D.DE780 Condition"
    or exists "Vaginal discharge syndrome - HIV.D.DE780 Observation"
define "Vaginal discharge syndrome - HIV.D.DE780 Condition":
  [Condition: Concepts."Vaginal discharge syndrome - HIV.D.DE780"]
define "Vaginal discharge syndrome - HIV.D.DE780 Observation":
  [Observation: Concepts."Vaginal discharge syndrome - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Vaginal discharge syndrome - HIV.D.DE780"
/* End of Vaginal discharge syndrome - HIV.D.DE780 */

/*
@dataElement: HIV.D.DE781 - Lower Abdominal pain  - HIV.D.DE781
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Client diagnosed with lower abdominal pain
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lower Abdominal pain  - HIV.D.DE781":
  exists "Lower Abdominal pain  - HIV.D.DE781 Condition"
    or exists "Lower Abdominal pain  - HIV.D.DE781 Observation"
define "Lower Abdominal pain  - HIV.D.DE781 Condition":
  [Condition: Concepts."Lower Abdominal pain  - HIV.D.DE781"]
define "Lower Abdominal pain  - HIV.D.DE781 Observation":
  [Observation: Concepts."Lower Abdominal pain  - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lower Abdominal pain  - HIV.D.DE781"
/* End of Lower Abdominal pain  - HIV.D.DE781 */

/*
@dataElement: HIV.D.DE782 - Genital ulcer disease syndrome - HIV.D.DE782
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Client diagnosed with genital ulcer disease syndrome
*/
// TODO: Replace placeholder with relevant CQL logic
define "Genital ulcer disease syndrome - HIV.D.DE782":
  exists "Genital ulcer disease syndrome - HIV.D.DE782 Condition"
    or exists "Genital ulcer disease syndrome - HIV.D.DE782 Observation"
define "Genital ulcer disease syndrome - HIV.D.DE782 Condition":
  [Condition: Concepts."Genital ulcer disease syndrome - HIV.D.DE782"]
define "Genital ulcer disease syndrome - HIV.D.DE782 Observation":
  [Observation: Concepts."Genital ulcer disease syndrome - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Genital ulcer disease syndrome - HIV.D.DE782"
/* End of Genital ulcer disease syndrome - HIV.D.DE782 */

/*
@dataElement: HIV.D.DE783 - Anorectal discharge - HIV.D.DE783
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Client diagnosed with anorectal discharge
*/
// TODO: Replace placeholder with relevant CQL logic
define "Anorectal discharge - HIV.D.DE783":
  exists "Anorectal discharge - HIV.D.DE783 Condition"
    or exists "Anorectal discharge - HIV.D.DE783 Observation"
define "Anorectal discharge - HIV.D.DE783 Condition":
  [Condition: Concepts."Anorectal discharge - HIV.D.DE783"]
define "Anorectal discharge - HIV.D.DE783 Observation":
  [Observation: Concepts."Anorectal discharge - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Anorectal discharge - HIV.D.DE783"
/* End of Anorectal discharge - HIV.D.DE783 */

/*
@dataElement: HIV.D.DE784 - Sent for testing - HIV.D.DE784
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Specimen sent for testing
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sent for testing - HIV.D.DE784":
  exists "Sent for testing - HIV.D.DE784 Condition"
    or exists "Sent for testing - HIV.D.DE784 Observation"
define "Sent for testing - HIV.D.DE784 Condition":
  [Condition: Concepts."Sent for testing - HIV.D.DE784"]
define "Sent for testing - HIV.D.DE784 Observation":
  [Observation: Concepts."Sent for testing - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sent for testing - HIV.D.DE784"
/* End of Sent for testing - HIV.D.DE784 */

/*
@dataElement: HIV.D.DE785 - Other - HIV.D.DE785
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Other syndrome/STI diagnosed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.D.DE785":
  exists "Other - HIV.D.DE785 Condition"
    or exists "Other - HIV.D.DE785 Observation"
define "Other - HIV.D.DE785 Condition":
  [Condition: Concepts."Other - HIV.D.DE785"]
define "Other - HIV.D.DE785 Observation":
  [Observation: Concepts."Other - HIV.D.DE778"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.D.DE785"
/* End of Other - HIV.D.DE785 */

/*
@dataElement: HIV.D.DE787 - Any STI syndrome diagnosed - HIV.D.DE787
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Was the client diagnosed with any of the five STI syndromes during this visit?
*/
// TODO: Replace placeholder with relevant CQL logic
define "Any STI syndrome diagnosed - HIV.D.DE787":
  [Observation: Concepts."Any STI syndrome diagnosed - HIV.D.DE787"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Any STI syndrome diagnosed - HIV.D.DE787 */

/*
@dataElement: HIV.D.DE801 - Syphilis test date - HIV.D.DE801
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Date of syphilis test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis test date - HIV.D.DE801":
  [Observation: Concepts."Syphilis test date - HIV.D.DE801"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Syphilis test date - HIV.D.DE801 */

/*
@dataElement: HIV.D.DE802 - Syphilis test result - HIV.D.DE802
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Result from syphilis test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis test result - HIV.D.DE802 Observation":
  [Observation: Concepts."Syphilis test result - HIV.D.DE802"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Syphilis test result - HIV.D.DE802 */

/*
@dataElement: HIV.D.DE803 - Positive - HIV.D.DE803
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Test result is positive for syphilis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.D.DE803":
  exists "Positive - HIV.D.DE803 Condition"
    or exists "Positive - HIV.D.DE803 Observation"
define "Positive - HIV.D.DE803 Condition":
  [Condition: Concepts."Positive - HIV.D.DE803"]
define "Positive - HIV.D.DE803 Observation":
  [Observation: Concepts."Positive - HIV.D.DE802"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.D.DE803"
/* End of Positive - HIV.D.DE803 */

/*
@dataElement: HIV.D.DE804 - Negative - HIV.D.DE804
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Test result is negative for syphilis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.D.DE804":
  exists "Negative - HIV.D.DE804 Condition"
    or exists "Negative - HIV.D.DE804 Observation"
define "Negative - HIV.D.DE804 Condition":
  [Condition: Concepts."Negative - HIV.D.DE804"]
define "Negative - HIV.D.DE804 Observation":
  [Observation: Concepts."Negative - HIV.D.DE802"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.D.DE804"
/* End of Negative - HIV.D.DE804 */

/*
@dataElement: HIV.D.DE805 - Inconclusive - HIV.D.DE805
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Test result is inconclusive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Inconclusive - HIV.D.DE805":
  exists "Inconclusive - HIV.D.DE805 Condition"
    or exists "Inconclusive - HIV.D.DE805 Observation"
define "Inconclusive - HIV.D.DE805 Condition":
  [Condition: Concepts."Inconclusive - HIV.D.DE805"]
define "Inconclusive - HIV.D.DE805 Observation":
  [Observation: Concepts."Inconclusive - HIV.D.DE802"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Inconclusive - HIV.D.DE805"
/* End of Inconclusive - HIV.D.DE805 */

/*
@dataElement: HIV.D.DE806 - Syphilis treatment start date - HIV.D.DE806
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Date of initiation of syphilis treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis treatment start date - HIV.D.DE806":
  [Observation: Concepts."Syphilis treatment start date - HIV.D.DE806"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Syphilis treatment start date - HIV.D.DE806 */

/*
@dataElement: HIV.D.DE807 - Gonorrhoea test date - HIV.D.DE807
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Date of Gonorrhoea test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gonorrhoea test date - HIV.D.DE807":
  [Observation: Concepts."Gonorrhoea test date - HIV.D.DE807"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Gonorrhoea test date - HIV.D.DE807 */

/*
@dataElement: HIV.D.DE808 - Gonorrhoea test result - HIV.D.DE808
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Result from Gonorrhoea test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gonorrhoea test result - HIV.D.DE808 Observation":
  [Observation: Concepts."Gonorrhoea test result - HIV.D.DE808"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Gonorrhoea test result - HIV.D.DE808 */

/*
@dataElement: HIV.D.DE809 - Positive - HIV.D.DE809
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Test result is positive for Neisseria gonorrhoeae
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.D.DE809":
  exists "Positive - HIV.D.DE809 Condition"
    or exists "Positive - HIV.D.DE809 Observation"
define "Positive - HIV.D.DE809 Condition":
  [Condition: Concepts."Positive - HIV.D.DE809"]
define "Positive - HIV.D.DE809 Observation":
  [Observation: Concepts."Positive - HIV.D.DE808"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.D.DE809"
/* End of Positive - HIV.D.DE809 */

/*
@dataElement: HIV.D.DE810 - Negative - HIV.D.DE810
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Test result is negative for Neisseria gonorrhoeae
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.D.DE810":
  exists "Negative - HIV.D.DE810 Condition"
    or exists "Negative - HIV.D.DE810 Observation"
define "Negative - HIV.D.DE810 Condition":
  [Condition: Concepts."Negative - HIV.D.DE810"]
define "Negative - HIV.D.DE810 Observation":
  [Observation: Concepts."Negative - HIV.D.DE808"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.D.DE810"
/* End of Negative - HIV.D.DE810 */

/*
@dataElement: HIV.D.DE811 - Inconclusive - HIV.D.DE811
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Test result is inconclusive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Inconclusive - HIV.D.DE811":
  exists "Inconclusive - HIV.D.DE811 Condition"
    or exists "Inconclusive - HIV.D.DE811 Observation"
define "Inconclusive - HIV.D.DE811 Condition":
  [Condition: Concepts."Inconclusive - HIV.D.DE811"]
define "Inconclusive - HIV.D.DE811 Observation":
  [Observation: Concepts."Inconclusive - HIV.D.DE808"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Inconclusive - HIV.D.DE811"
/* End of Inconclusive - HIV.D.DE811 */

/*
@dataElement: HIV.D.DE812 - Gonorrhoea treatment start date - HIV.D.DE812
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Date of initiation of Gonorrhoea treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Gonorrhoea treatment start date - HIV.D.DE812":
  [Observation: Concepts."Gonorrhoea treatment start date - HIV.D.DE812"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Gonorrhoea treatment start date - HIV.D.DE812 */

/*
@dataElement: HIV.D.DE813 - Type of specimen - HIV.D.DE813
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Type of specimen to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Type of specimen - HIV.D.DE813 Observation":
  [Observation: Concepts."Type of specimen - HIV.D.DE813"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Type of specimen - HIV.D.DE813 */

/*
@dataElement: HIV.D.DE814 - Blood - HIV.D.DE814
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Blood specimen to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Blood - HIV.D.DE814":
  exists "Blood - HIV.D.DE814 Condition"
    or exists "Blood - HIV.D.DE814 Observation"
define "Blood - HIV.D.DE814 Condition":
  [Condition: Concepts."Blood - HIV.D.DE814"]
define "Blood - HIV.D.DE814 Observation":
  [Observation: Concepts."Blood - HIV.D.DE813"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Blood - HIV.D.DE814"
/* End of Blood - HIV.D.DE814 */

/*
@dataElement: HIV.D.DE815 - Urine - HIV.D.DE815
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Urine specimen to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Urine - HIV.D.DE815":
  exists "Urine - HIV.D.DE815 Condition"
    or exists "Urine - HIV.D.DE815 Observation"
define "Urine - HIV.D.DE815 Condition":
  [Condition: Concepts."Urine - HIV.D.DE815"]
define "Urine - HIV.D.DE815 Observation":
  [Observation: Concepts."Urine - HIV.D.DE813"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Urine - HIV.D.DE815"
/* End of Urine - HIV.D.DE815 */

/*
@dataElement: HIV.D.DE816 - Cervical or vaginal swab - HIV.D.DE816
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Cervical or vaginal swab to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cervical or vaginal swab - HIV.D.DE816":
  exists "Cervical or vaginal swab - HIV.D.DE816 Condition"
    or exists "Cervical or vaginal swab - HIV.D.DE816 Observation"
define "Cervical or vaginal swab - HIV.D.DE816 Condition":
  [Condition: Concepts."Cervical or vaginal swab - HIV.D.DE816"]
define "Cervical or vaginal swab - HIV.D.DE816 Observation":
  [Observation: Concepts."Cervical or vaginal swab - HIV.D.DE813"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cervical or vaginal swab - HIV.D.DE816"
/* End of Cervical or vaginal swab - HIV.D.DE816 */

/*
@dataElement: HIV.D.DE817 - Urethral or penile swab - HIV.D.DE817
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Urethral or penile swab to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Urethral or penile swab - HIV.D.DE817":
  exists "Urethral or penile swab - HIV.D.DE817 Condition"
    or exists "Urethral or penile swab - HIV.D.DE817 Observation"
define "Urethral or penile swab - HIV.D.DE817 Condition":
  [Condition: Concepts."Urethral or penile swab - HIV.D.DE817"]
define "Urethral or penile swab - HIV.D.DE817 Observation":
  [Observation: Concepts."Urethral or penile swab - HIV.D.DE813"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Urethral or penile swab - HIV.D.DE817"
/* End of Urethral or penile swab - HIV.D.DE817 */

/*
@dataElement: HIV.D.DE818 - Rectal swab - HIV.D.DE818
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Rectal swab to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Rectal swab - HIV.D.DE818":
  exists "Rectal swab - HIV.D.DE818 Condition"
    or exists "Rectal swab - HIV.D.DE818 Observation"
define "Rectal swab - HIV.D.DE818 Condition":
  [Condition: Concepts."Rectal swab - HIV.D.DE818"]
define "Rectal swab - HIV.D.DE818 Observation":
  [Observation: Concepts."Rectal swab - HIV.D.DE813"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Rectal swab - HIV.D.DE818"
/* End of Rectal swab - HIV.D.DE818 */

/*
@dataElement: HIV.D.DE819 - Other - HIV.D.DE819
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Other specimen type to be collected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.D.DE819":
  exists "Other - HIV.D.DE819 Condition"
    or exists "Other - HIV.D.DE819 Observation"
define "Other - HIV.D.DE819 Condition":
  [Condition: Concepts."Other - HIV.D.DE819"]
define "Other - HIV.D.DE819 Observation":
  [Observation: Concepts."Other - HIV.D.DE813"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.D.DE819"
/* End of Other - HIV.D.DE819 */

/*
@dataElement: HIV.D.DE828 - Neisseria gonorrhoeae test type - HIV.D.DE828
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Type of diagnostic test used for Neisseria gonorrhoeae
*/
// TODO: Replace placeholder with relevant CQL logic
define "Neisseria gonorrhoeae test type - HIV.D.DE828 Observation":
  [Observation: Concepts."Neisseria gonorrhoeae test type - HIV.D.DE828"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Neisseria gonorrhoeae test type - HIV.D.DE828 */

/*
@dataElement: HIV.D.DE829 - NAAT - HIV.D.DE829
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Nucleic Acid Amplification Test (NAAT) used
*/
// TODO: Replace placeholder with relevant CQL logic
define "NAAT - HIV.D.DE829":
  exists "NAAT - HIV.D.DE829 Condition"
    or exists "NAAT - HIV.D.DE829 Observation"
define "NAAT - HIV.D.DE829 Condition":
  [Condition: Concepts."NAAT - HIV.D.DE829"]
define "NAAT - HIV.D.DE829 Observation":
  [Observation: Concepts."NAAT - HIV.D.DE828"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."NAAT - HIV.D.DE829"
/* End of NAAT - HIV.D.DE829 */

/*
@dataElement: HIV.D.DE830 - POC Test - HIV.D.DE830
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Point-of-care (POC) test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "POC Test - HIV.D.DE830":
  exists "POC Test - HIV.D.DE830 Condition"
    or exists "POC Test - HIV.D.DE830 Observation"
define "POC Test - HIV.D.DE830 Condition":
  [Condition: Concepts."POC Test - HIV.D.DE830"]
define "POC Test - HIV.D.DE830 Observation":
  [Observation: Concepts."POC Test - HIV.D.DE828"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."POC Test - HIV.D.DE830"
/* End of POC Test - HIV.D.DE830 */

/*
@dataElement: HIV.D.DE831 - Culture - HIV.D.DE831
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Culture test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "Culture - HIV.D.DE831":
  exists "Culture - HIV.D.DE831 Condition"
    or exists "Culture - HIV.D.DE831 Observation"
define "Culture - HIV.D.DE831 Condition":
  [Condition: Concepts."Culture - HIV.D.DE831"]
define "Culture - HIV.D.DE831 Observation":
  [Observation: Concepts."Culture - HIV.D.DE828"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Culture - HIV.D.DE831"
/* End of Culture - HIV.D.DE831 */

/*
@dataElement: HIV.D.DE832 - Microscopy - HIV.D.DE832
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Microscopy test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "Microscopy - HIV.D.DE832":
  exists "Microscopy - HIV.D.DE832 Condition"
    or exists "Microscopy - HIV.D.DE832 Observation"
define "Microscopy - HIV.D.DE832 Condition":
  [Condition: Concepts."Microscopy - HIV.D.DE832"]
define "Microscopy - HIV.D.DE832 Observation":
  [Observation: Concepts."Microscopy - HIV.D.DE828"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Microscopy - HIV.D.DE832"
/* End of Microscopy - HIV.D.DE832 */

/*
@dataElement: HIV.D.DE833 - Other - HIV.D.DE833
@activity: HIV.D26 Offer sexual and reproductive health services
@description: Other type of test used
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.D.DE833":
  exists "Other - HIV.D.DE833 Condition"
    or exists "Other - HIV.D.DE833 Observation"
define "Other - HIV.D.DE833 Condition":
  [Condition: Concepts."Other - HIV.D.DE833"]
define "Other - HIV.D.DE833 Observation":
  [Observation: Concepts."Other - HIV.D.DE828"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.D.DE833"
/* End of Other - HIV.D.DE833 */

/*
@dataElement: HIV.D.DE903 - Medication/drug
@activity: HIV.D21 Determine regimen and treatment options
@description: Current or considered medication/drug, for the purpose of determining drug interactions
*/
// TODO: Replace placeholder with relevant CQL logic
define "Medication/drug Observation":
  [Observation: Concepts."Medication/drug"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Medication/drug */

/*
@dataElement: HIV.D.DE904 - Rifampicin
@activity: HIV.D21 Determine regimen and treatment options
@description: Rifampicin currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Rifampicin":
  exists "Rifampicin Condition"
    or exists "Rifampicin Observation"
define "Rifampicin Condition":
  [Condition: Concepts."Rifampicin"]
define "Rifampicin Observation":
  [Observation: Concepts."Rifampicin"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Rifampicin"
/* End of Rifampicin */

/*
@dataElement: HIV.D.DE905 - Halofantrine
@activity: HIV.D21 Determine regimen and treatment options
@description: Halofantrine currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Halofantrine":
  exists "Halofantrine Condition"
    or exists "Halofantrine Observation"
define "Halofantrine Condition":
  [Condition: Concepts."Halofantrine"]
define "Halofantrine Observation":
  [Observation: Concepts."Halofantrine"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Halofantrine"
/* End of Halofantrine */

/*
@dataElement: HIV.D.DE906 - Lovastatin
@activity: HIV.D21 Determine regimen and treatment options
@description: Lovastatin currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lovastatin":
  exists "Lovastatin Condition"
    or exists "Lovastatin Observation"
define "Lovastatin Condition":
  [Condition: Concepts."Lovastatin"]
define "Lovastatin Observation":
  [Observation: Concepts."Lovastatin"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lovastatin"
/* End of Lovastatin */

/*
@dataElement: HIV.D.DE907 - Simvastatin
@activity: HIV.D21 Determine regimen and treatment options
@description: Simvastatin currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Simvastatin":
  exists "Simvastatin Condition"
    or exists "Simvastatin Observation"
define "Simvastatin Condition":
  [Condition: Concepts."Simvastatin"]
define "Simvastatin Observation":
  [Observation: Concepts."Simvastatin"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Simvastatin"
/* End of Simvastatin */

/*
@dataElement: HIV.D.DE908 - Hormonal contraception
@activity: HIV.D21 Determine regimen and treatment options
@description: Hormonal contraception currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Hormonal contraception":
  exists "Hormonal contraception Condition"
    or exists "Hormonal contraception Observation"
define "Hormonal contraception Condition":
  [Condition: Concepts."Hormonal contraception"]
define "Hormonal contraception Observation":
  [Observation: Concepts."Hormonal contraception"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Hormonal contraception"
/* End of Hormonal contraception */

/*
@dataElement: HIV.D.DE909 - Metformin
@activity: HIV.D21 Determine regimen and treatment options
@description: Metformin currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Metformin":
  exists "Metformin Condition"
    or exists "Metformin Observation"
define "Metformin Condition":
  [Condition: Concepts."Metformin"]
define "Metformin Observation":
  [Observation: Concepts."Metformin"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Metformin"
/* End of Metformin */

/*
@dataElement: HIV.D.DE910 - Astemizole
@activity: HIV.D21 Determine regimen and treatment options
@description: Astemizole currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Astemizole":
  exists "Astemizole Condition"
    or exists "Astemizole Observation"
define "Astemizole Condition":
  [Condition: Concepts."Astemizole"]
define "Astemizole Observation":
  [Observation: Concepts."Astemizole"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Astemizole"
/* End of Astemizole */

/*
@dataElement: HIV.D.DE911 - Terfenadine
@activity: HIV.D21 Determine regimen and treatment options
@description: Terfenadine currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Terfenadine":
  exists "Terfenadine Condition"
    or exists "Terfenadine Observation"
define "Terfenadine Condition":
  [Condition: Concepts."Terfenadine"]
define "Terfenadine Observation":
  [Observation: Concepts."Terfenadine"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Terfenadine"
/* End of Terfenadine */

/*
@dataElement: HIV.D.DE912 - TDF - HIV.D.DE912
@activity: HIV.D21 Determine regimen and treatment options
@description: TDF currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "TDF - HIV.D.DE912":
  exists "TDF - HIV.D.DE912 Condition"
    or exists "TDF - HIV.D.DE912 Observation"
define "TDF - HIV.D.DE912 Condition":
  [Condition: Concepts."TDF - HIV.D.DE912"]
define "TDF - HIV.D.DE912 Observation":
  [Observation: Concepts."TDF - HIV.D.DE903"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TDF - HIV.D.DE912"
/* End of TDF - HIV.D.DE912 */

/*
@dataElement: HIV.D.DE913 - Simeprevir
@activity: HIV.D21 Determine regimen and treatment options
@description: Simeprevir currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Simeprevir":
  exists "Simeprevir Condition"
    or exists "Simeprevir Observation"
define "Simeprevir Condition":
  [Condition: Concepts."Simeprevir"]
define "Simeprevir Observation":
  [Observation: Concepts."Simeprevir"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Simeprevir"
/* End of Simeprevir */

/*
@dataElement: HIV.D.DE914 - Ombitasvir + paritaprevir/ritonavir + dasabuvir
@activity: HIV.D21 Determine regimen and treatment options
@description: Ombitasvir + paritaprevir/ritonavir + dasabuvir currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Ombitasvir + paritaprevir/ritonavir + dasabuvir":
  exists "Ombitasvir + paritaprevir/ritonavir + dasabuvir Condition"
    or exists "Ombitasvir + paritaprevir/ritonavir + dasabuvir Observation"
define "Ombitasvir + paritaprevir/ritonavir + dasabuvir Condition":
  [Condition: Concepts."Ombitasvir + paritaprevir/ritonavir + dasabuvir"]
define "Ombitasvir + paritaprevir/ritonavir + dasabuvir Observation":
  [Observation: Concepts."Ombitasvir + paritaprevir/ritonavir + dasabuvir"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Ombitasvir + paritaprevir/ritonavir + dasabuvir"
/* End of Ombitasvir + paritaprevir/ritonavir + dasabuvir */

/*
@dataElement: HIV.D.DE915 - Methadone - HIV.D.DE915
@activity: HIV.D21 Determine regimen and treatment options
@description: Methadone currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Methadone - HIV.D.DE915":
  exists "Methadone - HIV.D.DE915 Condition"
    or exists "Methadone - HIV.D.DE915 Observation"
define "Methadone - HIV.D.DE915 Condition":
  [Condition: Concepts."Methadone - HIV.D.DE915"]
define "Methadone - HIV.D.DE915 Observation":
  [Observation: Concepts."Methadone - HIV.D.DE903"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Methadone - HIV.D.DE915"
/* End of Methadone - HIV.D.DE915 */

/*
@dataElement: HIV.D.DE916 - Buprenorphine - HIV.D.DE916
@activity: HIV.D21 Determine regimen and treatment options
@description: Buprenorphine currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Buprenorphine - HIV.D.DE916":
  exists "Buprenorphine - HIV.D.DE916 Condition"
    or exists "Buprenorphine - HIV.D.DE916 Observation"
define "Buprenorphine - HIV.D.DE916 Condition":
  [Condition: Concepts."Buprenorphine - HIV.D.DE916"]
define "Buprenorphine - HIV.D.DE916 Observation":
  [Observation: Concepts."Buprenorphine - HIV.D.DE903"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Buprenorphine - HIV.D.DE916"
/* End of Buprenorphine - HIV.D.DE916 */

/*
@dataElement: HIV.D.DE917 - Dofetilide
@activity: HIV.D21 Determine regimen and treatment options
@description: Dofetilide currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dofetilide":
  exists "Dofetilide Condition"
    or exists "Dofetilide Observation"
define "Dofetilide Condition":
  [Condition: Concepts."Dofetilide"]
define "Dofetilide Observation":
  [Observation: Concepts."Dofetilide"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Dofetilide"
/* End of Dofetilide */

/*
@dataElement: HIV.D.DE918 - Carbamazepine
@activity: HIV.D21 Determine regimen and treatment options
@description: Carbamazepine currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Carbamazepine":
  exists "Carbamazepine Condition"
    or exists "Carbamazepine Observation"
define "Carbamazepine Condition":
  [Condition: Concepts."Carbamazepine"]
define "Carbamazepine Observation":
  [Observation: Concepts."Carbamazepine"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Carbamazepine"
/* End of Carbamazepine */

/*
@dataElement: HIV.D.DE919 - Phenobarbital
@activity: HIV.D21 Determine regimen and treatment options
@description: Phenobarbital currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Phenobarbital":
  exists "Phenobarbital Condition"
    or exists "Phenobarbital Observation"
define "Phenobarbital Condition":
  [Condition: Concepts."Phenobarbital"]
define "Phenobarbital Observation":
  [Observation: Concepts."Phenobarbital"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Phenobarbital"
/* End of Phenobarbital */

/*
@dataElement: HIV.D.DE920 - Phenytoin
@activity: HIV.D21 Determine regimen and treatment options
@description: Phenytoin currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Phenytoin":
  exists "Phenytoin Condition"
    or exists "Phenytoin Observation"
define "Phenytoin Condition":
  [Condition: Concepts."Phenytoin"]
define "Phenytoin Observation":
  [Observation: Concepts."Phenytoin"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Phenytoin"
/* End of Phenytoin */

/*
@dataElement: HIV.D.DE921 - Polyvalent cation products containing Mg, Al, Fe, Ca and Zn
@activity: HIV.D21 Determine regimen and treatment options
@description: Polyvalent cation products containing Mg, Al, Fe, Ca and Zn currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Polyvalent cation products containing Mg, Al, Fe, Ca and Zn":
  exists "Polyvalent cation products containing Mg, Al, Fe, Ca and Zn Condition"
    or exists "Polyvalent cation products containing Mg, Al, Fe, Ca and Zn Observation"
define "Polyvalent cation products containing Mg, Al, Fe, Ca and Zn Condition":
  [Condition: Concepts."Polyvalent cation products containing Mg, Al, Fe, Ca and Zn"]
define "Polyvalent cation products containing Mg, Al, Fe, Ca and Zn Observation":
  [Observation: Concepts."Polyvalent cation products containing Mg, Al, Fe, Ca and Zn"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Polyvalent cation products containing Mg, Al, Fe, Ca and Zn"
/* End of Polyvalent cation products containing Mg, Al, Fe, Ca and Zn */

/*
@dataElement: HIV.D.DE922 - Amodiaquine
@activity: HIV.D21 Determine regimen and treatment options
@description: Amodiaquine currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Amodiaquine":
  exists "Amodiaquine Condition"
    or exists "Amodiaquine Observation"
define "Amodiaquine Condition":
  [Condition: Concepts."Amodiaquine"]
define "Amodiaquine Observation":
  [Observation: Concepts."Amodiaquine"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Amodiaquine"
/* End of Amodiaquine */

/*
@dataElement: HIV.D.DE923 - Cisapride
@activity: HIV.D21 Determine regimen and treatment options
@description: Cisapride currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Cisapride":
  exists "Cisapride Condition"
    or exists "Cisapride Observation"
define "Cisapride Condition":
  [Condition: Concepts."Cisapride"]
define "Cisapride Observation":
  [Observation: Concepts."Cisapride"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Cisapride"
/* End of Cisapride */

/*
@dataElement: HIV.D.DE924 - Ergotamine
@activity: HIV.D21 Determine regimen and treatment options
@description: Ergotamine currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Ergotamine":
  exists "Ergotamine Condition"
    or exists "Ergotamine Observation"
define "Ergotamine Condition":
  [Condition: Concepts."Ergotamine"]
define "Ergotamine Observation":
  [Observation: Concepts."Ergotamine"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Ergotamine"
/* End of Ergotamine */

/*
@dataElement: HIV.D.DE925 - Dihydroergotamine
@activity: HIV.D21 Determine regimen and treatment options
@description: Dihydroergotamine currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dihydroergotamine":
  exists "Dihydroergotamine Condition"
    or exists "Dihydroergotamine Observation"
define "Dihydroergotamine Condition":
  [Condition: Concepts."Dihydroergotamine"]
define "Dihydroergotamine Observation":
  [Observation: Concepts."Dihydroergotamine"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Dihydroergotamine"
/* End of Dihydroergotamine */

/*
@dataElement: HIV.D.DE926 - Midazolam
@activity: HIV.D21 Determine regimen and treatment options
@description: Midazolam currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Midazolam":
  exists "Midazolam Condition"
    or exists "Midazolam Observation"
define "Midazolam Condition":
  [Condition: Concepts."Midazolam"]
define "Midazolam Observation":
  [Observation: Concepts."Midazolam"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Midazolam"
/* End of Midazolam */

/*
@dataElement: HIV.D.DE927 - Triazolam
@activity: HIV.D21 Determine regimen and treatment options
@description: Triazolam currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Triazolam":
  exists "Triazolam Condition"
    or exists "Triazolam Observation"
define "Triazolam Condition":
  [Condition: Concepts."Triazolam"]
define "Triazolam Observation":
  [Observation: Concepts."Triazolam"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Triazolam"
/* End of Triazolam */

/*
@dataElement: HIV.D.DE928 - Estrogen-based hormonal contraception
@activity: HIV.D21 Determine regimen and treatment options
@description: Estrogen-based hormonal contraception currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Estrogen-based hormonal contraception":
  exists "Estrogen-based hormonal contraception Condition"
    or exists "Estrogen-based hormonal contraception Observation"
define "Estrogen-based hormonal contraception Condition":
  [Condition: Concepts."Estrogen-based hormonal contraception"]
define "Estrogen-based hormonal contraception Observation":
  [Observation: Concepts."Estrogen-based hormonal contraception"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Estrogen-based hormonal contraception"
/* End of Estrogen-based hormonal contraception */

/*
@dataElement: HIV.D.DE929 - Ribavirin
@activity: HIV.D21 Determine regimen and treatment options
@description: Ribavirin currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Ribavirin":
  exists "Ribavirin Condition"
    or exists "Ribavirin Observation"
define "Ribavirin Condition":
  [Condition: Concepts."Ribavirin"]
define "Ribavirin Observation":
  [Observation: Concepts."Ribavirin"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Ribavirin"
/* End of Ribavirin */

/*
@dataElement: HIV.D.DE930 - Peginterferon alfa-2a
@activity: HIV.D21 Determine regimen and treatment options
@description: Peginterferon alfa-2a currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Peginterferon alfa-2a":
  exists "Peginterferon alfa-2a Condition"
    or exists "Peginterferon alfa-2a Observation"
define "Peginterferon alfa-2a Condition":
  [Condition: Concepts."Peginterferon alfa-2a"]
define "Peginterferon alfa-2a Observation":
  [Observation: Concepts."Peginterferon alfa-2a"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Peginterferon alfa-2a"
/* End of Peginterferon alfa-2a */

/*
@dataElement: HIV.D.DE931 - Other - HIV.D.DE931
@activity: HIV.D21 Determine regimen and treatment options
@description: Other medication currently being taken by, or considered for, client
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.D.DE931":
  exists "Other - HIV.D.DE931 Condition"
    or exists "Other - HIV.D.DE931 Observation"
define "Other - HIV.D.DE931 Condition":
  [Condition: Concepts."Other - HIV.D.DE931"]
define "Other - HIV.D.DE931 Observation":
  [Observation: Concepts."Other - HIV.D.DE903"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.D.DE931"
/* End of Other - HIV.D.DE931 */

/*
@dataElement: HIV.D.DE933 - Medication change recommended
@activity: HIV.D21 Determine regimen and treatment options
@description: A medication change is recommended for the client based upon current or considered medications
*/
// TODO: Replace placeholder with relevant CQL logic
define "Medication change recommended":
  [Observation: Concepts."Medication change recommended"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Medication change recommended */

/*
@dataElement: HIV.D.DE934 - WHO HIV clinical stage condition or symptom - HIV.D.DE934
@activity: HIV.D15 Determine clinical stage of HIV
@description: New or recurrent clinical events used to categorize HIV disease severity based at baseline and follow up
*/
// TODO: Replace placeholder with relevant CQL logic
define "WHO HIV clinical stage condition or symptom - HIV.D.DE934 Observation":
  [Observation: Concepts."WHO HIV clinical stage condition or symptom - HIV.D.DE934"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of WHO HIV clinical stage condition or symptom - HIV.D.DE934 */

/*
@dataElement: HIV.D.DE935 - Pulmonary TB - HIV.D.DE935
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include pulmonary TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Pulmonary TB - HIV.D.DE935":
  exists "Pulmonary TB - HIV.D.DE935 Condition"
    or exists "Pulmonary TB - HIV.D.DE935 Observation"
define "Pulmonary TB - HIV.D.DE935 Condition":
  [Condition: Concepts."Pulmonary TB - HIV.D.DE935"]
define "Pulmonary TB - HIV.D.DE935 Observation":
  [Observation: Concepts."Pulmonary TB - HIV.D.DE934"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Pulmonary TB - HIV.D.DE935"
/* End of Pulmonary TB - HIV.D.DE935 */

/*
@dataElement: HIV.D.DE936 - Lymph node TB - HIV.D.DE936
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include lymph node TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lymph node TB - HIV.D.DE936":
  exists "Lymph node TB - HIV.D.DE936 Condition"
    or exists "Lymph node TB - HIV.D.DE936 Observation"
define "Lymph node TB - HIV.D.DE936 Condition":
  [Condition: Concepts."Lymph node TB - HIV.D.DE936"]
define "Lymph node TB - HIV.D.DE936 Observation":
  [Observation: Concepts."Lymph node TB - HIV.D.DE934"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lymph node TB - HIV.D.DE936"
/* End of Lymph node TB - HIV.D.DE936 */

/*
@dataElement: HIV.D.DE937 - Extrapulmonary TB - HIV.D.DE937
@activity: HIV.D15 Determine clinical stage of HIV
@description: Client's symptoms include extrapulmonary tuberculosis (TB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Extrapulmonary TB - HIV.D.DE937":
  exists "Extrapulmonary TB - HIV.D.DE937 Condition"
    or exists "Extrapulmonary TB - HIV.D.DE937 Observation"
define "Extrapulmonary TB - HIV.D.DE937 Condition":
  [Condition: Concepts."Extrapulmonary TB - HIV.D.DE937"]
define "Extrapulmonary TB - HIV.D.DE937 Observation":
  [Observation: Concepts."Extrapulmonary TB - HIV.D.DE934"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Extrapulmonary TB - HIV.D.DE937"
/* End of Extrapulmonary TB - HIV.D.DE937 */

/*
@dataElement: HIV.D.DE939 - TB diagnosis result
@activity: HIV.D8 Capture or update client history
@description: Final result of the TB investigation (bacteriological and/or clinical)
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB diagnosis result Observation":
  [Observation: Concepts."TB diagnosis result"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of TB diagnosis result */

/*
@dataElement: HIV.D.DE940 - Diagnosed TB
@activity: HIV.D8 Capture or update client history
@description: Client is diagnosed with TB disease
*/
// TODO: Replace placeholder with relevant CQL logic
define "Diagnosed TB":
  exists "Diagnosed TB Condition"
    or exists "Diagnosed TB Observation"
define "Diagnosed TB Condition":
  [Condition: Concepts."Diagnosed TB"]
define "Diagnosed TB Observation":
  [Observation: Concepts."Diagnosed TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Diagnosed TB"
/* End of Diagnosed TB */

/*
@dataElement: HIV.D.DE941 - TB excluded
@activity: HIV.D8 Capture or update client history
@description: Client is not diagnosed with TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB excluded":
  exists "TB excluded Condition"
    or exists "TB excluded Observation"
define "TB excluded Condition":
  [Condition: Concepts."TB excluded"]
define "TB excluded Observation":
  [Observation: Concepts."TB excluded"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TB excluded"
/* End of TB excluded */

/*
@dataElement: HIV.D.DE945 - Presumptive TB - HIV.D.DE945
@activity: HIV.D8 Capture or update client history
@description: Client has signs or symptoms of tuberculosis (TB) without laboratory confirmation
*/
// TODO: Replace placeholder with relevant CQL logic
define "Presumptive TB - HIV.D.DE945":
  [Observation: Concepts."Presumptive TB - HIV.D.DE945"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Presumptive TB - HIV.D.DE945 */

/*
@dataElement: HIV.D.DE952 - Date of TB diagnosis
@activity: HIV.D8 Capture or update client history
@description: The date when the diagnosis was established
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of TB diagnosis":
  [Observation: Concepts."Date of TB diagnosis"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of TB diagnosis */

/*
@dataElement: HIV.D.DE954 - TB preventive treatment TPT start date
@activity: HIV.D8 Capture or update client history
@description: The date on which the client began taking TPT
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB preventive treatment TPT start date":
  [Observation: Concepts."TB preventive treatment TPT start date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of TB preventive treatment TPT start date */

/*
@dataElement: HIV.D.DE956 - TB screening algorithm
@activity: HIV.D4 Screen for TB
@description: Screening algorithm selected for screening activities
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB screening algorithm Observation":
  [Observation: Concepts."TB screening algorithm"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of TB screening algorithm */

/*
@dataElement: HIV.D.DE957 - Screening with cough
@activity: HIV.D4 Screen for TB
@description: Client screened for TB based on cough symptom
*/
// TODO: Replace placeholder with relevant CQL logic
define "Screening with cough":
  exists "Screening with cough Condition"
    or exists "Screening with cough Observation"
define "Screening with cough Condition":
  [Condition: Concepts."Screening with cough"]
define "Screening with cough Observation":
  [Observation: Concepts."Screening with cough"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Screening with cough"
/* End of Screening with cough */

/*
@dataElement: HIV.D.DE958 - Screening with any TB symptom
@activity: HIV.D4 Screen for TB
@description: Client screened for TB based on any TB symptom
*/
// TODO: Replace placeholder with relevant CQL logic
define "Screening with any TB symptom":
  exists "Screening with any TB symptom Condition"
    or exists "Screening with any TB symptom Observation"
define "Screening with any TB symptom Condition":
  [Condition: Concepts."Screening with any TB symptom"]
define "Screening with any TB symptom Observation":
  [Observation: Concepts."Screening with any TB symptom"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Screening with any TB symptom"
/* End of Screening with any TB symptom */

/*
@dataElement: HIV.D.DE959 - W4SS single screening algorithm
@activity: HIV.D4 Screen for TB
@description: Client screened for TB based on the WHO-recommended four-symptom screen
*/
// TODO: Replace placeholder with relevant CQL logic
define "W4SS single screening algorithm":
  exists "W4SS single screening algorithm Condition"
    or exists "W4SS single screening algorithm Observation"
define "W4SS single screening algorithm Condition":
  [Condition: Concepts."W4SS single screening algorithm"]
define "W4SS single screening algorithm Observation":
  [Observation: Concepts."W4SS single screening algorithm"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."W4SS single screening algorithm"
/* End of W4SS single screening algorithm */

/*
@dataElement: HIV.D.DE960 - CRP single screening algorithm
@activity: HIV.D4 Screen for TB
@description: Client screened for TB based on C-reactive protein (CRP) testing
*/
// TODO: Replace placeholder with relevant CQL logic
define "CRP single screening algorithm":
  exists "CRP single screening algorithm Condition"
    or exists "CRP single screening algorithm Observation"
define "CRP single screening algorithm Condition":
  [Condition: Concepts."CRP single screening algorithm"]
define "CRP single screening algorithm Observation":
  [Observation: Concepts."CRP single screening algorithm"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."CRP single screening algorithm"
/* End of CRP single screening algorithm */

/*
@dataElement: HIV.D.DE961 - CXR single screening algorithm
@activity: HIV.D4 Screen for TB
@description: Client screened for TB with a chest radiography (CXR)
*/
// TODO: Replace placeholder with relevant CQL logic
define "CXR single screening algorithm":
  exists "CXR single screening algorithm Condition"
    or exists "CXR single screening algorithm Observation"
define "CXR single screening algorithm Condition":
  [Condition: Concepts."CXR single screening algorithm"]
define "CXR single screening algorithm Observation":
  [Observation: Concepts."CXR single screening algorithm"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."CXR single screening algorithm"
/* End of CXR single screening algorithm */

/*
@dataElement: HIV.D.DE962 - Parallel screening algorithm with W4SS and CRP
@activity: HIV.D4 Screen for TB
@description: Client screened for TB using parallel screening with WHO-recommended four-symptom screen and C-reactive protein (CRP) testing
*/
// TODO: Replace placeholder with relevant CQL logic
define "Parallel screening algorithm with W4SS and CRP":
  exists "Parallel screening algorithm with W4SS and CRP Condition"
    or exists "Parallel screening algorithm with W4SS and CRP Observation"
define "Parallel screening algorithm with W4SS and CRP Condition":
  [Condition: Concepts."Parallel screening algorithm with W4SS and CRP"]
define "Parallel screening algorithm with W4SS and CRP Observation":
  [Observation: Concepts."Parallel screening algorithm with W4SS and CRP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Parallel screening algorithm with W4SS and CRP"
/* End of Parallel screening algorithm with W4SS and CRP */

/*
@dataElement: HIV.D.DE963 - Sequential positive screening algorithm with W4SS and CRP
@activity: HIV.D4 Screen for TB
@description: Client screened for TB using sequential positive screening with WHO-recommended four-symptom screen and C-reactive protein (CRP) testing.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sequential positive screening algorithm with W4SS and CRP":
  exists "Sequential positive screening algorithm with W4SS and CRP Condition"
    or exists "Sequential positive screening algorithm with W4SS and CRP Observation"
define "Sequential positive screening algorithm with W4SS and CRP Condition":
  [Condition: Concepts."Sequential positive screening algorithm with W4SS and CRP"]
define "Sequential positive screening algorithm with W4SS and CRP Observation":
  [Observation: Concepts."Sequential positive screening algorithm with W4SS and CRP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sequential positive screening algorithm with W4SS and CRP"
/* End of Sequential positive screening algorithm with W4SS and CRP */

/*
@dataElement: HIV.D.DE964 - Sequential negative screening algorithm with W4SS and CRP
@activity: HIV.D4 Screen for TB
@description: Client screened for TB using sequential negative screening with WHO-recommended four-symptom screen and C-reactive protein (CRP) testing
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sequential negative screening algorithm with W4SS and CRP":
  exists "Sequential negative screening algorithm with W4SS and CRP Condition"
    or exists "Sequential negative screening algorithm with W4SS and CRP Observation"
define "Sequential negative screening algorithm with W4SS and CRP Condition":
  [Condition: Concepts."Sequential negative screening algorithm with W4SS and CRP"]
define "Sequential negative screening algorithm with W4SS and CRP Observation":
  [Observation: Concepts."Sequential negative screening algorithm with W4SS and CRP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sequential negative screening algorithm with W4SS and CRP"
/* End of Sequential negative screening algorithm with W4SS and CRP */

/*
@dataElement: HIV.D.DE965 - Parallel screening algorithm with W4SS and CXR
@activity: HIV.D4 Screen for TB
@description: Client screened for TB using the parallel screening algorithm with W4SS and CXR
*/
// TODO: Replace placeholder with relevant CQL logic
define "Parallel screening algorithm with W4SS and CXR":
  exists "Parallel screening algorithm with W4SS and CXR Condition"
    or exists "Parallel screening algorithm with W4SS and CXR Observation"
define "Parallel screening algorithm with W4SS and CXR Condition":
  [Condition: Concepts."Parallel screening algorithm with W4SS and CXR"]
define "Parallel screening algorithm with W4SS and CXR Observation":
  [Observation: Concepts."Parallel screening algorithm with W4SS and CXR"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Parallel screening algorithm with W4SS and CXR"
/* End of Parallel screening algorithm with W4SS and CXR */

/*
@dataElement: HIV.D.DE966 - Sequential positive screening algorithm with W4SS and CXR
@activity: HIV.D4 Screen for TB
@description: Client screened for TB using sequential positive screening with WHO-recommended four-symptom screen and chest radiography
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sequential positive screening algorithm with W4SS and CXR":
  exists "Sequential positive screening algorithm with W4SS and CXR Condition"
    or exists "Sequential positive screening algorithm with W4SS and CXR Observation"
define "Sequential positive screening algorithm with W4SS and CXR Condition":
  [Condition: Concepts."Sequential positive screening algorithm with W4SS and CXR"]
define "Sequential positive screening algorithm with W4SS and CXR Observation":
  [Observation: Concepts."Sequential positive screening algorithm with W4SS and CXR"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sequential positive screening algorithm with W4SS and CXR"
/* End of Sequential positive screening algorithm with W4SS and CXR */

/*
@dataElement: HIV.D.DE967 - Sequential negative screening algorithm with W4SS and CXR
@activity: HIV.D4 Screen for TB
@description: Client screened for TB using sequential negative screening with WHO-recommended four-symptom screen and chest radiography
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sequential negative screening algorithm with W4SS and CXR":
  exists "Sequential negative screening algorithm with W4SS and CXR Condition"
    or exists "Sequential negative screening algorithm with W4SS and CXR Observation"
define "Sequential negative screening algorithm with W4SS and CXR Condition":
  [Condition: Concepts."Sequential negative screening algorithm with W4SS and CXR"]
define "Sequential negative screening algorithm with W4SS and CXR Observation":
  [Observation: Concepts."Sequential negative screening algorithm with W4SS and CXR"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sequential negative screening algorithm with W4SS and CXR"
/* End of Sequential negative screening algorithm with W4SS and CXR */

/*
@dataElement: HIV.D.DE968 - Screening with mWRD
@activity: HIV.D4 Screen for TB
@description: Client screened for TB with a molecular WHO-recommended rapid diagnostic test (mWRD), such as an Xpert MTB/RIF test to detect Mycobacterium tuberculosis (MTB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Screening with mWRD":
  exists "Screening with mWRD Condition"
    or exists "Screening with mWRD Observation"
define "Screening with mWRD Condition":
  [Condition: Concepts."Screening with mWRD"]
define "Screening with mWRD Observation":
  [Observation: Concepts."Screening with mWRD"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Screening with mWRD"
/* End of Screening with mWRD */

/*
@dataElement: HIV.D.DE969 - Clinical assessment
@activity: HIV.D4 Screen for TB
@description: Client screened for with a clinical evaluation for tuberculosis (TB) based on national guidelines. Clinical assessment may be used as an eligibility evaluation for testing with LF-LAM or for empiric TB treatment.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Clinical assessment":
  exists "Clinical assessment Condition"
    or exists "Clinical assessment Observation"
define "Clinical assessment Condition":
  [Condition: Concepts."Clinical assessment"]
define "Clinical assessment Observation":
  [Observation: Concepts."Clinical assessment"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Clinical assessment"
/* End of Clinical assessment */

/*
@dataElement: HIV.D.DE970 - Other TB screening algorithm
@activity: HIV.D4 Screen for TB
@description: Client screened for tuberculosis (TB) with a different screening method not listed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other TB screening algorithm":
  exists "Other TB screening algorithm Condition"
    or exists "Other TB screening algorithm Observation"
define "Other TB screening algorithm Condition":
  [Condition: Concepts."Other TB screening algorithm"]
define "Other TB screening algorithm Observation":
  [Observation: Concepts."Other TB screening algorithm"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other TB screening algorithm"
/* End of Other TB screening algorithm */

/*
@dataElement: HIV.D.DE973 - Symptoms of TB
@activity: HIV.D4 Screen for TB
@description: Symptoms that may indicate TB disease in clients living with HIV, based on a clinical algorithm
*/
// TODO: Replace placeholder with relevant CQL logic
define "Symptoms of TB Observation":
  [Observation: Concepts."Symptoms of TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Symptoms of TB */

/*
@dataElement: HIV.D.DE974 - Current cough
@activity: HIV.D4 Screen for TB
@description: Client has a cough regardless of duration
*/
// TODO: Replace placeholder with relevant CQL logic
define "Current cough":
  exists "Current cough Condition"
    or exists "Current cough Observation"
define "Current cough Condition":
  [Condition: Concepts."Current cough"]
define "Current cough Observation":
  [Observation: Concepts."Current cough"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Current cough"
/* End of Current cough */

/*
@dataElement: HIV.D.DE975 - Prolonged cough >=2w
@activity: HIV.D4 Screen for TB
@description: Client has a prolonged cough of 2 weeks or more
*/
// TODO: Replace placeholder with relevant CQL logic
define "Prolonged cough >=2w":
  exists "Prolonged cough >=2w Condition"
    or exists "Prolonged cough >=2w Observation"
define "Prolonged cough >=2w Condition":
  [Condition: Concepts."Prolonged cough >=2w"]
define "Prolonged cough >=2w Observation":
  [Observation: Concepts."Prolonged cough >=2w"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Prolonged cough >=2w"
/* End of Prolonged cough >=2w */

/*
@dataElement: HIV.D.DE976 - Fever of 39 °C or greater
@activity: HIV.D4 Screen for TB
@description: Client has a fever with a measured temperature of 102.2 °F/39 °C or greater
*/
// TODO: Replace placeholder with relevant CQL logic
define "Fever of 39 °C or greater":
  exists "Fever of 39 °C or greater Condition"
    or exists "Fever of 39 °C or greater Observation"
define "Fever of 39 °C or greater Condition":
  [Condition: Concepts."Fever of 39 °C or greater"]
define "Fever of 39 °C or greater Observation":
  [Observation: Concepts."Fever of 39 °C or greater"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Fever of 39 °C or greater"
/* End of Fever of 39 °C or greater */

/*
@dataElement: HIV.D.DE977 - Weight loss reported
@activity: HIV.D4 Screen for TB
@description: Unexplained weight loss
*/
// TODO: Replace placeholder with relevant CQL logic
define "Weight loss reported":
  exists "Weight loss reported Condition"
    or exists "Weight loss reported Observation"
define "Weight loss reported Condition":
  [Condition: Concepts."Weight loss reported"]
define "Weight loss reported Observation":
  [Observation: Concepts."Weight loss reported"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Weight loss reported"
/* End of Weight loss reported */

/*
@dataElement: HIV.D.DE978 - Night sweats
@activity: HIV.D4 Screen for TB
@description: Client reports experiencing night sweats
*/
// TODO: Replace placeholder with relevant CQL logic
define "Night sweats":
  exists "Night sweats Condition"
    or exists "Night sweats Observation"
define "Night sweats Condition":
  [Condition: Concepts."Night sweats"]
define "Night sweats Observation":
  [Observation: Concepts."Night sweats"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Night sweats"
/* End of Night sweats */

/*
@dataElement: HIV.D.DE979 - Poor weight gain
@activity: HIV.D4 Screen for TB
@description: Client reports poor weight gain of child or infant or growth curve flattening or weight for age <-2 Z-scores.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Poor weight gain":
  exists "Poor weight gain Condition"
    or exists "Poor weight gain Observation"
define "Poor weight gain Condition":
  [Condition: Concepts."Poor weight gain"]
define "Poor weight gain Observation":
  [Observation: Concepts."Poor weight gain"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Poor weight gain"
/* End of Poor weight gain */

/*
@dataElement: HIV.D.DE980 - Reduced playfulness
@activity: HIV.D4 Screen for TB
@description: Client reports reduced playfulness of child
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reduced playfulness":
  exists "Reduced playfulness Condition"
    or exists "Reduced playfulness Observation"
define "Reduced playfulness Condition":
  [Condition: Concepts."Reduced playfulness"]
define "Reduced playfulness Observation":
  [Observation: Concepts."Reduced playfulness"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reduced playfulness"
/* End of Reduced playfulness */

/*
@dataElement: HIV.D.DE981 - Chest pain
@activity: HIV.D4 Screen for TB
@description: Client reports chest pain
*/
// TODO: Replace placeholder with relevant CQL logic
define "Chest pain":
  exists "Chest pain Condition"
    or exists "Chest pain Observation"
define "Chest pain Condition":
  [Condition: Concepts."Chest pain"]
define "Chest pain Observation":
  [Observation: Concepts."Chest pain"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Chest pain"
/* End of Chest pain */

/*
@dataElement: HIV.D.DE982 - Haemoptysis
@activity: HIV.D4 Screen for TB
@description: Client reports experiencing haemoptysis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Haemoptysis":
  exists "Haemoptysis Condition"
    or exists "Haemoptysis Observation"
define "Haemoptysis Condition":
  [Condition: Concepts."Haemoptysis"]
define "Haemoptysis Observation":
  [Observation: Concepts."Haemoptysis"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Haemoptysis"
/* End of Haemoptysis */

/*
@dataElement: HIV.D.DE983 - Lethargy - HIV.D.DE983
@activity: HIV.D4 Screen for TB
@description: Client reports lethargy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lethargy - HIV.D.DE983":
  exists "Lethargy - HIV.D.DE983 Condition"
    or exists "Lethargy - HIV.D.DE983 Observation"
define "Lethargy - HIV.D.DE983 Condition":
  [Condition: Concepts."Lethargy - HIV.D.DE983"]
define "Lethargy - HIV.D.DE983 Observation":
  [Observation: Concepts."Lethargy - HIV.D.DE973"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lethargy - HIV.D.DE983"
/* End of Lethargy - HIV.D.DE983 */

/*
@dataElement: HIV.D.DE984 - None
@activity: HIV.D4 Screen for TB
@description: No symptoms of TB identified
*/
// TODO: Replace placeholder with relevant CQL logic
define "None":
  exists "None Condition"
    or exists "None Observation"
define "None Condition":
  [Condition: Concepts."None"]
define "None Observation":
  [Observation: Concepts."None"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."None"
/* End of None */

/*
@dataElement: HIV.D.DE985 - History of contact with a person with TB
@activity: HIV.D4 Screen for TB
@description: Client had a history of a contact with a person with TB
*/
// TODO: Replace placeholder with relevant CQL logic
define "History of contact with a person with TB":
  [Observation: Concepts."History of contact with a person with TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of History of contact with a person with TB */

/*
@dataElement: HIV.D.DE986 - TB screening result
@activity: HIV.D4 Screen for TB
@description: Record the result of the tuberculosis (TB) screening
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB screening result Observation":
  [Observation: Concepts."TB screening result"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of TB screening result */

/*
@dataElement: HIV.D.DE987 - Screen positive for TB
@activity: HIV.D4 Screen for TB
@description: Screening result was positive for tuberculosis (TB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Screen positive for TB":
  exists "Screen positive for TB Condition"
    or exists "Screen positive for TB Observation"
define "Screen positive for TB Condition":
  [Condition: Concepts."Screen positive for TB"]
define "Screen positive for TB Observation":
  [Observation: Concepts."Screen positive for TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Screen positive for TB"
/* End of Screen positive for TB */

/*
@dataElement: HIV.D.DE988 - Screen negative for TB
@activity: HIV.D4 Screen for TB
@description: Screening result was negative for tuberculosis (TB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Screen negative for TB":
  exists "Screen negative for TB Condition"
    or exists "Screen negative for TB Observation"
define "Screen negative for TB Condition":
  [Condition: Concepts."Screen negative for TB"]
define "Screen negative for TB Observation":
  [Observation: Concepts."Screen negative for TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Screen negative for TB"
/* End of Screen negative for TB */

/*
@dataElement: HIV.D.DE989 - Inconclusive - HIV.D.DE989
@activity: HIV.D4 Screen for TB
@description: Screening result was inconclusive for tuberculosis (TB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Inconclusive - HIV.D.DE989":
  exists "Inconclusive - HIV.D.DE989 Condition"
    or exists "Inconclusive - HIV.D.DE989 Observation"
define "Inconclusive - HIV.D.DE989 Condition":
  [Condition: Concepts."Inconclusive - HIV.D.DE989"]
define "Inconclusive - HIV.D.DE989 Observation":
  [Observation: Concepts."Inconclusive - HIV.D.DE986"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Inconclusive - HIV.D.DE989"
/* End of Inconclusive - HIV.D.DE989 */

/*
@dataElement: HIV.D.DE990 - TB screening date
@activity: HIV.D4 Screen for TB
@description: Date the TB screening was conducted
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB screening date":
  [Observation: Concepts."TB screening date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of TB screening date */

/*
@dataElement: HIV.D.DE992 - TB diagnostic test category
@activity: HIV.D4 Screen for TB
@description: The type of diagnostic test performed to detect tuberculosis (TB) disease
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB diagnostic test category Observation":
  [Observation: Concepts."TB diagnostic test category"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of TB diagnostic test category */

/*
@dataElement: HIV.D.DE993 - LF-LAM
@activity: HIV.D4 Screen for TB
@description: Client tested for tuberculosis with a lateral flow urine lipoarabinomannan assay
*/
// TODO: Replace placeholder with relevant CQL logic
define "LF-LAM":
  exists "LF-LAM Condition"
    or exists "LF-LAM Observation"
define "LF-LAM Condition":
  [Condition: Concepts."LF-LAM"]
define "LF-LAM Observation":
  [Observation: Concepts."LF-LAM"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."LF-LAM"
/* End of LF-LAM */

/*
@dataElement: HIV.D.DE994 - mWRD test for TB
@activity: HIV.D4 Screen for TB
@description: Client tested with a WHO-recommended molecular diagnostic test to detect Mycobacterium tuberculosis (MTB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "mWRD test for TB":
  exists "mWRD test for TB Condition"
    or exists "mWRD test for TB Observation"
define "mWRD test for TB Condition":
  [Condition: Concepts."mWRD test for TB"]
define "mWRD test for TB Observation":
  [Observation: Concepts."mWRD test for TB"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."mWRD test for TB"
/* End of mWRD test for TB */

/*
@dataElement: HIV.D.DE995 - Microscopy - Sputum acid-fast bacilli AFB
@activity: HIV.D4 Screen for TB
@description: Client tested for tuberculosis with a sputum acid-fast bacilli (AFB)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Microscopy - Sputum acid-fast bacilli AFB":
  exists "Microscopy - Sputum acid-fast bacilli AFB Condition"
    or exists "Microscopy - Sputum acid-fast bacilli AFB Observation"
define "Microscopy - Sputum acid-fast bacilli AFB Condition":
  [Condition: Concepts."Microscopy - Sputum acid-fast bacilli AFB"]
define "Microscopy - Sputum acid-fast bacilli AFB Observation":
  [Observation: Concepts."Microscopy - Sputum acid-fast bacilli AFB"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Microscopy - Sputum acid-fast bacilli AFB"
/* End of Microscopy - Sputum acid-fast bacilli AFB */

/*
@dataElement: HIV.D.DE996 - TB Culture
@activity: HIV.D4 Screen for TB
@description: Client tested for tuberculosis (TB) with a culture
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB Culture":
  exists "TB Culture Condition"
    or exists "TB Culture Observation"
define "TB Culture Condition":
  [Condition: Concepts."TB Culture"]
define "TB Culture Observation":
  [Observation: Concepts."TB Culture"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."TB Culture"
/* End of TB Culture */

/*
@dataElement: HIV.D.DE997 - TB diagnostic test date
@activity: HIV.D4 Screen for TB
@description: The date when TB diagnostic test was performed
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB diagnostic test date":
  [Observation: Concepts."TB diagnostic test date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of TB diagnostic test date */

/*
@dataElement: HIV.D.DE1001 - TB treatment start date
@activity: HIV.D8 Capture or update client history
@description: The date on which the client start or restarted tuberculosis (TB) treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB treatment start date":
  [Observation: Concepts."TB treatment start date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of TB treatment start date */

/*
@dataElement: HIV.D.DE1017 - Eligible for TB preventive treatment
@activity: HIV.D14 Prevent, screen, and manage comorbidities and coinfections
@description: Client is eligible for tuberculosis preventive treatment (TPT)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Eligible for TB preventive treatment":
  [Observation: Concepts."Eligible for TB preventive treatment"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Eligible for TB preventive treatment */

/*
@dataElement: HIV.D.DE1023 - TB prevention services accepted
@activity: HIV.D21 Determine regimen and treatment options
@description: Indicates if the client accepts to be evaluated for TB infection and to take the treatment in case he/she is eligible
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB prevention services accepted":
  [Observation: Concepts."TB prevention services accepted"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of TB prevention services accepted */

/*
@dataElement: HIV.D.DE1026 - C reactive protein test result
@activity: HIV.D4 Screen for TB
@description: Test result of the client's C reactive protein test result in mg/L
*/
// TODO: Replace placeholder with relevant CQL logic
define "C reactive protein test result":
  [Observation: Concepts."C reactive protein test result"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of C reactive protein test result */

/*
@dataElement: HIV.D.DE1028 - TPT regimen type
@activity: HIV.D4 Screen for TB
@description: Type of TPT regimen the client is currently on
*/
// TODO: Replace placeholder with relevant CQL logic
define "TPT regimen type Observation":
  [Observation: Concepts."TPT regimen type"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of TPT regimen type */

/*
@dataElement: HIV.D.DE1029 - 3HP
@activity: HIV.D4 Screen for TB
@description: The client's current TPT regimen is 3HP
*/
// TODO: Replace placeholder with relevant CQL logic
define "3HP":
  exists "3HP Condition"
    or exists "3HP Observation"
define "3HP Condition":
  [Condition: Concepts."3HP"]
define "3HP Observation":
  [Observation: Concepts."3HP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."3HP"
/* End of 3HP */

/*
@dataElement: HIV.D.DE1030 - 1HP
@activity: HIV.D4 Screen for TB
@description: The client's current TPT regimen is 1HP
*/
// TODO: Replace placeholder with relevant CQL logic
define "1HP":
  exists "1HP Condition"
    or exists "1HP Observation"
define "1HP Condition":
  [Condition: Concepts."1HP"]
define "1HP Observation":
  [Observation: Concepts."1HP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."1HP"
/* End of 1HP */

/*
@dataElement: HIV.D.DE1031 - 6H
@activity: HIV.D4 Screen for TB
@description: The client's current TPT regimen is 6H
*/
// TODO: Replace placeholder with relevant CQL logic
define "6H":
  exists "6H Condition"
    or exists "6H Observation"
define "6H Condition":
  [Condition: Concepts."6H"]
define "6H Observation":
  [Observation: Concepts."6H"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."6H"
/* End of 6H */

/*
@dataElement: HIV.D.DE1032 - Six months of levofloxacin daily
@activity: HIV.D4 Screen for TB
@description: The client's current TPT regimen is six months of levofloxacin daily
*/
// TODO: Replace placeholder with relevant CQL logic
define "Six months of levofloxacin daily":
  exists "Six months of levofloxacin daily Condition"
    or exists "Six months of levofloxacin daily Observation"
define "Six months of levofloxacin daily Condition":
  [Condition: Concepts."Six months of levofloxacin daily"]
define "Six months of levofloxacin daily Observation":
  [Observation: Concepts."Six months of levofloxacin daily"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Six months of levofloxacin daily"
/* End of Six months of levofloxacin daily */

/*
@dataElement: HIV.D.DE1033 - Other TB preventive treatment TPT regimen
@activity: HIV.D4 Screen for TB
@description: The client's current TPT regimen is another regimen than those listed above
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other TB preventive treatment TPT regimen":
  exists "Other TB preventive treatment TPT regimen Condition"
    or exists "Other TB preventive treatment TPT regimen Observation"
define "Other TB preventive treatment TPT regimen Condition":
  [Condition: Concepts."Other TB preventive treatment TPT regimen"]
define "Other TB preventive treatment TPT regimen Observation":
  [Observation: Concepts."Other TB preventive treatment TPT regimen"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other TB preventive treatment TPT regimen"
/* End of Other TB preventive treatment TPT regimen */

/*
@dataElement: HIV.D.DE1034 - TB preventive treatment TPT status
@activity: HIV.D4 Screen for TB
@description: Indicates the current status of TB preventive treatment (TPT)
*/
// TODO: Replace placeholder with relevant CQL logic
define "TB preventive treatment TPT status Observation":
  [Observation: Concepts."TB preventive treatment TPT status"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of TB preventive treatment TPT status */

/*
@dataElement: HIV.D.DE1035 - Not started
@activity: HIV.D4 Screen for TB
@description: The client did not start the TB preventive treatment (TPT)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Not started":
  exists "Not started Condition"
    or exists "Not started Observation"
define "Not started Condition":
  [Condition: Concepts."Not started"]
define "Not started Observation":
  [Observation: Concepts."Not started"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Not started"
/* End of Not started */

/*
@dataElement: HIV.D.DE1036 - On TPT
@activity: HIV.D4 Screen for TB
@description: The client started the TB preventive treatment (TPT) and is currently taking the medication, without treatment interruptions
*/
// TODO: Replace placeholder with relevant CQL logic
define "On TPT":
  exists "On TPT Condition"
    or exists "On TPT Observation"
define "On TPT Condition":
  [Condition: Concepts."On TPT"]
define "On TPT Observation":
  [Observation: Concepts."On TPT"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."On TPT"
/* End of On TPT */

/*
@dataElement: HIV.D.DE1037 - On TPT with interruptions
@activity: HIV.D4 Screen for TB
@description: The client started the TB preventive treatment (TPT) and is currently taking the medication, with treatment interruptions
*/
// TODO: Replace placeholder with relevant CQL logic
define "On TPT with interruptions":
  exists "On TPT with interruptions Condition"
    or exists "On TPT with interruptions Observation"
define "On TPT with interruptions Condition":
  [Condition: Concepts."On TPT with interruptions"]
define "On TPT with interruptions Observation":
  [Observation: Concepts."On TPT with interruptions"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."On TPT with interruptions"
/* End of On TPT with interruptions */

/*
@dataElement: HIV.D.DE1038 - On hold
@activity: HIV.D4 Screen for TB
@description: The health care worker has temporarily stopped the TB preventive treatment (TPT), but TPT is expected to continue again later. May also be called 'suspended'.
*/
// TODO: Replace placeholder with relevant CQL logic
define "On hold":
  exists "On hold Condition"
    or exists "On hold Observation"
define "On hold Condition":
  [Condition: Concepts."On hold"]
define "On hold Observation":
  [Observation: Concepts."On hold"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."On hold"
/* End of On hold */

/*
@dataElement: HIV.D.DE1039 - Completed
@activity: HIV.D4 Screen for TB
@description: TB preventive treatment (TPT) was completed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Completed":
  exists "Completed Condition"
    or exists "Completed Observation"
define "Completed Condition":
  [Condition: Concepts."Completed"]
define "Completed Observation":
  [Observation: Concepts."Completed"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Completed"
/* End of Completed */

/*
@dataElement: HIV.E.DE41 - Timing of ART initiation
@activity: HIV.E1 Capture or update mother's history
@description: When the pregnant woman or mother initiated ART, for women living with HIV.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Timing of ART initiation Observation":
  [Observation: Concepts."Timing of ART initiation"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Timing of ART initiation */

/*
@dataElement: HIV.E.DE42 - Already on ART at first antenatal care visit
@activity: HIV.E1 Capture or update mother's history
@description: The pregnant woman was already on antiretroviral therapy (ART) at first antenatal care visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Already on ART at first antenatal care visit":
  exists "Already on ART at first antenatal care visit Condition"
    or exists "Already on ART at first antenatal care visit Observation"
define "Already on ART at first antenatal care visit Condition":
  [Condition: Concepts."Already on ART at first antenatal care visit"]
define "Already on ART at first antenatal care visit Observation":
  [Observation: Concepts."Already on ART at first antenatal care visit"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Already on ART at first antenatal care visit"
/* End of Already on ART at first antenatal care visit */

/*
@dataElement: HIV.E.DE43 - Newly on ART during pregnancy
@activity: HIV.E1 Capture or update mother's history
@description: The pregnant woman started ART during her pregnancy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Newly on ART during pregnancy":
  exists "Newly on ART during pregnancy Condition"
    or exists "Newly on ART during pregnancy Observation"
define "Newly on ART during pregnancy Condition":
  [Condition: Concepts."Newly on ART during pregnancy"]
define "Newly on ART during pregnancy Observation":
  [Observation: Concepts."Newly on ART during pregnancy"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Newly on ART during pregnancy"
/* End of Newly on ART during pregnancy */

/*
@dataElement: HIV.E.DE44 - Newly on ART during labour and delivery
@activity: HIV.E1 Capture or update mother's history
@description: The woman started ART during labour and delivery
*/
// TODO: Replace placeholder with relevant CQL logic
define "Newly on ART during labour and delivery":
  exists "Newly on ART during labour and delivery Condition"
    or exists "Newly on ART during labour and delivery Observation"
define "Newly on ART during labour and delivery Condition":
  [Condition: Concepts."Newly on ART during labour and delivery"]
define "Newly on ART during labour and delivery Observation":
  [Observation: Concepts."Newly on ART during labour and delivery"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Newly on ART during labour and delivery"
/* End of Newly on ART during labour and delivery */

/*
@dataElement: HIV.E.DE46 - Delivery date
@activity: HIV.E1 Capture or update mother's history
@description: Date on which the woman delivered
*/
// TODO: Replace placeholder with relevant CQL logic
define "Delivery date":
  [Observation: Concepts."Delivery date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Delivery date */

/*
@dataElement: HIV.E.DE67 - Place of delivery
@activity: HIV.E1 Capture or update mother's history
@description: The type of place where the woman delivered
*/
// TODO: Replace placeholder with relevant CQL logic
define "Place of delivery Observation":
  [Observation: Concepts."Place of delivery"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Place of delivery */

/*
@dataElement: HIV.E.DE68 - Health facility
@activity: HIV.E1 Capture or update mother's history
@description: The woman delivered at a health facility
*/
// TODO: Replace placeholder with relevant CQL logic
define "Health facility":
  exists "Health facility Condition"
    or exists "Health facility Observation"
define "Health facility Condition":
  [Condition: Concepts."Health facility"]
define "Health facility Observation":
  [Observation: Concepts."Health facility"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Health facility"
/* End of Health facility */

/*
@dataElement: HIV.E.DE69 - Home
@activity: HIV.E1 Capture or update mother's history
@description: The woman delivered at home
*/
// TODO: Replace placeholder with relevant CQL logic
define "Home":
  exists "Home Condition"
    or exists "Home Observation"
define "Home Condition":
  [Condition: Concepts."Home"]
define "Home Observation":
  [Observation: Concepts."Home"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Home"
/* End of Home */

/*
@dataElement: HIV.E.DE70 - Other - HIV.E.DE70
@activity: HIV.E1 Capture or update mother's history
@description: The woman delivered at another location that is not at home or at a health facility
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.E.DE70":
  exists "Other - HIV.E.DE70 Condition"
    or exists "Other - HIV.E.DE70 Observation"
define "Other - HIV.E.DE70 Condition":
  [Condition: Concepts."Other - HIV.E.DE70"]
define "Other - HIV.E.DE70 Observation":
  [Observation: Concepts."Other - HIV.E.DE67"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.E.DE70"
/* End of Other - HIV.E.DE70 */

/*
@dataElement: HIV.E.DE85 - ANC contact date - HIV.E.DE85
@activity: HIV.E1 Capture or update mother's history
@description: The date and time of the client's ANC contact (in the ANC DAK this is called 'Contact date')
*/
// TODO: Replace placeholder with relevant CQL logic
define "ANC contact date - HIV.E.DE85":
  [Observation: Concepts."ANC contact date - HIV.E.DE85"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of ANC contact date - HIV.E.DE85 */

/*
@dataElement: HIV.E.DE87 - Infant date of birth
@activity: HIV.E1 Capture or update mother's history
@description: The infant's date of birth (DOB) if known
*/
// TODO: Replace placeholder with relevant CQL logic
define "Infant date of birth":
  [Observation: Concepts."Infant date of birth"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Infant date of birth */

/*
@dataElement: HIV.E.DE90 - Age of infant
@activity: HIV.E1 Capture or update mother's history
@description: Infant age calculated using date of birth
*/
// TODO: Replace placeholder with relevant CQL logic
define "Age of infant":
  [Observation: Concepts."Age of infant"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Age of infant */

/*
@dataElement: HIV.E.DE112 - HIV-exposed infant or child - HIV.E.DE112
@activity: HIV.F6 Check whether infant/child had HIV exposure
@description: Whether the infant or child was determined to have had HIV exposure
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-exposed infant or child - HIV.E.DE112":
  [Observation: Concepts."HIV-exposed infant or child - HIV.E.DE112"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV-exposed infant or child - HIV.E.DE112 */

/*
@dataElement: HIV.E.DE113 - Key population member* - HIV.E.DE113
@activity: HIV.E1 Capture or update mother's history
@description: Mother is a member of a key population which has an increased risk of HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Key population member* - HIV.E.DE113":
  [Observation: Concepts."Key population member* - HIV.E.DE113"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Key population member* - HIV.E.DE113 */

/*
@dataElement: HIV.E.DE114 - Key population member type* - HIV.E.DE114
@activity: HIV.E1 Capture or update mother's history
@description: The type of key population that the infant's mother is included in
*/
// TODO: Replace placeholder with relevant CQL logic
define "Key population member type* - HIV.E.DE114 Observation":
  [Observation: Concepts."Key population member type* - HIV.E.DE114"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Key population member type* - HIV.E.DE114 */

/*
@dataElement: HIV.E.DE115 - Sex worker - HIV.E.DE115
@activity: HIV.E1 Capture or update mother's history
@description: Infant's mother is a sex worker
*/
// TODO: Replace placeholder with relevant CQL logic
define "Sex worker - HIV.E.DE115":
  exists "Sex worker - HIV.E.DE115 Condition"
    or exists "Sex worker - HIV.E.DE115 Observation"
define "Sex worker - HIV.E.DE115 Condition":
  [Condition: Concepts."Sex worker - HIV.E.DE115"]
define "Sex worker - HIV.E.DE115 Observation":
  [Observation: Concepts."Sex worker - HIV.E.DE114"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Sex worker - HIV.E.DE115"
/* End of Sex worker - HIV.E.DE115 */

/*
@dataElement: HIV.E.DE116 - People who inject drugs - HIV.E.DE116
@activity: HIV.E1 Capture or update mother's history
@description: Infant's mother is a person who injects drugs
*/
// TODO: Replace placeholder with relevant CQL logic
define "People who inject drugs - HIV.E.DE116":
  exists "People who inject drugs - HIV.E.DE116 Condition"
    or exists "People who inject drugs - HIV.E.DE116 Observation"
define "People who inject drugs - HIV.E.DE116 Condition":
  [Condition: Concepts."People who inject drugs - HIV.E.DE116"]
define "People who inject drugs - HIV.E.DE116 Observation":
  [Observation: Concepts."People who inject drugs - HIV.E.DE114"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."People who inject drugs - HIV.E.DE116"
/* End of People who inject drugs - HIV.E.DE116 */

/*
@dataElement: HIV.E.DE117 - Trans and gender-diverse people - HIV.E.DE117
@activity: HIV.E1 Capture or update mother's history
@description: Infant's mother identifies as trans and gender-diverse
*/
// TODO: Replace placeholder with relevant CQL logic
define "Trans and gender-diverse people - HIV.E.DE117":
  exists "Trans and gender-diverse people - HIV.E.DE117 Condition"
    or exists "Trans and gender-diverse people - HIV.E.DE117 Observation"
define "Trans and gender-diverse people - HIV.E.DE117 Condition":
  [Condition: Concepts."Trans and gender-diverse people - HIV.E.DE117"]
define "Trans and gender-diverse people - HIV.E.DE117 Observation":
  [Observation: Concepts."Trans and gender-diverse people - HIV.E.DE114"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Trans and gender-diverse people - HIV.E.DE117"
/* End of Trans and gender-diverse people - HIV.E.DE117 */

/*
@dataElement: HIV.E.DE118 - People living in prisons and other closed setting
@activity: HIV.E1 Capture or update mother's history
@description: Infant's mother is in a prison or closed setting
*/
// TODO: Replace placeholder with relevant CQL logic
define "People living in prisons and other closed setting":
  exists "People living in prisons and other closed setting Condition"
    or exists "People living in prisons and other closed setting Observation"
define "People living in prisons and other closed setting Condition":
  [Condition: Concepts."People living in prisons and other closed setting"]
define "People living in prisons and other closed setting Observation":
  [Observation: Concepts."People living in prisons and other closed setting"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."People living in prisons and other closed setting"
/* End of People living in prisons and other closed setting */

/*
@dataElement: HIV.E.DE155 - Signs of substantial risk of HIV infection - HIV.E.DE155
@activity: HIV.E1 Capture or update mother's history
@description: Signs the client is at a substantial risk of HIV infection
*/
// TODO: Replace placeholder with relevant CQL logic
define "Signs of substantial risk of HIV infection - HIV.E.DE155 Observation":
  [Observation: Concepts."Signs of substantial risk of HIV infection - HIV.E.DE155"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Signs of substantial risk of HIV infection - HIV.E.DE155 */

/*
@dataElement: HIV.E.DE156 - No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156
@activity: HIV.E1 Capture or update mother's history
@description: Recent vaginal or anal sexual intercourse without a condom with more than one partner
*/
// TODO: Replace placeholder with relevant CQL logic
define "No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156":
  exists "No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156 Condition"
    or exists "No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156 Observation"
define "No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156 Condition":
  [Condition: Concepts."No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156"]
define "No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156 Observation":
  [Observation: Concepts."No condom use during sex with more than one partner in the past 6 months - HIV.E.DE155"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156"
/* End of No condom use during sex with more than one partner in the past 6 months - HIV.E.DE156 */

/*
@dataElement: HIV.E.DE157 - STI in the past 6 months - HIV.E.DE157
@activity: HIV.E1 Capture or update mother's history
@description: A recent history (in the last 6 months) of a sexually transmitted infection (STI) by laboratory testing or self-report of syndromic STI treatment
*/
// TODO: Replace placeholder with relevant CQL logic
define "STI in the past 6 months - HIV.E.DE157":
  exists "STI in the past 6 months - HIV.E.DE157 Condition"
    or exists "STI in the past 6 months - HIV.E.DE157 Observation"
define "STI in the past 6 months - HIV.E.DE157 Condition":
  [Condition: Concepts."STI in the past 6 months - HIV.E.DE157"]
define "STI in the past 6 months - HIV.E.DE157 Observation":
  [Observation: Concepts."STI in the past 6 months - HIV.E.DE155"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."STI in the past 6 months - HIV.E.DE157"
/* End of STI in the past 6 months - HIV.E.DE157 */

/*
@dataElement: HIV.E.DE158 - A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158
@activity: HIV.E1 Capture or update mother's history
@description: A recent sex partner of the client had HIV risk factors
*/
// TODO: Replace placeholder with relevant CQL logic
define "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158":
  exists "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158 Condition"
    or exists "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158 Observation"
define "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158 Condition":
  [Condition: Concepts."A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158"]
define "A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158 Observation":
  [Observation: Concepts."A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE155"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158"
/* End of A sexual partner in the past 6 months had one or more HIV risk factors - HIV.E.DE158 */

/*
@dataElement: HIV.E.DE159 - PrEP requested by client - HIV.E.DE159
@activity: HIV.E1 Capture or update mother's history
@description: Client is requesting PrEP, reflecting a decision-making process has already taken place and suggesting of substantial risk of HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "PrEP requested by client - HIV.E.DE159":
  exists "PrEP requested by client - HIV.E.DE159 Condition"
    or exists "PrEP requested by client - HIV.E.DE159 Observation"
define "PrEP requested by client - HIV.E.DE159 Condition":
  [Condition: Concepts."PrEP requested by client - HIV.E.DE159"]
define "PrEP requested by client - HIV.E.DE159 Observation":
  [Observation: Concepts."PrEP requested by client - HIV.E.DE155"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."PrEP requested by client - HIV.E.DE159"
/* End of PrEP requested by client - HIV.E.DE159 */

/*
@dataElement: HIV.E.DE160 - Serodiscordant partner - HIV.E.DE160
@activity: HIV.E1 Capture or update mother's history
@description: Mother's HIV status is different from a current partner's HIV status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Serodiscordant partner - HIV.E.DE160":
  [Observation: Concepts."Serodiscordant partner - HIV.E.DE160"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Serodiscordant partner - HIV.E.DE160 */

/*
@dataElement: HIV.E.DE168 - HIV test type - HIV.E.DE168
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: Type of HIV test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test type - HIV.E.DE168 Observation":
  [Observation: Concepts."HIV test type - HIV.E.DE168"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV test type - HIV.E.DE168 */

/*
@dataElement: HIV.E.DE169 - Rapid diagnostic test for HIV - HIV.E.DE169
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: Antibody test for HIV performed with a rapid diagnostic (RDT)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Rapid diagnostic test for HIV - HIV.E.DE169":
  exists "Rapid diagnostic test for HIV - HIV.E.DE169 Condition"
    or exists "Rapid diagnostic test for HIV - HIV.E.DE169 Observation"
define "Rapid diagnostic test for HIV - HIV.E.DE169 Condition":
  [Condition: Concepts."Rapid diagnostic test for HIV - HIV.E.DE169"]
define "Rapid diagnostic test for HIV - HIV.E.DE169 Observation":
  [Observation: Concepts."Rapid diagnostic test for HIV - HIV.E.DE168"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Rapid diagnostic test for HIV - HIV.E.DE169"
/* End of Rapid diagnostic test for HIV - HIV.E.DE169 */

/*
@dataElement: HIV.E.DE170 - Enzyme immunoassay for HIV - HIV.E.DE170
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: Antibody test for HIV performed with an enzyme immunoassay (EIA)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Enzyme immunoassay for HIV - HIV.E.DE170":
  exists "Enzyme immunoassay for HIV - HIV.E.DE170 Condition"
    or exists "Enzyme immunoassay for HIV - HIV.E.DE170 Observation"
define "Enzyme immunoassay for HIV - HIV.E.DE170 Condition":
  [Condition: Concepts."Enzyme immunoassay for HIV - HIV.E.DE170"]
define "Enzyme immunoassay for HIV - HIV.E.DE170 Observation":
  [Observation: Concepts."Enzyme immunoassay for HIV - HIV.E.DE168"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Enzyme immunoassay for HIV - HIV.E.DE170"
/* End of Enzyme immunoassay for HIV - HIV.E.DE170 */

/*
@dataElement: HIV.E.DE171 - Nucleic acid test for HIV - HIV.E.DE171
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: Virological test, which includes testing for early infant diagnosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Nucleic acid test for HIV - HIV.E.DE171":
  exists "Nucleic acid test for HIV - HIV.E.DE171 Condition"
    or exists "Nucleic acid test for HIV - HIV.E.DE171 Observation"
define "Nucleic acid test for HIV - HIV.E.DE171 Condition":
  [Condition: Concepts."Nucleic acid test for HIV - HIV.E.DE171"]
define "Nucleic acid test for HIV - HIV.E.DE171 Observation":
  [Observation: Concepts."Nucleic acid test for HIV - HIV.E.DE168"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Nucleic acid test for HIV - HIV.E.DE171"
/* End of Nucleic acid test for HIV - HIV.E.DE171 */

/*
@dataElement: HIV.E.DE172 - Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: Antibody test for HIV and syphilis performed with a rapid diagnostic
*/
// TODO: Replace placeholder with relevant CQL logic
define "Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172":
  exists "Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172 Condition"
    or exists "Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172 Observation"
define "Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172 Condition":
  [Condition: Concepts."Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172"]
define "Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172 Observation":
  [Observation: Concepts."Dual HIV/syphilis rapid diagnostic test - HIV.E.DE168"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172"
/* End of Dual HIV/syphilis rapid diagnostic test - HIV.E.DE172 */

/*
@dataElement: HIV.E.DE173 - Maternal and child health service visit
@activity: HIV.E1 Capture or update mother's history
@description: Maternal and child health service visit attended by an HIV-exposed infant
*/
// TODO: Replace placeholder with relevant CQL logic
define "Maternal and child health service visit Observation":
  [Observation: Concepts."Maternal and child health service visit"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Maternal and child health service visit */

/*
@dataElement: HIV.E.DE174 - 12-month visit
@activity: HIV.E1 Capture or update mother's history
@description: HIV-exposed infant attending MCH services for a 12-month visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "12-month visit":
  exists "12-month visit Condition"
    or exists "12-month visit Observation"
define "12-month visit Condition":
  [Condition: Concepts."12-month visit"]
define "12-month visit Observation":
  [Observation: Concepts."12-month visit"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."12-month visit"
/* End of 12-month visit */

/*
@dataElement: HIV.E.DE175 - 24-month visit
@activity: HIV.E1 Capture or update mother's history
@description: HIV-exposed infants attending MCH services for a 24-month visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "24-month visit":
  exists "24-month visit Condition"
    or exists "24-month visit Observation"
define "24-month visit Condition":
  [Condition: Concepts."24-month visit"]
define "24-month visit Observation":
  [Observation: Concepts."24-month visit"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."24-month visit"
/* End of 24-month visit */

/*
@dataElement: HIV.E.DE176 - First visit after the end of breastfeeding
@activity: HIV.E1 Capture or update mother's history
@description: HIV-exposed infant attending MCH services for a first visit after the end of breastfeeding
*/
// TODO: Replace placeholder with relevant CQL logic
define "First visit after the end of breastfeeding":
  exists "First visit after the end of breastfeeding Condition"
    or exists "First visit after the end of breastfeeding Observation"
define "First visit after the end of breastfeeding Condition":
  [Condition: Concepts."First visit after the end of breastfeeding"]
define "First visit after the end of breastfeeding Observation":
  [Observation: Concepts."First visit after the end of breastfeeding"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."First visit after the end of breastfeeding"
/* End of First visit after the end of breastfeeding */

/*
@dataElement: HIV.E.DE179 - Registered in birth cohort
@activity: HIV.F3 Capture or update infant's/child's history
@description: Whether the infant has been registered in a birth cohort
*/
// TODO: Replace placeholder with relevant CQL logic
define "Registered in birth cohort":
  [Observation: Concepts."Registered in birth cohort"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Registered in birth cohort */

/*
@dataElement: HIV.E.DE180 - EID sample number
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Early infant diagnosis (EID) sample number
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID sample number Observation":
  [Observation: Concepts."EID sample number"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of EID sample number */

/*
@dataElement: HIV.E.DE181 - EID sample 1
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: First sample used to test an infant for HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID sample 1":
  exists "EID sample 1 Condition"
    or exists "EID sample 1 Observation"
define "EID sample 1 Condition":
  [Condition: Concepts."EID sample 1"]
define "EID sample 1 Observation":
  [Observation: Concepts."EID sample 1"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."EID sample 1"
/* End of EID sample 1 */

/*
@dataElement: HIV.E.DE182 - EID sample 2
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Second sample used to test an infant for HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID sample 2":
  exists "EID sample 2 Condition"
    or exists "EID sample 2 Observation"
define "EID sample 2 Condition":
  [Condition: Concepts."EID sample 2"]
define "EID sample 2 Observation":
  [Observation: Concepts."EID sample 2"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."EID sample 2"
/* End of EID sample 2 */

/*
@dataElement: HIV.E.DE183 - EID test number
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Early infant diagnosis (EID) HIV test number using the same sample
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID test number Observation":
  [Observation: Concepts."EID test number"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of EID test number */

/*
@dataElement: HIV.E.DE184 - EID test number 1
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: First test on a sample to test an infant for HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID test number 1":
  exists "EID test number 1 Condition"
    or exists "EID test number 1 Observation"
define "EID test number 1 Condition":
  [Condition: Concepts."EID test number 1"]
define "EID test number 1 Observation":
  [Observation: Concepts."EID test number 1"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."EID test number 1"
/* End of EID test number 1 */

/*
@dataElement: HIV.E.DE185 - EID test number 2
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Second test on a sample to test an infant for HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID test number 2":
  exists "EID test number 2 Condition"
    or exists "EID test number 2 Observation"
define "EID test number 2 Condition":
  [Condition: Concepts."EID test number 2"]
define "EID test number 2 Observation":
  [Observation: Concepts."EID test number 2"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."EID test number 2"
/* End of EID test number 2 */

/*
@dataElement: HIV.E.DE186 - EID test number 1 test result
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Early infant diagnosis test number 1 test result
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID test number 1 test result Observation":
  [Observation: Concepts."EID test number 1 test result"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of EID test number 1 test result */

/*
@dataElement: HIV.E.DE187 - Positive - HIV.E.DE187
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Positive HIV test result from the nucleic acid test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.E.DE187":
  exists "Positive - HIV.E.DE187 Condition"
    or exists "Positive - HIV.E.DE187 Observation"
define "Positive - HIV.E.DE187 Condition":
  [Condition: Concepts."Positive - HIV.E.DE187"]
define "Positive - HIV.E.DE187 Observation":
  [Observation: Concepts."Positive - HIV.E.DE186"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.E.DE187"
/* End of Positive - HIV.E.DE187 */

/*
@dataElement: HIV.E.DE188 - Negative - HIV.E.DE188
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Negative HIV test result from the nucleic acid test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.E.DE188":
  exists "Negative - HIV.E.DE188 Condition"
    or exists "Negative - HIV.E.DE188 Observation"
define "Negative - HIV.E.DE188 Condition":
  [Condition: Concepts."Negative - HIV.E.DE188"]
define "Negative - HIV.E.DE188 Observation":
  [Observation: Concepts."Negative - HIV.E.DE186"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.E.DE188"
/* End of Negative - HIV.E.DE188 */

/*
@dataElement: HIV.E.DE189 - Indeterminate - HIV.E.DE189
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Indeterminate HIV test result from the nucleic acid test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Indeterminate - HIV.E.DE189":
  exists "Indeterminate - HIV.E.DE189 Condition"
    or exists "Indeterminate - HIV.E.DE189 Observation"
define "Indeterminate - HIV.E.DE189 Condition":
  [Condition: Concepts."Indeterminate - HIV.E.DE189"]
define "Indeterminate - HIV.E.DE189 Observation":
  [Observation: Concepts."Indeterminate - HIV.E.DE186"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Indeterminate - HIV.E.DE189"
/* End of Indeterminate - HIV.E.DE189 */

/*
@dataElement: HIV.E.DE190 - EID test number 2 test result
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Early infant diagnosis test number 2 test result
*/
// TODO: Replace placeholder with relevant CQL logic
define "EID test number 2 test result Observation":
  [Observation: Concepts."EID test number 2 test result"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of EID test number 2 test result */

/*
@dataElement: HIV.E.DE191 - Positive - HIV.E.DE191
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Positive HIV test result from the nucleic acid test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.E.DE191":
  exists "Positive - HIV.E.DE191 Condition"
    or exists "Positive - HIV.E.DE191 Observation"
define "Positive - HIV.E.DE191 Condition":
  [Condition: Concepts."Positive - HIV.E.DE191"]
define "Positive - HIV.E.DE191 Observation":
  [Observation: Concepts."Positive - HIV.E.DE190"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.E.DE191"
/* End of Positive - HIV.E.DE191 */

/*
@dataElement: HIV.E.DE192 - Negative - HIV.E.DE192
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Negative HIV test result from the nucleic acid test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.E.DE192":
  exists "Negative - HIV.E.DE192 Condition"
    or exists "Negative - HIV.E.DE192 Observation"
define "Negative - HIV.E.DE192 Condition":
  [Condition: Concepts."Negative - HIV.E.DE192"]
define "Negative - HIV.E.DE192 Observation":
  [Observation: Concepts."Negative - HIV.E.DE190"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.E.DE192"
/* End of Negative - HIV.E.DE192 */

/*
@dataElement: HIV.E.DE193 - Indeterminate - HIV.E.DE193
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Indeterminate HIV test result from the nucleic acid test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Indeterminate - HIV.E.DE193":
  exists "Indeterminate - HIV.E.DE193 Condition"
    or exists "Indeterminate - HIV.E.DE193 Observation"
define "Indeterminate - HIV.E.DE193 Condition":
  [Condition: Concepts."Indeterminate - HIV.E.DE193"]
define "Indeterminate - HIV.E.DE193 Observation":
  [Observation: Concepts."Indeterminate - HIV.E.DE190"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Indeterminate - HIV.E.DE193"
/* End of Indeterminate - HIV.E.DE193 */

/*
@dataElement: HIV.E.DE194 - Assay number in testing strategy - HIV.E.DE194
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The number of the assay (test kit) in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay number in testing strategy - HIV.E.DE194 Observation":
  [Observation: Concepts."Assay number in testing strategy - HIV.E.DE194"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Assay number in testing strategy - HIV.E.DE194 */

/*
@dataElement: HIV.E.DE195 - Assay 0 - HIV.E.DE195
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: A community outreach test-for-triage or self-test which is not included in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 0 - HIV.E.DE195":
  exists "Assay 0 - HIV.E.DE195 Condition"
    or exists "Assay 0 - HIV.E.DE195 Observation"
define "Assay 0 - HIV.E.DE195 Condition":
  [Condition: Concepts."Assay 0 - HIV.E.DE195"]
define "Assay 0 - HIV.E.DE195 Observation":
  [Observation: Concepts."Assay 0 - HIV.E.DE194"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 0 - HIV.E.DE195"
/* End of Assay 0 - HIV.E.DE195 */

/*
@dataElement: HIV.E.DE196 - Assay 1 - HIV.E.DE196
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The first test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 1 - HIV.E.DE196":
  exists "Assay 1 - HIV.E.DE196 Condition"
    or exists "Assay 1 - HIV.E.DE196 Observation"
define "Assay 1 - HIV.E.DE196 Condition":
  [Condition: Concepts."Assay 1 - HIV.E.DE196"]
define "Assay 1 - HIV.E.DE196 Observation":
  [Observation: Concepts."Assay 1 - HIV.E.DE194"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 1 - HIV.E.DE196"
/* End of Assay 1 - HIV.E.DE196 */

/*
@dataElement: HIV.E.DE197 - Assay 2 - HIV.E.DE197
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The second test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 2 - HIV.E.DE197":
  exists "Assay 2 - HIV.E.DE197 Condition"
    or exists "Assay 2 - HIV.E.DE197 Observation"
define "Assay 2 - HIV.E.DE197 Condition":
  [Condition: Concepts."Assay 2 - HIV.E.DE197"]
define "Assay 2 - HIV.E.DE197 Observation":
  [Observation: Concepts."Assay 2 - HIV.E.DE194"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 2 - HIV.E.DE197"
/* End of Assay 2 - HIV.E.DE197 */

/*
@dataElement: HIV.E.DE198 - Assay 3 - HIV.E.DE198
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The third test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 3 - HIV.E.DE198":
  exists "Assay 3 - HIV.E.DE198 Condition"
    or exists "Assay 3 - HIV.E.DE198 Observation"
define "Assay 3 - HIV.E.DE198 Condition":
  [Condition: Concepts."Assay 3 - HIV.E.DE198"]
define "Assay 3 - HIV.E.DE198 Observation":
  [Observation: Concepts."Assay 3 - HIV.E.DE194"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 3 - HIV.E.DE198"
/* End of Assay 3 - HIV.E.DE198 */

/*
@dataElement: HIV.E.DE199 - Assay 1 repeated - HIV.E.DE199
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The first test in the HIV testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Assay 1 repeated - HIV.E.DE199":
  exists "Assay 1 repeated - HIV.E.DE199 Condition"
    or exists "Assay 1 repeated - HIV.E.DE199 Observation"
define "Assay 1 repeated - HIV.E.DE199 Condition":
  [Condition: Concepts."Assay 1 repeated - HIV.E.DE199"]
define "Assay 1 repeated - HIV.E.DE199 Observation":
  [Observation: Concepts."Assay 1 repeated - HIV.E.DE194"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Assay 1 repeated - HIV.E.DE199"
/* End of Assay 1 repeated - HIV.E.DE199 */

/*
@dataElement: HIV.E.DE200 - Test result of HIV assay 1 - HIV.E.DE200
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 1 - HIV.E.DE200 Observation":
  [Observation: Concepts."Test result of HIV assay 1 - HIV.E.DE200"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 1 - HIV.E.DE200 */

/*
@dataElement: HIV.E.DE201 - Reactive - HIV.E.DE201
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.E.DE201":
  exists "Reactive - HIV.E.DE201 Condition"
    or exists "Reactive - HIV.E.DE201 Observation"
define "Reactive - HIV.E.DE201 Condition":
  [Condition: Concepts."Reactive - HIV.E.DE201"]
define "Reactive - HIV.E.DE201 Observation":
  [Observation: Concepts."Reactive - HIV.E.DE200"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.E.DE201"
/* End of Reactive - HIV.E.DE201 */

/*
@dataElement: HIV.E.DE202 - Non-reactive - HIV.E.DE202
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.E.DE202":
  exists "Non-reactive - HIV.E.DE202 Condition"
    or exists "Non-reactive - HIV.E.DE202 Observation"
define "Non-reactive - HIV.E.DE202 Condition":
  [Condition: Concepts."Non-reactive - HIV.E.DE202"]
define "Non-reactive - HIV.E.DE202 Observation":
  [Observation: Concepts."Non-reactive - HIV.E.DE200"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.E.DE202"
/* End of Non-reactive - HIV.E.DE202 */

/*
@dataElement: HIV.E.DE203 - Invalid - HIV.E.DE203
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.E.DE203":
  exists "Invalid - HIV.E.DE203 Condition"
    or exists "Invalid - HIV.E.DE203 Observation"
define "Invalid - HIV.E.DE203 Condition":
  [Condition: Concepts."Invalid - HIV.E.DE203"]
define "Invalid - HIV.E.DE203 Observation":
  [Observation: Concepts."Invalid - HIV.E.DE200"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.E.DE203"
/* End of Invalid - HIV.E.DE203 */

/*
@dataElement: HIV.E.DE204 - Test result of HIV assay 2 - HIV.E.DE204
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the second HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 2 - HIV.E.DE204 Observation":
  [Observation: Concepts."Test result of HIV assay 2 - HIV.E.DE204"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 2 - HIV.E.DE204 */

/*
@dataElement: HIV.E.DE205 - Reactive - HIV.E.DE205
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.E.DE205":
  exists "Reactive - HIV.E.DE205 Condition"
    or exists "Reactive - HIV.E.DE205 Observation"
define "Reactive - HIV.E.DE205 Condition":
  [Condition: Concepts."Reactive - HIV.E.DE205"]
define "Reactive - HIV.E.DE205 Observation":
  [Observation: Concepts."Reactive - HIV.E.DE204"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.E.DE205"
/* End of Reactive - HIV.E.DE205 */

/*
@dataElement: HIV.E.DE206 - Non-reactive - HIV.E.DE206
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.E.DE206":
  exists "Non-reactive - HIV.E.DE206 Condition"
    or exists "Non-reactive - HIV.E.DE206 Observation"
define "Non-reactive - HIV.E.DE206 Condition":
  [Condition: Concepts."Non-reactive - HIV.E.DE206"]
define "Non-reactive - HIV.E.DE206 Observation":
  [Observation: Concepts."Non-reactive - HIV.E.DE204"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.E.DE206"
/* End of Non-reactive - HIV.E.DE206 */

/*
@dataElement: HIV.E.DE207 - Invalid - HIV.E.DE207
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.E.DE207":
  exists "Invalid - HIV.E.DE207 Condition"
    or exists "Invalid - HIV.E.DE207 Observation"
define "Invalid - HIV.E.DE207 Condition":
  [Condition: Concepts."Invalid - HIV.E.DE207"]
define "Invalid - HIV.E.DE207 Observation":
  [Observation: Concepts."Invalid - HIV.E.DE204"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.E.DE207"
/* End of Invalid - HIV.E.DE207 */

/*
@dataElement: HIV.E.DE208 - Test result of HIV assay 3 - HIV.E.DE208
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the third HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 3 - HIV.E.DE208 Observation":
  [Observation: Concepts."Test result of HIV assay 3 - HIV.E.DE208"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 3 - HIV.E.DE208 */

/*
@dataElement: HIV.E.DE209 - Reactive - HIV.E.DE209
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.E.DE209":
  exists "Reactive - HIV.E.DE209 Condition"
    or exists "Reactive - HIV.E.DE209 Observation"
define "Reactive - HIV.E.DE209 Condition":
  [Condition: Concepts."Reactive - HIV.E.DE209"]
define "Reactive - HIV.E.DE209 Observation":
  [Observation: Concepts."Reactive - HIV.E.DE208"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.E.DE209"
/* End of Reactive - HIV.E.DE209 */

/*
@dataElement: HIV.E.DE210 - Non-reactive - HIV.E.DE210
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.E.DE210":
  exists "Non-reactive - HIV.E.DE210 Condition"
    or exists "Non-reactive - HIV.E.DE210 Observation"
define "Non-reactive - HIV.E.DE210 Condition":
  [Condition: Concepts."Non-reactive - HIV.E.DE210"]
define "Non-reactive - HIV.E.DE210 Observation":
  [Observation: Concepts."Non-reactive - HIV.E.DE208"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.E.DE210"
/* End of Non-reactive - HIV.E.DE210 */

/*
@dataElement: HIV.E.DE211 - Invalid - HIV.E.DE211
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.E.DE211":
  exists "Invalid - HIV.E.DE211 Condition"
    or exists "Invalid - HIV.E.DE211 Observation"
define "Invalid - HIV.E.DE211 Condition":
  [Condition: Concepts."Invalid - HIV.E.DE211"]
define "Invalid - HIV.E.DE211 Observation":
  [Observation: Concepts."Invalid - HIV.E.DE208"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.E.DE211"
/* End of Invalid - HIV.E.DE211 */

/*
@dataElement: HIV.E.DE212 - Test result of HIV assay 1 repeated - HIV.E.DE212
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the repeated first HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 1 repeated - HIV.E.DE212 Observation":
  [Observation: Concepts."Test result of HIV assay 1 repeated - HIV.E.DE212"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 1 repeated - HIV.E.DE212 */

/*
@dataElement: HIV.E.DE213 - Reactive - HIV.E.DE213
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.E.DE213":
  exists "Reactive - HIV.E.DE213 Condition"
    or exists "Reactive - HIV.E.DE213 Observation"
define "Reactive - HIV.E.DE213 Condition":
  [Condition: Concepts."Reactive - HIV.E.DE213"]
define "Reactive - HIV.E.DE213 Observation":
  [Observation: Concepts."Reactive - HIV.E.DE212"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.E.DE213"
/* End of Reactive - HIV.E.DE213 */

/*
@dataElement: HIV.E.DE214 - Non-reactive - HIV.E.DE214
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.E.DE214":
  exists "Non-reactive - HIV.E.DE214 Condition"
    or exists "Non-reactive - HIV.E.DE214 Observation"
define "Non-reactive - HIV.E.DE214 Condition":
  [Condition: Concepts."Non-reactive - HIV.E.DE214"]
define "Non-reactive - HIV.E.DE214 Observation":
  [Observation: Concepts."Non-reactive - HIV.E.DE212"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.E.DE214"
/* End of Non-reactive - HIV.E.DE214 */

/*
@dataElement: HIV.E.DE215 - Invalid - HIV.E.DE215
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.E.DE215":
  exists "Invalid - HIV.E.DE215 Condition"
    or exists "Invalid - HIV.E.DE215 Observation"
define "Invalid - HIV.E.DE215 Condition":
  [Condition: Concepts."Invalid - HIV.E.DE215"]
define "Invalid - HIV.E.DE215 Observation":
  [Observation: Concepts."Invalid - HIV.E.DE212"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.E.DE215"
/* End of Invalid - HIV.E.DE215 */

/*
@dataElement: HIV.E.DE216 - Test result of syphilis assay 1
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first syphilis assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of syphilis assay 1 Observation":
  [Observation: Concepts."Test result of syphilis assay 1"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of syphilis assay 1 */

/*
@dataElement: HIV.E.DE217 - Reactive - HIV.E.DE217
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first syphilis assay in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.E.DE217":
  exists "Reactive - HIV.E.DE217 Condition"
    or exists "Reactive - HIV.E.DE217 Observation"
define "Reactive - HIV.E.DE217 Condition":
  [Condition: Concepts."Reactive - HIV.E.DE217"]
define "Reactive - HIV.E.DE217 Observation":
  [Observation: Concepts."Reactive - HIV.E.DE216"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.E.DE217"
/* End of Reactive - HIV.E.DE217 */

/*
@dataElement: HIV.E.DE218 - Non-reactive - HIV.E.DE218
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first syphilis assay in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.E.DE218":
  exists "Non-reactive - HIV.E.DE218 Condition"
    or exists "Non-reactive - HIV.E.DE218 Observation"
define "Non-reactive - HIV.E.DE218 Condition":
  [Condition: Concepts."Non-reactive - HIV.E.DE218"]
define "Non-reactive - HIV.E.DE218 Observation":
  [Observation: Concepts."Non-reactive - HIV.E.DE216"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.E.DE218"
/* End of Non-reactive - HIV.E.DE218 */

/*
@dataElement: HIV.E.DE219 - Invalid - HIV.E.DE219
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the HIV assay in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.E.DE219":
  exists "Invalid - HIV.E.DE219 Condition"
    or exists "Invalid - HIV.E.DE219 Observation"
define "Invalid - HIV.E.DE219 Condition":
  [Condition: Concepts."Invalid - HIV.E.DE219"]
define "Invalid - HIV.E.DE219 Observation":
  [Observation: Concepts."Invalid - HIV.E.DE216"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.E.DE219"
/* End of Invalid - HIV.E.DE219 */

/*
@dataElement: HIV.E.DE220 - Test result of syphilis assay 1 repeated
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first syphilis assay repeated in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of syphilis assay 1 repeated Observation":
  [Observation: Concepts."Test result of syphilis assay 1 repeated"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of syphilis assay 1 repeated */

/*
@dataElement: HIV.E.DE221 - Reactive - HIV.E.DE221
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first syphilis assay repeated in the testing strategy was reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reactive - HIV.E.DE221":
  exists "Reactive - HIV.E.DE221 Condition"
    or exists "Reactive - HIV.E.DE221 Observation"
define "Reactive - HIV.E.DE221 Condition":
  [Condition: Concepts."Reactive - HIV.E.DE221"]
define "Reactive - HIV.E.DE221 Observation":
  [Observation: Concepts."Reactive - HIV.E.DE220"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Reactive - HIV.E.DE221"
/* End of Reactive - HIV.E.DE221 */

/*
@dataElement: HIV.E.DE222 - Non-reactive - HIV.E.DE222
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first syphilis assay repeated in the testing strategy was non-reactive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Non-reactive - HIV.E.DE222":
  exists "Non-reactive - HIV.E.DE222 Condition"
    or exists "Non-reactive - HIV.E.DE222 Observation"
define "Non-reactive - HIV.E.DE222 Condition":
  [Condition: Concepts."Non-reactive - HIV.E.DE222"]
define "Non-reactive - HIV.E.DE222 Observation":
  [Observation: Concepts."Non-reactive - HIV.E.DE220"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Non-reactive - HIV.E.DE222"
/* End of Non-reactive - HIV.E.DE222 */

/*
@dataElement: HIV.E.DE223 - Invalid - HIV.E.DE223
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first syphilis assay repeated in the testing strategy was invalid
*/
// TODO: Replace placeholder with relevant CQL logic
define "Invalid - HIV.E.DE223":
  exists "Invalid - HIV.E.DE223 Condition"
    or exists "Invalid - HIV.E.DE223 Observation"
define "Invalid - HIV.E.DE223 Condition":
  [Condition: Concepts."Invalid - HIV.E.DE223"]
define "Invalid - HIV.E.DE223 Observation":
  [Observation: Concepts."Invalid - HIV.E.DE220"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Invalid - HIV.E.DE223"
/* End of Invalid - HIV.E.DE223 */

/*
@dataElement: HIV.E.DE224 - HIV test date - HIV.E.DE224
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Date of the HIV test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test date - HIV.E.DE224":
  [Observation: Concepts."HIV test date - HIV.E.DE224"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV test date - HIV.E.DE224 */

/*
@dataElement: HIV.E.DE225 - Infant HIV status
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: HIV status reported after applying the HIV testing algorithm. No single HIV test can provide an HIV-positive diagnosis.
*/
// TODO: Replace placeholder with relevant CQL logic
define "Infant HIV status Observation":
  [Observation: Concepts."Infant HIV status"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Infant HIV status */

/*
@dataElement: HIV.E.DE226 - HIV-positive - HIV.E.DE226
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Infant is HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive - HIV.E.DE226":
  exists "HIV-positive - HIV.E.DE226 Condition"
    or exists "HIV-positive - HIV.E.DE226 Observation"
define "HIV-positive - HIV.E.DE226 Condition":
  [Condition: Concepts."HIV-positive - HIV.E.DE226"]
define "HIV-positive - HIV.E.DE226 Observation":
  [Observation: Concepts."HIV-positive - HIV.E.DE225"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive - HIV.E.DE226"
/* End of HIV-positive - HIV.E.DE226 */

/*
@dataElement: HIV.E.DE227 - HIV-negative - HIV.E.DE227
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Infant is HIV-negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-negative - HIV.E.DE227":
  exists "HIV-negative - HIV.E.DE227 Condition"
    or exists "HIV-negative - HIV.E.DE227 Observation"
define "HIV-negative - HIV.E.DE227 Condition":
  [Condition: Concepts."HIV-negative - HIV.E.DE227"]
define "HIV-negative - HIV.E.DE227 Observation":
  [Observation: Concepts."HIV-negative - HIV.E.DE225"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-negative - HIV.E.DE227"
/* End of HIV-negative - HIV.E.DE227 */

/*
@dataElement: HIV.E.DE228 - Unknown - HIV.E.DE228
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Infant has unknown HIV status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unknown - HIV.E.DE228":
  exists "Unknown - HIV.E.DE228 Condition"
    or exists "Unknown - HIV.E.DE228 Observation"
define "Unknown - HIV.E.DE228 Condition":
  [Condition: Concepts."Unknown - HIV.E.DE228"]
define "Unknown - HIV.E.DE228 Observation":
  [Observation: Concepts."Unknown - HIV.E.DE225"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unknown - HIV.E.DE228"
/* End of Unknown - HIV.E.DE228 */

/*
@dataElement: HIV.E.DE229 - Infant ART start date
@activity: HIV.F16 Immediately start infant on ART
@description: The date on which the infant was started or restarted on antiretroviral therapy (ART)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Infant ART start date":
  [Observation: Concepts."Infant ART start date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Infant ART start date */

/*
@dataElement: HIV.E.DE230 - Final diagnosis of HIV-exposed infant - HIV.E.DE230
@activity: HIV.F20 Record infant's/child's final HIV diagnosis
@description: HIV-exposed infant final status at 18 months or 3 months after cessation of breastfeeding (whichever is later).
*/
// TODO: Replace placeholder with relevant CQL logic
define "Final diagnosis of HIV-exposed infant - HIV.E.DE230 Observation":
  [Observation: Concepts."Final diagnosis of HIV-exposed infant - HIV.E.DE230"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Final diagnosis of HIV-exposed infant - HIV.E.DE230 */

/*
@dataElement: HIV.E.DE231 - HIV-positive - HIV.E.DE231
@activity: HIV.F20 Record infant's/child's final HIV diagnosis
@description: The infant is HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive - HIV.E.DE231":
  exists "HIV-positive - HIV.E.DE231 Condition"
    or exists "HIV-positive - HIV.E.DE231 Observation"
define "HIV-positive - HIV.E.DE231 Condition":
  [Condition: Concepts."HIV-positive - HIV.E.DE231"]
define "HIV-positive - HIV.E.DE231 Observation":
  [Observation: Concepts."HIV-positive - HIV.E.DE230"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive - HIV.E.DE231"
/* End of HIV-positive - HIV.E.DE231 */

/*
@dataElement: HIV.E.DE232 - HIV-negative and no longer breastfeeding
@activity: HIV.F20 Record infant's/child's final HIV diagnosis
@description: The infant is HIV-negative and the mother has quit breastfeeding
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-negative and no longer breastfeeding":
  exists "HIV-negative and no longer breastfeeding Condition"
    or exists "HIV-negative and no longer breastfeeding Observation"
define "HIV-negative and no longer breastfeeding Condition":
  [Condition: Concepts."HIV-negative and no longer breastfeeding"]
define "HIV-negative and no longer breastfeeding Observation":
  [Observation: Concepts."HIV-negative and no longer breastfeeding"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-negative and no longer breastfeeding"
/* End of HIV-negative and no longer breastfeeding */

/*
@dataElement: HIV.E.DE233 - HIV status unknown
@activity: HIV.F20 Record infant's/child's final HIV diagnosis
@description: The final HIV status of the child is unknown because the infant died, was lost to follow-up or transferred out without ever having an HIV-positive diagnosis or is active in care but was not tested at 18 months
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV status unknown":
  exists "HIV status unknown Condition"
    or exists "HIV status unknown Observation"
define "HIV status unknown Condition":
  [Condition: Concepts."HIV status unknown"]
define "HIV status unknown Observation":
  [Observation: Concepts."HIV status unknown"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV status unknown"
/* End of HIV status unknown */

/*
@dataElement: HIV.G.DE1 - CD4 count - HIV.G.DE1
@activity: HIV.D20 Diagnostics
@description: CD4 cell count in cells/mm^3
*/
// TODO: Replace placeholder with relevant CQL logic
define "CD4 count - HIV.G.DE1":
  [Observation: Concepts."CD4 count - HIV.G.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of CD4 count - HIV.G.DE1 */

/*
@dataElement: HIV.G.DE3 - Baseline CD4 count - HIV.G.DE3
@activity: HIV.D20 Diagnostics
@description: CD4 count performed at HIV diagnosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Baseline CD4 count - HIV.G.DE3":
  [Observation: Concepts."Baseline CD4 count - HIV.G.DE3"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Baseline CD4 count - HIV.G.DE3 */

/*
@dataElement: HIV.G.DE8 - Date of viral load sample collection - HIV.G.DE8
@activity: HIV.D20 Diagnostics
@description: Date and time when the sample was collected to test the client's HIV viral load
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of viral load sample collection - HIV.G.DE8":
  [Observation: Concepts."Date of viral load sample collection - HIV.G.DE8"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of viral load sample collection - HIV.G.DE8 */

/*
@dataElement: HIV.G.DE12 - Viral load test result - HIV.G.DE12
@activity: HIV.D20 Diagnostics
@description: Result from the viral load test in number of copies/mL
*/
// TODO: Replace placeholder with relevant CQL logic
define "Viral load test result - HIV.G.DE12":
  [Observation: Concepts."Viral load test result - HIV.G.DE12"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Viral load test result - HIV.G.DE12 */

/*
@dataElement: HIV.G.DE17 - HBsAg test date - HIV.G.DE17
@activity: HIV.D20 Diagnostics
@description: Date client was tested for hepatitis B virus (HBV)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HBsAg test date - HIV.G.DE17":
  [Observation: Concepts."HBsAg test date - HIV.G.DE17"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HBsAg test date - HIV.G.DE17 */

/*
@dataElement: HIV.G.DE18 - HBsAg test result - HIV.G.DE18
@activity: HIV.D20 Diagnostics
@description: Hepatitis B virus test result (HBsAg)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HBsAg test result - HIV.G.DE18 Observation":
  [Observation: Concepts."HBsAg test result - HIV.G.DE18"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HBsAg test result - HIV.G.DE18 */

/*
@dataElement: HIV.G.DE19 - Positive - HIV.G.DE19
@activity: HIV.D20 Diagnostics
@description: HBsAg test result was positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.G.DE19":
  exists "Positive - HIV.G.DE19 Condition"
    or exists "Positive - HIV.G.DE19 Observation"
define "Positive - HIV.G.DE19 Condition":
  [Condition: Concepts."Positive - HIV.G.DE19"]
define "Positive - HIV.G.DE19 Observation":
  [Observation: Concepts."Positive - HIV.G.DE18"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.G.DE19"
/* End of Positive - HIV.G.DE19 */

/*
@dataElement: HIV.G.DE20 - Negative - HIV.G.DE20
@activity: HIV.D20 Diagnostics
@description: HBsAg test result was negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.G.DE20":
  exists "Negative - HIV.G.DE20 Condition"
    or exists "Negative - HIV.G.DE20 Observation"
define "Negative - HIV.G.DE20 Condition":
  [Condition: Concepts."Negative - HIV.G.DE20"]
define "Negative - HIV.G.DE20 Observation":
  [Observation: Concepts."Negative - HIV.G.DE18"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.G.DE20"
/* End of Negative - HIV.G.DE20 */

/*
@dataElement: HIV.G.DE21 - Indeterminate - HIV.G.DE21
@activity: HIV.D20 Diagnostics
@description: HBsAg test result was indeterminate
*/
// TODO: Replace placeholder with relevant CQL logic
define "Indeterminate - HIV.G.DE21":
  exists "Indeterminate - HIV.G.DE21 Condition"
    or exists "Indeterminate - HIV.G.DE21 Observation"
define "Indeterminate - HIV.G.DE21 Condition":
  [Condition: Concepts."Indeterminate - HIV.G.DE21"]
define "Indeterminate - HIV.G.DE21 Observation":
  [Observation: Concepts."Indeterminate - HIV.G.DE18"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Indeterminate - HIV.G.DE21"
/* End of Indeterminate - HIV.G.DE21 */

/*
@dataElement: HIV.G.DE42 - HCV test date - HIV.G.DE42
@activity: HIV.D20 Diagnostics
@description: Date client was tested for hepatitis C virus (HCV antibody, HCV RNA or HCV core antigen)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV test date - HIV.G.DE42":
  [Observation: Concepts."HCV test date - HIV.G.DE42"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HCV test date - HIV.G.DE42 */

/*
@dataElement: HIV.G.DE43 - HCV test result - HIV.G.DE43
@activity: HIV.D20 Diagnostics
@description: Hepatitis C virus test result (HCV antibody, HCV RNA or HCV core antigen)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV test result - HIV.G.DE43 Observation":
  [Observation: Concepts."HCV test result - HIV.G.DE43"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HCV test result - HIV.G.DE43 */

/*
@dataElement: HIV.G.DE44 - Positive - HIV.G.DE44
@activity: HIV.D20 Diagnostics
@description: HCV test result was positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.G.DE44":
  exists "Positive - HIV.G.DE44 Condition"
    or exists "Positive - HIV.G.DE44 Observation"
define "Positive - HIV.G.DE44 Condition":
  [Condition: Concepts."Positive - HIV.G.DE44"]
define "Positive - HIV.G.DE44 Observation":
  [Observation: Concepts."Positive - HIV.G.DE43"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.G.DE44"
/* End of Positive - HIV.G.DE44 */

/*
@dataElement: HIV.G.DE45 - Negative - HIV.G.DE45
@activity: HIV.D20 Diagnostics
@description: HCV test result was negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.G.DE45":
  exists "Negative - HIV.G.DE45 Condition"
    or exists "Negative - HIV.G.DE45 Observation"
define "Negative - HIV.G.DE45 Condition":
  [Condition: Concepts."Negative - HIV.G.DE45"]
define "Negative - HIV.G.DE45 Observation":
  [Observation: Concepts."Negative - HIV.G.DE43"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.G.DE45"
/* End of Negative - HIV.G.DE45 */

/*
@dataElement: HIV.G.DE46 - Indeterminate - HIV.G.DE46
@activity: HIV.D20 Diagnostics
@description: HCV test result was indeterminate
*/
// TODO: Replace placeholder with relevant CQL logic
define "Indeterminate - HIV.G.DE46":
  exists "Indeterminate - HIV.G.DE46 Condition"
    or exists "Indeterminate - HIV.G.DE46 Observation"
define "Indeterminate - HIV.G.DE46 Condition":
  [Condition: Concepts."Indeterminate - HIV.G.DE46"]
define "Indeterminate - HIV.G.DE46 Observation":
  [Observation: Concepts."Indeterminate - HIV.G.DE43"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Indeterminate - HIV.G.DE46"
/* End of Indeterminate - HIV.G.DE46 */

/*
@dataElement: HIV.G.DE47 - HCV viral load test date - HIV.G.DE47
@activity: HIV.D20 Diagnostics
@description: Hepatitis C viral load test date
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV viral load test date - HIV.G.DE47":
  [Observation: Concepts."HCV viral load test date - HIV.G.DE47"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HCV viral load test date - HIV.G.DE47 */

/*
@dataElement: HIV.G.DE48 - HCV viral load test result - HIV.G.DE48
@activity: HIV.D20 Diagnostics
@description: Hepatitis C viral load test result (qualitative)
*/
// TODO: Replace placeholder with relevant CQL logic
define "HCV viral load test result - HIV.G.DE48 Observation":
  [Observation: Concepts."HCV viral load test result - HIV.G.DE48"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HCV viral load test result - HIV.G.DE48 */

/*
@dataElement: HIV.G.DE49 - Detected - HIV.G.DE49
@activity: HIV.D20 Diagnostics
@description: HCV was detected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Detected - HIV.G.DE49":
  exists "Detected - HIV.G.DE49 Condition"
    or exists "Detected - HIV.G.DE49 Observation"
define "Detected - HIV.G.DE49 Condition":
  [Condition: Concepts."Detected - HIV.G.DE49"]
define "Detected - HIV.G.DE49 Observation":
  [Observation: Concepts."Detected - HIV.G.DE48"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Detected - HIV.G.DE49"
/* End of Detected - HIV.G.DE49 */

/*
@dataElement: HIV.G.DE50 - Not detected - HIV.G.DE50
@activity: HIV.D20 Diagnostics
@description: HCV was not detected
*/
// TODO: Replace placeholder with relevant CQL logic
define "Not detected - HIV.G.DE50":
  exists "Not detected - HIV.G.DE50 Condition"
    or exists "Not detected - HIV.G.DE50 Observation"
define "Not detected - HIV.G.DE50 Condition":
  [Condition: Concepts."Not detected - HIV.G.DE50"]
define "Not detected - HIV.G.DE50 Observation":
  [Observation: Concepts."Not detected - HIV.G.DE48"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Not detected - HIV.G.DE50"
/* End of Not detected - HIV.G.DE50 */

/*
@dataElement: HIV.G.DE69 - Syphilis test date - HIV.G.DE69
@activity: HIV.D20 Diagnostics
@description: Date of syphilis test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis test date - HIV.G.DE69":
  [Observation: Concepts."Syphilis test date - HIV.G.DE69"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Syphilis test date - HIV.G.DE69 */

/*
@dataElement: HIV.G.DE70 - Syphilis test result - HIV.G.DE70
@activity: HIV.D20 Diagnostics
@description: Result from syphilis test
*/
// TODO: Replace placeholder with relevant CQL logic
define "Syphilis test result - HIV.G.DE70 Observation":
  [Observation: Concepts."Syphilis test result - HIV.G.DE70"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Syphilis test result - HIV.G.DE70 */

/*
@dataElement: HIV.G.DE71 - Positive - HIV.G.DE71
@activity: HIV.D20 Diagnostics
@description: Test result is positive for syphilis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Positive - HIV.G.DE71":
  exists "Positive - HIV.G.DE71 Condition"
    or exists "Positive - HIV.G.DE71 Observation"
define "Positive - HIV.G.DE71 Condition":
  [Condition: Concepts."Positive - HIV.G.DE71"]
define "Positive - HIV.G.DE71 Observation":
  [Observation: Concepts."Positive - HIV.G.DE70"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Positive - HIV.G.DE71"
/* End of Positive - HIV.G.DE71 */

/*
@dataElement: HIV.G.DE72 - Negative - HIV.G.DE72
@activity: HIV.D20 Diagnostics
@description: Test result is negative for syphilis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.G.DE72":
  exists "Negative - HIV.G.DE72 Condition"
    or exists "Negative - HIV.G.DE72 Observation"
define "Negative - HIV.G.DE72 Condition":
  [Condition: Concepts."Negative - HIV.G.DE72"]
define "Negative - HIV.G.DE72 Observation":
  [Observation: Concepts."Negative - HIV.G.DE70"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.G.DE72"
/* End of Negative - HIV.G.DE72 */

/*
@dataElement: HIV.G.DE73 - Inconclusive - HIV.G.DE73
@activity: HIV.D20 Diagnostics
@description: Test result is inconclusive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Inconclusive - HIV.G.DE73":
  exists "Inconclusive - HIV.G.DE73 Condition"
    or exists "Inconclusive - HIV.G.DE73 Observation"
define "Inconclusive - HIV.G.DE73 Condition":
  [Condition: Concepts."Inconclusive - HIV.G.DE73"]
define "Inconclusive - HIV.G.DE73 Observation":
  [Observation: Concepts."Inconclusive - HIV.G.DE70"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Inconclusive - HIV.G.DE73"
/* End of Inconclusive - HIV.G.DE73 */

/*
@dataElement: HIV.H.DE34 - HIV status of partner or contact
@activity: HIV.B6 Capture or update client history
@description: HIV status of the partner or contact given by the index case
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV status of partner or contact Observation":
  [Observation: Concepts."HIV status of partner or contact"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV status of partner or contact */

/*
@dataElement: HIV.H.DE35 - Already knew positive
@activity: HIV.B6 Capture or update client history
@description: The partner or contact of the index case already knew they are HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Already knew positive":
  exists "Already knew positive Condition"
    or exists "Already knew positive Observation"
define "Already knew positive Condition":
  [Condition: Concepts."Already knew positive"]
define "Already knew positive Observation":
  [Observation: Concepts."Already knew positive"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Already knew positive"
/* End of Already knew positive */

/*
@dataElement: HIV.H.DE36 - Newly diagnosed
@activity: HIV.B6 Capture or update client history
@description: The partner or contact of the index case is newly diagnosed as HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "Newly diagnosed":
  exists "Newly diagnosed Condition"
    or exists "Newly diagnosed Observation"
define "Newly diagnosed Condition":
  [Condition: Concepts."Newly diagnosed"]
define "Newly diagnosed Observation":
  [Observation: Concepts."Newly diagnosed"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Newly diagnosed"
/* End of Newly diagnosed */

/*
@dataElement: HIV.H.DE37 - Negative - HIV.H.DE37
@activity: HIV.B6 Capture or update client history
@description: The partner or contact of the index case is newly diagnosed is HIV-negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "Negative - HIV.H.DE37":
  exists "Negative - HIV.H.DE37 Condition"
    or exists "Negative - HIV.H.DE37 Observation"
define "Negative - HIV.H.DE37 Condition":
  [Condition: Concepts."Negative - HIV.H.DE37"]
define "Negative - HIV.H.DE37 Observation":
  [Observation: Concepts."Negative - HIV.H.DE34"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Negative - HIV.H.DE37"
/* End of Negative - HIV.H.DE37 */

/*
@dataElement: HIV.H.DE41 - HIV treatment outcome
@activity: HIV.H3 Record outreach and result
@description: The outcome for the client which is used for reporting retention/attrition.
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV treatment outcome Observation":
  [Observation: Concepts."HIV treatment outcome"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV treatment outcome */

/*
@dataElement: HIV.H.DE42 - Lost to follow-up
@activity: HIV.H3 Record outreach and result
@description: Twenty-eight days or more since last missed appointment 
*/
// TODO: Replace placeholder with relevant CQL logic
define "Lost to follow-up":
  exists "Lost to follow-up Condition"
    or exists "Lost to follow-up Observation"
define "Lost to follow-up Condition":
  [Condition: Concepts."Lost to follow-up"]
define "Lost to follow-up Observation":
  [Observation: Concepts."Lost to follow-up"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Lost to follow-up"
/* End of Lost to follow-up */

/*
@dataElement: HIV.H.DE43 - Transferred out
@activity: HIV.H3 Record outreach and result
@description: The client transferred to another facility
*/
// TODO: Replace placeholder with relevant CQL logic
define "Transferred out":
  exists "Transferred out Condition"
    or exists "Transferred out Observation"
define "Transferred out Condition":
  [Condition: Concepts."Transferred out"]
define "Transferred out Observation":
  [Observation: Concepts."Transferred out"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Transferred out"
/* End of Transferred out */

/*
@dataElement: HIV.H.DE44 - Death documented
@activity: HIV.H3 Record outreach and result
@description: People living with HIV previously on ART who are confirmed to have died from any cause
*/
// TODO: Replace placeholder with relevant CQL logic
define "Death documented":
  exists "Death documented Condition"
    or exists "Death documented Observation"
define "Death documented Condition":
  [Condition: Concepts."Death documented"]
define "Death documented Observation":
  [Observation: Concepts."Death documented"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Death documented"
/* End of Death documented */

/*
@dataElement: HIV.H.DE45 - Refused stopped treatment
@activity: HIV.H3 Record outreach and result
@description: Client was contacted and confirmed to have stopped ART (reasons may include stigma and discrimination, faith healing, etc.)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Refused stopped treatment":
  exists "Refused stopped treatment Condition"
    or exists "Refused stopped treatment Observation"
define "Refused stopped treatment Condition":
  [Condition: Concepts."Refused stopped treatment"]
define "Refused stopped treatment Observation":
  [Observation: Concepts."Refused stopped treatment"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Refused stopped treatment"
/* End of Refused stopped treatment */

/*
@dataElement: HIV.H.DE47 - On ART - HIV.H.DE47
@activity: HIV.H3 Record outreach and result
@description: Client is currently taking ART 
*/
// TODO: Replace placeholder with relevant CQL logic
define "On ART - HIV.H.DE47":
  [Observation: Concepts."On ART - HIV.H.DE47"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of On ART - HIV.H.DE47 */

/*
@dataElement: HIV.H.DE73 - Date ART stopped - HIV.H.DE73
@activity: HIV.H3 Record outreach and result
@description: Date on which client stopped ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date ART stopped - HIV.H.DE73":
  [Observation: Concepts."Date ART stopped - HIV.H.DE73"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date ART stopped - HIV.H.DE73 */

/*
@dataElement: HIV.H.DE74 - Reason ART stopped - HIV.H.DE74
@activity: HIV.H3 Record outreach and result
@description: Reason why client intentionally stopped ART
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reason ART stopped - HIV.H.DE74 Observation":
  [Observation: Concepts."Reason ART stopped - HIV.H.DE74"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Reason ART stopped - HIV.H.DE74 */

/*
@dataElement: HIV.H.DE75 - Toxicity/side effects - HIV.H.DE75
@activity: HIV.H3 Record outreach and result
@description: Client stopped ART because of toxicity/side effects
*/
// TODO: Replace placeholder with relevant CQL logic
define "Toxicity/side effects - HIV.H.DE75":
  exists "Toxicity/side effects - HIV.H.DE75 Condition"
    or exists "Toxicity/side effects - HIV.H.DE75 Observation"
define "Toxicity/side effects - HIV.H.DE75 Condition":
  [Condition: Concepts."Toxicity/side effects - HIV.H.DE75"]
define "Toxicity/side effects - HIV.H.DE75 Observation":
  [Observation: Concepts."Toxicity/side effects - HIV.H.DE74"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Toxicity/side effects - HIV.H.DE75"
/* End of Toxicity/side effects - HIV.H.DE75 */

/*
@dataElement: HIV.H.DE76 - Severe illness, hospitalization - HIV.H.DE76
@activity: HIV.H3 Record outreach and result
@description: Client stopped ART because of severe illness, hospitalization
*/
// TODO: Replace placeholder with relevant CQL logic
define "Severe illness, hospitalization - HIV.H.DE76":
  exists "Severe illness, hospitalization - HIV.H.DE76 Condition"
    or exists "Severe illness, hospitalization - HIV.H.DE76 Observation"
define "Severe illness, hospitalization - HIV.H.DE76 Condition":
  [Condition: Concepts."Severe illness, hospitalization - HIV.H.DE76"]
define "Severe illness, hospitalization - HIV.H.DE76 Observation":
  [Observation: Concepts."Severe illness, hospitalization - HIV.H.DE74"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Severe illness, hospitalization - HIV.H.DE76"
/* End of Severe illness, hospitalization - HIV.H.DE76 */

/*
@dataElement: HIV.H.DE77 - Drugs out of stock 
@activity: HIV.H3 Record outreach and result
@description: Client stopped ART because of drugs being out of stock 
*/
// TODO: Replace placeholder with relevant CQL logic
define "Drugs out of stock ":
  exists "Drugs out of stock  Condition"
    or exists "Drugs out of stock  Observation"
define "Drugs out of stock  Condition":
  [Condition: Concepts."Drugs out of stock "]
define "Drugs out of stock  Observation":
  [Observation: Concepts."Drugs out of stock "] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Drugs out of stock "
/* End of Drugs out of stock  */

/*
@dataElement: HIV.H.DE78 - Client lacks finances 
@activity: HIV.H3 Record outreach and result
@description: Client stopped ART because client lacked finances 
*/
// TODO: Replace placeholder with relevant CQL logic
define "Client lacks finances ":
  exists "Client lacks finances  Condition"
    or exists "Client lacks finances  Observation"
define "Client lacks finances  Condition":
  [Condition: Concepts."Client lacks finances "]
define "Client lacks finances  Observation":
  [Observation: Concepts."Client lacks finances "] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Client lacks finances "
/* End of Client lacks finances  */

/*
@dataElement: HIV.H.DE79 - Excluded HIV infection in infant - HIV.H.DE79
@activity: HIV.H3 Record outreach and result
@description: Client stopped ART because the infant was determined to not have HIV
*/
// TODO: Replace placeholder with relevant CQL logic
define "Excluded HIV infection in infant - HIV.H.DE79":
  exists "Excluded HIV infection in infant - HIV.H.DE79 Condition"
    or exists "Excluded HIV infection in infant - HIV.H.DE79 Observation"
define "Excluded HIV infection in infant - HIV.H.DE79 Condition":
  [Condition: Concepts."Excluded HIV infection in infant - HIV.H.DE79"]
define "Excluded HIV infection in infant - HIV.H.DE79 Observation":
  [Observation: Concepts."Excluded HIV infection in infant - HIV.H.DE74"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Excluded HIV infection in infant - HIV.H.DE79"
/* End of Excluded HIV infection in infant - HIV.H.DE79 */

/*
@dataElement: HIV.H.DE80 - Other reason for stopping ART - HIV.H.DE80
@activity: HIV.H3 Record outreach and result
@description: Client stopped ART for other reason
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other reason for stopping ART - HIV.H.DE80":
  exists "Other reason for stopping ART - HIV.H.DE80 Condition"
    or exists "Other reason for stopping ART - HIV.H.DE80 Observation"
define "Other reason for stopping ART - HIV.H.DE80 Condition":
  [Condition: Concepts."Other reason for stopping ART - HIV.H.DE80"]
define "Other reason for stopping ART - HIV.H.DE80 Observation":
  [Observation: Concepts."Other reason for stopping ART - HIV.H.DE74"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other reason for stopping ART - HIV.H.DE80"
/* End of Other reason for stopping ART - HIV.H.DE80 */

/*
@dataElement: HIV.PRV.DE1 - At elevated risk for HIV acquisition - HIV.PRV.DE1
@activity: HIV.B6 Capture or update client history
@description: Client is at elevated risk for HIV acquisition, defined according to country/programme context
*/
// TODO: Replace placeholder with relevant CQL logic
define "At elevated risk for HIV acquisition - HIV.PRV.DE1":
  [Observation: Concepts."At elevated risk for HIV acquisition - HIV.PRV.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of At elevated risk for HIV acquisition - HIV.PRV.DE1 */

/*
@dataElement: HIV.PRV.DE2 - HIV prevention intervention
@activity: HIV.B6 Capture or update client history
@description: HIV prevention intervention that client accessed
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV prevention intervention Observation":
  [Observation: Concepts."HIV prevention intervention"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV prevention intervention */

/*
@dataElement: HIV.PRV.DE3 - PrEP service
@activity: HIV.B6 Capture or update client history
@description: Client accessed PrEP services
*/
// TODO: Replace placeholder with relevant CQL logic
define "PrEP service":
  exists "PrEP service Condition"
    or exists "PrEP service Observation"
define "PrEP service Condition":
  [Condition: Concepts."PrEP service"]
define "PrEP service Observation":
  [Observation: Concepts."PrEP service"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."PrEP service"
/* End of PrEP service */

/*
@dataElement: HIV.PRV.DE4 - OAMT
@activity: HIV.B6 Capture or update client history
@description: Client accessed opioid agonist maintenance treatment (OAMT) services
*/
// TODO: Replace placeholder with relevant CQL logic
define "OAMT":
  exists "OAMT Condition"
    or exists "OAMT Observation"
define "OAMT Condition":
  [Condition: Concepts."OAMT"]
define "OAMT Observation":
  [Observation: Concepts."OAMT"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."OAMT"
/* End of OAMT */

/*
@dataElement: HIV.PRV.DE5 - NSP
@activity: HIV.B6 Capture or update client history
@description: Client accessed needle-syringe programme (NSP) services
*/
// TODO: Replace placeholder with relevant CQL logic
define "NSP":
  exists "NSP Condition"
    or exists "NSP Observation"
define "NSP Condition":
  [Condition: Concepts."NSP"]
define "NSP Observation":
  [Observation: Concepts."NSP"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."NSP"
/* End of NSP */

/*
@dataElement: HIV.PRV.DE6 - STI services
@activity: HIV.B6 Capture or update client history
@description: Client accessed sexually transmitted infection (STI) services
*/
// TODO: Replace placeholder with relevant CQL logic
define "STI services":
  exists "STI services Condition"
    or exists "STI services Observation"
define "STI services Condition":
  [Condition: Concepts."STI services"]
define "STI services Observation":
  [Observation: Concepts."STI services"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."STI services"
/* End of STI services */

/*
@dataElement: HIV.PRV.DE7 - VMMC
@activity: HIV.B6 Capture or update client history
@description: Client accessed voluntary medical male circumcision (VMMC) services
*/
// TODO: Replace placeholder with relevant CQL logic
define "VMMC":
  exists "VMMC Condition"
    or exists "VMMC Observation"
define "VMMC Condition":
  [Condition: Concepts."VMMC"]
define "VMMC Observation":
  [Observation: Concepts."VMMC"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."VMMC"
/* End of VMMC */

/*
@dataElement: HIV.PRV.DE8 - Other - HIV.PRV.DE8
@activity: HIV.B6 Capture or update client history
@description: Client accessed other HIV prevention services
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other - HIV.PRV.DE8":
  exists "Other - HIV.PRV.DE8 Condition"
    or exists "Other - HIV.PRV.DE8 Observation"
define "Other - HIV.PRV.DE8 Condition":
  [Condition: Concepts."Other - HIV.PRV.DE8"]
define "Other - HIV.PRV.DE8 Observation":
  [Observation: Concepts."Other - HIV.PRV.DE2"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Other - HIV.PRV.DE8"
/* End of Other - HIV.PRV.DE8 */

/*
@dataElement: HIV.PRV.DE10 - Date accessed HIV prevention intervention
@activity: HIV.B6 Capture or update client history
@description: Date the client accessed HIV prevention intervention
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date accessed HIV prevention intervention":
  [Observation: Concepts."Date accessed HIV prevention intervention"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date accessed HIV prevention intervention */

/*
@dataElement: HIV.PRV.DE11 - HIV status of contact
@activity: HIV.B6 Capture or update client history
@description: The HIV status of the client's contact
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV status of contact Observation":
  [Observation: Concepts."HIV status of contact"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV status of contact */

/*
@dataElement: HIV.PRV.DE12 - HIV-positive - HIV.PRV.DE12
@activity: HIV.B6 Capture or update client history
@description: Client's contact is HIV-positive
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-positive - HIV.PRV.DE12":
  exists "HIV-positive - HIV.PRV.DE12 Condition"
    or exists "HIV-positive - HIV.PRV.DE12 Observation"
define "HIV-positive - HIV.PRV.DE12 Condition":
  [Condition: Concepts."HIV-positive - HIV.PRV.DE12"]
define "HIV-positive - HIV.PRV.DE12 Observation":
  [Observation: Concepts."HIV-positive - HIV.PRV.DE11"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-positive - HIV.PRV.DE12"
/* End of HIV-positive - HIV.PRV.DE12 */

/*
@dataElement: HIV.PRV.DE13 - HIV-negative - HIV.PRV.DE13
@activity: HIV.B6 Capture or update client history
@description: Client's contact is HIV-negative
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-negative - HIV.PRV.DE13":
  exists "HIV-negative - HIV.PRV.DE13 Condition"
    or exists "HIV-negative - HIV.PRV.DE13 Observation"
define "HIV-negative - HIV.PRV.DE13 Condition":
  [Condition: Concepts."HIV-negative - HIV.PRV.DE13"]
define "HIV-negative - HIV.PRV.DE13 Observation":
  [Observation: Concepts."HIV-negative - HIV.PRV.DE11"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."HIV-negative - HIV.PRV.DE13"
/* End of HIV-negative - HIV.PRV.DE13 */

/*
@dataElement: HIV.PRV.DE14 - Unknown - HIV.PRV.DE14
@activity: HIV.B6 Capture or update client history
@description: Client does not know contact's HIV status
*/
// TODO: Replace placeholder with relevant CQL logic
define "Unknown - HIV.PRV.DE14":
  exists "Unknown - HIV.PRV.DE14 Condition"
    or exists "Unknown - HIV.PRV.DE14 Observation"
define "Unknown - HIV.PRV.DE14 Condition":
  [Condition: Concepts."Unknown - HIV.PRV.DE14"]
define "Unknown - HIV.PRV.DE14 Observation":
  [Observation: Concepts."Unknown - HIV.PRV.DE11"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Unknown - HIV.PRV.DE14"
/* End of Unknown - HIV.PRV.DE14 */

/*
@dataElement: HIV.PRV.DE15 - Date injecting equipment provided
@activity: HIV.B21 Offer prevention options
@description: Date client was provided with injecting equipment
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date injecting equipment provided":
  [Observation: Concepts."Date injecting equipment provided"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date injecting equipment provided */

/*
@dataElement: HIV.PRV.DE17 - Date OAMT initiated
@activity: HIV.B21 Offer prevention options
@description: Date client initiated opioid agonist maintenance treatment (OAMT)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date OAMT initiated":
  [Observation: Concepts."Date OAMT initiated"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date OAMT initiated */

/*
@dataElement: HIV.PRV.DE20 - Currently on OAMT
@activity: HIV.B6 Capture or update client history
@description: Client is currently on opioid agonist maintenance treatment (OAMT) at reporting date, defined according to country/program to account for medication dispensed and LTFU criterion
*/
// TODO: Replace placeholder with relevant CQL logic
define "Currently on OAMT":
  [Observation: Concepts."Currently on OAMT"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Currently on OAMT */

/*
@dataElement: HIV.PRV.DE21 - Retained on OAMT
@activity: HIV.B6 Capture or update client history
@description: Client is retained on opioid agonist maintenance treatment (OAMT) at reporting date, defined according to country/program to account for medication dispensed and LTFU criterion
*/
// TODO: Replace placeholder with relevant CQL logic
define "Retained on OAMT":
  [Observation: Concepts."Retained on OAMT"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Retained on OAMT */

/*
@dataElement: HIV.PRV.DE25 - Date of loss to follow-up or OAMT stopped
@activity: HIV.B6 Capture or update client history
@description: Date of loss to follow-up or opioid agonist maintenance treatment (OAMT) stopped
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of loss to follow-up or OAMT stopped":
  [Observation: Concepts."Date of loss to follow-up or OAMT stopped"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of loss to follow-up or OAMT stopped */

/*
@dataElement: HIV.PRV.DE27 - Date medications prescribed - HIV.PRV.DE27
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Date the client was prescribed medications
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date medications prescribed - HIV.PRV.DE27":
  [Observation: Concepts."Date medications prescribed - HIV.PRV.DE27"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date medications prescribed - HIV.PRV.DE27 */

/*
@dataElement: HIV.PRV.DE28 - Number of days prescribed - HIV.PRV.DE28
@activity: HIV.C23 Prescribe or administer PrEP or PEP
@description: Days of medication client has been prescribed
*/
// TODO: Replace placeholder with relevant CQL logic
define "Number of days prescribed - HIV.PRV.DE28":
  [Observation: Concepts."Number of days prescribed - HIV.PRV.DE28"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Number of days prescribed - HIV.PRV.DE28 */

/*
@dataElement: HIV.SRV.DE1 - HIV test date - HIV.SRV.DE1
@activity: HIV.F8 Test infant/child for HIV using testing algorithm
@description: Date of the HIV test
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test date - HIV.SRV.DE1":
  [Observation: Concepts."HIV test date - HIV.SRV.DE1"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV test date - HIV.SRV.DE1 */

/*
@dataElement: HIV.SRV.DE2 - HIV test result - HIV.SRV.DE2
@activity: HIV.B7 Test for HIV using testing algorithm
@description: The result from HIV testing after applying the testing algorithm
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV test result - HIV.SRV.DE2 Observation":
  [Observation: Concepts."HIV test result - HIV.SRV.DE2"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV test result - HIV.SRV.DE2 */

/*
@dataElement: HIV.SRV.DE3 - Baseline CD4 count - HIV.SRV.DE3
@activity: HIV.D20 Diagnostics
@description: CD4 count performed at HIV diagnosis
*/
// TODO: Replace placeholder with relevant CQL logic
define "Baseline CD4 count - HIV.SRV.DE3":
  [Observation: Concepts."Baseline CD4 count - HIV.SRV.DE3"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Baseline CD4 count - HIV.SRV.DE3 */

/*
@dataElement: HIV.SRV.DE4 - Date of baseline CD4 count test - HIV.SRV.DE4
@activity: HIV.D20 Diagnostics
@description: Date and time when baseline CD4 count test was conducted
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of baseline CD4 count test - HIV.SRV.DE4":
  [Observation: Concepts."Date of baseline CD4 count test - HIV.SRV.DE4"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of baseline CD4 count test - HIV.SRV.DE4 */

/*
@dataElement: HIV.SRV.DE5 - HIV clinical stage - HIV.SRV.DE5
@activity: HIV.D8 Capture or update client history
@description: WHO clinical stage of client based on signs and symptoms. WHO clinical staging is a way to categorize HIV disease severity based on new or recurrent clinical events. There are 4 WHO clinical stages that range from mild symptoms (WHO clinical stage 1) to severe symptoms (WHO clinical stage 4).
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV clinical stage - HIV.SRV.DE5 Observation":
  [Observation: Concepts."HIV clinical stage - HIV.SRV.DE5"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV clinical stage - HIV.SRV.DE5 */

/*
@dataElement: HIV.SRV.DE6 - ART start date - HIV.SRV.DE6
@activity: HIV.B8 Provide post-test counselling
@description: The date on which the client started or restarted antiretroviral therapy (ART)
*/
// TODO: Replace placeholder with relevant CQL logic
define "ART start date - HIV.SRV.DE6":
  [Observation: Concepts."ART start date - HIV.SRV.DE6"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of ART start date - HIV.SRV.DE6 */

/*
@dataElement: HIV.SRV.DE7 - Currently pregnant - HIV.SRV.DE7
@activity: HIV.B6 Capture or update client history
@description: Client is currently pregnant
*/
// TODO: Replace placeholder with relevant CQL logic
define "Currently pregnant - HIV.SRV.DE7":
  [Observation: Concepts."Currently pregnant - HIV.SRV.DE7"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Currently pregnant - HIV.SRV.DE7 */

/*
@dataElement: HIV.SRV.DE8 - CD4 count - HIV.SRV.DE8
@activity: HIV.D20 Diagnostics
@description: CD4 cell count in cells/mm^3
*/
// TODO: Replace placeholder with relevant CQL logic
define "CD4 count - HIV.SRV.DE8":
  [Observation: Concepts."CD4 count - HIV.SRV.DE8"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of CD4 count - HIV.SRV.DE8 */

/*
@dataElement: HIV.SRV.DE12 - Date of viral load sample collection - HIV.SRV.DE12
@activity: HIV.D10 Counsel returning client
@description: Date and time when the sample was collected to test the client's HIV viral load
*/
// TODO: Replace placeholder with relevant CQL logic
define "Date of viral load sample collection - HIV.SRV.DE12":
  [Observation: Concepts."Date of viral load sample collection - HIV.SRV.DE12"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Date of viral load sample collection - HIV.SRV.DE12 */

/*
@dataElement: HIV.SRV.DE13 - Viral load test result - HIV.SRV.DE13
@activity: HIV.D20 Diagnostics
@description: Result from the viral load test in number of copies/mL
*/
// TODO: Replace placeholder with relevant CQL logic
define "Viral load test result - HIV.SRV.DE13":
  [Observation: Concepts."Viral load test result - HIV.SRV.DE13"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Viral load test result - HIV.SRV.DE13 */

/*
@dataElement: HIV.SRV.DE15 - Visit date - HIV.SRV.DE15
@activity: HIV.A2 Gather client details
@description: The date and time of the client's visit
*/
// TODO: Replace placeholder with relevant CQL logic
define "Visit date - HIV.SRV.DE15":
  [Observation: Concepts."Visit date - HIV.SRV.DE15"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Visit date - HIV.SRV.DE15 */

/*
@dataElement: HIV.SRV.DE18 - ANC contact date - HIV.SRV.DE18
@activity: HIV.E1 Capture or update mother's history
@description: The date and time of the client's ANC contact (in the ANC DAK this is called 'Contact date')
*/
// TODO: Replace placeholder with relevant CQL logic
define "ANC contact date - HIV.SRV.DE18":
  [Observation: Concepts."ANC contact date - HIV.SRV.DE18"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of ANC contact date - HIV.SRV.DE18 */

/*
@dataElement: HIV.SRV.DE20 - HIV-exposed infant or child - HIV.SRV.DE20
@activity: HIV.F6 Check whether infant/child had HIV exposure
@description: Whether the infant or child was determined to have had HIV exposure
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV-exposed infant or child - HIV.SRV.DE20":
  [Observation: Concepts."HIV-exposed infant or child - HIV.SRV.DE20"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HIV-exposed infant or child - HIV.SRV.DE20 */

/*
@dataElement: HIV.SRV.DE21 - Test result of HIV assay 1 - HIV.SRV.DE21
@activity: HIV.E4 Test mother for HIV using testing algorithm
@description: The result of the first HIV assay in the testing strategy
*/
// TODO: Replace placeholder with relevant CQL logic
define "Test result of HIV assay 1 - HIV.SRV.DE21 Observation":
  [Observation: Concepts."Test result of HIV assay 1 - HIV.SRV.DE21"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Test result of HIV assay 1 - HIV.SRV.DE21 */

/*
@dataElement: HIV.SRV.DE22 - Final diagnosis of HIV-exposed infant - HIV.SRV.DE22
@activity: HIV.F20 Record infant's/child's final HIV diagnosis
@description: HIV-exposed infant final status at 18 months or 3 months after cessation of breastfeeding (whichever is later).
*/
// TODO: Replace placeholder with relevant CQL logic
define "Final diagnosis of HIV-exposed infant - HIV.SRV.DE22 Observation":
  [Observation: Concepts."Final diagnosis of HIV-exposed infant - HIV.SRV.DE22"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Final diagnosis of HIV-exposed infant - HIV.SRV.DE22 */

/*
@dataElement: HIV.Config.DE6 - Malaria-endemic setting
@activity: HIV.Configuration
@description: Whether the setting is a malaria-endemic setting
*/
// TODO: Replace placeholder with relevant CQL logic
define "Malaria-endemic setting":
  [Observation: Concepts."Malaria-endemic setting"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Malaria-endemic setting */

/*
@dataElement: HIV.Config.DE12 - HIV burden of the setting
@activity: HIV.Configuration
@description: HIV burden of the setting (high or low) based on the national HIV prevalence or where the HIV prevalence and/or incidence in a geographical setting is higher than national prevalence and, therefore, needs priority in the HIV response
*/
// TODO: Replace placeholder with relevant CQL logic
define "HIV burden of the setting Observation":
  [Observation: Concepts."HIV burden of the setting"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of HIV burden of the setting */

/*
@dataElement: HIV.Config.DE13 - High HIV burden setting
@activity: HIV.Configuration
@description: Settings with >5% national HIV prevalence and subpopulations and geographic settings where HIV prevalence and/or incidence is higher than nationally.
*/
// TODO: Replace placeholder with relevant CQL logic
define "High HIV burden setting":
  exists "High HIV burden setting Condition"
    or exists "High HIV burden setting Observation"
define "High HIV burden setting Condition":
  [Condition: Concepts."High HIV burden setting"]
define "High HIV burden setting Observation":
  [Observation: Concepts."High HIV burden setting"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."High HIV burden setting"
/* End of High HIV burden setting */

/*
@dataElement: HIV.Config.DE14 - Low HIV burden setting
@activity: HIV.Configuration
@description: Settings with <5% HIV national prevalence but where certain populations (primarily key populations and their partners) and geographic settings may have higher HIV prevalence and/or incidence than nationally and, therefore, need priority in the HIV response
*/
// TODO: Replace placeholder with relevant CQL logic
define "Low HIV burden setting":
  exists "Low HIV burden setting Condition"
    or exists "Low HIV burden setting Observation"
define "Low HIV burden setting Condition":
  [Condition: Concepts."Low HIV burden setting"]
define "Low HIV burden setting Observation":
  [Observation: Concepts."Low HIV burden setting"] O
    where O.status in { 'final', 'amended', 'corrected' }
      and O.value ~ Concepts."Low HIV burden setting"
/* End of Low HIV burden setting */

/*
@dataElement: HIV.Config.DE15 - HPV DNA testing operational at the health facility
@activity: HIV.Configuration
@description: Is HPV DNA testing operational at the health facility for cervical cancer screening?
*/
// TODO: Replace placeholder with relevant CQL logic
define "HPV DNA testing operational at the health facility":
  [Observation: Concepts."HPV DNA testing operational at the health facility"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of HPV DNA testing operational at the health facility */

/*
@dataElement: HIV.Config.DE19 - Other priority populations
@activity: HIV.Configuration
@description: Other populations of priority of HIV prevention and care in local context (provided during adaptation)
*/
// TODO: Replace placeholder with relevant CQL logic
define "Other priority populations Observation":
  [Observation: Concepts."Other priority populations"] O
    where O.status in { 'final', 'amended', 'corrected' }
/* End of Other priority populations */

/*
@dataElement: HIV.Config.DE20 - Reporting period end date
@activity: HIV.Configuration
@description: End date of the reporting period
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reporting period end date":
  [Observation: Concepts."Reporting period end date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Reporting period end date */

/*
@dataElement: HIV.Config.DE21 - Reporting period start date
@activity: HIV.Configuration
@description: Start date of the reporting period
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reporting period start date":
  [Observation: Concepts."Reporting period start date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Reporting period start date */

/*
@dataElement: HIV.Config.DE22 - Reporting date
@activity: HIV.Configuration
@description: Reporting date, for surveys performed on a specific date
*/
// TODO: Replace placeholder with relevant CQL logic
define "Reporting date":
  [Observation: Concepts."Reporting date"] O
    where O.status in { 'final', 'amended', 'corrected' }
    return O.value
/* End of Reporting date */


/*
 * Custom elements and logic for use DT and IND CQL Libraries
 */