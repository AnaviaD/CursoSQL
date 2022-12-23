--The syntax of the SELECT statement with the GROUP BY and HAVING clauses

/*SELECT select_list 
FROM table_source
    [WHERE search_condition]
    [GROUP BY group_by_list]
    [HAVING search_condition]
    [GROUP BY order_by_by_list]*/

--A summary query that  calculates the average invoice amount by vendor 
--Este query agrupa los registros por IDdelVendor y saca un AVG de sus Invoices 'facturas'
SELECT VendorID, AVG(InvoiceTotal) AS AverageInvoiceAmount
    FROM AP.dbo.Invoices
    GROUP BY VendorID
    HAVING AVG(InvoiceTotal) > 2000
    ORDER BY AverageInvoiceAmount DESC
