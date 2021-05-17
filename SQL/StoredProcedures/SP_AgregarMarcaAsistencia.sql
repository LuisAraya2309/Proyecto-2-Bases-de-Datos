USE[SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_AgregarMarcaAsistencia
	@inValorDocumentoIdentidad INT
	, @inFechaEntrada VARCHAR(64)
	, @inFechaSalida VARCHAR(64)
	, @outResultCode INT OUTPUT

--Este procedimiento agrega una marca de asistencia según la fecha brindada
AS

BEGIN
	-- Codigo para probar el SP

    --DECLARE
		
    --EXEC dbo.sp_AgregarMarcaAsistencia
		
	SET NOCOUNT ON;

	DECLARE @idEmpleado INT  
	= (SELECT E.id 
	FROM dbo.Empleado AS E
	WHERE 
		E.ValorDocIdentidad = @inValorDocumentoIdentidad);

	DECLARE @idJornada INT
	= (SELECT J.id
	FROM dbo.Jornada AS J
	WHERE 
		J.IdEmpleado = @idEmpleado);

	INSERT INTO dbo.MarcasAsistencia
	VALUES
	(@inFechaEntrada
	,@inFechaSalida
	,@idJornada)

	SET NOCOUNT OFF;

END
