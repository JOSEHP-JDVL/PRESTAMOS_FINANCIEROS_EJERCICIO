USE [master]
GO
/****** Object:  Database [prestamos_financieros_ejercicio]    Script Date: 8/12/2024 17:28:59 ******/
CREATE DATABASE [prestamos_financieros_ejercicio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prestamos_financieros_ejercicio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\prestamos_financieros_ejercicio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prestamos_financieros_ejercicio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\prestamos_financieros_ejercicio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prestamos_financieros_ejercicio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET ARITHABORT OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET RECOVERY FULL 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET  MULTI_USER 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'prestamos_financieros_ejercicio', N'ON'
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET QUERY_STORE = ON
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [prestamos_financieros_ejercicio]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](55) NOT NULL,
	[persona_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuotas]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuotas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prestamo_id] [int] NOT NULL,
	[numero_cuota] [int] NOT NULL,
	[monto] [money] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[monto_pendiente] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detelle_pagos]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detelle_pagos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cuota_id] [int] NOT NULL,
	[pago_id] [int] NOT NULL,
	[monto_afectado] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
	[codigo_empleado] [varchar](6) NOT NULL,
	[cargo] [varchar](100) NOT NULL,
	[supervisor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_operacion] [varchar](20) NOT NULL,
	[fecha_pago] [datetime] NULL,
	[monto_abonado] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas_juridicas]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas_juridicas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[razon_social] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas_naturales]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas_naturales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[celular] [varchar](20) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestamos]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prestamos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[sucursal_id] [int] NOT NULL,
	[empleado_id] [int] NOT NULL,
	[tipo_prestamo_id] [int] NOT NULL,
	[monto_otorgado] [money] NOT NULL,
	[tasa_interes] [float] NOT NULL,
	[plazo] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_vencimiento] [datetime] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [int] NULL,
	[deleted_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursales]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [char](6) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[direccion] [varchar](22) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_prestamos]    Script Date: 8/12/2024 17:29:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_prestamos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[pagos] ADD  DEFAULT (getdate()) FOR [fecha_pago]
GO
ALTER TABLE [dbo].[cuotas]  WITH CHECK ADD  CONSTRAINT [FK_prestamo_cuota] FOREIGN KEY([prestamo_id])
REFERENCES [dbo].[prestamos] ([id])
GO
ALTER TABLE [dbo].[cuotas] CHECK CONSTRAINT [FK_prestamo_cuota]
GO
ALTER TABLE [dbo].[detelle_pagos]  WITH CHECK ADD  CONSTRAINT [FK_cuotas_detalles_pagos] FOREIGN KEY([cuota_id])
REFERENCES [dbo].[cuotas] ([id])
GO
ALTER TABLE [dbo].[detelle_pagos] CHECK CONSTRAINT [FK_cuotas_detalles_pagos]
GO
ALTER TABLE [dbo].[detelle_pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_detalles_pagos] FOREIGN KEY([pago_id])
REFERENCES [dbo].[pagos] ([id])
GO
ALTER TABLE [dbo].[detelle_pagos] CHECK CONSTRAINT [FK_pagos_detalles_pagos]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_persona_natural_empleados] FOREIGN KEY([persona_id])
REFERENCES [dbo].[personas_naturales] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_persona_natural_empleados]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_supervisor_empleado] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_supervisor_empleado]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_clientes_prestamos] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_clientes_prestamos]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_empleados_prestamos] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_empleados_prestamos]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_sucursales_prestamos] FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[sucursales] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_sucursales_prestamos]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tipos_prestamo_prestamos] FOREIGN KEY([tipo_prestamo_id])
REFERENCES [dbo].[tipos_prestamos] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_tipos_prestamo_prestamos]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [check_tipo_persona] CHECK  (([tipo_persona]='Persona Jurídica' OR [tipo_persona]='Persona_Natural'))
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [check_tipo_persona]
GO
USE [master]
GO
ALTER DATABASE [prestamos_financieros_ejercicio] SET  READ_WRITE 
GO
