USE [master]
GO
/****** Object:  Database [ShopPV]    Script Date: 5/21/2022 7:16:00 PM ******/
CREATE DATABASE [ShopPV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopPV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGOCHUNG\MSSQL\DATA\ShopPV.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopPV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGOCHUNG\MSSQL\DATA\ShopPV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopPV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopPV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopPV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopPV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopPV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopPV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopPV] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopPV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopPV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopPV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopPV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopPV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopPV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopPV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopPV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopPV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopPV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopPV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopPV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopPV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopPV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopPV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopPV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopPV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopPV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopPV] SET  MULTI_USER 
GO
ALTER DATABASE [ShopPV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopPV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopPV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopPV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopPV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShopPV]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 5/21/2022 7:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSanPham] [nvarchar](10) NOT NULL,
	[TenLoaiSanPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 5/21/2022 7:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNhaSanXuat] [nvarchar](10) NOT NULL,
	[TenNhaSanXuat] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/21/2022 7:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](10) NOT NULL,
	[MaLoaiSanPham] [nvarchar](10) NULL,
	[MaNhaSanXuat] [nvarchar](10) NOT NULL,
	[TenSanPham] [nvarchar](max) NULL,
	[CauHinh] [nvarchar](50) NULL,
	[HinhChinh] [nvarchar](50) NULL,
	[Hinh1] [nvarchar](50) NULL,
	[Hinh2] [nvarchar](50) NULL,
	[Hinh3] [nvarchar](50) NULL,
	[Hinh4] [nvarchar](50) NULL,
	[Gia] [float] NULL CONSTRAINT [DF_SanPham_Gia]  DEFAULT ((0)),
	[SoLuongDaBan] [int] NULL CONSTRAINT [DF_SanPham_SoLuongDaBan]  DEFAULT ((0)),
	[LuotView] [int] NULL CONSTRAINT [DF_SanPham_LuotView]  DEFAULT ((0)),
	[TinhTrang] [nchar](10) NULL CONSTRAINT [DF_SanPham_TinhTrang]  DEFAULT ((0)),
 CONSTRAINT [PK_SanPham_1] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'LSP01', N'Cao Cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'LSP02', N'Trung Bình')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'LSP03', N'Thấp')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (N'NSX01', N'Iphone')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (N'NSX02', N'SamSung')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat]) VALUES (N'NSX03', N'Oppo')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP01', N'LSP01', N'NSX01', N'Iphone 12 Pro 512GB', N'Chưa xác định', N'1.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP02', N'LSP02', N'NSX02', N'Iphone 12 Pro128GB', N'Chưa xác định', N'2.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP03', N'LSP03', N'NSX03', N'SamSung ', N'Chưa xác định', N'3.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP04', N'LSP01', N'NSX01', N'Iphone X 64GB', N'Chưa xác định', N'4.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP05', N'LSP02', N'NSX02', N'SamSung J2', N'Chưa xác định', N'5.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP06', N'LSP01', N'NSX03', N'Iphone 7 plus 128GB', N'Chưa xác định', N'6.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP07', N'LSP01', N'NSX01', N'Iphone 8 plus 128GB', N'Chưa xác định', N'7.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP08', N'LSP02', N'NSX03', N'SamSung Galaxy', N'Chưa xác định ', N'8.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP09', N'LSP03', N'NSX01', N'Iphone 13 Pro 128GB', N'Chưa xác định', N'8.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP10', N'LSP02', N'NSX02', N'Sam Sung J3', N'Chưa xác định', N'10.png', NULL, NULL, NULL, NULL, 0, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP11', N'LSP03', N'NSX01', N'Sam sung A3', N'Chưa xác định ', N'11.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang]) VALUES (N'SP12', N'LSP02', N'NSX03', N'SamSung J4', N'Chưa xác định', N'12.png', NULL, NULL, NULL, NULL, 28490000, 0, 0, N'0         ')
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNhaSanXuat])
REFERENCES [dbo].[NhaSanXuat] ([MaNhaSanXuat])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
USE [master]
GO
ALTER DATABASE [ShopPV] SET  READ_WRITE 
GO
