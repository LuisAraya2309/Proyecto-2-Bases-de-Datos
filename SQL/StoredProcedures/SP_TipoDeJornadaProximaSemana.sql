USE[SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_TipoDeJornadaProximaSemana
	@inValorDocumentoIdentidad INT
	, @inIdNuevoTipoJornada INT
	, @outResultCode INT OUTPUT

--Este procedimiento edita un empleado el cual es buscado por su nombre, y se cambian sus atributos por los parametros
AS

BEGIN
	-- Codigo para probar el SP

    --DECLARE
		

    --EXEC dbo.sp_EditarEmpleado 
		

	SET NOCOUNT ON;


	UPDATE dbo.Jornada 

		SET 
			IdTipoJornada = @inIdNuevoTipoJornada

		WHERE
			Jornada.IdEmpleado = (SELECT E.id 
								 FROM dbo.Empleado AS E
								 WHERE 
									E.ValorDocIdentidad = @inValorDocumentoIdentidad);

	SET NOCOUNT OFF;

END
