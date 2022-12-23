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

/*
A HAVING clause is like a WHERE clause, but applies only to groups as a whole (that is, to the rows in the result set representing groups), 
whereas the WHERE clause applies to individual rows. A query can contain both a WHERE clause and a HAVING clause. In that case:

The WHERE clause is applied first to the individual rows in the tables or table-valued objects in the Diagram pane. 
Only the rows that meet the conditions in the WHERE clause are grouped.

The HAVING clause is then applied to the rows in the result set. Only the groups that meet the HAVING conditions appear in the query output. 
You can apply a HAVING clause only to columns that also appear in the GROUP BY clause or in an aggregate function.
*/