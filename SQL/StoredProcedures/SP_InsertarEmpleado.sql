
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_InsertarEmpleado 
	@inNuevoNombre VARCHAR(40)
	, @inBuscarTipoIdentificacion  VARCHAR(40)
	, @inNuevoValorIdentidad INT
	, @inNuevoFechaNacimiento VARCHAR(40)
	, @inBuscarPuesto VARCHAR(40)
	, @inBuscarDepartamento  VARCHAR(40)
	, @inUsername VARCHAR(40)
	, @inPassword VARCHAR(40)
	, @outResultCode INT OUTPUT

AS

BEGIN
	-- Codigo para probar el SP

    --DECLARE
		--@inNuevoNombre VARCHAR(40) = Carlos Esteban
		--, @inBuscarTipoIdentificacion  = cedula nacional
		--, @inNuevoValorIdentidad INT = 542645365
		--, @inNuevoFechaNacimiento VARCHAR(40) = 1988-12-29
		--, @inBuscarPuesto VARCHAR(40) = gerente
		--, @inBuscarDepartamento  VARCHAR(40) = laboratorio

    --EXEC dbo.sp_InsertarEmpleado 
		--@inNuevoNombre 
		--, @inBuscarTipoIdentificacion
		--, @inNuevoValorIdentidad 
		--, @inNuevoFechaNacimiento 
		--, @inBuscarPuesto 
		--, @inBuscarDepartamento

	SET NOCOUNT ON;

	---Realiza la busqueda del puesto segun su nombre y devuelve el valor de su id
	DECLARE 
		@nuevoPuesto INT 
	=(SELECT 
		P.Id 
	FROM dbo.Puestos AS P
	WHERE 
		P.Nombre = @inBuscarPuesto);

	---Realiza la busqueda del tipo documento de identificacion segun su nombre y devuelve el valor de su id
	DECLARE @nuevoTipoIdentificacion INT
	= (SELECT 
		T.Id 
	FROM dbo.TipoDocIdentidad AS T
	WHERE 
		T.Nombre = @inBuscarTipoIdentificacion);

	---Realiza la busqueda del puesto segun su nombre y devuelve el valor de su id
	DECLARE @nuevoDepartamento INT  
	= (SELECT 
		D.Id 
	FROM dbo.Departamento AS D
	WHERE 
		D.Nombre = @inBuscarDepartamento);

	INSERT INTO dbo.Usuarios
	VALUES
	(@inUsername
	, @inPassword
	, 1
	)

	INSERT INTO dbo.Empleado
	VALUES
	(@nuevoPuesto
	, @nuevoDepartamento
	, @nuevoTipoIdentificacion
	, @inNuevoNombre
	, @inNuevoFechaNacimiento
	, @inNuevoValorIdentidad
	, 1)

	SET NOCOUNT OFF;
	RETURN @outResultCode

END
GO
