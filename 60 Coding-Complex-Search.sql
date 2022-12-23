--A summary query with a compound condition in the HAVING clause

SELECT InvoiceDate, COUNT(*) AS InvoiceQty, SUM(InvoiceTotal) AS InvoiceSum
    FROM AP.dbo.Invoices
    GROUP BY InvoiceDate
    HAVING InvoiceDate BETWEEN '2020-01-01' AND '2020-01-31'
        AND COUNT(*) > 1
        AND SUM(InvoiceTotal) > 100
    ORDER BY InvoiceDate DESC


SELECT InvoiceDate, COUNT(*) AS InvoiceQty, SUM(InvoiceTotal) AS InvoiceSum
    FROM AP.dbo.Invoices
    WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-01-31'
    GROUP BY InvoiceDate
    HAVING COUNT(*) > 1
        AND SUM(InvoiceTotal) > 100
    ORDER BY InvoiceDate DESC    

    /*  
    Se supone que hay una ventaja de poner todas las condiciones
    en el HAVING condicion
    -Pero el resultado de la consulta deberia ser la misma
    */