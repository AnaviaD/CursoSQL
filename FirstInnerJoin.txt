SELECT InvoiceNumber, VendorName, InvoiceDueDate, InvoiceTotal - PaymentTotal - CreditTotal AS Balance
	FROM AP.dbo.Vendors AS V JOIN AP.dbo.Invoices AS I
		ON V.VendorID = I.VendorID
		WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
		ORDER BY InvoiceDueDate DESC