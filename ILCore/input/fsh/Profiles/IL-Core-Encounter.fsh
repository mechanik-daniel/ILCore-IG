Profile: ILCoreEncounter
Parent: Encounter
Id: il-core-encounter
Title: "ILCore Encounter Profile"
Description: "Israel Core proposed constraints and extensions on the Encounter Resource"

* ^url = $ILEncounter
* ^version = "0.14.0"
* ^status = #draft
* insert CurrentDate
* ^publisher = "Israel Core Team"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "tal.primak@moh.gov.il"

* . ^short = "ILCore Encounter Profile"
* . ^definition = "Israel Core proposed constraints and extensions on the Encounter resource profile."
* . ^isModifier = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1


* extension contains
    $modeOfArrival named mode-of-arrival 0..1 and
    $ext-encounter-paying-entity named paying-entity 0..1
* extension[modeOfArrival].valueCoding from $vs-patient-mode-of-arrival-moh (example)
* extension[paying-entity] ^short = "Extension: Encounter Paying Entity"
* extension[paying-entity] ^definition = "Paying Entity for the Encounter"

//Must Support + definitions
* identifier and status and class and subject and period and serviceProvider MS
* identifier ^definition = "Must support - <b>recieving system SHOULD store the value</b>"
* status ^definition = "Must support - <b>recieving system SHALL either store the value as-is or SHALL be able to translate it into internal state and SHALL be able to reconstruct the value when requested to retrieve data</b>"
* class ^definition = "Must support - <b>recieving system SHALL either store the value as-is or SHALL be able to translate it into internal state and SHALL be able to reconstruct the value when requested to retrieve data</b>"
* subject ^definition = "Must support - <b>recieving system SHALL either store the value as-is or SHALL be able to translate it into internal state and SHALL be able to reconstruct the value when requested to retrieve data</b>"
* period ^definition = "Must support - <b>recieving system SHALL either store the value as-is or SHALL be able to translate it into internal state and SHALL be able to reconstruct the value when requested to retrieve data</b>"
* serviceProvider ^definition = "Must support - <b>recieving system SHALL either store the value as-is or SHALL be able to translate it into internal state and SHALL be able to reconstruct the value when requested to retrieve data</b>"


* class from $vs-il-core-encounter-class (extensible)
* classHistory.class from $vs-il-core-encounter-class (extensible)
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains 
    virtual-encounters 0..* and
    doctor-to-doctor-consultation 0..*
* type[doctor-to-doctor-consultation] from $vs-il-core-doctor-to-doctor (required)
* type[virtual-encounters] from $vs-il-core-virtual-type (required)
* serviceType from $vs-il-core-service-type (extensible)
* subject 1..1
* subject only Reference(ILCorePatient or ILCoreGroup)
* subject.extension contains $ext-encounter-visitor-type named visitor-type 0..1
* subject.extension[visitor-type] ^short = "Extension: Israeli CORE Encounter Visitor Type"
* subject.extension[visitor-type] ^definition = "Classification of the visitor type (סוג מבקר/סוג כניסה) for the Encounter"
* basedOn only Reference(ILCoreServiceRequest)
* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type"
* participant ^slicing.rules = #open
* participant contains 
    primary-performer 0..* MS
* participant[primary-performer]
  * ^definition = "Must support - <b>receiving system either SHALL store the value or SHALL be able to translate it into internal state and SHALL be able to recover it when required to send data</b>"
  * type MS
  * type 1..1
  * period MS
  * period 0..1
  * individual MS
  * individual 1..1
  * type.coding.system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType" (exactly)
  * type.coding.code = #PPRF (exactly)
* participant.individual only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreRelatedPerson)
* reasonCode ^slicing.discriminator.type = #pattern
* reasonCode ^slicing.discriminator.path = "$this"
* reasonCode ^slicing.rules = #open
* reasonCode contains moh-reason-code 0..*
* reasonCode[moh-reason-code] from $vs-patient-visit-reason-moh (preferred)
* reasonReference only Reference(ILCoreCondition or ILCoreProcedure or ILCoreObservation or ImmunizationRecommendation)
* diagnosis.condition only Reference(ILCoreCondition or ILCoreProcedure)
* hospitalization.origin only Reference(ILCoreLocation or ILCoreOrganization)
* hospitalization.admitSource from $vs-patient-admit-source-moh (preferred)
* hospitalization.destination only Reference(ILCoreLocation or ILCoreOrganization)
* hospitalization.extension contains $ext-movement-sequence-number named movement-number 0..1
* hospitalization.extension[movement-number] ^short = "Ext: Movement Sequence-Number"
* hospitalization.extension[movement-number] ^definition = "Extension: Movement Sequence-Number"
* hospitalization.dischargeDisposition from $vs-patient-release-type-moh (example)
* location.location only Reference(ILCoreLocation)
* serviceProvider only Reference(ILCoreOrganization)
* partOf only Reference(ILCoreEncounter)
