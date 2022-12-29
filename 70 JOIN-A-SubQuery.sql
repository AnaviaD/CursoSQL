-- A Subquery coded in the FROM clause

SELECT I.VendorID, MAX(InvoiceDate) AS LatestInv,
	AVG(InvoiceTotal) AS AvgInvoice
		FROM AP.dbo.Invoices AS I
		JOIN 
		(SELECT TOP 5 VendorID, AVG(InvoiceTotal) AS AvgInvoice
			FROM AP.dbo.Invoices
			GROUP BY VendorID
			ORDER BY AvgInvoice DESC) AS TopVendor
			ON I.VendorID = TopVendor.VendorID
		GROUP BY I.VendorID
		ORDER BY LatestInv DESC


-- Pordemos utilizar cualquiera de las columnas que utilizamos en alguno de los 
-- subqueries para la las columnas principales

SELECT I.VendorID, MAX(InvoiceDate) AS LatestInv,
	AVG(InvoiceTotal) AS AvgInvoice
-- No solamente tenemos que agregar el nombre de la columna en el subquery	
		AvgInvoice
		JOIN 
		(SELECT TOP 5 VendorID, AVG(InvoiceTotal) AS AvgInvoice
-- Tambien tenemos que agregarlo en el GROUP BY para que se ejecute correctamente 		
			FROM AP.dbo.Invoices
			GROUP BY VendorID
			ORDER BY AvgInvoice DESC) AS TopVendor
			ON I.VendorID = TopVendor.VendorID
		GROUP BY I.VendorID, AvgInvoice
		ORDER BY LatestInv DESC



-- Podemos seleccionar todas las columnas de el subquery para que aparezca en el query principal
SELECT I.VendorID, MAX(InvoiceDate) AS LatestInv,
	AVG(InvoiceTotal) AS AvgInvoice
		AvgInvoice		--,TopVendor
		JOIN 
		(SELECT TOP 5 VendorID, AVG(InvoiceTotal) AS AvgInvoice
			FROM AP.dbo.Invoices
			GROUP BY VendorID
			ORDER BY AvgInvoice DESC) AS TopVendor		--TopVendor
			ON I.VendorID = TopVendor.VendorID
		GROUP BY I.VendorID, AvgInvoice
		ORDER BY LatestInv DESC