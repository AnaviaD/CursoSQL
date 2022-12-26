/*		1
Obtener dos columnas, una de Vendor Id y otra de PaymentSum donde la segunda 
Es la suma de la columna PaymentTotal agrupada por VendorID
*/
SELECT VendorID, SUM(PaymentTotal) as PaymentSum
	FROM AP.dbo.Invoices
	GROUP BY VendorID


/*		2
Escribir un select que regrese VendorName y
PaymentSum: sera la suma de la columna paymentTotal agrupada por vendorName
Regresar los primeros 10 registros a quien le pagaron mas
*/
SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
	FROM AP.dbo.Invoices AS I
	INNER JOIN AP.dbo.Vendors AS V ON V.VendorID = I.VendorID
	GROUP BY VendorName
	ORDER BY PaymentSum DESC


/*		3
Escribir un select que regrese 3 columnas VendorName
InvoiceCount:	El numero de facturas(Invoices)
InvoiceSum:		Es la suma de la columna InvoiceTotal
Agrupada por VendorName y ordenada por el mayor numero de facturas
*/
SELECT VendorName, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
	FROM AP.dbo.Invoices AS I
	INNER JOIN AP.dbo.Vendors AS V
		ON I.VendorID = V.VendorID
			GROUP BY VendorName
			ORDER BY InvoiceCount DESC
