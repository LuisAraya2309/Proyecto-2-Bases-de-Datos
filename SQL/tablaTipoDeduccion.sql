USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 06/05/2021 19:47:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoDeduccion](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Obligatorio] [varchar](64) NOT NULL,
	[Porcentual] [varchar](64) NOT NULL,
	[IdDeduPorcentualObligatoria] [int] NOT NULL,
 CONSTRAINT [PK_TipoDeduccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TipoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_TipoDeduccion_DeduPorcentualObligatoria] FOREIGN KEY([IdDeduPorcentualObligatoria])
REFERENCES [dbo].[DeduPorcentualObligatoria] ([Id])
GO

ALTER TABLE [dbo].[TipoDeduccion] CHECK CONSTRAINT [FK_TipoDeduccion_DeduPorcentualObligatoria]
GO

