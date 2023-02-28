-- SP [X_FTR].[dbo].[insert_registro_vacaciones]



	DECLARE @Error INT, @ErrorDesc AS NVARCHAR(250), @rdoc INT, @xmlRoot NVARCHAR(100), @SP_Nombre AS NVARCHAR(50);
	DECLARE @OidHisTransaccion AS UNIQUEIDENTIFIER, @FechaTransaccion AS DATETIME;
	SET @OidHisTransaccion = NEWID();
	SET @FechaTransaccion = GETDATE();
	SET @SP_Nombre = OBJECT_NAME(@@PROCID);


		DECLARE @MyCursor CURSOR;
		DECLARE @stringTest as varchar (100)
		DECLARE @emplId as varchar (20)
		DECLARE @años as int
		DECLARE @nombre as varchar(150)
		DECLARE @dias as int
		DECLARE @añoActual as int
		DECLARE @añoIngreso as datetime
		DECLARE @añoIngreso2 as datetime
		DECLARE @anoDeCondicional as int
		set @añoIngreso2 = GETDATE()
		set @añoActual = (select(YEAR(getdate())))



		SET @MyCursor = CURSOR FOR (select i.empl_id, i.name, i.dateofhire from x_ftr.dbo.em i where status <> 'TER' AND month(dateofhire)=month(getdate()))
			OPEN @MyCursor 
		
			FETCH NEXT FROM @MyCursor 
			INTO @emplId, @nombre, @añoIngreso
		
			WHILE (@@FETCH_STATUS = 0 )
			BEGIN 
				set @años = (select (cast(datediff(dd, @añoIngreso ,GETDATE()) / 365 as int)) as edad)

				set @anoDeCondicional = YEAR(@añoIngreso)

				IF(@anoDeCondicional = 2022)
				BEGIN
					set @dias = (select dias = case 
									when @años < 2 and @años > 0 then 6
									when @años = 2 then 8
									when @años = 3 then 10
									when @años = 4 then 12
									when @años in (5,6,7,8,9) then 14
									when @años in (10,11,12,13,14)then 16
									when @años in (15,16,17,18,19)then 18
									when @años in (20,21,22,23,24) then 20
									when @años in (25,26,27,28,29) then 22
									when @años in (30, 31,32,33,34) then 24
									when @años > 35 then 26
									else -1
									END)
				END


				IF(@anoDeCondicional < 2022)
				BEGIN
					set @dias = (select dias = case 
									when @años < 2 and @años > 0 then 12
									when @años = 2 then 14
									when @años = 3 then 16
									when @años = 4 then 18
									when @años = 5 then 20
									when @años in (6,7,8,9,10) then 22
									when @años in (11,12,13,14,15)then 24
									when @años in (16,17,18,19,20)then 26
									when @años in (21,22,23,24,25) then 28
									when @años in (26,27,28,29,30) then 30
									when @años in (31,32,33,34,35) then 32
									when @años > 35 then 32
									else -1
									END)

				END

				


				if(@dias != -1)
				BEGIN
					set @stringTest = ' ' + RTRIM(LTRIM(@emplId)) +'     '+ RTRIM(LTRIM(@nombre)) + CHAR(9) + CONVERT(varchar(100), @añoIngreso) + ' ' + CHAR(9) + 'Tiene : ' + CONVERT(varchar(100), @dias) + ' dias' + ' '  + CHAR(9) + CONVERT(varchar(100), @anoDeCondicional);
					PRINT ('============================================================================================================================')
					PRINT (@stringTest)
					PRINT ('==============================================================')

					--insert into [x_FTR].[dbo].[trfVacacionesPeriodo] VALUES (@emplId, @añoActual, @dias,@dias, GETDATE(), null)
					--insert into [x_FTR].[dbo].[trfVacaciones] (empl_id, d_periodo, p_disfrutar, d_pendiente_p, f_sitema) values (@emplId, @dias, @añoActual,@dias, GETDATE())
				END

				FETCH NEXT FROM @MyCursor 
				INTO @emplId, @nombre, @añoIngreso
			END

		CLOSE @MyCursor ;
		DEALLOCATE @MyCursor;