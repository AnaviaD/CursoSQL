select * from (
		SELECT  t5.AF, 
		 t1.clave, 
		   t1.assetno as Unidad, 
		     t1.desc_ruta, 
		       t6.description,
		         t1.oc as Talon, 
		           (SELECT TOP 1 ETA_DATE FROM x_FTR.dbo.TB_EDI_FTRail WHERE REFERENCE_NUMBER = t1.oc  AND TRANSACTION_TYPE = 'AF' AND ENVIADO_STARS = '1') AS ultima_eta_enviada,
		             getdate() horaActual, 
   		   	           t2.Llegada_Programada AS Llegada_Programada,  
		   	             t3.Direccion, 
		   		           (select top 1 DELIVERY_LOCATION_CODE from x_ftr.dbo.TB_EDI_FTRail where REFERENCE_NUMBER = t1.oc ) as Delivery, 
                 	         (select top 1 PICKUP_LOCATION_CODE from x_ftr.dbo.TB_EDI_FTRail where REFERENCE_NUMBER = t1.oc ) as Pickup, 
					           (select datediff(mi, getdate(), t5.ultima_eta_enviada)) as diferenciaEtaEnviadavsHoraActual,
							     (select count (*) from x_ftr.dbo.TB_EDI_FTRail where REFERENCE_NUMBER = t1.oc and TRANSACTION_TYPE = 'x1') as countX1,
								   (SELECT top 1 Geocerca from ftrail.dbo.Visita_Geocerca  where date_arrival > CONVERT(DATETIME,CONCAT(CONVERT(VARCHAR(11), t1.org_date, 120), '', t1.org_time / 1000, (t1.org_time / 100) - ((t1.org_time / 1000) * 10), ':', (t1.org_time % 100) / 10, t1.org_time % 10, ':00.000'), 120) 
													and date_departure is null and oc COLLATE MODERN_SPANISH_CI_AS = t1.oc ) geocerca
		FROM    x_FTR.dbo.trfwkaw					AS t1 INNER JOIN
				ftrail.dbo.Estatus_Viajes			AS t2 ON t1.oc = t2.Talon COLLATE Modern_Spanish_CI_AS INNER JOIN
				x_FTR.dbo.Estatus_Unidades_FTRail	AS t3 ON t1.assetno = t3.Unidad INNER JOIN
				x_FTR.dbo.eventos_prueba			AS t5 ON t1.oc = t5.talon INNER JOIN
				x_FTR.dbo.stptcc					as t6 ON t6.costcenter COLLATE MODERN_SPANISH_CI_AS = t1.cto_operativo 
		where t5.X3 > 0
		AND t5.AF > 0
		AND t5.X1 = 0) as t
	where t.countX1 = 0
	order by t.diferenciaEtaEnviadavsHoraActual asc