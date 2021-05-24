
USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarFeriados
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarFeriados
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO Feriados
					SELECT
						feriado.value('@Fecha','VARCHAR(64)') AS fecha,
						feriado.value('@Nombre','VARCHAR(64)') AS nombre
                
					FROM 
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Feriados/Feriado') AS A(feriado)
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