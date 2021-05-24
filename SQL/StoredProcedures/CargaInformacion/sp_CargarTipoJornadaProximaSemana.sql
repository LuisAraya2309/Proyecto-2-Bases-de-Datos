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

				INSERT INTO Jornada
					SELECT 
						tipoJornadaProximaSemana.value('@IdJornada','INT') AS idJornada,
						(SELECT E.Id FROM dbo.Empleado AS E WHERE E.ValorDocumentoIdentidad = tipoJornadaProximaSemana.value('@ValorDocumentoIdentidad','INT')),
						(SELECT Id FROM dbo.SemanaPlanilla WHERE FechaInicio = (SELECT DATEADD(DAY,1,(tipoJornadaProximaSemana.value('../@Fecha', 'DATE')))))

					FROM 
						(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
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