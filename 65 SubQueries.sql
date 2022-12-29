/*
Four waus to introduce a subquery in a SELECT statement
1.- In a WHERE clause as a search condition
2.- In a HAVING clause as a search condition
3.- In the FROM clause as a table specification
4.- In the SELECT clause as a column specification
*/

-- A subquery in the WHERE clause
SELECT InvoiceNumber,  InvoiceDate, InvoiceTotal
	FROM AP.dbo.Invoices
		WHERE InvoiceTotal >
			(SELECT AVG(InvoiceTotal)
			FROM AP.dbo.Invoices)
			ORDER BY InvoiceTotal DESC
-- Ya lo habia utilizado, el subquery en el WHERE solo nos trae una lista de los mayores al promedio
-- Como la niña con Iq mayor al promedio

SELECT AVG(InvoiceTotal)
			FROM AP.dbo.Invoices
-- Probamos el query antes de usarlo en la consulta

/*
WHERE  a subquery can be introduced
If a subquery returns...						It can be introduced..
A single value									Anywhere an expression is allowed
A result set with a single column				In place of a list of values
A result set with one or more columns			In place of a table in the FROM clause 
*/