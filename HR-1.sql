/*
Query all columns for all American cities in the CITY
table with populations larger than 100000. The CountryCode for America is USA.
The CITY table is described as follows:

Quericaso que nos traiga todas las columnas de la tabla CITY 
donde el campo POPULATION sobrepase los 100000 unidades 
y el COUNTRYCODE sea igual a USA
*/

SELECT * FROM CITY WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA'