USE [master]
GO
/****** Object:  Database [SUPER]    Script Date: 12/18/2017 10:40:07 AM ******/
CREATE DATABASE [SUPER]
 
USE [SUPER]
GO
/******************************************/
CREATE TABLE USUARIO
(
  ID_USUARIO INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
  Nombre VARCHAR (30),
  Usuario VARCHAR (30),
  Pasword VARCHAR (30)
)

/****** Object:  UserDefinedFunction [dbo].[INVENTARIO]    Script Date: 12/18/2017 10:40:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE FUNCTION [dbo].[INVENTARIO]() RETURNS INT
AS
BEGIN
DECLARE @total DECIMAL
 SELECT @total=SUM(stock) FROM ARTICULOS
 RETURN @total
END
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 12/18/2017 10:40:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS](
	[clave_art] [int] NOT NULL,
	[costo] [decimal](7, 2) NULL,
	[descripcion] [varchar](50) NULL,
	[marca] [varchar](15) NULL,
	[modelo] [varchar](20) NULL,
	[depto] [varchar](2) NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK__ARTICULO__4FAE7F20D3C8BBC3] PRIMARY KEY CLUSTERED 
(
	[clave_art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BITACORA_CLIENTES]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BITACORA_CLIENTES](
	[usuario] [varchar](40) NULL,
	[terminal] [varchar](40) NULL,
	[fecha] [datetime] NULL,
	[cliente] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[clave_cliente] [int] NOT NULL,
	[nombre] [varchar](40) NULL,
	[direccion] [varchar](40) NULL,
	[telefono] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[clave_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTAMENTO]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTO](
	[depto] [varchar](2) NOT NULL,
	[nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[depto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDOS]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDOS](
	[clave_cli] [int] NULL,
	[clave_art] [int] NULL,
	[cantidad] [int] NULL,
	[fecha] [varchar](12) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (880, CAST(50.80 AS Decimal(7, 2)), N'TRAPEADOR', N'PATITO', N'HILO', N'15', 430)
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (885, CAST(55.80 AS Decimal(7, 2)), N'SACUDIDOR', N'PATITO', N'TELA', N'15', 480)
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (1002, CAST(32.20 AS Decimal(7, 2)), N'ESCOBA', N'PATITO', N'PALMA', N'15', 500)
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (1005, CAST(28.50 AS Decimal(7, 2)), N'RECOGEDOR', N'PATITO', N'PLASTICO', N'15', 600)
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (1010, CAST(78.80 AS Decimal(7, 2)), N'CARNE MOLIDA', N'7 CERROS', N'MAGRA', N'13', 700)
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (1011, CAST(35.00 AS Decimal(7, 2)), N'CHORIZO', N'H-C', N'MEJORADO', N'13', 420)
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (1012, CAST(50.25 AS Decimal(7, 2)), N'COBIJA', N'SAN MARCOS', N'7 HILOS', N'14', 400)
INSERT [dbo].[ARTICULOS] ([clave_art], [costo], [descripcion], [marca], [modelo], [depto], [stock]) VALUES (1015, CAST(75.80 AS Decimal(7, 2)), N'FRAZADA', N'SAN MARCOS', N'DELGADA', N'14', 600)
INSERT [dbo].[CLIENTES] ([clave_cliente], [nombre], [direccion], [telefono]) VALUES (1, N'Alejandro Landavazo', N'Tubac #29', N'6621531624')
INSERT [dbo].[CLIENTES] ([clave_cliente], [nombre], [direccion], [telefono]) VALUES (1180, N'LUCERO RICO', N'REP. DE CUBA 325', N'22-11-75-78')
INSERT [dbo].[CLIENTES] ([clave_cliente], [nombre], [direccion], [telefono]) VALUES (1185, N'MARIA LOPEZ', N'MEXICO 3325', N'22-11-75-78')
INSERT [dbo].[CLIENTES] ([clave_cliente], [nombre], [direccion], [telefono]) VALUES (1200, N'AGAPITO BUELNA', N'VILLAHERMOSA 5', N'22-84-35-60')
INSERT [dbo].[CLIENTES] ([clave_cliente], [nombre], [direccion], [telefono]) VALUES (1205, N'MARIO GOMEZ', N'TABASCO 305', N'22-84-35-60')
INSERT [dbo].[DEPARTAMENTO] ([depto], [nombre]) VALUES (N'10', N'Abarrotes')
INSERT [dbo].[DEPARTAMENTO] ([depto], [nombre]) VALUES (N'11', N'Salchichoneria')
INSERT [dbo].[DEPARTAMENTO] ([depto], [nombre]) VALUES (N'12', N'Lacteos')
INSERT [dbo].[DEPARTAMENTO] ([depto], [nombre]) VALUES (N'13', N'Carnes')
INSERT [dbo].[DEPARTAMENTO] ([depto], [nombre]) VALUES (N'14', N'Blancos')
INSERT [dbo].[DEPARTAMENTO] ([depto], [nombre]) VALUES (N'15', N'Limpieza')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1200, 1002, 5, N'2007-12-01')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1200, 1012, 5, N'2007-12-01')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1180, 1002, 5, N'2007-12-02')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1180, 880, 5, N'2007-12-02')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1205, 1005, 15, N'2007-12-08')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1185, 885, 11, N'2007-12-20')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1200, 1010, 5, N'2010-12-02')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1180, 1011, 5, N'2010-12-02')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1205, 1012, 15, N'2015-12-08')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1185, 1015, 11, N'2015-12-20')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1, 1012, 1, N'12/18/2017')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1, 880, 20, N'12/18/2017')
INSERT [dbo].[PEDIDOS] ([clave_cli], [clave_art], [cantidad], [fecha]) VALUES (1, 1012, 74, N'12/18/2017')
ALTER TABLE [dbo].[ARTICULOS]  WITH CHECK ADD  CONSTRAINT [FK__ARTICULOS__depto__1273C1CD] FOREIGN KEY([depto])
REFERENCES [dbo].[DEPARTAMENTO] ([depto])
GO
ALTER TABLE [dbo].[ARTICULOS] CHECK CONSTRAINT [FK__ARTICULOS__depto__1273C1CD]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK__PEDIDOS__clave_a__173876EA] FOREIGN KEY([clave_art])
REFERENCES [dbo].[ARTICULOS] ([clave_art])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [FK__PEDIDOS__clave_a__173876EA]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK__PEDIDOS__clave_c__164452B1] FOREIGN KEY([clave_cli])
REFERENCES [dbo].[CLIENTES] ([clave_cliente])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [FK__PEDIDOS__clave_c__164452B1]
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_ARTICULO_VALIDO]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_ARTICULO_VALIDO]

@clave INT,
@costo decimal(4,2),
@descripcion VARCHAR(40),
@marca VARCHAR(45),
@modelo VARCHAR(45),
@stock int,
@depto varchar(2),
@mensaje varchar(50)
AS
BEGIN
	If not exists(SELECT * FROM ARTICULOS where clave_art=@clave)
	BEGIN
		INSERT INTO ARTICULOS(clave_art,costo,descripcion,marca,modelo,stock,depto)
		VALUES
		(@clave,@costo,@descripcion, @marca, @modelo,@stock,@depto)
		set @mensaje = 'Articulo registrado correctamente'
		select @mensaje
		
	END
	If exists(SELECT * FROM ARTICULOS where clave_art=@clave)
	BEGIN
		set @mensaje = 'Este articulo ya existe'
		select @mensaje
		
	END

END
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_CLIENTE_VALIDO]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_CLIENTE_VALIDO]
@clave INT,
@Wnombre VARCHAR(40),
@Wdireccion VARCHAR(40),
@Wtelefono VARCHAR(45),
@mensaje varchar(40)
--@mensaje varchar(40) output
AS
BEGIN
	If not exists(SELECT * FROM CLIENTES where clave_cliente=@clave)
	BEGIN
		INSERT INTO CLIENTES(clave_cliente,nombre,direccion,telefono)
		VALUES
		(@clave,@Wnombre, @Wdireccion, @Wtelefono)
		set @mensaje = 'Cliente registrado correctamente'
		select @mensaje
		
	END
	If exists(SELECT * FROM CLIENTES where clave_cliente=@clave)
	BEGIN
		set @mensaje = 'Este cliente ya existe'
		select @mensaje
		
	END

END
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_DEPTO_VALIDO]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_DEPTO_VALIDO]

@clave varchar(2),
@nombre varchar(30),
@mensaje varchar(50)
AS
BEGIN
	If not exists(SELECT * FROM DEPARTAMENTO where depto=@clave)
	BEGIN
		INSERT INTO DEPARTAMENTO(depto,nombre)
		VALUES
		(@clave,@nombre)
		set @mensaje = 'Departamento registrado correctamente'
		select @mensaje
		
	END
	If exists(SELECT * FROM DEPARTAMENTO where depto=@clave)
	BEGIN
		set @mensaje = 'Este departamento ya existe'
		select @mensaje
		
	END

END
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_PEDIDOS_VALIDO]    Script Date: 12/18/2017 10:40:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_PEDIDOS_VALIDO]

@cliente varchar(30),
@descripcion varchar(50),
@fecha VARCHAR(45),
@cantidad int,
@clave_articulo INT,
@clave_cliente VARCHAR(40),
@mensaje varchar(200)
--@mensaje varchar(40) output
AS
BEGIN
	set @clave_cliente = (SELECT clave_cliente FROM CLIENTES WHERE nombre = @cliente)
	set @clave_articulo =(SELECT clave_art FROM ARTICULOS WHERE descripcion = @descripcion)
	if (select stock from ARTICULOS where clave_art = @clave_articulo) >= @cantidad
	BEGIN
		INSERT INTO PEDIDOS(clave_cli,clave_art,cantidad,fecha)
		VALUES
		(@clave_cliente,@clave_articulo, @cantidad, @fecha)
		update ARTICULOS set stock = stock - @cantidad where clave_art= @clave_articulo
		set @mensaje = 'Pedido registrado correctamente'
		select @mensaje
	END
	else
	BEGIN 
		set @mensaje = 'No hay tantos articulos existentes en el stock'
		select @mensaje
	END


END
GO
USE [master]
GO
ALTER DATABASE [SUPER] SET  READ_WRITE 
GO


