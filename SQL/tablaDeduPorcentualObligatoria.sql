USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[DeduPorcentualObligatoria]    Script Date: 06/05/2021 19:42:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DeduPorcentualObligatoria](
	[Id] [int] NOT NULL,
	[Porcentaje] [float] NOT NULL,
 CONSTRAINT [PK_DeduPorcentualObligatoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

