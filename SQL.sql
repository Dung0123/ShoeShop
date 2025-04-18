USE [Du_An_Ca_Nhan2]
GO
/****** Object:  Table [dbo].[ANHSANPHAM]    Script Date: 3/29/2024 1:38:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANHSANPHAM](
	[MAANHSANPHAM] [bigint] IDENTITY(1,1) NOT NULL,
	[ANHSANPHAM] [nvarchar](max) NULL,
	[MASANPHAM] [bigint] NULL,
	[TRANGTHAI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAANHSANPHAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHATLIEU]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHATLIEU](
	[MACHATLIEU] [bigint] IDENTITY(1,1) NOT NULL,
	[CHATLIEU] [nvarchar](30) NULL,
	[TRANGTHAI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MACHATLIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[MADANHMUC] [bigint] IDENTITY(1,1) NOT NULL,
	[DANHMUC] [nvarchar](30) NULL,
	[TRANGTHAI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MADANHMUC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachYeuThich](
	[MaDanhSach] [uniqueidentifier] NOT NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhap] [date] NULL,
	[NguoiSoHuu] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[MaDiaChi] [uniqueidentifier] NOT NULL,
	[TenDiaChi] [nvarchar](50) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
	[TinhThanhPho] [nvarchar](50) NULL,
	[QuanHuyen] [nvarchar](50) NULL,
	[PhuongXa] [nvarchar](50) NULL,
	[DuongPho] [nvarchar](50) NULL,
	[KhachHang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDiaChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [uniqueidentifier] NOT NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhap] [date] NULL,
	[NguoiSoHuu] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHangChiTiet]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHangChiTiet](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [bigint] NULL,
	[MagioHang] [uniqueidentifier] NULL,
	[SoLuong] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangKhachHang]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangKhachHang](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[DiemToiThieu] [int] NOT NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayLap] [date] NULL,
	[NguoiLap] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[NgayThanhToan] [date] NULL,
	[TrangThai] [int] NULL,
	[NguoiMua] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[MaHoaDon] [bigint] NOT NULL,
	[MaSanPham] [bigint] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[SinhNhat] [date] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[ChungMinhThu] [varchar](15) NULL,
	[SoCanCuoc] [varchar](15) NULL,
	[AnhDaiDien] [varchar](50) NULL,
	[TrangThai] [int] NULL,
	[DiemTichLuy] [int] NULL,
	[HangKhachHang] [int] NULL,
	[NguoiGioiThieu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAUSAC]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAUSAC](
	[MAMAUSAC] [bigint] IDENTITY(1,1) NOT NULL,
	[MAUSAC] [nvarchar](30) NULL,
	[TRANGTHAI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAMAUSAC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHASANXUAT]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHASANXUAT](
	[MANHASANXUAT] [bigint] IDENTITY(1,1) NOT NULL,
	[NHASANXUAT] [nvarchar](30) NULL,
	[TRANGTHAI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MANHASANXUAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuGiamGia]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuGiamGia](
	[MaPhieu] [varchar](10) NOT NULL,
	[TenPhieu] [nvarchar](20) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[GiaTriGiam] [money] NULL,
	[GiaTriGiamToiDa] [money] NULL,
	[HinhThucGiam] [bit] NULL,
	[TrangThai] [int] NULL,
	[NguoiSoHuu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuGiaoHang]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuGiaoHang](
	[MaPhieuGiao] [uniqueidentifier] NOT NULL,
	[NguoiNhan] [nvarchar](50) NULL,
	[SdtNhan] [varchar](20) NULL,
	[NguoiGiao] [nvarchar](50) NULL,
	[SdtGiao] [varchar](20) NULL,
	[NgayGiao] [date] NULL,
	[NgayNhan] [date] NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[PhiGiaoHang] [money] NULL,
	[HoaDonGiao] [bigint] NULL,
	[DiaChiGiao] [uniqueidentifier] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuGiao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [bigint] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[MaChatLieu] [bigint] NULL,
	[GiaHienHanh] [money] NULL,
	[SoLuongTon] [int] NULL,
	[SIZE] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaDanhMuc] [bigint] NULL,
	[MaMauSac] [bigint] NULL,
	[MaNhaSanXuat] [bigint] NULL,
	[TrangThai] [int] NULL,
	[MAANHSANPHAM] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheThanhVien]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheThanhVien](
	[MaThe] [varchar](50) NOT NULL,
	[MauThe] [nvarchar](10) NULL,
	[LoaiThe] [nvarchar](10) NULL,
	[NgayPhatHanh] [date] NULL,
	[NgayHuy] [date] NULL,
	[TrangThai] [int] NULL,
	[NguoiSoHuu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThichChiTiet]    Script Date: 3/29/2024 1:38:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThichChiTiet](
	[MaDanhSach] [uniqueidentifier] NOT NULL,
	[MaSanPham] [bigint] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhSach] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ANHSANPHAM] ON 

INSERT [dbo].[ANHSANPHAM] ([MAANHSANPHAM], [ANHSANPHAM], [MASANPHAM], [TRANGTHAI]) VALUES (1, N'Olong.jpg', NULL, NULL)
INSERT [dbo].[ANHSANPHAM] ([MAANHSANPHAM], [ANHSANPHAM], [MASANPHAM], [TRANGTHAI]) VALUES (2, N'Screenshot 2024-03-12 203151.png', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ANHSANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[CHATLIEU] ON 

INSERT [dbo].[CHATLIEU] ([MACHATLIEU], [CHATLIEU], [TRANGTHAI]) VALUES (1, N'Da tổng hợp', 1)
INSERT [dbo].[CHATLIEU] ([MACHATLIEU], [CHATLIEU], [TRANGTHAI]) VALUES (2, N'Da thật', 1)
INSERT [dbo].[CHATLIEU] ([MACHATLIEU], [CHATLIEU], [TRANGTHAI]) VALUES (3, N'Vải', 1)
SET IDENTITY_INSERT [dbo].[CHATLIEU] OFF
GO
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([MADANHMUC], [DANHMUC], [TRANGTHAI]) VALUES (1, N'Giày thể thao', 1)
INSERT [dbo].[DANHMUC] ([MADANHMUC], [DANHMUC], [TRANGTHAI]) VALUES (2, N'Giày công sở', 1)
INSERT [dbo].[DANHMUC] ([MADANHMUC], [DANHMUC], [TRANGTHAI]) VALUES (3, N'Giày lười', 1)
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
GO
SET IDENTITY_INSERT [dbo].[MAUSAC] ON 

INSERT [dbo].[MAUSAC] ([MAMAUSAC], [MAUSAC], [TRANGTHAI]) VALUES (1, N'Màu đen', 1)
INSERT [dbo].[MAUSAC] ([MAMAUSAC], [MAUSAC], [TRANGTHAI]) VALUES (2, N'Màu trắng', 1)
INSERT [dbo].[MAUSAC] ([MAMAUSAC], [MAUSAC], [TRANGTHAI]) VALUES (3, N'Màu xanh', 1)
SET IDENTITY_INSERT [dbo].[MAUSAC] OFF
GO
SET IDENTITY_INSERT [dbo].[NHASANXUAT] ON 

INSERT [dbo].[NHASANXUAT] ([MANHASANXUAT], [NHASANXUAT], [TRANGTHAI]) VALUES (1, N'Nike', 1)
INSERT [dbo].[NHASANXUAT] ([MANHASANXUAT], [NHASANXUAT], [TRANGTHAI]) VALUES (2, N'Adidas', 1)
INSERT [dbo].[NHASANXUAT] ([MANHASANXUAT], [NHASANXUAT], [TRANGTHAI]) VALUES (3, N'Puma', 1)
SET IDENTITY_INSERT [dbo].[NHASANXUAT] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaChatLieu], [GiaHienHanh], [SoLuongTon], [SIZE], [MoTa], [MaDanhMuc], [MaMauSac], [MaNhaSanXuat], [TrangThai], [MAANHSANPHAM]) VALUES (1, N'test', 1, 10.0000, 5, 40, N'test', 1, 1, 1, 0, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaChatLieu], [GiaHienHanh], [SoLuongTon], [SIZE], [MoTa], [MaDanhMuc], [MaMauSac], [MaNhaSanXuat], [TrangThai], [MAANHSANPHAM]) VALUES (2, N'Giày Adidas', 1, 40.0000, 10, 39, N'testt', 1, 1, 1, 0, 2)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[DanhSachYeuThich] ADD  DEFAULT (newid()) FOR [MaDanhSach]
GO
ALTER TABLE [dbo].[DiaChi] ADD  DEFAULT (newid()) FOR [MaDiaChi]
GO
ALTER TABLE [dbo].[GioHang] ADD  DEFAULT (newid()) FOR [MaGioHang]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((0)) FOR [DiemTichLuy]
GO
ALTER TABLE [dbo].[PhieuGiaoHang] ADD  DEFAULT (newid()) FOR [MaPhieuGiao]
GO
ALTER TABLE [dbo].[ANHSANPHAM]  WITH CHECK ADD FOREIGN KEY([MASANPHAM])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([NguoiSoHuu])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([KhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([NguoiSoHuu])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MagioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([NguoiMua])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([HangKhachHang])
REFERENCES [dbo].[HangKhachHang] ([MaHang])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([NguoiGioiThieu])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[PhieuGiamGia]  WITH CHECK ADD FOREIGN KEY([NguoiSoHuu])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[PhieuGiaoHang]  WITH CHECK ADD FOREIGN KEY([DiaChiGiao])
REFERENCES [dbo].[DiaChi] ([MaDiaChi])
GO
ALTER TABLE [dbo].[PhieuGiaoHang]  WITH CHECK ADD FOREIGN KEY([HoaDonGiao])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_ANH_SAN_PHAM] FOREIGN KEY([MAANHSANPHAM])
REFERENCES [dbo].[ANHSANPHAM] ([MAANHSANPHAM])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_ANH_SAN_PHAM]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_CHAT_LIEU] FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[CHATLIEU] ([MACHATLIEU])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_CHAT_LIEU]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_DANH_MUC] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DANHMUC] ([MADANHMUC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_DANH_MUC]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_MAU_SAC] FOREIGN KEY([MaMauSac])
REFERENCES [dbo].[MAUSAC] ([MAMAUSAC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_MAU_SAC]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_NHA_SAN_XUAT] FOREIGN KEY([MaNhaSanXuat])
REFERENCES [dbo].[NHASANXUAT] ([MANHASANXUAT])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_NHA_SAN_XUAT]
GO
ALTER TABLE [dbo].[TheThanhVien]  WITH CHECK ADD FOREIGN KEY([NguoiSoHuu])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[YeuThichChiTiet]  WITH CHECK ADD FOREIGN KEY([MaDanhSach])
REFERENCES [dbo].[DanhSachYeuThich] ([MaDanhSach])
GO
ALTER TABLE [dbo].[YeuThichChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
