--Weather Observation Station 5

/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective 
lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:

where LAT_N is the northern latitude and LONG_W is the western longitude.
Sample Input
For example, CITY has four entries: DEF, ABC, PQRS and WXY.
Sample Output

ABC 3
PQRS 4
Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with 
lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, 
because it comes first alphabetically.

Note
You can write two separate queries to get the desired output. It need not be a single query.
*/
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

-- Hay que seleccionar el nombre de la ciudad que tenga mas y menos caracteres,
-- En caso de que esxistan 2 o mas casos similares, se debe tomar en cuenta el orden afabetico
-- Hay que seleccionar el nombre de la ciudad y el numero de caracteres que posee
-- Para obtener el numero de caracteres como en js se utiliza la palabra LEN()


SELECT TOP 1 CITY, LEN(CITY) 
    FROM STATION 
    ORDER BY LEN(CITY),CITY; 
SELECT TOP 1 CITY, LEN(CITY) 
    FROM STATION 
    ORDER BY LEN(CITY) DESC,CITY;