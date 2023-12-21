create database QLBanQuanAo
go
use QLBanQuanAo
go


create table NguoiDung
(
	MaNguoiDung int primary key identity(1,1),
	TenDangNhap varchar(100),
	TenNguoiDung nvarchar(500),
	SoDienThoai varchar(200),
	Email varchar(200),
	MatKhau varchar(200),
	DiaChi nvarchar(250)
);

create table DonHang
(
	MaDonHang int primary key identity(1,1),
	NgayDatHang Date,
	DiaChiGiaoHang nvarchar(250),
	PTThanhToan nvarchar(200),
	TinhTrang nvarchar(250),
	TenNguoiNhanHang nvarchar(250),
	SoDienThoaiNhanHang varchar(200),
	TongTien decimal,
	GiamGia float,
	GhiChu nvarchar(250),
	MaNguoiDung int,
	Foreign Key (MaNguoiDung) References NguoiDung(MaNguoiDung)
);

create table PhanLoai
(
	MaPhanLoai int primary key identity(1,1),
	PhanLoaiChinh nvarchar(250)
);

create table PhanLoaiPhu
(
	MaPhanLoaiPhu int primary key identity(1,1),
	TenPhanLoaiPhu nvarchar(250),
	MaPhanLoai int,
);

create table SanPham
(
	MaSanPham int primary key identity(1,1),
	TenSanPham nvarchar(250),
	GiaNhap nvarchar(250),
	DonGiaBanNhoNhat decimal,
	TrangThai nvarchar(250),
	MoTaNgan nvarchar(250),
	AnhDaiDien varchar(250),
	NoiBat nvarchar(250),
	MaPhanLoaiPhu int,
	MaPhanLoai int,
	foreign key (MaPhanLoaiPhu) references PhanLoaiPhu(MaPhanLoaiPhu),
	foreign key (MaPhanLoai) references PhanLoai(MaPhanLoai),
);

create table MauSac
(
	MaMau int identity(1,1) primary key,
	TenMau nvarchar(250),
);


create table SPTheoMau
(
	MaSPTheoMau int primary key identity(1,1),
	MaSanPham int,
	MaMau int,
	foreign key (MaSanPham) references SanPham(MaSanPham),
	foreign key (MaMau) references MauSac(MaMau),
);

create table AnhChiTietSP
(
	MaAnh int primary key identity(1,1),
	TenFileAnh varchar(250),
	MaSPTheoMau int,
	foreign key (MaSPTheoMau) references SPTheoMau(MaSPTheoMau)
);

create table ChiTietSPBan
(
	MaChiTietSP int primary key identity(1,1),
	KichCo float,
	SoLuong int, 
	DonGiaBan decimal,
	MaSPTheoMau int,
	foreign key(MaSPTheoMau) references SPTheoMau(MaSPTheoMau)
);

create table ChiTietDonHang
(
	MaChiTietSP int,
	MaDonHang int,
	SoLuongMua int,
	DonGiaBan decimal,
	PRIMARY KEY (MaChiTietSP, MaDonHang),
	foreign key (MaChiTietSP) references ChiTietSPBan(MaChiTietSP),
	foreign key (MaDonHang) references DonHang(MaDonHang),
);




-- insert
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Oriental Fresh Tuna');
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Recycled Cotton Shoes');
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Handmade Frozen Salad');
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Unbranded Wooden Car');
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Licensed Rubber Bike');
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Recycled Bronze Chips');

select * from PhanLoai
delete from PhanLoai
where MaPhanLoai >= 4