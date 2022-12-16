SELECT I.InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount 
	FROM AP.dbo.Invoices AS I JOIN AP.dbo.InvoiceLineItems AS LineItems
	ON (I.InvoiceID = LineItems.InvoiceID) AND 
		(I.InvoiceTotal > LineItems.InvoiceLineItemAmount)
		ORDER BY InvoiceNumber


SELECT I.InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount 
	FROM AP.dbo.Invoices AS I JOIN AP.dbo.InvoiceLineItems AS LineItems
	ON (I.InvoiceID = LineItems.InvoiceID) 
		WHERE I.InvoiceTotal > LineItems.InvoiceLineItemAmount
		ORDER BY InvoiceNumber