USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[Jornada]    Script Date: 06/05/2021 04:39:07 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Jornada](
	[Id] [int] NOT NULL,
	[IdTipoJornada] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
	[IdMarcaAsistencia] [int] NOT NULL
) ON [PRIMARY]
GO

