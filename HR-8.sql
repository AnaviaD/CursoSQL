--Weather Observation Station 4

/*
Find the difference between the total number of CITY entries in the table and the number of 
distinct CITY entries in the table.
The STATION table is described as follows:

where LAT_N is the northern latitude and LONG_W is the western longitude.

For example, if there are three records in the table with CITY values 'New York', 'New York', 'Bengalaru',
there are 2 different city names: 'New York' and 'Bengalaru'. The query returns , because .

total number of records - number of unique city names = 3 - 2 = 1.
*/

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;