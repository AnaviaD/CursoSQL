--The explicit syntax for an outer join 
--El chiste de los LEFT Right joins es que dependiendo de de que parte de la 
--tabla este posisionado el query, va a ser la tabla que presente valores aunque 
--la tabla con la que se haga el join no contenga ningun valor 


SELECT select_list
FROM table_1
	{LEFT|RIGHT|FULL} [OUTER] JOIN table_2
		ON join_condition_1
	[{LEFT|RIGHT|FULL} [OUTER] JOIN table_3
		ON join_condition_2]

--Ejemplo 

SELECT VendorName, InvoiceNumber, InvoiceTotal
	Vendors.VendorID AS 'VendorID In Vendor Table'
	Invoices.VendorID AS 'VendorID In Invoices Table'
FROM Vendors LEFT JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName


SELECT DeptName, Departments.DeptNo, LastName
	FROM Departments LEFT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo


SELECT DeptName, Departments.DeptNo, LastName
	FROM Departments RIGHT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo