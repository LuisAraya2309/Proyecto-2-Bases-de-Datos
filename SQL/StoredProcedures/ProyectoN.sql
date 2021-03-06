USE [master]
GO
/****** Object:  Database [SistemaObrero]    Script Date: 25/05/2021 09:47:58 a. m. ******/
CREATE DATABASE [SistemaObrero]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaObrero', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SistemaObrero.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaObrero_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SistemaObrero_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[DeduccionPorcentualObligatoria]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[DeduccionXEmpleado]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[DeduccionXEmpleadoXMes]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[Departamento]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[ValorDocumentoIdentidad] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[IdPuesto] [int] NOT NULL,
	[IdDepartamento] [int] NOT NULL,
	[IdTipoDocumentoIdentidad] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errores]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores](
	[SUSER_SNAME] [varchar](max) NULL,
	[ERROR_NUMBER] [int] NULL,
	[ERROR_STATE] [int] NULL,
	[ERROR_SEVERITY] [int] NULL,
	[ERROR_LINE] [int] NULL,
	[ERROR_PROCEDURE] [varchar](max) NULL,
	[ERROR_MESSAGE] [varchar](max) NULL,
	[GETDATE] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriados]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[FijaNoObligatoria]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FijaNoObligatoria](
	[Id] [int] NOT NULL,
	[Monto] [int] NOT NULL,
 CONSTRAINT [PK_FijaNoObligatoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jornada]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jornada](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoJornada] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NULL,
 CONSTRAINT [PK_Jornada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcasAsistencia]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcasAsistencia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [smalldatetime] NOT NULL,
	[FechaFin] [smalldatetime] NOT NULL,
	[IdJornada] [int] NOT NULL,
 CONSTRAINT [PK_MarcasAsistencia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesPlanilla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaIncio] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
 CONSTRAINT [PK_MesPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoDeduccion]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[MovimientoHora]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoPlanilla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [int] NOT NULL,
	[IdTipoMovimientoPlanilla] [int] NOT NULL,
	[IdPlanillaXSemanaXEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanillaXMesXEmpleado]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[PlanillaXSemanaXEmpleado]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[Puestos]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemanaPlanilla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[IdMesPlanilla] [int] NOT NULL,
 CONSTRAINT [PK_SemanaPlanilla_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[TipoDocIdentidad]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[TipoMovimientoDeducciones]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
/****** Object:  Table [dbo].[TipoMovimientoPlanilla]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoPlanilla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](64) NOT NULL,
	[Pwd] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
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
ALTER TABLE [dbo].[DeduccionXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXEmpleado_FijaNoObligatoria] FOREIGN KEY([Id])
REFERENCES [dbo].[FijaNoObligatoria] ([Id])
GO
ALTER TABLE [dbo].[DeduccionXEmpleado] CHECK CONSTRAINT [FK_DeduccionXEmpleado_FijaNoObligatoria]
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
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Usuarios]
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
ALTER TABLE [dbo].[PlanillaXMesXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXMesXEmpleado_MesPlanilla1] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([Id])
GO
ALTER TABLE [dbo].[PlanillaXMesXEmpleado] CHECK CONSTRAINT [FK_PlanillaXMesXEmpleado_MesPlanilla1]
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
ALTER TABLE [dbo].[SemanaPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_SemanaPlanilla_MesPlanilla1] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([Id])
GO
ALTER TABLE [dbo].[SemanaPlanilla] CHECK CONSTRAINT [FK_SemanaPlanilla_MesPlanilla1]
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
/****** Object:  StoredProcedure [dbo].[sp_BuscarIdJornada]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_BuscarIdJornada]
	@inValorDocumentoIdentidad INT
	, @outResultCode INT OUTPUT

--Este procedimiento agrega una marca de asistencia según la fecha brindada
AS

BEGIN
	-- Codigo para probar el SP

    --DECLARE
		
    --EXEC dbo.sp_AgregarMarcaAsistencia
		
	SET NOCOUNT ON;

	DECLARE @idEmpleado INT  
	= (SELECT E.id 
	FROM dbo.Empleado AS E
	WHERE 
		E.ValorDocumentoIdentidad = @inValorDocumentoIdentidad);

	DECLARE @idJornada INT
	= (SELECT J.id
	FROM dbo.Jornada AS J
	WHERE 
		J.IdEmpleado = @idEmpleado);

	RETURN @idJornada;

	SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarDepartamentos]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarDepartamentos]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarDepartamentos
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO Departamento

				SELECT
					departamento.value('@Id','INT') AS id,
					departamento.value('@Nombre','VARCHAR(40)') AS nombre, 
					1 AS activo
			
				FROM
				(
					SELECT CAST(c AS XML) FROM
					OPENROWSET(
						BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
						SINGLE_BLOB
					) AS T(c)
					) AS S(C)
					CROSS APPLY c.nodes('Datos/Catalogos/Departamentos/Departamento') AS A(departamento)

			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarEliminarEmpleados]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarEliminarEmpleados]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarEliminarEmpleados
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			
			DECLARE @count INT;
			CREATE TABLE #EliminarTemporal(valorDocIdentidad INT);

			SELECT
			@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO #EliminarTemporal
					SELECT
						eliminarEmpleado.value('@ValorDocumentoIdentidad','INT') 
					FROM
					(
						SELECT  CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Operacion/EliminarEmpleado') AS A (eliminarEmpleado)

				SELECT @count = COUNT(*) FROM #EliminarTemporal;
				WHILE @count > 0
					BEGIN
						DECLARE @valorDocIdentidad INT = (SELECT TOP(1) valorDocIdentidad FROM #EliminarTemporal);
						UPDATE dbo.Empleado
						SET 
							Empleado.Activo = 0
						WHERE 
							Empleado.ValorDocumentoIdentidad = @ValorDocIdentidad;
						DELETE TOP (1) FROM #EliminarTemporal
						SELECT @count = COUNT(*) FROM #EliminarTemporal;
					END
				DROP TABLE #EliminarTemporal;
			COMMIT TRANSACTION TSaveMov;


		END TRY
		BEGIN CATCH
			IF @@Trancount>0 
				ROLLBACK TRANSACTION TSaveMov;
			INSERT INTO dbo.Errores	VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);

			Set @OutResultCode=50005;
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarEmpleados]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarEmpleados]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarEmpleados
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO Empleado
					SELECT

						empleado.value('@Nombre','VARCHAR(40)') AS nombre,
						empleado.value('@ValorDocumentoIdentidad','INT') AS valorDocIdentidad,
						CAST(empleado.value('@FechaNacimiento','VARCHAR(40)')AS DATE)  AS fechaNacimiento,
						empleado.value('@idPuesto','INT') AS idPuesto,
						empleado.value('@idDepartamento','INT') AS idDepartamento,
						empleado.value('@idTipoDocumentacionIdentidad','INT') AS idTipoDoc,
						(SELECT id FROM Usuarios AS U WHERE U.Pwd = empleado.value('@Password','INT')),
						1 AS activo
            
					FROM
						(
							SELECT CAST(c AS XML) FROM
							OPENROWSET(
								BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
								SINGLE_BLOB
							) AS T(c)
							) AS S(C)
							CROSS APPLY c.nodes('Datos/Operacion/NuevoEmpleado') AS A (empleado)

				COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;

				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarFeriados]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarFeriados]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarFeriados
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO Feriados
					SELECT
						feriado.value('@Fecha','VARCHAR(64)') AS fecha,
						feriado.value('@Nombre','VARCHAR(64)') AS nombre
                
					FROM 
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Feriados/Feriado') AS A(feriado)
			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarMarcasAsistencia]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarMarcasAsistencia]
@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarMarcasAsistencia
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
			@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO dbo.MarcasAsistencia
					SELECT

						marcaAsistencia.value('@FechaEntrada','SMALLDATETIME') AS fechaEntrada,
						marcaAsistencia.value('@FechaSalida','SMALLDATETIME') AS fechaSalida,
						(SELECT TOP 1 J.id 
						FROM dbo.Jornada AS J 
						WHERE J.IdEmpleado IN (SELECT TOP 1 E.id 
												FROM dbo.Empleado AS E 
												WHERE E.ValorDocumentoIdentidad = marcaAsistencia.value('@ValorDocumentoIdentidad','INT')))
					FROM
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Operacion/MarcaDeAsistencia') AS A (marcaAsistencia)
			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
            
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarMesesSemanas]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CargarMesesSemanas]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarMesesSemanas
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
			@OutResultCode=0 ;

			DECLARE @countFechas INT; DECLARE @countSemanas INT;
			CREATE TABLE #FechasTemporales(fecha DATE);
			CREATE TABLE #FechasSemana(fecha DATE);
			SET LANGUAGE Spanish 
			BEGIN TRANSACTION TSaveMov
				INSERT INTO  #FechasTemporales

					SELECT
						operacion.value('@Fecha','DATE') 
					FROM
					(
						SELECT  CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Operacion') AS A (operacion)
					WHERE
						(((SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = 4) OR ((SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = 5));


				SELECT @countFechas = COUNT(*) FROM #FechasTemporales;
				SELECT @countSemanas = COUNT(*) FROM #FechasTemporales;

				--Se crea la copia de la fechasTemporales
				INSERT INTO #FechasSemana

					SELECT fecha
					FROM #FechasTemporales

				--Se insertan los meses 
				DECLARE @fechaInicio DATE = (SELECT DATEADD(DAY,1,(SELECT TOP (1) fecha FROM #FechasTemporales)));
				DECLARE @mesActual INT = (SELECT DATEPART(MONTH, (SELECT TOP (1) fecha FROM #FechasTemporales)));

				WHILE @countFechas > 0

					BEGIN
						DECLARE @fechaActual DATE = (SELECT TOP(1) fecha FROM #FechasTemporales);

						IF (SELECT DATEPART(WEEKDAY,@fechaActual)) = 4 AND  @mesActual <> (SELECT DATEPART(MONTH,@fechaActual))
							BEGIN
								INSERT INTO MesPlanilla
								VALUES(
									@fechaInicio
									,@fechaActual
								)
								SET @fechaInicio = (SELECT DATEADD(DAY,1,@fechaActual));
								SET @mesActual = (SELECT DATEPART(MONTH,@fechaActual));
							END
						DELETE TOP (1) FROM #FechasTemporales
						SELECT @countFechas = COUNT(*) FROM #FechasTemporales;
					END
				DROP TABLE #FechasTemporales;

				--Se insertan las semanas

				WHILE @countSemanas > 0

					BEGIN
						DECLARE @fechaActualS DATE = (SELECT TOP(1) fecha FROM #FechasSemana);

						IF (SELECT DATEPART(WEEKDAY,@fechaActualS)) = 5
							BEGIN
								INSERT INTO SemanaPlanilla
								VALUES(
									@fechaActualS
									, (SELECT DATEADD(DAY,6,@fechaActualS))
									, (SELECT id FROM MesPlanilla AS MP WHERE(SELECT DATEPART(MONTH,MP.FechaIncio)) = (SELECT DATEPART(MONTH,@fechaActualS)))
								)
							END
						DELETE TOP (1) FROM #FechasSemana
						SELECT @countSemanas = COUNT(*) FROM #FechasSemana;
					END
				DROP TABLE #FechasSemana;
			COMMIT TRANSACTION TSaveMov;

		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarPuestos]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarPuestos] 
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarPuestos
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
			@OutResultCode=0;

			BEGIN TRANSACTION TSaveMov
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
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Puestos/Puesto') AS A(puesto)

			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarTipoDeduccion]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarTipoDeduccion]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarTipoDeduccion
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;
			CREATE TABLE #TipoDeduccionTemporal(id int,esObligatorio VARCHAR(40),esPorcentual VARCHAR(40), valor FLOAT(3));
			DECLARE @count INT;
			BEGIN TRANSACTION TSaveMov
				INSERT INTO TipoDeduccion 
					SELECT

						tipoDeduccion.value('@Id','INT') AS id,
						tipoDeduccion.value('@Nombre','VARCHAR(40)') AS nombre,
						tipoDeduccion.value('@Obligatorio','VARCHAR(40)') AS esObligatorio,
						tipoDeduccion.value('@Porcentual','VARCHAR(40)') AS esPorcentual

					FROM
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccion)

				INSERT INTO #TipoDeduccionTemporal
					SELECT

						tipoDeduccionTemp.value('@Id','INT') AS id,
						tipoDeduccionTemp.value('@Obligatorio','VARCHAR(40)') AS esObligatorio,
						tipoDeduccionTemp.value('@Porcentual','VARCHAR(40)') AS esPorcentual,
						tipoDeduccionTemp.value('@Valor','FLOAT(3)') AS valor

					FROM
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccionTemp)
				SELECT @count = COUNT(*) FROM #TipoDeduccionTemporal;

				WHILE @count > 0

					BEGIN
						IF EXISTS(SELECT TOP (1) * FROM #TipoDeduccionTemporal AS TD WHERE TD.esObligatorio = 'Si')
							BEGIN
								INSERT INTO DeduccionPorcentualObligatoria
								VALUES(
								(SELECT TOP (1)  id FROM #TipoDeduccionTemporal AS TD)
								, (SELECT TOP (1) valor FROM #TipoDeduccionTemporal AS TD)
								)
							END

						DELETE TOP (1) FROM #TipoDeduccionTemporal
						SELECT @count = COUNT(*) FROM #TipoDeduccionTemporal;
					END
					 
				DROP TABLE #TipoDeduccionTemporal;

			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarTipoDocIdentidad]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarTipoDocIdentidad]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarTipoDocIdentidad
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
			@OutResultCode=0;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO TipoDocIdentidad

					SELECT
						tipodoc.value('@Id','INT') AS id,
						tipodoc.value('@Nombre','VARCHAR(40)') AS nombre,
						1 AS activo
                
					FROM
					(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/Tipos_de_Documento_de_Identificacion/TipoIdDoc') AS A(tipodoc)

			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarTipoJornada]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarTipoJornada] 
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarTipoJornada
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
			@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
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
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Catalogos/TiposDeJornada/TipoDeJornada') AS A(tipoJornada)
			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarTipoJornadaProximaSemana]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarTipoJornadaProximaSemana]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarTipoJornadaProximaSemana
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				SET LANGUAGE SPANISH;

				INSERT INTO Jornada
					SELECT 
						tipoJornadaProximaSemana.value('@IdJornada','INT') AS idJornada,
						(SELECT E.Id FROM dbo.Empleado AS E WHERE E.ValorDocumentoIdentidad = tipoJornadaProximaSemana.value('@ValorDocumentoIdentidad','INT')),
						(SELECT Id FROM dbo.SemanaPlanilla WHERE FechaInicio = (SELECT DATEADD(DAY,1,(tipoJornadaProximaSemana.value('../@Fecha', 'DATE')))))

					FROM 
						(
						SELECT CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
							SINGLE_BLOB
						) AS T(c)
						) AS S(C)
						CROSS APPLY c.nodes('Datos/Operacion/TipoDeJornadaProximaSemana') AS A (tipoJornadaProximaSemana)

			COMMIT TRANSACTION TSaveMov;

		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarTipoMovimientoPlanilla]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarTipoMovimientoPlanilla]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarTipoMovimientoPlanilla
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO TipoMovimientoPlanilla

						SELECT
							tipoMovimiento.value('@Id','INT') AS id,
							tipoMovimiento.value('@Nombre','VARCHAR(40)') AS nombre
                
						FROM
						(
							SELECT CAST(c AS XML) FROM
							OPENROWSET(
								BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
								SINGLE_BLOB
							) AS T(c)
							) AS S(C)
							CROSS APPLY c.nodes('Datos/Catalogos/TiposDeMovimiento/TipoMovimiento') AS A(tipoMovimiento)

			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarUsuarios]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CargarUsuarios]
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarUsuarios
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
			@OutResultCode=0;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO Usuarios

				SELECT
					usuario.value('@username','VARCHAR(64)') AS username,
					usuario.value('@pwd','INT') AS pwd,
					usuario.value('@tipo','INT') AS tipo,
					1 AS activo
        
				FROM 
				(
					SELECT CAST(c AS XML) FROM
					OPENROWSET(
						BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
						SINGLE_BLOB
					) AS T(c)
					) AS S(C)
					CROSS APPLY c.nodes('Datos/Usuarios/Usuario') AS A(usuario);

				INSERT INTO Usuarios
					SELECT

						empleado.value('@Username','VARCHAR(64)') AS username,
						empleado.value('@Password','INT') AS pwd,
						'2' AS tipo,
						1 AS activo
            
					FROM
						(
							SELECT CAST(c AS XML) FROM
							OPENROWSET(
								BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
								SINGLE_BLOB
							) AS T(c)
							) AS S(C)
							CROSS APPLY c.nodes('Datos/Operacion/NuevoEmpleado') AS A (empleado)

			COMMIT TRANSACTION TSaveMov;
		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;
				INSERT INTO dbo.Errores	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarEmpleado]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarEmpleado] 
	@inNuevoNombre VARCHAR(40)
	, @inIdTipoIdentificacion  INT
	, @inNuevoValorIdentidad INT
	, @inNuevoFechaNacimiento VARCHAR(40)
	, @inIdPuesto INT
	, @inIdDepartamento  INT
	, @inUsername VARCHAR(40)
	, @inPassword INT
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
	, Cast(@inNuevoFechaNacimiento AS DATE)
	, @inIdPuesto
	, @inIdDepartamento
	, @inIdTipoIdentificacion
	, @IdUsuarios
	, 1)

	SET NOCOUNT OFF;
	RETURN @outResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SimulacionCarga]    Script Date: 25/05/2021 09:47:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_SimulacionCarga] 

AS
BEGIN
	DECLARE @OutResultCode INT = 0;
    EXEC sp_CargarPuestos @OutResultCode;
    EXEC sp_CargarDepartamentos @OutResultCode;
    EXEC sp_CargarTipoDocIdentidad @OutResultCode;
    EXEC sp_CargarTipoJornada @OutResultCode;
    EXEC sp_CargarTipoMovimientoPlanilla @OutResultCode;
    EXEC sp_CargarFeriados @OutResultCode;
    EXEC sp_CargarTipoDeduccion @OutResultCode;
    EXEC sp_CargarUsuarios @OutResultCode;
    EXEC sp_CargarEmpleados @OutResultCode;
    EXEC sp_CargarMesesSemanas @OutResultCode;
    EXEC sp_CargarTipoJornadaProximaSemana @OutResultCode;
    EXEC sp_CargarMarcasAsistencia @OutResultCode;
    EXEC sp_CargarEliminarEmpleados @OutResultCode;


END

GO
/****** Object:  StoredProcedure [dbo].[sp_TipoDeJornadaProximaSemana]    Script Date: 25/05/2021 09:47:59 a. m. ******/
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
