USE [master]
GO
/****** Object:  Database [Salon]    Script Date: 09.04.2024 21:24:30 ******/
CREATE DATABASE [Salon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Salon', FILENAME = N'K:\SSMS\MSSQL15.DOZO\MSSQL\DATA\Salon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Salon_log', FILENAME = N'K:\SSMS\MSSQL15.DOZO\MSSQL\DATA\Salon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Salon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Salon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Salon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Salon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Salon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Salon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Salon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Salon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Salon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Salon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Salon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Salon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Salon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Salon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Salon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Salon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Salon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Salon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Salon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Salon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Salon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Salon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Salon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Salon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Salon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Salon] SET  MULTI_USER 
GO
ALTER DATABASE [Salon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Salon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Salon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Salon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Salon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Salon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Salon] SET QUERY_STORE = OFF
GO
USE [Salon]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NULL,
	[LoginDateTime] [datetime] NULL,
	[TypeVxod] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [text] NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
	[total_cost] [int] NULL,
	[delivery_days] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_user]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09.04.2024 21:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoginHistory] ON 

INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1, 3, CAST(N'2023-12-14T16:24:01.020' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (2, 1, CAST(N'2023-12-14T16:24:18.713' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (3, 4, CAST(N'2023-12-14T16:24:26.000' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (4, NULL, CAST(N'2023-12-14T16:39:53.073' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (5, NULL, CAST(N'2023-12-14T16:39:56.687' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (6, NULL, CAST(N'2023-12-14T16:39:57.610' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (7, 4, CAST(N'2023-12-14T16:40:16.560' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (8, 3, CAST(N'2023-12-14T16:40:35.473' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (9, 3, CAST(N'2023-12-14T16:42:27.573' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (10, NULL, CAST(N'2024-04-02T16:35:01.783' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (11, 1, CAST(N'2024-04-02T16:35:13.057' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (12, 1, CAST(N'2024-04-02T16:43:57.627' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (13, NULL, CAST(N'2024-04-02T17:02:22.273' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (14, 1, CAST(N'2024-04-02T17:02:38.723' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (15, 1, CAST(N'2024-04-02T17:04:40.603' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (16, 1, CAST(N'2024-04-02T17:07:02.257' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1010, 1, CAST(N'2024-04-08T18:14:29.800' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1011, 1, CAST(N'2024-04-08T18:15:15.840' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1012, NULL, CAST(N'2024-04-08T18:54:13.453' AS DateTime), N'Не успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1013, 4, CAST(N'2024-04-08T18:54:19.437' AS DateTime), N'Успешно')
INSERT [dbo].[LoginHistory] ([id], [id_users], [LoginDateTime], [TypeVxod]) VALUES (1014, 1, CAST(N'2024-04-08T19:04:42.280' AS DateTime), N'Успешно')
SET IDENTITY_INSERT [dbo].[LoginHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (1, N'/photo/srtiz.jpeg', N'Стрижка', N'мужская/женская', N'Дарья', 2000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (2, N'/photo/okrkorn.jpeg', N'Окрашивание корней', N'Покрасим корни', N'Дарья', 3000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (3, N'/photo/okr1ton.jpeg', N'Окрашивание в один тон', N'Один тон', N'Дарья', 5000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (4, N'/photo/okrhard.jpeg', N'Окрашивание сложное', N'Балаяж/шатуш/мелирование/колорирование', N'Дарья', 20000, 15)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (5, N'/photo/ukladkanabresh.jpeg', N'Укладка на браш', N'Укладка', N'Дарья', 1000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (6, N'/photo/ukladkautug.jpeg', N'Укладка на утюжок', N'Голивудская укладка/выпрямление/афрокудри/калифорнийские локоны', N'Дарья', 2000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (7, N'/photo/uxod.jpeg', N'Уход для волос', N'Кератин/ботокс/холодное восстановление ', N'Дарья', 4000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (8, N'/photo/zavivka.jpeg', N'Химическая завивка', N'Завивка', N'Дарья', 7000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (9, N'/photo/svadbamanik.jpeg', N'Макияж свадебный', N'Чтобы невеста сияла', N'Дарья', 7000, 10)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (10, N'/photo/daymanik.jpeg', N'Макияж дневной', N'На день', N'Дарья', 4000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (11, N'/photo/vechermanik.jpeg', N'Макияж вечерний', N'На вечер', N'Дарья', 4500, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (12, N'/photo/manikdontpokr.jpeg', N'Маникюр без покрытия', N'Аппаратный/классический', N'Дарья', 1000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (13, N'/photo/manikspokr.jpeg', N'Маникюр с покрытием', N'Аппаратный/ классический', N'Дарья', 3000, NULL)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (14, N'/photo/maniknara.jpeg', N'Маникюр с покрытием и наращиванием', N'Аппаратный/ классический', N'Дарья', 5000, 5)
INSERT [dbo].[merch] ([id], [photo], [name], [description], [manufacturer], [price], [discount]) VALUES (15, N'/photo/sn.png', N'Проверка', N'тест', N'тест', 100, 1)
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1, 3, 2, 1, CAST(N'2023-12-14' AS Date), 407, 1000, 0, 1000, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2, 3, 1, 1, CAST(N'2024-04-08' AS Date), 982, 2000, 0, 2000, 6)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [name]) VALUES (1, N'Салон Палитра')
SET IDENTITY_INSERT [dbo].[point] OFF
GO
SET IDENTITY_INSERT [dbo].[sostav] ON 

INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (1, 1, 5, 1, 1, 1000, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (2, 2, 1, 1, 1, 2000, 0)
SET IDENTITY_INSERT [dbo].[sostav] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'в работе')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'завершен')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[type_user] ON 

INSERT [dbo].[type_user] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[type_user] ([id], [role]) VALUES (2, N'Менеджер')
INSERT [dbo].[type_user] ([id], [role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[type_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (1, N'dasha', N'12345', N'Дарья', N'/res/dasha.png', 1)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (3, N'delpanDDD', N'12345', N'Степан', N'/res/delp.png', 2)
INSERT [dbo].[users] ([id], [login], [password], [name], [photo], [id_type]) VALUES (4, N'client', N'12345', N'Вика', N'/res/cl.png', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[LoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginHistory_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[LoginHistory] CHECK CONSTRAINT [FK_LoginHistory_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point1] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point1]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status1] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status1]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users1] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users1]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders1] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders1]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_user] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_user]
GO
USE [master]
GO
ALTER DATABASE [Salon] SET  READ_WRITE 
GO
