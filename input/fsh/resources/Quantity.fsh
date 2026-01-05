Profile: EAHPLogisticalQuantity
Parent: SimpleQuantity
Id: eahp-logistical-quantity
Title: "EAHP Logistical Quantity"
Description: "A specialized quantity that strictly counts Indivisible Logistical Units (e.g. 1 tablet, 30 vials)."

* system 1..1
* system = "http://example.org/CodeSystem/eahp-logistics-unit-cs" // TODO define the correct URL
* code 1..1
* code = #indivisible-logistical-unit (exactly)
* unit 1..1
* unit = "Indivisible Logistical Unit"
* value 1..1 MS

CodeSystem: EAHPLogisticsUnitCS
Id: eahp-logistics-unit-cs
Title: "EAHP Logistics Units"
Description: "Custom units of measure for abstracting pharmacy automation logistics."
* #indivisible-logistical-unit "Indivisible Logistical Unit" "The atomic, physical unit of inventory. It represents a quantity of '1' that cannot be subdivided further without destroying the item or altering its integrity."