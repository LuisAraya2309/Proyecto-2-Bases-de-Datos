USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarMesesSemanas
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarMesesSemanas
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
			@OutResultCode=0 ;

			DECLARE @countFechas INT; DECLARE @countSemanas INT;
			CREATE TABLE #FechasTemporales(fecha DATE);
			CREATE TABLE #FechasSemana(fecha DATE);
			SET LANGUAGE Spanish 
			BEGIN TRANSACTION TSaveMov
				INSERT INTO  #FechasTemporales

					SELECT
						operacion.value('@Fecha','DATE') 
					FROM
					(
						SELECT  CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Operacion') AS A (operacion)
					WHERE
						(((SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = 4) OR ((SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = 5));


				SELECT @countFechas = COUNT(*) FROM #FechasTemporales;
				SELECT @countSemanas = COUNT(*) FROM #FechasTemporales;

				--Se crea la copia de la fechasTemporales
				INSERT INTO #FechasSemana

					SELECT fecha
					FROM #FechasTemporales

				--Se insertan los meses 
				DECLARE @fechaInicio DATE = (SELECT DATEADD(DAY,1,(SELECT TOP (1) fecha FROM #FechasTemporales)));
				DECLARE @mesActual INT = (SELECT DATEPART(MONTH, (SELECT TOP (1) fecha FROM #FechasTemporales)));

				WHILE @countFechas > 0

					BEGIN
						DECLARE @fechaActual DATE = (SELECT TOP(1) fecha FROM #FechasTemporales);

						IF (SELECT DATEPART(WEEKDAY,@fechaActual)) = 4 AND  @mesActual <> (SELECT DATEPART(MONTH,@fechaActual))
							BEGIN
								INSERT INTO MesPlanilla
								VALUES(
									@fechaInicio
									,@fechaActual
								)
								SET @fechaInicio = (SELECT DATEADD(DAY,1,@fechaActual));
								SET @mesActual = (SELECT DATEPART(MONTH,@fechaActual));
							END
						DELETE TOP (1) FROM #FechasTemporales
						SELECT @countFechas = COUNT(*) FROM #FechasTemporales;
					END
				DROP TABLE #FechasTemporales;

				--Se insertan las semanas

				WHILE @countSemanas > 0

					BEGIN
						DECLARE @fechaActualS DATE = (SELECT TOP(1) fecha FROM #FechasSemana);

						IF (SELECT DATEPART(WEEKDAY,@fechaActualS)) = 5
							BEGIN
								INSERT INTO SemanaPlanilla
								VALUES(
									@fechaActualS
									, (SELECT DATEADD(DAY,6,@fechaActualS))
									, (SELECT id FROM MesPlanilla AS MP WHERE(SELECT DATEPART(MONTH,MP.FechaIncio)) = (SELECT DATEPART(MONTH,@fechaActualS)))
								)
							END
						DELETE TOP (1) FROM #FechasSemana
						SELECT @countSemanas = COUNT(*) FROM #FechasSemana;
					END
				DROP TABLE #FechasSemana;
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