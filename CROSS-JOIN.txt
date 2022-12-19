--Syntaxis de Cross JOIN 
--Como no tiene ningun tipo de condicion y todo se va a mosntrar en el mismo row
--los resultados se van a multiplicar tabla por tabla por el mismo problema de la condicion
--el primer valor de la tabla tomara cada uno de los valores de la otra tabla 
--y el seg valor tendra de nuevo cada uno de los valores de la otra tabla 

-- Explicit syntax
SELECT Departments.DeptNo, DeptName, EmployeeID, LastName
FROM Departments
CROSS JOIN 
	Employees
	ORDER BY Departments.DeptNo;


-- Implicit syntax
SELECT Departments.DeptNo, DeptName, EmployeeID, LastName
FROM Departments, Employees
	ORDER BY Departments.DeptNo;