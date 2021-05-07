USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[Empleado]    Script Date: 06/05/2021 04:38:27 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[ValorDocIdentidad] [int] NOT NULL,
	[FechaNacimiento] [int] NOT NULL,
	[IdPuesto] [int] NOT NULL,
	[IdDepartamento] [int] NOT NULL,
	[IdTipoDocumentoIdentidad] [int] NOT NULL,
	[IdJornada] [int] NOT NULL,
	[IdDeduccionXEmpleado] [int] NOT NULL,
	[IdUsuarios] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

