USE [master]
GO
/****** Object:  Database [pil]    Script Date: 2/9/2021 17:54:43 ******/
CREATE DATABASE [pil]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pil', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pil.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pil_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pil_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pil] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pil].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pil] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pil] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pil] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pil] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pil] SET ARITHABORT OFF 
GO
ALTER DATABASE [pil] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pil] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pil] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pil] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pil] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pil] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pil] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pil] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pil] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pil] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pil] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pil] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pil] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pil] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pil] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pil] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pil] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pil] SET RECOVERY FULL 
GO
ALTER DATABASE [pil] SET  MULTI_USER 
GO
ALTER DATABASE [pil] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pil] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pil] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pil] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pil] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pil] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pil', N'ON'
GO
ALTER DATABASE [pil] SET QUERY_STORE = OFF
GO
USE [pil]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fecha_de_nacimiento] [date] NOT NULL,
	[documento] [int] NOT NULL,
	[cuil] [int] NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[genero] [varchar](50) NOT NULL,
	[id_localidad] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[imagen_delantera] [varchar](50) NOT NULL,
	[imagen_trasera] [varchar](50) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id_cuenta] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[cvu] [int] NOT NULL,
	[numero_de_cuenta] [int] NOT NULL,
	[saldo] [int] NOT NULL,
	[id_tipo_cuenta] [int] NOT NULL,
 CONSTRAINT [PK_cuentaa] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id_localidad] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[codigo_postal] [int] NOT NULL,
	[id_provincia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion](
	[id_operaciones] [int] NOT NULL,
	[id_cuenta] [int] NOT NULL,
	[id_tipo_operacion] [int] NOT NULL,
	[monto] [int] NULL,
	[id_cuenta_destino] [int] NULL,
	[concepto] [text] NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[estado] [text] NOT NULL,
 CONSTRAINT [PK_operacion] PRIMARY KEY CLUSTERED 
(
	[id_operaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id_provincia] [varchar](50) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_provincia] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono](
	[id_telefono] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[telefono] [int] NOT NULL,
 CONSTRAINT [PK_telefono] PRIMARY KEY CLUSTERED 
(
	[id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_cuenta]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_cuenta](
	[id_tipo_cuenta] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[moneda] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_operacion]    Script Date: 2/9/2021 17:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_operacion](
	[id_tipo_operacion] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_operacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [contraseña], [imagen_delantera], [imagen_trasera]) VALUES (1, N'Juan', N'Perez', CAST(N'2020-12-01' AS Date), 330000, 2330003, N'Argentina', N'Masculino', N'1', N'123456', N'si', N'si')
