-- The syntax of a WHERE clause that uses an IN phrase with a subquery
-- WHERE test_expression [NOT] IN (subquery)

SELECT VendorID, VendorName, VendorState
	FROM AP.dbo.Vendors
	WHERE VendorID NOT IN 
		(SELECT DISTINCT VendorID
			FROM AP.dbo.Invoices)

-- The query restated without a subquery 
SELECT V.VendorID, VendorName, VendorState
	FROM AP.dbo.Vendors AS V LEFT JOIN AP.dbo.Invoices
		ON V.VendorID = I.VendorID
		WHERE I.VendorID IS NULL
-- Left join quiere devir que la tabla que este de lado IZQ va a ser 
-- La tabla que tenga todos los registros 		