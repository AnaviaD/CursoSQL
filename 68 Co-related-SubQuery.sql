-- A query that uses a correlated subquery
-- Con este query quiere traer todos los registros donde el InvoiceTotal sea mayor al promedio

SELECT VendorID, InvoiceNumber, InvoiceTotal
	FROM AP.dbo.Invoices AS Inv_Main
		WHERE InvoiceTotal >
			(SELECT AVG(InvoiceTotal)
				FROM AP.dbo.Invoices AS Inv_Sub
				WHERE Inv_Sub.VendorID = Inv_Main.VendorID)