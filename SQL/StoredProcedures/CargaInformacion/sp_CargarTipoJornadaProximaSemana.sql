USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarTipoJornadaProximaSemana
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarTipoJornadaProximaSemana
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
			SET LANGUAGE SPANISH;
			CREATE TABLE #FechasJueves(Fecha DATE);

			INSERT INTO #FechasJueves
				SELECT 
					operacion.value('@Fecha','DATE') AS Fecha
						
				FROM 
				(
					SELECT CAST(c AS XML) FROM
					OPENROWSET(
						BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
						SINGLE_BLOB
					) AS T(c)
					) AS S(C)
					CROSS APPLY c.nodes('Datos/Operacion') AS A (operacion)

				WHERE 
					(SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = 4;


			DECLARE @cantidadJueves INT , @OperacionesXSemana INT, @indexTablaSemana INT; 
			SELECT @cantidadJueves = COUNT(*) FROM #FechasJueves;
			CREATE TABLE #operacionesPorJueves (Fecha DATE,operaciones INT);

			WHILE @cantidadJueves>0
				BEGIN
					DECLARE @fechaActual DATE;
					SELECT @fechaActual = (SELECT TOP(1) Fecha FROM #FechasJueves);
					CREATE TABLE #cantidadPorJueves (id INT);

					INSERT INTO #cantidadPorJueves

							SELECT
								operacion.value('@TipoJornadaProximaSemana/@idJornada','INT')

							FROM 
							(
								SELECT CAST(c AS XML) FROM
								OPENROWSET(
									BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
									SINGLE_BLOB
								) AS T(c)
								) AS S(C)
								CROSS APPLY c.nodes('Datos/Operacion') AS A (operacion)

							WHERE 
								(operacion.value('@Fecha','DATE') = @fechaActual)

					
					SELECT @OperacionesXSemana = COUNT(*) FROM #cantidadPorJueves;				
					
					INSERT INTO #operacionesPorJueves
						VALUES(
							@fechaActual,
							@OperacionesXSemana
							)

					DELETE TOP (1) FROM #FechasJueves
					SELECT @cantidadJueves = COUNT(*) FROM #FechasJueves;
					DROP TABLE #cantidadPorJueves;
				END

			DROP TABLE #FechasJueves; 

			CREATE TABLE #tipoJornadaProximaS (idJornada INT,ValorDocIdentidad INT);

			INSERT INTO  #tipoJornadaProximaS
				SELECT 
					tipoJornadaProximaSemana.value('@IdJornada','INT') AS idJornada,
					tipoJornadaProximaSemana.value('@ValorDocumentoIdentidad','INT')

				FROM 
						(
							SELECT CAST(c AS XML) FROM
							OPENROWSET(
								BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
								SINGLE_BLOB
							) AS T(c)
							) AS S(C)
							CROSS APPLY c.nodes('Datos/Operacion/TipoDeJornadaProximaSemana') AS A (tipoJornadaProximaSemana)
			Select * From #tipoJornadaProximaS;
			Select * From #operacionesPorJueves;
			SELECT @indexTablaSemana = COUNT(*) FROM #operacionesPorJueves;
			WHILE @indexTablaSemana>1
				BEGIN
					PRINT 'Entre al primer while';
					DECLARE @CantidadOperaciones INT = 0;
					WHILE @CantidadOperaciones<= (SELECT TOP(1) operaciones FROM #operacionesPorJueves)
						BEGIN
							PRINT 'Entre al segundo while';
							INSERT INTO dbo.Jornada
								VALUES(
								(SELECT TOP (1) idJornada FROM #tipoJornadaProximaS),
								(SELECT E.Id FROM dbo.Empleado AS E WHERE E.ValorDocumentoIdentidad = (SELECT TOP (1) ValorDocIdentidad FROM #tipoJornadaProximaS)),
								(SELECT Id FROM dbo.SemanaPlanilla WHERE FechaInicio = (SELECT DATEADD(DAY, 1, (SELECT TOP(1) Fecha FROM #operacionesPorJueves))))
							)
							PRINT 'Termine de insertar';
							Print 'Cantidad de operaciones' + @CantidadOperaciones;
							DELETE TOP (1) FROM #tipoJornadaProximaS
							SELECT @CantidadOperaciones = @CantidadOperaciones+1;
						END
					DELETE TOP (1) FROM #operacionesPorJueves;
					SELECT @indexTablaSemana = COUNT(*) FROM #operacionesPorJueves;
				END

			DROP TABLE #operacionesPorJueves; 
			DROP TABLE #tipoJornadaProximaS; 
			COMMIT TRANSACTION TSaveMov;

		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO