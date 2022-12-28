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
-- Los datos son asi como vienen y el PARTITION BY sirve para cumplir justo esa condicion sin importar los rows que vengan
-- Cuando se aplique la SUM() OVER (PARTITION BY InvoiceDate) como se toman los valores como vienen, NO SE MUESTRA EL PROCESO DE LA SUMA
-- Simplemente muestra el total de la operacion, no como el ejemplo de abajo
-- Esto es como en el caso de que aparecen 3 en la columna DATECOUNT pero
-- En las columnas donde aparece 1 como se puede ver no hay ningun cambio en DATESUM O DATE AVG	


/*		2
A query that calculates a cumulative total and a moving average
*/
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	SUM(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS CumTotal,
	COUNT(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS CountT,
	AVG(InvoiceTotal) OVER (ORDER BY InvoiceDate) AS MovingAvg
		FROM AP.dbo.Invoices
		ORDER BY InvoiceDate
