SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_EliminarEmpleado
	@inValorDocIdentidad INT
	, @outResultCode INT OUTPUT

--Elimina un empleado
AS
BEGIN
	-- Codigo para probar el SP

    --DECLARE
		-- @inNombre VARCHAR(40) = Gabriel

    --EXEC dbo.sp_EliminarEmpleado 
		-- @inNombre

	SET NOCOUNT ON;

	UPDATE dbo.Empleado
	SET 
		Activo = 0
	WHERE 
		ValorDocumentoIdentidad = @inValorDocIdentidad


	SET NOCOUNT OFF;
	RETURN @outResultCode;

END
GO