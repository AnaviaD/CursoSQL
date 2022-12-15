--SELECT * FROM Examples.dbo.NullSample 

--SELECT * FROM Examples.dbo.NullSample WHERE InvoiceTotal <> 0

--SELECT * FROM Examples.dbo.NullSample WHERE InvoiceTotal IS NULL

SELECT * FROM Examples.dbo.NullSample WHERE InvoiceTotal IS NOT NULL
