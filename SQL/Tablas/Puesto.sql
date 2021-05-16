USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[Puestos]    Script Date: 16/05/2021 12:24:39 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Puestos](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[SalarioXHora] [int] NOT NULL,
	[Activo] [nchar](10) NULL,
 CONSTRAINT [PK_Puestos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

