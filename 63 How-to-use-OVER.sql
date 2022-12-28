/*		1
The syntax for the OVER clause
aggregate_function OVER ([partition_by_clause][order_by_clause])
A query that groups summary data by dates
*/
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
	COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
	AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAvg
		FROM AP.dbo.Invoices
-- Creo que el over se aplica solo con la condicion de que se pone en el PARTITION BY 


/*		2
A query that calculates a cumulative total and a moving average
*/
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	SUM(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS CumTotal,
	COUNT(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS CountT,
	AVG(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS MovingAvg
		FROM AP.dbo.Invoices
