--SELECT * FROM AP.dbo.Vendors WHERE VendorState LIKE 'N[A-J]' 

--SELECT * FROM AP.dbo.Vendors WHERE VendorState LIKE 'N[^K-Y]' 

--Traemos los zipcodes que empiezan con 0's 
--SELECT VendorZipCode, * FROM AP.dbo.Vendors WHERE VendorZipCode NOT LIKE '[1-9]%'

--SELECT * FROM Examples.dbo.NullSample WHERE InvoiceTotal <> 0

--SELECT * FROM Examples.dbo.NullSample WHERE InvoiceTotal IS NOT NULL

SELECT * FROM Examples.dbo.NullSample WHERE InvoiceTotal IS NULL