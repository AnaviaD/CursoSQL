--A summary query with a search condition in the HAVING clause

SELECT VendorName, COUNT (*) AS InvoiceQty,
    AVG(InvoiceTotal) AS InvoiceAvg
        FROM AP.dbo.Vendor AS V JOIN AP.dbo.Invoices AS I
        ON V.VendorID = I.VendorID
    GROUP BY VendorName
    HAVING AVG(InvoiceTotal) > 500
    ORDER BY InvoiceQty DESC


    SELECT VendorName, COUNT (*) AS InvoiceQty,
    AVG(InvoiceTotal) AS InvoiceAvg
        FROM AP.dbo.Vendor AS V JOIN AP.dbo.Invoices AS I
        ON V.VendorID = I.VendorID
    HAVING AVG(InvoiceTotal) > 500
    GROUP BY VendorName
    ORDER BY InvoiceQty DESC

/*Tiene una diferencia en cuanto a el agrupamiento de datos 
1.- En el primer ejemplo primero se agrupan los datos y despues se 
obtienen aquellos que sean mayores a 500 

2.- En el segundo ejemplo primero se Obtienen lo que son mayor a 500
y despues se agrupan los resultados */

