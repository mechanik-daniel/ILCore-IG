Extension: DiagnosticReportNote
Id: ext-diagnostic-report-note
Title: "Ext: DiagnosticReport Note"
Description: "Extension: DiagnosticReport Note annotation, to mimic v5 DiagnosticReport.note element"

* ^url = $ext-diagnostic-report-note
* ^version = "0.14.0"
* insert CurrentDate
* ^status = #draft
* ^context.type = #element
* ^context.expression = "DiagnosticReport"
* value[x] only Annotation
