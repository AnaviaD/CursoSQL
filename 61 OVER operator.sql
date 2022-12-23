-- The syntax of the OVER clause

aggregate_function OVER ([partition_by_clause]
    [order_by_clause])

--A query that groups the summaty data by date

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
    SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
    COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
    AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAvg
        FROM AP.dbo.Invoices


SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
    SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS CumTotal,
    COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS Count,
    AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS MovingAvg
        FROM AP.dbo.Invoices

/*
El oerador OVER sirve para llevar una cuenta o tomar en cuenta el registro anterior 
*/