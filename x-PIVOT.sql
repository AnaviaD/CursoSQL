/*
Explicacion de Microsoft
https://learn.microsoft.com/es-es/sql/t-sql/queries/from-using-pivot-and-unpivot?view=sql-server-ver16
===============================uso de PIVOT y UNPIVOT===============================
Se pueden usar los operadores relacionales PIVOT y UNPIVOT para modificar una expresión con valores de tabla en otra tabla. 
PIVOT gira una expresión con valores de tabla al convertir los valores únicos de una columna en la expresión en varias 
columnas en la salida. Y PIVOT ejecuta agregaciones donde se requieren en los valores de columna restantes que se desean 
en la salida final. UNPIVOT realiza la operación contraria a PIVOT girando las columnas de una expresión con valores 
de tabla a valores de columna.

La sintaxis de PIVOT es más sencilla y legible que la sintaxis que se puede especificar en una serie compleja de 
instrucciones SELECT...CASE. Para obtener una descripción completa de la sintaxis de PIVOT, 
vea FROM (Transact-SQL).
*/

--======================================================================================
--================================Syntax sql============================================
--======================================================================================
SELECT <non-pivoted column>,  
    [first pivoted column] AS <column name>,  
    [second pivoted column] AS <column name>,  
    ...  
    [last pivoted column] AS <column name>  
FROM  
    (<SELECT query that produces the data>)   
    AS <alias for the source query>  
PIVOT  
(  
    <aggregation function>(<column being aggregated>)  
FOR   
[<column that contains the values that will become column headers>]   
    IN ( [first pivoted column], [second pivoted column],  
    ... [last pivoted column])  
) AS <alias for the pivot table>  
<optional ORDER BY clause>;  
--======================================================================================
--================================Syntax sql============================================
--======================================================================================


/*
Tomando la explicacion de un blog
https://www.sqlshack.com/dynamic-pivot-tables-in-sql-server/
Creamos una tabla de ejemplo

CREATE TABLE Grades(
  [Student] VARCHAR(50),
  [Subject] VARCHAR(50),
  [Marks]   INT
)
GO
 
INSERT INTO Grades VALUES 
('Jacob','Mathematics',100),
('Jacob','Science',95),
('Jacob','Geography',90),
('Amilee','Mathematics',90),
('Amilee','Science',90),
('Amilee','Geography',100)
GO

--Y ahora lo probamos con el query de aqui abajo

SELECT * FROM (
  SELECT
    [Student],
    [Subject],
    [Marks]
  FROM Grades
) StudentResults
PIVOT (
  SUM([Marks])
  FOR [Subject]
  IN (
    [Mathematics],
    [Science],
    [Geography]
  )
) AS PivotTable
*/

--Explicando el query anterior 
/*
The SUM() operator
Necesita un valor para meter en las columnas, ya sea hacer la sumatoria de diferentes datos ó el conteo
de datos, en este caso como es uno por registro aplicamos SUM(), asi pasara el valor limpio pero en 
otros casos se utiliza tambien el de COUNT()
*/

/*
The FOR keyword
Este es un campo muy importante ya que es el que le va a indicar sobre cual campo 'columna' se va a hacer el conteo
suma o cualquier tipo de agrupacion, esto va a hacer que se relacione la columna pertinente con el valor de la misma
*/

/*
The IN keyword
En este contexto nos brinda la estructura de aplicar el FOR de antes para poder insertar cada uno de los 
casos en las opciones dadas anteriormente 
*/


SUM([Marks])            --  Nos da la opcion de agrupar la columna seleccionada
  FOR [Subject]         --  Esta es la columna de la que va a tomar los valores para meterlos en el IN()
  IN (                  --  Es la forma que tiene sql para agrupar los valores sumatorios de la
    [Mathematics],      --  Columna anterior.
    [Science],
    [Geography]
  )