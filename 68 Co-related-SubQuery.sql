-- A query that uses a correlated subquery

SELECT VendorID, InvoiceNumber, InvoiceTotal
	FROM AP.dbo.Invoices AS Inv_Main
		WHERE InvoiceTotal >
		(SELECT AVG(InvoiceTotal)
			FROM AP.dbo.Invoices AS Inv_Sub
			WHERE Inv_Sub.VendorID = Inv_Main.VendorID)