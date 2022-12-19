--Table from AP 
--Inner join de mas de dos tablas
SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceLineItemAmount AS LineItemAmount, AccountDescription
FROM Vendors
	JOIN Invoices ON Vendors.VendorsID = Invoices.VendorID
	JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	JOIN GLAcounts ON InvoiceLineItems.AcountNo = GLAccounts.AccountNo 
		WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
		ORDER BY VendroName, LineItemAmount DESC;