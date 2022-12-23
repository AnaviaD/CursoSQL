--A summary query that counts the number of invoices by vendor
SELECT VendorID, COUNT(*) AS InvoiceQty
FROM AP.dbo.Invoices
GROUP BY VendorID

--A summary query that groups by two columns
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty,
    AVG(InvoiceTotal) AS InvoiceAVG
        FROM AP.dbo.Invoices AS I JOIN AP.dbo.Vendors AS V
        ON I.VendorID = V.VendorID
GROUP BY VendorState, VendorCity
ORDER BY VendorState, VendorCity        

--The same summary query with a HAVING clause that limits the results
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty,
    AVG(InvoiceTotal) AS InvoiceAVG
        FROM AP.dbo.Invoices AS I JOIN AP.dbo.Vendors AS V
        ON I.VendorID = V.VendorID
    GROUP BY VendorState, VendorCity
    HAVING COUNT(*) >= 2
    ORDER BY VendorState, VendorCity