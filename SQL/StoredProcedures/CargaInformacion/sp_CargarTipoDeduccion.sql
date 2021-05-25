USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarTipoDeduccion
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarTipoDeduccion
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;
			CREATE TABLE #TipoDeduccionTemporal(id int,esObligatorio VARCHAR(40),esPorcentual VARCHAR(40), valor FLOAT(3));
			DECLARE @count INT;
			BEGIN TRANSACTION TSaveMov
				INSERT INTO TipoDeduccion 
					SELECT

						tipoDeduccion.value('@Id','INT') AS id,
						tipoDeduccion.value('@Nombre','VARCHAR(40)') AS nombre,
						tipoDeduccion.value('@Obligatorio','VARCHAR(40)') AS esObligatorio,
						tipoDeduccion.value('@Porcentual','VARCHAR(40)') AS esPorcentual

					FROM
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccion)

				INSERT INTO #TipoDeduccionTemporal
					SELECT

						tipoDeduccionTemp.value('@Id','INT') AS id,
						tipoDeduccionTemp.value('@Obligatorio','VARCHAR(40)') AS esObligatorio,
						tipoDeduccionTemp.value('@Porcentual','VARCHAR(40)') AS esPorcentual,
						tipoDeduccionTemp.value('@Valor','FLOAT(3)') AS valor

					FROM
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccionTemp)
				SELECT @count = COUNT(*) FROM #TipoDeduccionTemporal;

				WHILE @count > 0

					BEGIN
						IF EXISTS(SELECT TOP (1) * FROM #TipoDeduccionTemporal AS TD WHERE TD.esObligatorio = 'Si')
							BEGIN
								INSERT INTO DeduccionPorcentualObligatoria
								VALUES(
								(SELECT TOP (1)  id FROM #TipoDeduccionTemporal AS TD)
								, (SELECT TOP (1) valor FROM #TipoDeduccionTemporal AS TD)
								)
							END

						DELETE TOP (1) FROM #TipoDeduccionTemporal
						SELECT @count = COUNT(*) FROM #TipoDeduccionTemporal;
					END
					 
				DROP TABLE #TipoDeduccionTemporal;

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