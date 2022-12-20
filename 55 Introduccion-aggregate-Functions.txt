-- A summary query that counts unpaid invoices
--and calculates the total due

SELECT COUNT(*) AS NumberOfInvoices, SUM(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices
	WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0 