--A summay query with COUNT(*), AVG, and SUM 

SELECT 'After 7/1/2019' AS SelectionDate, COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmont
		FROM AP.dbo.Invoices
			WHERE InvoiceDate > '2019-07-01'


-- A summary query with MIN and MAX

SELECT 'After 7/1/2019' AS  SelectionDate,
	COUNT(*) AS NumberOfInvoices,
	MAX(InvoiceTotal) AS HighestInvoiceTotal,
	MIN(InvoiceTotal) AS LowestInvoiceTotal
		FROM AP.dbo.Invoices
		WHERE InvoiceDate > '2019-07-01'


--A summary query for non-numeric columns

SELECT MIN(VendorName) AS FirstVendor,
	MAX(VendorName) AS LastVendor,
	COUNT(VendorName) AS NumberOfVendors
		FROM AP.dbo.Vendors


--Example with Alphabetic
--Practicar cambiando la seleccion entre MAX MIN AVG COUNT para ver que nombre nos regresa


SELECT MAX(J) AS Test
FROM (
SELECT 'John' AS  J
UNION 
SELECT 'Paul' AS P
UNION
SELECT 'Mary' AS M
) h



--A summary query with the DISTINCT keyword

SELECT COUNT(DISTINCT VendorID) AS NumberOfVendors, 
	COUNT(VendorID) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AverageInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
		FROM AP.dbo.Invoices
		WHERE InvoiceDate > '2019-07-01'
	
