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
--Existe union y union all, la diferencia es que: 
--En [UNION] se traen rows unicos 
--En [UNION ALL] se traen todos los rows sin importar que sean repetidos


SELECT 'Active' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM ActiveInvoices
	WHERE InvoiceDate >= '01/01/2016'
UNION
	SELECT 'Paid' AS Source, InvoiceNumber, InvoiceDare, InvoiceTotal
	FROM PaidInvoices
	WHERE InvoiceDate >= '01/01/2016'
ORDER BY InvoiceTotal DESC
