// Medication Instance
Instance: Medication-Brufen-30x600mg
InstanceOf: Medication
Title: "Brufen 30x600mg Tablets"
Description: "Medication resource representing Brufen tablets, 30 tablets of 600 mg each."
Usage: #inline
* identifier[0].system = "http://hl7.org/fhir/sid/gtin"
* identifier[0].value = "0123456789012"
* code.text = "Brufen 600mg Tablets"
* doseForm.text = "Tablet"
* ingredient[0].item.concept.text = "Ibuprofen"
* ingredient[0].isActive = true
* ingredient[0].strengthRatio.numerator.value = 600
* ingredient[0].strengthRatio.numerator.unit = "mg"
* ingredient[0].strengthRatio.denominator.value = 1
* ingredient[0].strengthRatio.denominator.unit = "tablet"
* status = #active

// SupplyRequest Instance with contained Medication
Instance: SupplyRequest-Brufen-Example
InstanceOf: SupplyRequestEAHPInteroperabillity
Title: "Example Supply Request for Brufen"
Description: "Example of a supply request for Brufen tablets using the EAHP Interoperability profile."
* contained = Medication-Brufen-30x600mg
* identifier.system = "http://hospital.example.org/supply-requests"
* identifier.value = "SR-2025-001234"
* status = #active
* category = http://terminology.hl7.org/CodeSystem/supply-kind#central "Central Supply"
* priority = #routine
* item.reference = Reference(Medication-Brufen-30x600mg)
* quantity.value = 3 //We need to define if we will always TODO
* authoredOn = "2025-11-30T10:30:00Z"
* requester = Reference(Practitioner/example-practitioner) "Dr. Jane Smith"
* deliverTo = Reference(Location/example-pharmacy) "Hospital Pharmacy"