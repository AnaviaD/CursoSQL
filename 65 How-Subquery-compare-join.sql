-- A query that uses an inner join

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM AP.dbo.Invoices AS I JOIN AP.dbo.Vendors
		ON I.VendorID = V.VendorID 
		WHERE VendorState = 'CA'
		ORDER BY InvoiceDate 


-- The same query restated with a subquery

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM AP.dbo.Invoices
		WHERE VendorID IN
			(SELECT VendorID
				FROM AP.dbo.Vendors
				WHERE VendorState = 'CA')
		ORDER BY InvoiceDate DESC


-- Demostramos que trae una lista de donde tomar los valores
-- Es el mismo query que arriba pero en lugar de el subquery vamos a poner la lista como tal
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM AP.dbo.Invoices
		WHERE VendorID IN
			(4, 6, 7)
		ORDER BY InvoiceDate DESC

/*
Ventajas de los joins
1.- Los resultados de un join pueden traer columnas de ambas tablas
2.- Un join tiende a ser mas intuitivos cuando hay una relacion entre 2 tablas 
3.- Un query con un join usualmente se ejecuta mas rapido que un subquery

Ventajas de Subqueries
1.- Un subquery puede pasar un valor agregado "aggregate value to the outer query"
2.- Un subquery tiende a ser mas intuitivo cuando se usa "ad hoc relationship between two tables"
3.- Long, complex queries can sometimes be easier to code using subqueries
*/		