USE [master]
GO
/****** Object:  Database [pil2b]    Script Date: 13/9/2021 21:35:14 ******/
CREATE DATABASE [pil2b]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pil2b', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pil2b.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pil2b_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pil2b_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pil2b] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pil2b].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pil2b] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pil2b] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pil2b] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pil2b] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pil2b] SET ARITHABORT OFF 
GO
ALTER DATABASE [pil2b] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pil2b] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pil2b] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pil2b] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pil2b] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pil2b] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pil2b] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pil2b] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pil2b] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pil2b] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pil2b] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pil2b] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pil2b] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pil2b] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pil2b] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pil2b] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pil2b] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pil2b] SET RECOVERY FULL 
GO
ALTER DATABASE [pil2b] SET  MULTI_USER 
GO
ALTER DATABASE [pil2b] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pil2b] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pil2b] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pil2b] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pil2b] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pil2b] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pil2b', N'ON'
GO
ALTER DATABASE [pil2b] SET QUERY_STORE = OFF
GO
USE [pil2b]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fecha_de_nacimiento] [date] NOT NULL,
	[documento] [int] NOT NULL,
	[cuil] [varchar](50) NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[genero] [varchar](50) NOT NULL,
	[id_localidad] [int] NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
	[imagen_delantera] [varchar](50) NOT NULL,
	[imagen_trasera] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[cvu] [varchar](50) NOT NULL,
	[numero_de_cuenta] [varchar](50) NOT NULL,
	[saldo] [int] NOT NULL,
	[id_tipo_cuenta] [int] NOT NULL,
 CONSTRAINT [PK_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[codigo_postal] [int] NOT NULL,
	[id_provincia] [int] NOT NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion](
	[id_operaciones] [int] IDENTITY(1,1) NOT NULL,
	[id_cuenta] [int] NOT NULL,
	[id_tipo_operacion] [int] NOT NULL,
	[monto] [int] NOT NULL,
	[id_cuenta_destino] [int] NULL,
	[concepto] [varchar](200) NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_operacion] PRIMARY KEY CLUSTERED 
(
	[id_operaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_provincia] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono](
	[id_telefono] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_telefono] PRIMARY KEY CLUSTERED 
(
	[id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_cuenta]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_cuenta](
	[id_tipo_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[moneda] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_cuenta] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_operacion]    Script Date: 13/9/2021 21:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_operacion](
	[id_tipo_operacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_operacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (1, N'Juan', N'Perez', CAST(N'2000-03-03' AS Date), 23400456, N'23-23400456-0', N'Argentina', N'Masculino', 1, N'juanperez@gmail.com', N'123456', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (4, N'Ana', N'Lopez', CAST(N'1998-04-10' AS Date), 36000333, N'23-36000333-8', N'Argentina', N'Femenino', 1, N'analopez@gmail.com', N'123456', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (5, N'Pablo', N'Lopez', CAST(N'2001-09-13' AS Date), 42333456, N'23-42333456-4', N'Argentina', N'Masculino', 1, N'pablolopez@gmail.com', N'12345678', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (6, N'Camila', N'Lopez', CAST(N'2021-09-13' AS Date), 40222111, N'22-40222111-6', N'Argentina', N'Femenino', 1, N'camilopez@gmail.com', N'123456789', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (7, N'Maria', N'Gomez', CAST(N'2000-02-22' AS Date), 49000111, N'23-49000111-2', N'Argentina', N'Femenino', 1, N'mariagomez@gmail.com', N'12345678', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (8, N'Micaela', N'Lopez', CAST(N'2021-09-13' AS Date), 30444567, N'23-30444567-5', N'Argentina', N'Femenino', 1, N'micalopez@gmail.com', N'12345678', N'si', N'si')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [fecha_de_nacimiento], [documento], [cuil], [nacionalidad], [genero], [id_localidad], [mail], [contrasena], [imagen_delantera], [imagen_trasera]) VALUES (9, N'Pia', N'Perez', CAST(N'2021-09-01' AS Date), 40333000, N'25-40333000-6', N'Argentina', N'Femenino', 1, N'piaperez@hotmail.com', N'12345678', N'Si', N'Si')
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[localidad] ON 

INSERT [dbo].[localidad] ([id_localidad], [nombre], [codigo_postal], [id_provincia]) VALUES (1, N'Córdoba   ', 5008, 1)
SET IDENTITY_INSERT [dbo].[localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 

INSERT [dbo].[provincia] ([id_provincia], [provincia]) VALUES (1, N'Córdoba')
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_cuenta] ON 

INSERT [dbo].[tipo_cuenta] ([id_tipo_cuenta], [nombre], [moneda]) VALUES (1, N'Caja de Ahorro', N'Peso Argentino')
SET IDENTITY_INSERT [dbo].[tipo_cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_operacion] ON 

INSERT [dbo].[tipo_operacion] ([id_tipo_operacion], [nombre]) VALUES (1, N'Transferencia')
INSERT [dbo].[tipo_operacion] ([id_tipo_operacion], [nombre]) VALUES (2, N'Deposito')
SET IDENTITY_INSERT [dbo].[tipo_operacion] OFF
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_localidad] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidad] ([id_localidad])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_localidad]
GO
ALTER TABLE [dbo].[cuenta]  WITH CHECK ADD  CONSTRAINT [FK_cuenta_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[cuenta] CHECK CONSTRAINT [FK_cuenta_cliente]
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
ALTER TABLE [dbo].[telefono]  WITH CHECK ADD  CONSTRAINT [FK_telefono_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[telefono] CHECK CONSTRAINT [FK_telefono_cliente]
GO
/****** Object:  StoredProcedure [dbo].[insertar_cuenta]    Script Date: 13/9/2021 21:35:16 ******/
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
	@cvu varchar(50), 
	@numero_de_cuenta varchar(50), 
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
/****** Object:  StoredProcedure [dbo].[insertar_persona]    Script Date: 13/9/2021 21:35:16 ******/
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
	@nombre varchar(50),
	@apellido varchar(50),
	@fecha_de_nacimiento date,
	@documento int,
	@cuil varchar(50),
	@nacionalidad varchar(50),
	@genero varchar(50),
	@id_localidad int,
	@mail varchar(50),
	@contrasena varchar(50),
	@imagen_delantera varchar(50),
	@imagen_trasera varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO cliente
           (nombre
           ,apellido
           ,fecha_de_nacimiento
           ,documento
           ,cuil
           ,nacionalidad
           ,genero
           ,id_localidad
		   ,mail
           ,contrasena
           ,imagen_delantera
           ,imagen_trasera)
     VALUES
           (@nombre
           , @apellido
           , @fecha_de_nacimiento
           , @documento
           , @cuil
           , @nacionalidad
           , @genero
           , @id_localidad
		   , @mail
           , @contrasena
           , @imagen_delantera
           , @imagen_trasera)
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_telefono]    Script Date: 13/9/2021 21:35:16 ******/
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
	@telefono varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO telefono (id_telefono, id_cliente, telefono) VALUES (@id_telefono,@id_cliente, @telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_persona]    Script Date: 13/9/2021 21:35:16 ******/
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
	  ,[mail]
      ,[contrasena]
      ,[imagen_delantera]
      ,[imagen_trasera]
  FROM [dbo].[cliente]
  WHERE id_cliente=@id_cliente
END
GO
/****** Object:  StoredProcedure [dbo].[obtener_personas]    Script Date: 13/9/2021 21:35:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[obtener_personas] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[clientes]
END
GO
USE [master]
GO
ALTER DATABASE [pil2b] SET  READ_WRITE 
GO
