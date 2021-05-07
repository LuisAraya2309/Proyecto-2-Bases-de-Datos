USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[TipoJornada]    Script Date: 06/05/2021 04:42:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoJornada](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[HoraInicio] [varchar](64) NOT NULL,
	[HoraFin] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TipoJornada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

