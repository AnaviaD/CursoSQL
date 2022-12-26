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


/*		4
Escribir una consulta que regrese 3 columnas 
AccountDescription:	Column on the GLAccounts table
Match AccountNo en GLAccounts y en InvoiceLineItems
LineItemCount:		Es el numero de entradas en la tabla de InvoiceLineItems 
LineItemSum:		La suma de la col InvoiceLineItemAmount
Todo agrupado por AccountNo
*/

SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM AP.dbo.GLAccounts AS G
	INNER JOIN AP.dbo.InvoiceLineItems AS II
		ON G.AccountNo = II.AccountNo
		GROUP BY AccountDescription
		HAVING COUNT(*) > 1
		ORDER BY LineItemCount DESC


/*		5
Modificar la solucion para el ejercicio filtrar los invoices de el 1 de febrero 2015
*/

SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM AP.dbo.GLAccounts AS G
	INNER JOIN AP.dbo.InvoiceLineItems AS II
		ON G.AccountNo = II.AccountNo
	INNER JOIN AP.dbo.Invoices AS I
		ON I.InvoiceID = II.InvoiceID
		WHERE I.InvoiceDate BETWEEN '2019-10-01'AND '2019-12-31'
		GROUP BY AccountDescription
		HAVING COUNT(*) > 1
		ORDER BY LineItemCount DESC