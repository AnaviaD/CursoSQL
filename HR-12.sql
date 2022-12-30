-- Weather Observation Station 8
/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both 
their first and last characters. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:
*/

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

-- Selecionar las ciudades que comiencen y terminen con las letras de las vocales 
-- a e i o u

SELECT DISTINCT CITY 
    FROM STATION WHERE LEFT(CITY, 1) IN ('a','e','i','o','u')
        AND 
    RIGHT(CITY, 1) IN ('a','e','i','o','u');