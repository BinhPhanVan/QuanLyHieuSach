CREATE DATABASE QUAN_LY_HIEU_SACH
GO
USE QUAN_LY_HIEU_SACH

GO
CREATE TABLE NHA_XUAT_BAN
(
	MaNXB VARCHAR(5) PRIMARY KEY not null,
	TenNXB VARCHAR(30) not null
)

CREATE TABLE LOAI_SACH
(
	MaLoaiSach VARCHAR(5) PRIMARY KEY not null,
	TenLoaiSach VARCHAR(30) not null
)

CREATE TABLE SACH
(
	MaSach VARCHAR(5) PRIMARY KEY not null,
	TenSach VARCHAR(30) not null,
	GiaBan INT not null,
	SoLuong INT not null,
	MaNXB VARCHAR(5) not null,
	FOREIGN KEY (MaNXB) REFERENCES NHA_XUAT_BAN(MaNXB),
	MaLoaiSach VARCHAR(5) not null,
	FOREIGN KEY (MaLoaiSach) REFERENCES LOAI_SACH(MaLoaiSach)
)

CREATE TABLE NHAN_VIEN
(
	MaNhanVien VARCHAR(5) PRIMARY KEY not null,
	HoTen VARCHAR(30) not null,
	DanToc VARCHAR(10) not null,
	GioiTinh VARCHAR(3) not null,
	CMND VARCHAR(12) not null,
	SoDienThoai VARCHAR(10) not null,
	QueQuan VARCHAR(50) not null,
	NgaySinh DATE not null,
	TrangThai bit not null,
	isAdmin bit not null
)

CREATE TABLE TK_NHANVIEN
(
	TKNV VARCHAR(5) PRIMARY KEY not null,
	FOREIGN KEY (TKNV) REFERENCES  NHAN_VIEN(MaNhanVien),
	Pass VARCHAR(10) not null
)

CREATE TABLE KHACH_HANG
(
	MaKH VARCHAR(5) PRIMARY KEY not null,
	HoTen VARCHAR(30) not null,
	SDT VARCHAR(10) not null,
)

CREATE TABLE HOA_DON_NHAP
(
	MaDonNhap VARCHAR(5) Primary key not null,
	NgayNhap DATE,
	GhiChu VARCHAR(60),
)

CREATE TABLE CHI_TIET_HOA_DON_NHAP
( 
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MaDonNhap VARCHAR(5) not null,
	MaSach VARCHAR(5) not null,
    FOREIGN KEY (MaSach) REFERENCES SACH (MaSach),
	FOREIGN KEY (MaDonNhap) REFERENCES HOA_DON_NHAP (MaDonNhap),
	GiaNhap INT,
	SoLuong INT,
	ThanhTien INT,
	UNIQUE(MaDonNhap,MaSach)
)


CREATE TABLE HOA_DON_BAN
(
	MaDonBan INT IDENTITY(1,1) PRIMARY KEY not null,
	MaKH VARCHAR(5),
	MaNhanVien VARCHAR(5),
	FOREIGN KEY(MaNhanVien) REFERENCES NHAN_VIEN(MaNhanVien),
	FOREIGN KEY (MaKH) REFERENCES KHACH_HANG(MaKH),
	NgayBan DATE
)

CREATE TABLE CHI_TIET_HOA_DON_BAN
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MaDonBan INT not null,
	MaSach VARCHAR(5) not null,
	FOREIGN KEY (MaSach) REFERENCES SACH (MaSach),
	FOREIGN KEY (MaDonBan) REFERENCES HOA_DON_BAN(MaDonBan),
	SoLuong INT,
	DonGia INT,
	ThanhTien INT,
	UNIQUE (MaDonBan,MaSach)
)