USE [master]
GO
/****** Object:  Database [BanHang16]    Script Date: 12/21/2018 14:02:54 ******/
CREATE DATABASE [BanHang16] ON  PRIMARY 
( NAME = N'BanHang16', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BanHang16.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BanHang16_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BanHang16_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BanHang16] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHang16].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHang16] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BanHang16] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BanHang16] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BanHang16] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BanHang16] SET ARITHABORT OFF
GO
ALTER DATABASE [BanHang16] SET AUTO_CLOSE ON
GO
ALTER DATABASE [BanHang16] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BanHang16] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BanHang16] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BanHang16] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BanHang16] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BanHang16] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BanHang16] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BanHang16] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BanHang16] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BanHang16] SET  ENABLE_BROKER
GO
ALTER DATABASE [BanHang16] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BanHang16] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BanHang16] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BanHang16] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BanHang16] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BanHang16] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BanHang16] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BanHang16] SET  READ_WRITE
GO
ALTER DATABASE [BanHang16] SET RECOVERY SIMPLE
GO
ALTER DATABASE [BanHang16] SET  MULTI_USER
GO
ALTER DATABASE [BanHang16] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BanHang16] SET DB_CHAINING OFF
GO
USE [BanHang16]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/21/2018 14:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[idNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[GioiTinh] [nchar](10) NOT NULL,
	[SDT] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNhanVien] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 12/21/2018 14:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 12/21/2018 14:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[idtype] [int] IDENTITY(1,1) NOT NULL,
	[nametype] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idtype] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/21/2018 14:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](1000) NOT NULL,
	[idtype] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/21/2018 14:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NULL,
	[idNV] [int] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[M_Login]    Script Date: 12/21/2018 14:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[M_Login]
@userName nvarchar(100), @passWord nvarchar(100)
as
begin
	select * from dbo.Account where UserName = @userName and PassWord = @passWord
end
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/21/2018 14:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[idKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[GioiTinh] [nchar](10) NOT NULL,
	[SDT] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[idBill] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idKhachHang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 12/21/2018 14:03:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__Food__name__0519C6AF]    Script Date: 12/21/2018 14:02:56 ******/
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
/****** Object:  Default [DF__Food__price__060DEAE8]    Script Date: 12/21/2018 14:02:56 ******/
ALTER TABLE [dbo].[Food] ADD  DEFAULT ((0)) FOR [price]
GO
/****** Object:  Default [DF__Bill__DateCheckI__0AD2A005]    Script Date: 12/21/2018 14:02:56 ******/
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
/****** Object:  Default [DF__Bill__status__0BC6C43E]    Script Date: 12/21/2018 14:02:56 ******/
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__BillInfo__count__108B795B]    Script Date: 12/21/2018 14:03:00 ******/
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [count]
GO
/****** Object:  ForeignKey [FK_Account_AccountType]    Script Date: 12/21/2018 14:02:56 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([idtype])
REFERENCES [dbo].[AccountType] ([idtype])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType]
GO
/****** Object:  ForeignKey [FK_Bill_NhanVien]    Script Date: 12/21/2018 14:02:56 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_NhanVien] FOREIGN KEY([idNV])
REFERENCES [dbo].[NhanVien] ([idNhanVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_NhanVien]
GO
/****** Object:  ForeignKey [FK_KhachHang_Bill]    Script Date: 12/21/2018 14:03:00 ******/
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_Bill] FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_Bill]
GO
/****** Object:  ForeignKey [FK__BillInfo__count__117F9D94]    Script Date: 12/21/2018 14:03:00 ******/
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
/****** Object:  ForeignKey [FK__BillInfo__idFood__1273C1CD]    Script Date: 12/21/2018 14:03:00 ******/
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
