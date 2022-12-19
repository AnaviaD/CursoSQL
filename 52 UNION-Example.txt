-- Simple example of UNIONS 
--Se obtiene consulta rara, intentar select por select

SELECT 'A' AS 'COL A',  'B' AS 'COL B', 'C' AS 'COL C'
	UNION
SELECT 'D' AS 'COL D',  'E' AS 'COL E', 'F' AS 'COL F'

-- Primer ejemplo de UNION

--Tienen los mismos campos pero vienen de diferentes tablas
--En el query final se mostraran como pagado y activo 
--Nos sirve para juntar dos condiciones diferentes 
--Es como una suma a la tabla


SELECT 'Active' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM ActiveInvoices
	WHERE InvoiceDate >= '01/01/2016'
UNION
	SELECT 'Paid' AS Source, InvoiceNumber, InvoiceDare, InvoiceTotal
	FROM PaidInvoices
	WHERE InvoiceDate >= '01/01/2016'
ORDER BY InvoiceTotal DESC

--Segundo ejemplo


SELECT 'Active' AS Source,  InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
	WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
UNION
SELECT 'Paid' AS Source,  InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
	WHERE InvoiceTotal - PaymentTotal - CreditTotal <= 0
ORDER BY InvoiceTotal DESC

--A union that combines payment data
--from the same joined tables (part 1)
--Ejemplo de como se veria una cantidad haciendo el union a la misma tabla

SELECT InvoiceNumber, VendorName, '33% Payment' AS PaymentType, InvoiceTotal AS total,
(InvoiceTotal * 0.333) AS Payment
	FROM Invoices JOIN Vendors
	ON Invoices.VendorID = Vendors.VendorID
	WHERE InvoiceTotal > 10000
UNION 
SELECT InvoiceNumber, VendorName, '50% Payment' AS PaymentType, InvoiceTotal AS Total,
(InvoiceTotal * 0.5) AS Payment
	FROM Invoices JOIN Vendors
	ON Invoices.VendorID = Vendors.VendorID
	WHERE InvoiceTotal BETWEEN 500 AND 10000
UNION 
SELECT InvoiceNumber, VendorName, 'Full amount' AS PaymentType, InvoiceTotal AS Total,
InvoiceTotal AS Payment
	FROM Invoices JOIN Vendors
	ON Invoices.VendorID = Vendors.VendorID
	WHERE InvoiceTotal < 500
ORDER BY PaymentType

