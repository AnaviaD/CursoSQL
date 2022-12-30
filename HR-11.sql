-- Weather Observation Station 7
/*
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:
*/

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

-- Selecionar las ciudades que terminen con las letras de las vocales 
-- a e i o u

SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY, 1) IN ('a','e','i','o','u');