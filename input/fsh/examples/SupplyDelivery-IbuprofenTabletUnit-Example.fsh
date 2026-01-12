Instance: SupplyDelivery-IbuprofenTabletUnit-Example
InstanceOf: SupplyDelivery
Title: "Example Supply Delivery for Ibuprofen 500mg Unit Dose Tablets"
Description: "SupplyDelivery example corresponding to the SupplyRequest for Ibuprofen 500mg unit dose tablets."

* basedOn = Reference(SupplyRequest-IbuprofenTablet-Example)
* status = #completed
* suppliedItem[0].itemReference = Reference(9042a2ba-724c-47e4-b64c-6054da9dd4fa)
* suppliedItem[0].quantity.value = 2
* suppliedItem[0].quantity.system = "http://snomed.info/sct"
* suppliedItem[0].quantity.code = #421026006

* supplier = Reference(Practitioner/example-technician) "Pharmacy Technician"
* destination = Reference(Location/example-pharmacy) "Hospital Pharmacy"
