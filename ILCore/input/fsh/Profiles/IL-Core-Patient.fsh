
Profile: ILCorePatient
Parent: Patient
Id: il-core-patient
Title: "ILCore Patient Profile"
Description: "Israel Core Proposed constraints and extensions on the Patient Resource."

* ^url = $ILPatient
* ^version = "0.14.0"
* ^status = #draft
* insert CurrentDate
* ^publisher = "Israel Core Team"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "tal.primak@moh.gov.il"

* . ^short = "ILCore Patient profile"
* . ^definition = "The Patient Profile is based upon the core FHIR Patient Resource"
* . ^isModifier = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1


* extension contains
    ext-il-hmo named hmo 0..1 and
    $ext-admin-parent-name named parentName 0..* and
    $ext-birth-place named birthPlace 0..1 and 
    ext-patient-immigration named immigration 0..* and
    $us-core-birth-sex named birthSex 0..1 
* extension[hmo] ^short = "Extension: Israel Core HMO (קופת חולים)"
* extension[hmo] ^definition = "A code classifying the person's Israeli HMO"
* extension[hmo] ^mustSupport = true
* extension[parentName] ^short = "Extension: Administrative Parent Name"
* extension[parentName] ^definition = "Extension: The name of a person’s parent, recorded for administrative purposes as part of the person’s demographics (e.g to help with identification). This SHOULD NOT be confused with a parent whose details are recorded for contact purposes (Patient.contact) or as a family member (RelatedPerson). Most systems will use the “father’s name” field as the source of data for this extension. NOTE: This extension replaces the old ParentName extension and is the PREFFERED extension"
* extension[parentName] ^mustSupport = true
* extension[birthPlace] ^short = "Extension: Place of Birth for patient"
* extension[birthPlace] ^definition = "The registered place of birth of the patient. A sytem may use the address.text if they don't store the birthPlace address in discrete elements"
* extension[immigration] ^short = "Extension: Patient Immigration"
* extension[immigration] ^definition = "Extension: Immigration information for a patient - for the purpose of this extension - immigration is an international movement of a person to a destination country in order to settle as permanent resident"
* extension[birthSex] ^short = "Extension: US Core Birth Sex Extension"
* extension[birthSex] ^definition = "A code classifying the person’s sex assigned at birth as specified by the Office of the National Coordinator for Health IT (ONC). This extension aligns with the C-CDA Birth Sex Observation (LOINC 76689-9)."

* identifier ^min = 1
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* identifier.value ^short = "The value that is unique within the system."

* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains
   il-id 0..1 and
   pna-id 0..1 and
   ppn 0..* and
//    idf-sn 0..1 and
   prisoner-id 0..1 and
   enc 0..*
//    ppn-no-system 0..* 

* identifier[il-id] ^short = "Israeli National Identifier"
* identifier[il-id] ^definition = "Israeli ID number (9 digit unchangeable number, including leading zeros and includes a control digit), including temporarily identification numbers assigned by Israeli National Insurance"
* identifier[il-id] ^mustSupport = true
* identifier[il-id].value 1..1 MS
* identifier[il-id].value obeys il-id-chk
* identifier[il-id].value ^short = "An Israeli ID number"
* identifier[il-id].system 1..1 MS
* identifier[il-id].system = $il-id (exactly)
// * identifier[il-id] ^patternIdentifier.system = $il-id
* identifier[il-id].value ^example.valueString = "000000018"
* identifier[il-id].value ^example.label = "Valid Example"
* identifier[il-id].assigner only Reference(ILCoreOrganization)

* identifier[pna-id] ^short = "Palestinian National Identifier"
* identifier[pna-id] ^definition = "Palestinian ID number"
* identifier[pna-id] ^mustSupport = false
* identifier[pna-id].value 1..1 MS
* identifier[pna-id].value ^short = "A Palestininan ID number"
* identifier[pna-id].system 1..1 MS
* identifier[pna-id].system = $pna-id (exactly)
// * identifier[pna-id] ^patternIdentifier.system = $pna-id
* identifier[pna-id].value ^example.valueString = "000000018"
* identifier[pna-id].value ^example.label = "Valid Example"

* identifier[ppn] ^short = "Passport Number"
* identifier[ppn] ^definition = "Passport number" 
* identifier[ppn] ^mustSupport = false
* identifier[ppn].system 1..1 MS
* identifier[ppn].value 1..1 MS
* identifier[ppn].type = $id-type#PPN
* identifier[ppn].value ^short = "Passport Number"
* identifier[ppn].system from $vs-pp-uri (required)

//THE FOLLOWING IS COMMENTED OUT UNTIL AN IDF SLICE IS DECIDED UPON - 04-MAR-2024 - KIPPI
// * identifier[idf-sn] ^short = "IDF Service Number"
// * identifier[idf-sn] ^definition = "Israel Defence forces Sevice number (6-8 digits number). A unique identifier for any soldier currently serving or having served in the IDF"
// * identifier[idf-sn] ^mustSupport = true
// * identifier[idf-sn].value 1..1 MS
// * identifier[idf-sn].value obeys idf-num
// * identifier[idf-sn].value ^short = "IDF service number"
// * identifier[idf-sn].system 1..1 MS
// * identifier[idf-sn].system = $idf-sn (exactly)
// * identifier[idf-sn].value ^example.valueString = "1234567"
// * identifier[idf-sn].value ^example.label = "Valid Example"
// * identifier[idf-sn].assigner only Reference(ILCoreOrganization)

* identifier[prisoner-id].value 1..1 MS
* identifier[prisoner-id] ^short = "Prisoner Number"
* identifier[prisoner-id] ^definition = "Israel Prison Service prisoner number (5-6 digits number). A unique identifier for any prisoner currently serving a prison sentence"
* identifier[prisoner-id] ^mustSupport = true
* identifier[prisoner-id].value obeys il-prison-num
* identifier[prisoner-id].value ^short = "Prisoner Number"
* identifier[prisoner-id].system 1..1 MS
* identifier[prisoner-id].system = $prisoner-id (exactly)
* identifier[prisoner-id].value ^example.valueString = "123456"
* identifier[prisoner-id].value ^example.label = "Valid Example"
* identifier[prisoner-id].assigner only Reference(ILCoreOrganization)

* identifier[enc] ^short = "Person's Identifier - MoH encrypted"
* identifier[enc] ^definition = "The person’s identifier after applying MoH’s standard primary encryption algorithm"
* identifier[enc] ^mustSupport = false
* identifier[enc].value 1..1 MS
* identifier[enc].value ^short = "An encrypted identifier"
* identifier[enc].system 1..1 MS
* identifier[enc].system = $enc (exactly)
// * identifier[enc] ^patternIdentifier.system = $enc
* identifier[enc].value ^example.valueString = "000000018"
* identifier[enc].value ^example.label = "Valid Example"
* identifier[enc].assigner only Reference(ILCoreOrganization)

//address 
* address only ILCoreAddress
* address 0..*

// //communication
* communication.language 1..1 MS

//name
* name 1..* MS
* name obeys il-patient-name
* name.family 0..1 MS 
* name.given 0..* MS 
// * name.extension contains $data-absent-reason named dataAbsentReason 0..1
* insert HumanNameLanguage  // RuleSet that handles language extension and slices. -> see RuleSets/HumanNameLanguage // Kippi B. May-11 2023

//telecom
* telecom.system 1..1 MS
* telecom.value 1..1 MS
* telecom.use 0..1 MS

* gender 1..1 MS
* birthDate 1..1 MS
* contact.organization only Reference(ILCoreOrganization)
* generalPractitioner only Reference(ILCoreOrganization or ILCorePractitioner or ILCorePractitionerRole)
* managingOrganization only Reference(ILCoreOrganization)
* link.other only Reference(ILCorePatient or ILCoreRelatedPerson)

* contact ^slicing.discriminator.type = #pattern
* contact ^slicing.discriminator.path = "relationship"
* contact ^slicing.rules = #open
* contact contains Parent 0..*
* contact[Parent].relationship.coding ^patternCoding = http://terminology.hl7.org/CodeSystem/v2-0131#PAR
// * contact[Child].relationship.coding ^patternCoding = {system: "http://terminology.hl7.org/CodeSystem/v2-0131", code: "CHD"}

