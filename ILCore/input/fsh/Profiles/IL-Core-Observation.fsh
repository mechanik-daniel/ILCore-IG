Profile: ILCoreObservation
Parent: Observation
Id: il-core-observation
Title: "ILCore Observation Profile"
Description: "Israel Core proposed constraints and extensions on the Observation Resource"

* ^url = $ILObservation
* ^version = "0.14.0"
* ^status = #draft
* insert CurrentDate
* ^publisher = "Israel Core Team"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "tal.primak@moh.gov.il"

* . ^short = "ILCore Observation Profile"
* . ^definition = "Israel Core proposed constraints and extensions on the Observation resource profile."
* . ^isModifier = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1


* status and category and code and subject and value[x] MS
* basedOn only Reference(CarePlan or DeviceRequest or ILCoreImmunizationRecommendation or ILCoreMedicationRequest or NutritionOrder or ILCoreServiceRequest)
* partOf only Reference(ILCoreMedicationAdministration or ILCoreMedicationDispense or ILCoreProcedure or ILCoreImmunization or ILCoreImagingStudy or ILCoreMedicationStatement)
* code from $vs-il-core-observation-code (preferred)
* subject only Reference(ILCorePatient or ILCoreGroup or ILCoreDevice or ILCoreLocation) 
* encounter only Reference(ILCoreEncounter)
* performer only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam or ILCorePatient or ILCoreRelatedPerson)
* valueQuantity obeys il-obs-ucum
* valueCodeableConcept from $vs-il-core-observation-value (preferred)
* valueCodeableConcept obeys il-obs-value-cc
* bodySite ^binding.strength = #preferred
* method ^binding.strength = #preferred
* specimen only Reference(ILCoreSpecimen)
* device only Reference(ILCoreDevice or DeviceMetric)
* referenceRange.low obeys il-obs-ucum
* referenceRange.high obeys il-obs-ucum
* referenceRange.age.low from $age-units
* referenceRange.age.high from $age-units
* hasMember only Reference(ILCoreObservation or ILCoreQuestionnaireResponse or MolecularSequence)
* derivedFrom only Reference(ILCoreDocumentReference or ILCoreImagingStudy or ILCoreMedia or ILCoreQuestionnaireResponse or ILCoreObservation or MolecularSequence)
* dataAbsentReason.coding ^slicing.discriminator.type = #value
* dataAbsentReason.coding ^slicing.discriminator.path = "system"
* dataAbsentReason.coding ^slicing.rules = #open
* dataAbsentReason.coding contains 
    not-performed-reason 0..1
// * dataAbsentReason.coding[not-performed-reason] from $vs-not-performed-reason (required)
* dataAbsentReason.coding[not-performed-reason].system = $not-performed-reason
* dataAbsentReason.coding[not-performed-reason].system 1..1
* dataAbsentReason.coding[not-performed-reason].code 1..1
* dataAbsentReason obeys il-obs-not-performed
* component.code from $vs-il-core-observation-code (preferred)
* component.valueQuantity obeys il-obs-ucum
* component.valueCodeableConcept from $vs-il-core-observation-value (preferred)
* component.valueCodeableConcept obeys il-obs-value-cc
* component.referenceRange.low obeys il-obs-ucum
* component.referenceRange.high obeys il-obs-ucum
* component.referenceRange.age.low from $age-units
* component.referenceRange.age.high from $age-units