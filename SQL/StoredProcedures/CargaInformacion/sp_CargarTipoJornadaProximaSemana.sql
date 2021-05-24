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
						operacion.value('@Fecha','DATE') AS Fecha,
						0 AS  cantidadOperaciones
						
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


			DECLARE @cantidadJueves INT; 
			SELECT @cantidadJueves = COUNT(*) FROM #FechasJueves;
			CREATE TABLE #operacionesPorJueves (Fecha DATE,operaciones INT);

			WHILE @cantidadJueves>0
				BEGIN

					DECLARE @fechaActual DATE;
					SELECT @fechaActual = (SELECT TOP(1) Fecha FROM #FechasJueves);
					
					INSERT INTO #operacionesPorJueves
						VALUES(
						@fechaActual,
							(SELECT COUNT(*) 
								FROM 
								(
									SELECT CAST(c AS XML) FROM
									OPENROWSET(
										BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
										SINGLE_BLOB
									) AS T(c)
									) AS S(C)
									CROSS APPLY c.nodes('Datos/Operacion/TipoJornadaProximaSemana') AS A (operacion)

								WHERE 
									(SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = @fechaActual)
									)

					DELETE TOP (1) FROM #FechasJueves
					SELECT @cantidadJueves = COUNT(*) FROM #FechasJueves;

				END

			DROP TABLE #FechasJueves; 




				INSERT INTO dbo.Jornada
					SELECT

						tipoJornadaProximaSemana.value('@IdJornada','INT') AS idJornada,
						(SELECT E.Id FROM dbo.Empleado AS E WHERE E.ValorDocumentoIdentidad = tipoJornadaProximaSemana.value('@ValorDocumentoIdentidad','INT')),
						(SELECT Id FROM dbo.SemanaPlanilla WHERE Id = (SELECT IDENT_CURRENT('SemanaPlanilla')))
            
					FROM 
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Operacion/TipoDeJornadaProximaSemana') AS A (tipoJornadaProximaSemana)
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