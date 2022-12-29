/*
Query the NAME field for all American cities in the CITY
table with populations larger than 120000. The CountryCode for America is USA.

The CITY table is described as follows:

Selecciona el campo NAME para todas las ciudades americanas con la poblacion mayor a 120000
Con el  COUNTRYCODE de USA 
*/

SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA'

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE = "USA";

-- Hay que poner el punto y coma para que lo tome en cuenta segun la pagina ;