INSERT [dbo].[clientes] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [contraseña], [imagen_delantera], [imagen_trasera]) VALUES (2, N'Maria', N'Lopez', CAST(N'2005-03-12' AS Date), 30000, 230005, N'Argentina', N'Femenino', N'1', N'12345678', N'si', N'si')
GO
INSERT [dbo].[cuenta] ([id_cuenta], [id_cliente], [cvu], [numero_de_cuenta], [saldo], [id_tipo_cuenta]) VALUES (1, 1, 11234, 10000, 500, 1)
GO
INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (N'1', N'Córdoba', 5008, N'1')
GO
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (N'1', N'Córdoba')
INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (N'2', N'Buenos Aires')
GO
INSERT [dbo].[tipo_cuenta] ([id_tipo_cuenta], [nombre], [moneda]) VALUES (1, N'Caja de ahorro', N'Peso argentino')
GO
INSERT [dbo].[tipo_operacion] ([id_tipo_operacion], [nombre]) VALUES (1, N'Transferencia')
INSERT [dbo].[tipo_operacion] ([id_tipo_operacion], [nombre]) VALUES (2, N'Deposito')
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [FK_clientes_localidad] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidad] ([id_localidad])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [FK_clientes_localidad]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_clientes]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_tipo_cuenta] FOREIGN KEY([id_tipo_cuenta])
REFERENCES [dbo].[tipo_cuenta] ([id_tipo_cuenta])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_tipo_cuenta]
GO
ALTER TABLE [dbo].[localidad]  WITH CHECK ADD  CONSTRAINT [FK_localidad_provincia] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincia] ([id_provincia])
GO
ALTER TABLE [dbo].[localidad] CHECK CONSTRAINT [FK_localidad_provincia]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [FK_operacion_cuenta] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[cuenta] ([id_cuenta])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [FK_operacion_cuenta]
GO
ALTER TABLE [dbo].[operacion]  WITH CHECK ADD  CONSTRAINT [FK_operacion_tipo_operacion] FOREIGN KEY([id_tipo_operacion])
REFERENCES [dbo].[tipo_operacion] ([id_tipo_operacion])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [FK_operacion_tipo_operacion]
GO
ALTER TABLE [dbo].[telefono]  WITH CHECK ADD  CONSTRAINT [FK_telefono_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[telefono] CHECK CONSTRAINT [FK_telefono_clientes]
GO
/****** Object:  StoredProcedure [dbo].[insertar_cuenta]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_cuenta] 
	-- Add the parameters for the stored procedure here
	@id_cuenta int, 
	@id_cliente int, 
	@cvu int, 
	@numero_de_cuenta int, 
	@saldo int, 
	@id_tipo_cuenta int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO cuenta (id_cuenta,id_cliente,cvu,numero_de_cuenta,saldo,id_tipo_cuenta) VALUES (@id_cuenta,@id_cliente,@cvu,@numero_de_cuenta,@saldo,@id_tipo_cuenta)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_localidad]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_localidad] 
	-- Add the parameters for the stored procedure here
	@id_localidad varchar(50), 
	@nombre varchar(50), 
	@codigo_postal int, 
	@id_provincia varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO localidad (id_localidad,nombre,codigo_postal,id_provincia) VALUES (@id_localidad, @nombre, @codigo_postal, @id_provincia)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_operacion]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_operacion]
	-- Add the parameters for the stored procedure here
	@id_operaciones int,
	@id_cuenta int,
	@id_tipo_operacion int,
	@monto int,
	@id_cuenta_destino int,
	@concepto text,
	@fecha_hora datetime,
	@estado text

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO operacion (id_operaciones,id_cuenta,id_tipo_operacion,monto,id_cuenta_destino,concepto,fecha_hora,estado) VALUES (@id_operaciones, @id_cuenta,@id_tipo_operacion,@monto,@id_cuenta_destino,@concepto,@fecha_hora,@estado)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_persona]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_persona] 
	-- Add the parameters for the stored procedure here
	@id_cliente int,
	@nombre varchar(50),
	@apellido varchar(50),
	@fecha_de_nacimiento date,
	@documento int,
	@cuil int,
	@nacionalidad varchar(50),
	@genero varchar(50),
	@id_localidad varchar(50),
	@contraseña varchar(50),
	@imagen_delantera varchar(50),
	@imagen_trasera varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO clientes
           (id_cliente
           ,nombre
           ,apellido
           ,fecha_de_nacimiento
           ,documento
           ,cuil
           ,nacionalidad
           ,genero
           ,id_localidad
           ,contraseña
           ,imagen_delantera
           ,imagen_trasera)
     VALUES
           (@id_cliente
           , @nombre
           , @apellido
           , @fecha_de_nacimiento
           , @documento
           , @cuil
           , @nacionalidad
           , @genero
           , @id_localidad
           , @contraseña
           , @imagen_delantera
           , @imagen_trasera)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_persona2]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_persona2] 
	-- Add the parameters for the stored procedure here
	@id_cliente int,
	@nombre varchar(50),
	@apellido varchar(50),
	@documento int,
	@cuil int,
	@nacionalidad varchar(50),
	@genero varchar(50),
	@id_localidad varchar(50),
	@contraseña varchar(50),
	@imagen_delantera varchar(50),
	@imagen_trasera varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[clientes]
           ([id_cliente]
           ,[nombre]
           ,[apellido]
           ,[documento]
           ,[cuil]
           ,[nacionalidad]
           ,[genero]
           ,[id_localidad]
           ,[contraseña]
           ,[imagen_delantera]
           ,[imagen_trasera])
     VALUES
           (@id_cliente
           , @nombre
           , @apellido
           , @documento
           , @cuil
           , @nacionalidad
           , @genero
           , @id_localidad
           , @contraseña
           , @imagen_delantera
           , @imagen_trasera)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_provincia]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_provincia] 
	-- Add the parameters for the stored procedure here
	@id_provincia varchar(50), 
	@provincia varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO provincia (id_provincia,provincia) VALUES (@id_provincia, @provincia)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_telefono]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_telefono] 
	-- Add the parameters for the stored procedure here
	@id_telefono int, 
	@id_cliente int,
	@telefono int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO telefono (id_telefono, id_cliente, telefono) VALUES (@id_telefono,@id_cliente, @telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_tipo_cuenta]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_tipo_cuenta] 
	-- Add the parameters for the stored procedure here
	@id_tipo_cuenta int, 
	@nombre varchar(50),
	@moneda varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tipo_cuenta (id_tipo_cuenta,nombre,moneda) VALUES (@id_tipo_cuenta, @nombre, @moneda)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_tipo_operacion]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_tipo_operacion] 
	-- Add the parameters for the stored procedure here
	@id_tipo_operacion int, 
	@nombre varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tipo_operacion (id_tipo_operacion, nombre) VALUES (@id_tipo_operacion, @nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_persona]    Script Date: 2/9/2021 17:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_persona]
	-- Add the parameters for the stored procedure here
	@id_cliente int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id_cliente]
      ,[nombre]
      ,[apellido]
      ,[fecha_de_nacimiento]
      ,[documento]
      ,[cuil]
      ,[nacionalidad]
      ,[genero]
      ,[id_localidad]
      ,[contraseña]
      ,[imagen_delantera]
      ,[imagen_trasera]
  FROM [dbo].[clientes]
  WHERE id_cliente=@id_cliente
END
GO
USE [master]
GO
ALTER DATABASE [pil] SET  READ_WRITE 
GO
