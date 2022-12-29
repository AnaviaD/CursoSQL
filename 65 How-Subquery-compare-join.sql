-- A query that uses an inner join

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM AP.dbo.Invoices AS I JOIN AP.dbo.Vendors
		ON I.VendorID = V.VendorID 
		WHERE VendorState = 'CA'
		ORDER BY InvoiceDate 


-- The same query restated with a subquery

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM AP.dbo.Invoices
		WHERE VendorID IN
			(SELECT VendorID
				FROM AP.dbo.Vendors
				WHERE VendorState = 'CA')
		ORDER BY InvoiceDate DESC