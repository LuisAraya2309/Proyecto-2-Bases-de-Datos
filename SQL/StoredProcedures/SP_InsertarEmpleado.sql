USE[SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_InsertarEmpleado 
	@inNuevoNombre VARCHAR(40)
	, @inIdTipoIdentificacion  VARCHAR(40)
	, @inNuevoValorIdentidad INT
	, @inNuevoFechaNacimiento VARCHAR(40)
	, @inIdPuesto VARCHAR(40)
	, @inIdDepartamento  VARCHAR(40)
	, @inUsername VARCHAR(40)
	, @inPassword VARCHAR(40)
	, @outResultCode INT OUTPUT

AS

BEGIN
	-- Codigo para probar el SP

	SET NOCOUNT ON;

	INSERT INTO dbo.Usuarios
	VALUES
	(@inUsername
	, @inPassword
	, 1
	)

	DECLARE @IdUsuarios INT
	= ( SELECT Id 
	FROM dbo.Usuarios AS U 
	WHERE 
		Id = (SELECT IDENT_CURRENT('Usuarios')));
	
	INSERT INTO dbo.Empleado
	VALUES
	(@inNuevoNombre
	, @inNuevoValorIdentidad
	, @inNuevoFechaNacimiento
	, @inIdPuesto
	, @inIdDepartamento
	, @inIdTipoIdentificacion
	, @IdUsuarios
	, 1)

	SET NOCOUNT OFF;
	RETURN @outResultCode

END
GO
