USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[MarcasAsistencia]    Script Date: 16/05/2021 12:22:56 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MarcasAsistencia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarcaInicio] [varchar](64) NOT NULL,
	[MarcaFin] [varchar](64) NOT NULL,
	[IdJornada] [int] NOT NULL,
 CONSTRAINT [PK_MarcasAsistencia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MarcasAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_MarcasAsistencia_Jornada] FOREIGN KEY([IdJornada])
REFERENCES [dbo].[Jornada] ([Id])
GO

ALTER TABLE [dbo].[MarcasAsistencia] CHECK CONSTRAINT [FK_MarcasAsistencia_Jornada]
GO

