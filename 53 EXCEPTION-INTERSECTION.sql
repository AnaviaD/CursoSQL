--How to use EXCEPT and INTERSECT operators
--The syntax for the EXCEPT and INTERSECT operators

SELECT_statement_1
{EXCEPT|INTERSECT}
	SELECT_statement_2
	[ORDER BY order_by_list]


--Exclude rows from the first query 
--if they also occur in the second query
--Selecciona Toda la primer tabla excepto si en la segunda tabla aparecen los mismos valores
===========================================================
========================EXCEPT=============================
===========================================================

SELECT CustomerFirst, CustomerLast
	FROM Customers
EXCEPT 
	SELECT FirstName, LastName
	FROM Employees
ORDER BY CustomerLast

===========================================================
=======================INTERSECT===========================
===========================================================
--Este query solo trae los rows que aparezcan en las dos consultas
SELECT CustomerFirst, CustomerLast
	FROM Customers
INTERSECT
	SELECT FirstName, LastName
	FROM Employees