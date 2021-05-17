USE [master]
GO
/****** Object:  Database [SistemaObrero]    Script Date: 17/05/2021 12:17:13 p. m. ******/
CREATE DATABASE [SistemaObrero]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaObrero', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SistemaObrero.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaObrero_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SistemaObrero_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SistemaObrero] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaObrero].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaObrero] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaObrero] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaObrero] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaObrero] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaObrero] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaObrero] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaObrero] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaObrero] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaObrero] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaObrero] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaObrero] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaObrero] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaObrero] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaObrero] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaObrero] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SistemaObrero] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaObrero] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaObrero] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaObrero] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaObrero] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaObrero] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaObrero] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaObrero] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemaObrero] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaObrero] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaObrero] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaObrero] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaObrero] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaObrero] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaObrero] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemaObrero', N'ON'
GO
ALTER DATABASE [SistemaObrero] SET QUERY_STORE = OFF
GO
USE [SistemaObrero]
GO
/****** Object:  Table [dbo].[DeduccionPorcentualObligatoria]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionPorcentualObligatoria](
	[Id] [int] NOT NULL,
	[Porcentage] [float] NOT NULL,
 CONSTRAINT [PK_DeduccionPorcentualObligatoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionXEmpleado]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionXEmpleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdTipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_DeduccionXEmpleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionXEmpleadoXMes]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionXEmpleadoXMes](
	[Id] [int] NOT NULL,
	[TotalDeduccion] [int] NOT NULL,
	[IdPlanillaXMesXEmpleado] [int] NOT NULL,
	[IdTipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_DeduccionXEmpleadoXMes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/05/2021 12:17:13 p. m. ******/
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
	[IdUsuarios] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriados]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feriados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Fecha] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Feriados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FijaNoObligatoria]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FijaNoObligatoria](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_FijaNoObligatoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jornada]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jornada](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoJornada] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
 CONSTRAINT [PK_Jornada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcasAsistencia]    Script Date: 17/05/2021 12:17:13 p. m. ******/
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
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesPlanilla](
	[Id] [int] NOT NULL,
	[FechaInicio] [varchar](64) NOT NULL,
	[FechaFin] [varchar](64) NOT NULL,
 CONSTRAINT [PK_MesPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoDeduccion]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoDeduccion](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoDeduccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoHora]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoHora](
	[id] [int] NOT NULL,
	[idMarcaAsistencia] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoHora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoPlanilla](
	[Id] [int] NOT NULL,
	[Fecha] [varchar](64) NOT NULL,
	[Monto] [int] NOT NULL,
	[IdTipoMovimientoPlanilla] [int] NOT NULL,
	[IdPlanillaXSemanaXEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanillaXMesXEmpleado]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanillaXMesXEmpleado](
	[Id] [int] NOT NULL,
	[SalarioNeto] [int] NOT NULL,
	[SalarioTotal] [int] NOT NULL,
	[IdMesPlanilla] [int] NOT NULL,
 CONSTRAINT [PK_PlanillaXMesXEmpleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanillaXSemanaXEmpleado]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanillaXSemanaXEmpleado](
	[Id] [int] NOT NULL,
	[SalarioNeto] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
	[IdPlanillaXMesXEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_PlanillaXSemanaXEmpleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 17/05/2021 12:17:13 p. m. ******/
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
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemanaPlanilla](
	[Id] [int] NOT NULL,
	[FechaInicio] [varchar](64) NOT NULL,
	[FechaFin] [varchar](64) NOT NULL,
	[IdMesPlanilla] [int] NOT NULL,
 CONSTRAINT [PK_SemanaPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeduccion](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[EsObligatoria] [varchar](64) NOT NULL,
	[EsPorcentual] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TipoDeduccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocIdentidad]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocIdentidad](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoDocIdentidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 17/05/2021 12:17:13 p. m. ******/
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
/****** Object:  Table [dbo].[TipoMovimientoDeducciones]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoDeducciones](
	[Id] [int] NOT NULL,
	[IdTipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_TipoMovimientoDeducciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoPlanilla]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoPlanilla](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](64) NOT NULL,
	[Password] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeduccionPorcentualObligatoria]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionPorcentualObligatoria_TipoDeduccion] FOREIGN KEY([Id])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[DeduccionPorcentualObligatoria] CHECK CONSTRAINT [FK_DeduccionPorcentualObligatoria_TipoDeduccion]
GO
ALTER TABLE [dbo].[DeduccionXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXEmpleado_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[DeduccionXEmpleado] CHECK CONSTRAINT [FK_DeduccionXEmpleado_Empleado]
GO
ALTER TABLE [dbo].[DeduccionXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXEmpleado_TipoDeduccion] FOREIGN KEY([IdTipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[DeduccionXEmpleado] CHECK CONSTRAINT [FK_DeduccionXEmpleado_TipoDeduccion]
GO
ALTER TABLE [dbo].[DeduccionXEmpleadoXMes]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXEmpleadoXMes_PlanillaXMesXEmpleado] FOREIGN KEY([IdPlanillaXMesXEmpleado])
REFERENCES [dbo].[PlanillaXMesXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[DeduccionXEmpleadoXMes] CHECK CONSTRAINT [FK_DeduccionXEmpleadoXMes_PlanillaXMesXEmpleado]
GO
ALTER TABLE [dbo].[DeduccionXEmpleadoXMes]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXEmpleadoXMes_TipoDeduccion] FOREIGN KEY([IdTipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[DeduccionXEmpleadoXMes] CHECK CONSTRAINT [FK_DeduccionXEmpleadoXMes_TipoDeduccion]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([Id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamento]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puestos] FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puestos] ([Id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puestos]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoDocIdentidad] FOREIGN KEY([IdTipoDocumentoIdentidad])
REFERENCES [dbo].[TipoDocIdentidad] ([Id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoDocIdentidad]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Usuario] FOREIGN KEY([IdUsuarios])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Usuario]
GO
ALTER TABLE [dbo].[FijaNoObligatoria]  WITH CHECK ADD  CONSTRAINT [FK_FijaNoObligatoria_DeduccionXEmpleado] FOREIGN KEY([Id])
REFERENCES [dbo].[DeduccionXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[FijaNoObligatoria] CHECK CONSTRAINT [FK_FijaNoObligatoria_DeduccionXEmpleado]
GO
ALTER TABLE [dbo].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[Jornada] CHECK CONSTRAINT [FK_Jornada_Empleado]
GO
ALTER TABLE [dbo].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_SemanaPlanilla] FOREIGN KEY([IdSemanaPlanilla])
REFERENCES [dbo].[SemanaPlanilla] ([Id])
GO
ALTER TABLE [dbo].[Jornada] CHECK CONSTRAINT [FK_Jornada_SemanaPlanilla]
GO
ALTER TABLE [dbo].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_TipoJornada] FOREIGN KEY([IdTipoJornada])
REFERENCES [dbo].[TipoJornada] ([Id])
GO
ALTER TABLE [dbo].[Jornada] CHECK CONSTRAINT [FK_Jornada_TipoJornada]
GO
ALTER TABLE [dbo].[MarcasAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_MarcasAsistencia_Jornada] FOREIGN KEY([IdJornada])
REFERENCES [dbo].[Jornada] ([Id])
GO
ALTER TABLE [dbo].[MarcasAsistencia] CHECK CONSTRAINT [FK_MarcasAsistencia_Jornada]
GO
ALTER TABLE [dbo].[MovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoDeduccion_DeduccionXEmpleado] FOREIGN KEY([Id])
REFERENCES [dbo].[DeduccionXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[MovimientoDeduccion] CHECK CONSTRAINT [FK_MovimientoDeduccion_DeduccionXEmpleado]
GO
ALTER TABLE [dbo].[MovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoDeduccion_MovimientoPlanilla] FOREIGN KEY([Id])
REFERENCES [dbo].[MovimientoPlanilla] ([Id])
GO
ALTER TABLE [dbo].[MovimientoDeduccion] CHECK CONSTRAINT [FK_MovimientoDeduccion_MovimientoPlanilla]
GO
ALTER TABLE [dbo].[MovimientoHora]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoHora_MarcasAsistencia] FOREIGN KEY([idMarcaAsistencia])
REFERENCES [dbo].[MarcasAsistencia] ([Id])
GO
ALTER TABLE [dbo].[MovimientoHora] CHECK CONSTRAINT [FK_MovimientoHora_MarcasAsistencia]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_MovimientoHora] FOREIGN KEY([Id])
REFERENCES [dbo].[MovimientoHora] ([id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_MovimientoHora]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_PlanillaXSemanaXEmpleado] FOREIGN KEY([IdPlanillaXSemanaXEmpleado])
REFERENCES [dbo].[PlanillaXSemanaXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_PlanillaXSemanaXEmpleado]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_TipoMovimientoPlanilla] FOREIGN KEY([IdTipoMovimientoPlanilla])
REFERENCES [dbo].[TipoMovimientoPlanilla] ([Id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_TipoMovimientoPlanilla]
GO
ALTER TABLE [dbo].[PlanillaXMesXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXMesXEmpleado_MesPlanilla] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([Id])
GO
ALTER TABLE [dbo].[PlanillaXMesXEmpleado] CHECK CONSTRAINT [FK_PlanillaXMesXEmpleado_MesPlanilla]
GO
ALTER TABLE [dbo].[PlanillaXSemanaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXSemanaXEmpleado_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[PlanillaXSemanaXEmpleado] CHECK CONSTRAINT [FK_PlanillaXSemanaXEmpleado_Empleado]
GO
ALTER TABLE [dbo].[PlanillaXSemanaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXSemanaXEmpleado_PlanillaXMesXEmpleado] FOREIGN KEY([IdPlanillaXMesXEmpleado])
REFERENCES [dbo].[PlanillaXMesXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[PlanillaXSemanaXEmpleado] CHECK CONSTRAINT [FK_PlanillaXSemanaXEmpleado_PlanillaXMesXEmpleado]
GO
ALTER TABLE [dbo].[PlanillaXSemanaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXSemanaXEmpleado_SemanaPlanilla] FOREIGN KEY([IdSemanaPlanilla])
REFERENCES [dbo].[SemanaPlanilla] ([Id])
GO
ALTER TABLE [dbo].[PlanillaXSemanaXEmpleado] CHECK CONSTRAINT [FK_PlanillaXSemanaXEmpleado_SemanaPlanilla]
GO
ALTER TABLE [dbo].[SemanaPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_SemanaPlanilla_MesPlanilla] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([Id])
GO
ALTER TABLE [dbo].[SemanaPlanilla] CHECK CONSTRAINT [FK_SemanaPlanilla_MesPlanilla]
GO
ALTER TABLE [dbo].[TipoMovimientoDeducciones]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimientoDeducciones_TipoDeduccion] FOREIGN KEY([IdTipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[TipoMovimientoDeducciones] CHECK CONSTRAINT [FK_TipoMovimientoDeducciones_TipoDeduccion]
GO
ALTER TABLE [dbo].[TipoMovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimientoPlanilla_TipoMovimientoDeducciones] FOREIGN KEY([Id])
REFERENCES [dbo].[TipoMovimientoDeducciones] ([Id])
GO
ALTER TABLE [dbo].[TipoMovimientoPlanilla] CHECK CONSTRAINT [FK_TipoMovimientoPlanilla_TipoMovimientoDeducciones]
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarXML]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarXML] 

AS
BEGIN
-- Codigo para probar sp
--EXEC sp_CargarXML

	SET NOCOUNT ON

	INSERT INTO Puestos

		SELECT
			puesto.value('@Id','INT') AS id,
			puesto.value('@Nombre','VARCHAR(40)') AS Nombre,
			puesto.value('@SalarioXHora','INT') AS salarioxHora,
			1 AS activo  
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Puestos/Puesto') AS A(puesto)

	
    INSERT INTO Departamento

		SELECT
			departamento.value('@Id','INT') AS id,
			departamento.value('@Nombre','VARCHAR(40)') AS nombre, 
			1 AS activo
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Departamentos/Departamento') AS A(departamento)


    INSERT INTO TipoDocIdentidad

		SELECT
			tipodoc.value('@Id','INT') AS id,
			tipodoc.value('@Nombre','VARCHAR(40)') AS nombre,
			1 AS activo
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Tipos_de_Documento_de_Identificacion/TipoIdDoc') AS A(tipodoc)

    
    INSERT INTO TipoJornada

		SELECT
			tipoJornada.value('@Id','INT') AS id,
			tipoJornada.value('@Nombre','VARCHAR(40)') AS nombre,
            tipoJornada.value('@HoraEntrada','VARCHAR(40)') AS horaEntrada,
            tipoJornada.value('@HoraSalida','VARCHAR(40)') AS horaSalida
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/TiposDeJornada/TipoJornada') AS A(tipoJornada)



    INSERT INTO TipoMovimientoPlanilla

		SELECT
			tipoMovimiento.value('@Id','INT') AS id,
			tipoMovimiento.value('@Nombre','VARCHAR(40)') AS nombre
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/TiposDeMovimiento/TipoMovimiento') AS A(tipoMovimiento)

    

    INSERT INTO Feriados

		SELECT
			feriado.value('@Fecha','DATE') AS fecha,
			feriado.value('@Nombre','VARCHAR(64)') AS nombre
			
		FROM 
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Feriados/Feriado') AS A(feriado)


    INSERT INTO TipoDeduccion

		SELECT

			tipoDeduccion.value('@Id','INT') AS id,
			tipoDeduccion.value('@Nombre','VARCHAR(40)') AS nombre,
			tipoDeduccion.value('@Obligatorio','VARCHAR(40)') AS esObligatorio,
            tipoDeduccion.value('@Porcentual','VARCHAR(40)') AS porcentual
            --tipoDeduccion.value('@Valor','VARCHAR(40)') AS valor


		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccion)

	SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarEmpleado]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarEmpleado] 
	@inNuevoNombre VARCHAR(40)
	, @inIdTipoIdentificacion  VARCHAR(40)
	, @inNuevoValorIdentidad INT
	, @inNuevoFechaNacimiento VARCHAR(40)
	, @inIdPuesto VARCHAR(40)
	, @inIdDepartamento  VARCHAR(40)
	, @inUsername VARCHAR(40)
	, @inPassword VARCHAR(40)
	, @outResultCode INT OUTPUT

AS

BEGIN
	-- Codigo para probar el SP

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
	, @inNuevoFechaNacimiento
	, @inIdPuesto
	, @inIdDepartamento
	, @inIdTipoIdentificacion
	, @IdUsuarios
	, 1)

	SET NOCOUNT OFF;
	RETURN @outResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[sp_TipoDeJornadaProximaSemana]    Script Date: 17/05/2021 12:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_TipoDeJornadaProximaSemana]
	@inValorDocumentoIdentidad INT
	, @inIdNuevoTipoJornada INT
	, @outResultCode INT OUTPUT

--Este procedimiento edita un empleado el cual es buscado por su nombre, y se cambian sus atributos por los parametros
AS

BEGIN
	-- Codigo para probar el SP

    --DECLARE
		

    --EXEC dbo.sp_EditarEmpleado 
		

	SET NOCOUNT ON;


	UPDATE dbo.Jornada 

		SET 
			IdTipoJornada = @inIdNuevoTipoJornada

		WHERE
			Jornada.IdEmpleado = (SELECT E.id 
								 FROM dbo.Empleado AS E
								 WHERE 
									E.ValorDocIdentidad = @inValorDocumentoIdentidad);

	SET NOCOUNT OFF;

END
GO
USE [master]
GO
ALTER DATABASE [SistemaObrero] SET  READ_WRITE 
GO
