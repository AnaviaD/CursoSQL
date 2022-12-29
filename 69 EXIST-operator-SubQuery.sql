-- A query that returns vendors without invoices
-- Regresa vendedores sin facturas

SELECT VendorID,  VendorName, VendorState
	FROM AP.dbo.Vendors
	WHERE NOT EXISTS
		(SELECT *
		FROM AP.dbo.Invoices
		WHERE AP.dbo.Invoices.VendorID = AP.dbo.Vendors.VendorID)


SELECT V.VendorID, VendorName, VendorState
	FROM AP.dbo.Vendors AS V LEFT JOIN AP.dbo.Invoices AS I
	ON V.VendorID = I.VendorID
	WHERE I.VendorID IS NULL

--The syntax of a subquery with EXISTS
WHERE [NOT] EXISTS (subquery)