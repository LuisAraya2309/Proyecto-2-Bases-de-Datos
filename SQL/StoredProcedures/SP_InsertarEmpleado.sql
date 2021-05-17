USE[SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_InsertarEmpleado 
	@inNuevoNombre VARCHAR(40)
	, @inIdTipoIdentificacion  INT
	, @inNuevoValorIdentidad INT
	, @inNuevoFechaNacimiento VARCHAR(40)
	, @inIdPuesto INT
	, @inIdDepartamento  INT
	, @inUsername VARCHAR(40)
	, @inPassword INT
	, @outResultCode INT OUTPUT

AS

BEGIN
	-- Codigo para probar el SP:
	--DECLARE
	--	@inNuevoNombre VARCHAR(40) = 'Martina Leon Molina'
		--, @inIdTipoIdentificacion INT = 2
		--, @inNuevoValorIdentidad INT = 71070722
		--, @inNuevoFechaNacimiento VARCHAR(40) = '1988-12-29'
		--, @inIdPuesto INT = 4
		--, @inIdDepartamento  INT = 3
		--, @inUsername VARCHAR(40) = 'MLeon'
		--, @inPassword INT = 1853

    --EXEC dbo.sp_InsertarEmpleado 
		--@inNuevoNombre 
		--, @inIdTipoIdentificacion
		--, @inNuevoValorIdentidad 
		--, @inNuevoFechaNacimiento 
		--, @inIdPuesto 
		--, @inIdDepartamento
		--, @inUsername 
		--, @inPassword 
		--, 0

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
	, Cast(@inNuevoFechaNacimiento AS DATE)
	, @inIdPuesto
	, @inIdDepartamento
	, @inIdTipoIdentificacion
	, @IdUsuarios
	, 1)

	SET NOCOUNT OFF;
	RETURN @outResultCode

END
GO

