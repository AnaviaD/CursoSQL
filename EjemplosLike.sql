--SELECT * FROM AP.dbo.Vendors WHERE VendorState LIKE 'N[A-J]' 

--SELECT * FROM AP.dbo.Vendors WHERE VendorState LIKE 'N[^K-Y]' 

--Traemos los zipcodes que empiezan con 0's 
SELECT VendorZipCode, * FROM AP.dbo.Vendors
WHERE VendorZipCode NOT LIKE '[1-9]%'