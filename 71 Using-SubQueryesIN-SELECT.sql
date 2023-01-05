-- Using a sub query in the SELECT clause
-- En este caso el valor de la segunda columna va a ser variable 

SELECT DISTINCT VendorName,		--Tomamos los datos y las columnas de el FROM
	(SELECT MAX(InvoiceDate) FROM AP.dbo.Invoices
	WHERE AP.dbo.Invoices.VendorID = AP.dbo.Vendors.VendorID) AS LatestInv
		FROM AP.dbo.Vendors		--Aqui es donde se va a tomar la lista y no se repetira
		ORDER BY LatestInv DESC;


-- El mismo query pero sin el sub-Query

SELECT VendorName, MAX(InvoiceDate) AS LatestInv
	FROM AP.dbo.Vendors AS V LEFT JOIN AP.dbo.Invoices AS I
		ON V.VendorID = I.VendorID
		GROUP BY VendorName
		ORDER BY LatestInv DESC;

-- Se ahorro hacer el Inner Join pero se hace una segunda consulta en el select
-- Parece que todo lo define el FROM final 
-- Ese FROM o WHERE Va a ser el que trae la lista final 