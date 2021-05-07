USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[Puesto]    Script Date: 06/05/2021 04:41:10 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Puesto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[SalarioXHoras] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

