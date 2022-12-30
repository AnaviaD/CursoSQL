SELECT VendorName, VendorCity + ', ' + VendorState + ', ' + VendorZipCode AS AddressV
FROM Examples.dbo.Vendors 
ORDER BY VendorName ASC

SELECT VendorName,
VendorCity+', '+ VendorState+', '+VendorZipCode AS AddressV
FROM Examples.dbo.Vendors
ORDER BY VendorContactLName + VendorContactFName

SELECT VendorID, InvoiceTotal
FROM AP.dbo.Invoices
ORDER BY InvoiceTotal DESC
	OFFSET 0 ROWS 
	FETCH FIRST 5 ROWS ONLY


SELECT VendorName, VendorCity, VendorState, VendorZipCode
FROM AP.dbo.Vendors
WHERE VendorState = 'CA'
ORDER BY VendorCity ASC
	OFFSET 10 ROWS 
	FETCH FIRST 10 ROWS ONLY

--SELECT * FROM AP.dbo.Invoices