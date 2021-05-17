USE[SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_AsignarDeduccionesEmpleado
	@inIdEmpleado INT
	, @outResultCode INT OUTPUT

--Este procedimiento agrega una marca de asistencia según la fecha brindada
AS

BEGIN
	-- Codigo para probar el SP

    --DECLARE
		
    --EXEC dbo.sp_AsignarDeduccionesEmpleado
		
	SET NOCOUNT ON;

	INSERT INTO dbo.DeduccionXEmpleado 
	VALUES 
		(@inIdEmpleado
		, (SELECT TD.Id 
		FROM TipoDeduccion AS TD 
		WHERE 
		TD.EsObligatoria = 'Si'));
	
	SET NOCOUNT OFF;

END
