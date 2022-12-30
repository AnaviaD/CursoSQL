-- Ejemplo de un indexador SP
DECLARE @numero_pagina			INT = 1;
DECLARE @registros_por_pag		INT = 20;
SELECT i.InvoiceNumber, v.VendorName
FROM AP.dbo.Vendors as v JOIN AP.dbo.Invoices as i
	ON v.VendorID = i.VendorID
	ORDER BY i.InvoiceNumber ASC
	--El offset sirve para brincarse los primeros registros
	--En el Index nos es util para saltarse los primeros 
	OFFSET (@numero_pagina - 1) * @registros_por_pag ROWS 
	--Fetch next sirve para alimentar los registros despues de que se brincaron
	FETCH NEXT @registros_por_pag ROWS ONLY 