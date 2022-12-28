-- Simple example of UNIONS 
--Se obtiene consulta rara, intentar select por select

SELECT 'A' AS 'COL A',  'B' AS 'COL B', 'C' AS 'COL C'
	UNION
SELECT 'D' AS 'COL D',  'E' AS 'COL E', 'F' AS 'COL F'