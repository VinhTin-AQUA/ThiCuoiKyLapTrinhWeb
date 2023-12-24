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
)
go

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
)
go

create table PhanLoai
(
	MaPhanLoai int primary key identity(1,1),
	PhanLoaiChinh nvarchar(250)
)
go

create table PhanLoaiPhu
(
	MaPhanLoaiPhu int primary key identity(1,1),
	TenPhanLoaiPhu nvarchar(250),
	MaPhanLoai int,
)
go

create table SanPham
(
	MaSanPham int primary key identity(1,1),
	TenSanPham nvarchar(250),
	GiaNhap decimal,
	DonGiaBanNhoNhat decimal,
	TrangThai nvarchar(250),
	MoTaNgan nvarchar(250),
	AnhDaiDien varchar(250),
	NoiBat nvarchar(250),
	MaPhanLoaiPhu int,
	MaPhanLoai int,
	foreign key (MaPhanLoaiPhu) references PhanLoaiPhu(MaPhanLoaiPhu),
	foreign key (MaPhanLoai) references PhanLoai(MaPhanLoai),
)
go

create table MauSac
(
	MaMau int identity(1,1) primary key,
	TenMau nvarchar(250),
)
go

create table SPTheoMau
(
	MaSPTheoMau int primary key identity(1,1),
	MaSanPham int,
	MaMau int,
	foreign key (MaSanPham) references SanPham(MaSanPham),
	foreign key (MaMau) references MauSac(MaMau),
)
go

create table AnhChiTietSP
(
	MaAnh int primary key identity(1,1),
	TenFileAnh varchar(250),
	MaSPTheoMau int,
	foreign key (MaSPTheoMau) references SPTheoMau(MaSPTheoMau)
)
go

create table ChiTietSPBan
(
	MaChiTietSP int primary key identity(1,1),
	KichCo float,
	SoLuong int, 
	DonGiaBan decimal,
	MaSPTheoMau int,
	foreign key(MaSPTheoMau) references SPTheoMau(MaSPTheoMau)
)
go

create table ChiTietDonHang
(
	MaChiTietSP int,
	MaDonHang int,
	SoLuongMua int,
	DonGiaBan decimal,
	PRIMARY KEY (MaChiTietSP, MaDonHang),
	foreign key (MaChiTietSP) references ChiTietSPBan(MaChiTietSP),
	foreign key (MaDonHang) references DonHang(MaDonHang),
)
go

-- insert nguoi dung
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('twestmorland9', 'twestmorland9', '922-427-3345', 'mklimas9@who.int', 'twestmorland9', '51314 Anzinger Way');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('aglasbeya', 'aglasbeya', '806-932-5587', 'pgutmana@dion.ne.jp', 'aglasbeya', '193 Fairview Hill');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('bsearsbyb', 'bsearsbyb', '377-228-3488', 'pknobellb@cargocollective.com', 'bsearsbyb', '274 Dunning Park');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('opeetc', 'opeetc', '274-234-7260', 'bormerodc@nydailynews.com', 'opeetc', '8 Norway Maple Park');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('scourtliffd', 'scourtliffd', '679-389-6723', 'hattwoulld@cnbc.com', 'scourtliffd', '4 Golf View Avenue');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('lmcgarritye', 'lmcgarritye', '797-655-2547', 'dleree@spiegel.de', 'lmcgarritye', '385 Kenwood Drive');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('jnewickf', 'jnewickf', '336-186-6756', 'abrehautf@sciencedaily.com', 'jnewickf', '0 Truax Junction');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('aruppelg', 'aruppelg', '116-415-4329', 'chawseg@wordpress.org', 'aruppelg', '4278 Oakridge Crossing');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('rbrowneh', 'rbrowneh', '109-733-0672', 'fkidh@stumbleupon.com', 'rbrowneh', '5110 Sherman Drive');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('jdalgleishi', 'jdalgleishi', '486-651-8227', 'autleyi@goo.ne.jp', 'jdalgleishi', '060 Anhalt Terrace');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('dglazerj', 'dglazerj', '277-664-7669', 'dphiferj@hc360.com', 'dglazerj', '33442 Lien Point');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mcavellk', 'mcavellk', '843-231-2625', 'wbawlesk@fema.gov', 'mcavellk', '624 2nd Point');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('bcastagnetl', 'bcastagnetl', '913-227-1825', 'kwoodhamsl@seattletimes.com', 'bcastagnetl', '01130 Sutteridge Alley');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('hdarlastonm', 'hdarlastonm', '920-247-2331', 'tphiferm@noaa.gov', 'hdarlastonm', '933 Blue Bill Park Terrace');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gtonepohln', 'gtonepohln', '977-878-1648', 'aonginn@geocities.com', 'gtonepohln', '9 Crest Line Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('hlanslyo', 'hlanslyo', '327-737-4508', 'vnovako@themeforest.net', 'hlanslyo', '89942 Arizona Crossing');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('drecklessp', 'drecklessp', '169-124-0530', 'mchannonp@mediafire.com', 'drecklessp', '773 Mifflin Drive');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('ghaskayneq', 'ghaskayneq', '891-128-4162', 'esimonyq@globo.com', 'ghaskayneq', '6 Vernon Parkway');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('arojelr', 'arojelr', '500-162-4975', 'dwhewayr@blogger.com', 'arojelr', '6874 Mccormick Plaza');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('asparrowhawks', 'asparrowhawks', '221-315-0688', 'dantonazzis@fda.gov', 'asparrowhawks', '59562 Crowley Pass');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('npinhornt', 'npinhornt', '603-971-2038', 'vproughtent@sogou.com', 'npinhornt', '8 Meadow Ridge Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('bscawnu', 'bscawnu', '409-443-8532', 'pyewdallu@icq.com', 'bscawnu', '3171 Barby Center');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('nharmstonev', 'nharmstonev', '129-720-8472', 'dgregorettiv@wiley.com', 'nharmstonev', '90415 Prairie Rose Park');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('kwessingw', 'kwessingw', '721-880-1503', 'gfukew@hubpages.com', 'kwessingw', '3160 Pepper Wood Plaza');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('freallyx', 'freallyx', '274-516-9299', 'hbartalotx@oakley.com', 'freallyx', '59 Dorton Way');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mdrioliy', 'mdrioliy', '457-225-2095', 'ldietzy@sourceforge.net', 'mdrioliy', '64324 Melby Park');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mlarvorz', 'mlarvorz', '233-382-2138', 'ggarthlandz@china.com.cn', 'mlarvorz', '47289 Hollow Ridge Pass');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('ddacosta10', 'ddacosta10', '286-929-8909', 'cspira10@yahoo.com', 'ddacosta10', '2 Welch Junction');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('tborton11', 'tborton11', '122-631-0389', 'kfairpo11@dion.ne.jp', 'tborton11', '73073 Ohio Point');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('rhacquoil12', 'rhacquoil12', '843-177-7625', 'edoncom12@furl.net', 'rhacquoil12', '2454 Fairview Plaza');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mblew13', 'mblew13', '242-701-5376', 'twilcox13@hp.com', 'mblew13', '85142 Shasta Court');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('hbisset14', 'hbisset14', '972-910-9110', 'rlayus14@arstechnica.com', 'hbisset14', '81191 Hayes Road');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('cliepmann15', 'cliepmann15', '638-268-7920', 'ysussex15@mysql.com', 'cliepmann15', '2 School Junction');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('tholwell16', 'tholwell16', '330-167-9738', 'lgerhartz16@dedecms.com', 'tholwell16', '502 Meadow Valley Terrace');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('slevane17', 'slevane17', '606-645-2598', 'asingleton17@over-blog.com', 'slevane17', '105 Eastlawn Pass');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('agodier18', 'agodier18', '877-354-9337', 'jjouannisson18@yelp.com', 'agodier18', '592 Mayfield Trail');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('ghearst19', 'ghearst19', '520-987-5652', 'pwapol19@opera.com', 'ghearst19', '9010 Toban Circle');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('chibling1a', 'chibling1a', '821-208-6499', 'mgolby1a@earthlink.net', 'chibling1a', '736 Jay Hill');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('hfenelon1b', 'hfenelon1b', '878-294-2043', 'ckynd1b@biblegateway.com', 'hfenelon1b', '39039 Moland Park');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('adinley1c', 'adinley1c', '480-734-9293', 'btetlow1c@netlog.com', 'adinley1c', '979 Utah Drive');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('zstredwick1d', 'zstredwick1d', '152-767-1466', 'dkenyon1d@cloudflare.com', 'zstredwick1d', '98 Mallard Avenue');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('knottle1e', 'knottle1e', '314-636-2987', 'sstigell1e@ycombinator.com', 'knottle1e', '436 Veith Place');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('kjouhandeau1f', 'kjouhandeau1f', '524-132-3291', 'ddunkerley1f@booking.com', 'kjouhandeau1f', '33536 Cascade Circle');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('bbillham1g', 'bbillham1g', '263-358-7758', 'tpudner1g@issuu.com', 'bbillham1g', '36 Kennedy Parkway');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('kgrayham1h', 'kgrayham1h', '307-151-6720', 'astrognell1h@drupal.org', 'kgrayham1h', '694 Vermont Parkway');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('banwyl1i', 'banwyl1i', '212-244-4289', 'afeldon1i@home.pl', 'banwyl1i', '51 Charing Cross Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mcurryer1j', 'mcurryer1j', '822-286-7081', 'bmoret1j@bizjournals.com', 'mcurryer1j', '7 Butterfield Drive');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gsmeeth1k', 'gsmeeth1k', '110-182-9519', 'sfibbens1k@reuters.com', 'gsmeeth1k', '7807 Carberry Lane');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mrittelmeyer1l', 'mrittelmeyer1l', '469-782-5542', 'sdehn1l@microsoft.com', 'mrittelmeyer1l', '3 Di Loreto Avenue');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('dalbutt1m', 'dalbutt1m', '405-598-4937', 'afooter1m@free.fr', 'dalbutt1m', '6655 Southridge Center');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('djira1n', 'djira1n', '265-895-3834', 'howbrick1n@dot.gov', 'djira1n', '0 Springview Terrace');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('adingsdale1o', 'adingsdale1o', '379-366-9366', 'kmclurg1o@bloglovin.com', 'adingsdale1o', '4673 Westridge Lane');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('wsewart1p', 'wsewart1p', '390-269-0615', 'ggooderham1p@163.com', 'wsewart1p', '951 Cottonwood Alley');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('akitter1q', 'akitter1q', '140-327-2250', 'dweinberg1q@soup.io', 'akitter1q', '37056 Jay Alley');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('eionn1r', 'eionn1r', '533-754-6220', 'cbruyet1r@deviantart.com', 'eionn1r', '6948 Susan Place');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('jmaccollom1s', 'jmaccollom1s', '612-102-8250', 'skynastone1s@tinyurl.com', 'jmaccollom1s', '8537 Holmberg Park');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gthebes1t', 'gthebes1t', '150-564-7127', 'tbarwack1t@odnoklassniki.ru', 'gthebes1t', '8047 Merry Terrace');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('cpidgin1u', 'cpidgin1u', '376-463-9196', 'gtarr1u@myspace.com', 'cpidgin1u', '02 Kingsford Road');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mgrzelczak1v', 'mgrzelczak1v', '922-853-1106', 'kdureden1v@yellowpages.com', 'mgrzelczak1v', '7 Elmside Parkway');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('staysbil1w', 'staysbil1w', '343-479-5275', 'tmaccaughey1w@sakura.ne.jp', 'staysbil1w', '3922 Northfield Parkway');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gbech1x', 'gbech1x', '307-970-0967', 'eolliar1x@themeforest.net', 'gbech1x', '07 Westport Parkway');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('lsterricks1y', 'lsterricks1y', '283-527-3568', 'ctwamley1y@mozilla.com', 'lsterricks1y', '1201 Fremont Crossing');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('sfellman1z', 'sfellman1z', '123-253-7894', 'bchritchlow1z@opera.com', 'sfellman1z', '0156 Nancy Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('tbrankley20', 'tbrankley20', '227-490-9952', 'dbanton20@npr.org', 'tbrankley20', '47011 Glendale Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('troomes21', 'troomes21', '216-326-0374', 'shandscombe21@disqus.com', 'troomes21', '345 Union Crossing');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('dcrooke22', 'dcrooke22', '200-817-1451', 'jglassard22@theatlantic.com', 'dcrooke22', '50 Charing Cross Place');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('ffrounks23', 'ffrounks23', '770-410-5589', 'scookley23@miitbeian.gov.cn', 'ffrounks23', '76 Cordelia Junction');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('cbaythrop24', 'cbaythrop24', '556-363-1389', 'tgarter24@yellowbook.com', 'cbaythrop24', '10 Farwell Lane');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('ktirone25', 'ktirone25', '642-360-3618', 'dmacdonagh25@myspace.com', 'ktirone25', '746 Brickson Park Parkway');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('wcromer26', 'wcromer26', '304-714-9927', 'klidgely26@usda.gov', 'wcromer26', '05897 Crescent Oaks Center');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gharewood27', 'gharewood27', '530-457-8223', 'jscawton27@yale.edu', 'gharewood27', '0 Charing Cross Road');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('tbirkett28', 'tbirkett28', '403-882-6589', 'ashurlock28@sciencedirect.com', 'tbirkett28', '285 Schiller Terrace');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gbenion29', 'gbenion29', '722-543-4706', 'lreck29@wikia.com', 'gbenion29', '9 Lighthouse Bay Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('vdegouy2a', 'vdegouy2a', '620-732-7598', 'sdummer2a@example.com', 'vdegouy2a', '091 Fairview Circle');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('isakins2b', 'isakins2b', '361-622-1354', 'klandsman2b@usatoday.com', 'isakins2b', '3715 Swallow Park');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('fmecco2c', 'fmecco2c', '503-403-3750', 'ibeazer2c@blogspot.com', 'fmecco2c', '81019 Stephen Junction');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('bwidmoor2d', 'bwidmoor2d', '920-220-3442', 'hchancellor2d@mozilla.com', 'bwidmoor2d', '349 Nelson Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('kmaisey2e', 'kmaisey2e', '210-431-4391', 'chamshaw2e@flickr.com', 'kmaisey2e', '5739 Laurel Court');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('bcrinion2f', 'bcrinion2f', '271-842-3213', 'efozard2f@chron.com', 'bcrinion2f', '5821 Farwell Alley');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('mfetteplace2g', 'mfetteplace2g', '755-310-6304', 'lrenols2g@china.com.cn', 'mfetteplace2g', '9 Springs Place');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('sdrabble2h', 'sdrabble2h', '553-547-0049', 'bskerritt2h@wiley.com', 'sdrabble2h', '196 Farwell Point');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gcaldairou2i', 'gcaldairou2i', '427-914-6664', 'rlisett2i@tiny.cc', 'gcaldairou2i', '1229 Haas Junction');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('rriccardo2j', 'rriccardo2j', '697-458-0772', 'erendell2j@army.mil', 'rriccardo2j', '19625 Anthes Pass');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('gjelks2k', 'gjelks2k', '730-382-6976', 'lelcox2k@sciencedirect.com', 'gjelks2k', '4 Bartillon Avenue');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('eguilloneau2l', 'eguilloneau2l', '591-118-2309', 'rclash2l@redcross.org', 'eguilloneau2l', '509 Melby Point');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('cbernardino2m', 'cbernardino2m', '212-932-9661', 'balesbrook2m@yandex.ru', 'cbernardino2m', '762 Dorton Lane');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('sburke2n', 'sburke2n', '122-636-3117', 'wmacgillacolm2n@stanford.edu', 'sburke2n', '12 Butterfield Circle');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('hoclery2o', 'hoclery2o', '605-274-4710', 'hmerigeau2o@cnet.com', 'hoclery2o', '89939 Myrtle Hill');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('dgreenham2p', 'dgreenham2p', '759-852-1322', 'eclampe2p@baidu.com', 'dgreenham2p', '6362 Valley Edge Street');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('erisby2q', 'erisby2q', '954-272-8126', 'fbeeres2q@ning.com', 'erisby2q', '8931 Bay Road');
insert into NguoiDung (TenDangNhap, TenNguoiDung, SoDienThoai, Email, MatKhau, DiaChi) values ('kmcclean2r', 'kmcclean2r', '496-162-1794', 'nswatheridge2r@privacy.gov.au', 'kmcclean2r', '031 Thackeray Drive');
go

insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-07-18', '6431 Gina Way', 'jcb', 'Computers', 'wbolle0', '586-772-8186', 309, 7.1, 'montes nascetur ridiculus mus etiam vel', 38);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-03-04', '77625 Lakeland Pass', 'jcb', 'Kids', 'oovitts1', '339-322-8646', 722, 5.3, 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse', 80);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-02-11', '5563 Vera Point', 'mastercard', 'Kids', 'iflode2', '255-251-6476', 303, 1.3, 'nulla sed accumsan felis ut at', 18);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-11-08', '4079 Starling Plaza', 'visa-electron', 'Shoes', 'glashmore3', '861-630-2912', 429, 6.6, 'rhoncus sed vestibulum sit amet', 16);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-09-17', '3169 Oriole Junction', 'mastercard', 'Tools', 'bcicconetti4', '323-638-6774', 807, 2.4, 'non pretium quis lectus suspendisse potenti in', 49);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-12-17', '615 Ronald Regan Road', 'switch', 'Books', 'kcheasman5', '758-235-2513', 485, 5.3, 'lorem quisque ut erat curabitur gravida', 14);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-10-12', '1037 Schiller Alley', 'laser', 'Automotive', 'afairhurst6', '979-803-4230', 856, 7.1, 'lobortis sapien sapien non mi', 46);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-02-25', '898 Manley Place', 'jcb', 'Baby', 'rbolwell7', '321-284-0766', 261, 1.7, 'semper sapien a libero nam', 47);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-01-11', '987 Mifflin Alley', 'bankcard', 'Tools', 'jdicty8', '737-816-3611', 590, 2.6, 'vestibulum sagittis sapien cum sociis natoque penatibus et', 69);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-08-04', '122 Melby Alley', 'china-unionpay', 'Industrial', 'pmckinless9', '185-914-2867', 234, 5.5, 'diam id ornare imperdiet sapien urna pretium nisl ut volutpat', 2);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-06-18', '7 Gulseth Park', 'jcb', 'Tools', 'isweetzera', '682-877-4904', 266, 3.2, 'sapien non mi integer ac neque duis bibendum', 11);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-02-12', '90735 Eliot Crossing', 'jcb', 'Toys', 'hschutzeb', '925-161-1855', 365, 4.5, 'platea dictumst aliquam augue quam sollicitudin', 81);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-06-10', '0 Golf Center', 'bankcard', 'Books', 'bbosomworthc', '846-323-3635', 197, 8.4, 'porttitor lorem id ligula suspendisse ornare', 16);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-09-05', '6645 Thackeray Plaza', 'jcb', 'Clothing', 'kkleinschmidtd', '251-657-9618', 160, 4.3, 'a pede posuere nonummy integer non velit donec', 31);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-08-06', '063 Carpenter Avenue', 'jcb', 'Automotive', 'herdise', '185-311-3813', 242, 5.5, 'et ultrices posuere cubilia curae donec pharetra magna vestibulum', 17);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-01-21', '71857 Crowley Road', 'visa-electron', 'Sports', 'squernelf', '646-584-4840', 206, 2.0, 'nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque', 66);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-07-22', '348 Dennis Alley', 'jcb', 'Automotive', 'sdenisetg', '605-135-7791', 482, 3.6, 'hac habitasse platea dictumst maecenas ut massa quis', 50);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-02-22', '0028 School Drive', 'jcb', 'Tools', 'mcathersidesh', '282-894-7875', 491, 4.6, 'at dolor quis odio consequat varius integer ac leo', 51);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-03-09', '462 Park Meadow Street', 'jcb', 'Music', 'cstichalli', '991-277-0158', 581, 9.8, 'odio donec vitae nisi nam', 35);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-05-21', '73135 Pearson Pass', 'maestro', 'Computers', 'fsabenj', '520-159-6340', 678, 5.6, 'sollicitudin mi sit amet lobortis sapien sapien', 86);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-01-11', '807 Crest Line Terrace', 'visa-electron', 'Games', 'jmacalindenk', '813-611-8332', 752, 1.6, 'ipsum primis in faucibus orci luctus et', 24);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-12-06', '0161 Sutteridge Lane', 'jcb', 'Tools', 'dclinel', '115-746-6857', 375, 6.9, 'nulla elit ac nulla sed vel enim sit', 21);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-06-08', '23 Sunfield Hill', 'jcb', 'Kids', 'pmarm', '158-649-4822', 562, 6.5, 'id luctus nec molestie sed justo pellentesque', 56);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-07-27', '5229 Basil Avenue', 'jcb', 'Industrial', 'creddingtonn', '229-320-9836', 580, 9.0, 'nisl venenatis lacinia aenean sit amet justo morbi ut', 5);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-08-03', '885 Menomonie Street', 'visa-electron', 'Baby', 'zhakeno', '594-409-2440', 862, 3.2, 'sit amet nulla quisque arcu libero rutrum ac', 72);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-04-23', '171 Schurz Alley', 'solo', 'Beauty', 'nfrangletonp', '968-592-3455', 882, 8.6, 'rutrum nulla nunc purus phasellus in felis', 61);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-10-07', '5 Spenser Junction', 'diners-club-carte-blanche', 'Beauty', 'jsavinq', '546-831-3676', 667, 3.9, 'pellentesque volutpat dui maecenas tristique est', 56);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-05-02', '8 Erie Point', 'jcb', 'Grocery', 'sdumphriesr', '447-851-0713', 180, 8.3, 'velit id pretium iaculis diam erat fermentum', 52);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-10-04', '319 Fulton Alley', 'jcb', 'Clothing', 'cbarnisss', '150-180-2706', 682, 8.7, 'cras non velit nec nisi vulputate nonummy', 3);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-03-04', '52315 Judy Plaza', 'jcb', 'Books', 'msakert', '314-244-9503', 425, 6.3, 'lobortis convallis tortor risus dapibus augue vel accumsan tellus', 81);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-03-08', '124 Hooker Circle', 'jcb', 'Industrial', 'cembersonu', '658-447-8774', 713, 6.6, 'lobortis vel dapibus at diam nam tristique tortor', 85);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-02-26', '8018 Transport Alley', 'mastercard', 'Games', 'mmcginnv', '844-461-2971', 141, 7.0, 'ipsum dolor sit amet consectetuer adipiscing elit proin interdum', 85);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-05-13', '2 Erie Place', 'jcb', 'Electronics', 'spressnellw', '986-917-6217', 302, 1.7, 'mi sit amet lobortis sapien sapien non mi', 64);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-12-29', '1432 Bay Drive', 'mastercard', 'Games', 'emerwex', '792-893-8402', 792, 5.2, 'ac lobortis vel dapibus at diam nam tristique tortor eu', 59);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-07-26', '91 Express Terrace', 'visa-electron', 'Toys', 'iaingely', '766-109-2128', 174, 7.1, 'pede justo eu massa donec dapibus duis at velit', 33);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-06-18', '24927 Scott Crossing', 'jcb', 'Clothing', 'pmathwinz', '731-225-4721', 652, 7.4, 'laoreet ut rhoncus aliquet pulvinar sed nisl', 65);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-06-16', '151 Ryan Parkway', 'visa', 'Automotive', 'bemerton10', '467-572-4882', 401, 7.1, 'felis sed interdum venenatis turpis', 70);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-01-31', '92 6th Center', 'jcb', 'Books', 'areynish11', '517-489-9887', 152, 6.3, 'curabitur in libero ut massa volutpat convallis morbi odio odio', 27);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-02-05', '4012 Marcy Alley', 'jcb', 'Kids', 'ablore12', '962-247-8957', 117, 7.6, 'augue vel accumsan tellus nisi eu orci mauris lacinia', 84);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-08-02', '1 Stang Junction', 'laser', 'Baby', 'hhallowes13', '686-629-6587', 595, 5.2, 'elementum in hac habitasse platea dictumst morbi', 19);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-12-14', '84997 Almo Way', 'diners-club-enroute', 'Baby', 'mewert14', '378-166-8388', 703, 8.2, 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit', 50);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-12-11', '5407 Waxwing Drive', 'china-unionpay', 'Automotive', 'hseppey15', '545-553-8490', 887, 3.8, 'ipsum primis in faucibus orci', 90);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-06-24', '0901 Orin Way', 'mastercard', 'Electronics', 'gellingham16', '589-454-5798', 178, 7.0, 'est risus auctor sed tristique', 10);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-01-15', '7694 Redwing Circle', 'visa', 'Tools', 'kchristiensen17', '960-562-1484', 876, 9.2, 'fermentum donec ut mauris eget massa tempor convallis', 19);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-10-25', '275 Lighthouse Bay Parkway', 'americanexpress', 'Grocery', 'cgardner18', '900-736-5355', 431, 1.7, 'nibh ligula nec sem duis aliquam', 22);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-09-24', '9 Hauk Court', 'mastercard', 'Health', 'abrunger19', '974-905-8932', 635, 7.1, 'aliquam erat volutpat in congue etiam justo', 44);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-02-02', '38 Quincy Court', 'jcb', 'Health', 'kwhatham1a', '914-162-7123', 524, 7.7, 'tempus sit amet sem fusce consequat nulla nisl nunc', 80);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-06-22', '99006 Browning Hill', 'jcb', 'Shoes', 'hpeidro1b', '994-714-7771', 472, 6.1, 'varius integer ac leo pellentesque ultrices mattis odio donec vitae', 83);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-04-02', '4768 Commercial Street', 'china-unionpay', 'Computers', 'coddie1c', '772-377-3323', 641, 5.4, 'sit amet consectetuer adipiscing elit proin interdum mauris non ligula', 51);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-05-21', '7562 Park Meadow Terrace', 'switch', 'Movies', 'cmatijasevic1d', '312-837-1798', 682, 3.4, 'lorem vitae mattis nibh ligula nec sem duis aliquam convallis', 36);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-09-30', '6257 Myrtle Circle', 'mastercard', 'Jewelry', 'efinch1e', '183-806-7148', 688, 6.3, 'ipsum ac tellus semper interdum mauris ullamcorper', 71);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-04-22', '748 Troy Trail', 'americanexpress', 'Electronics', 'cedgworth1f', '800-111-8216', 140, 9.8, 'pellentesque eget nunc donec quis orci eget orci vehicula', 1);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-12-08', '64 Tomscot Park', 'mastercard', 'Industrial', 'rblanket1g', '287-879-1022', 439, 1.2, 'non mauris morbi non lectus aliquam sit amet diam', 83);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-01-31', '7 Park Meadow Park', 'diners-club-carte-blanche', 'Music', 'kroyston1h', '437-759-7602', 428, 3.4, 'vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 9);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-05-11', '49 Laurel Street', 'jcb', 'Games', 'knotton1i', '536-739-9343', 579, 2.3, 'enim lorem ipsum dolor sit', 52);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-04-21', '08 Northfield Point', 'mastercard', 'Health', 'cmcevon1j', '986-375-7643', 623, 5.8, 'nulla neque libero convallis eget eleifend luctus ultricies eu nibh', 45);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-06-23', '648 Ronald Regan Alley', 'mastercard', 'Music', 'aliddyard1k', '921-202-2805', 564, 9.4, 'eu nibh quisque id justo sit amet sapien dignissim vestibulum', 39);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-03-08', '97274 Esch Road', 'americanexpress', 'Clothing', 'ytansey1l', '750-940-8706', 867, 4.4, 'nisl aenean lectus pellentesque eget nunc donec', 10);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-08-21', '16 Buell Trail', 'jcb', 'Books', 'gmcfadin1m', '757-736-1766', 272, 9.6, 'convallis tortor risus dapibus augue vel accumsan', 16);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-11-15', '8 Amoth Crossing', 'jcb', 'Grocery', 'okinchin1n', '344-198-0974', 672, 4.9, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', 86);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-09-08', '81 Hanover Alley', 'jcb', 'Kids', 'ewitty1o', '330-250-9849', 357, 6.2, 'volutpat erat quisque erat eros', 45);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-01-31', '1123 Haas Street', 'jcb', 'Electronics', 'echoake1p', '301-201-7427', 406, 6.4, 'rutrum nulla tellus in sagittis dui', 46);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-04-10', '14354 Shoshone Avenue', 'diners-club-enroute', 'Beauty', 'rgotmann1q', '457-475-5354', 179, 3.5, 'in congue etiam justo etiam pretium iaculis justo', 65);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-01-01', '1 Shoshone Hill', 'mastercard', 'Garden', 'eleil1r', '250-593-1351', 519, 2.3, 'duis mattis egestas metus aenean fermentum donec', 88);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-12-26', '204 Longview Lane', 'jcb', 'Toys', 'jhenfre1s', '335-982-4505', 617, 2.4, 'pede justo lacinia eget tincidunt eget tempus', 70);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-09-01', '8275 Lukken Point', 'visa-electron', 'Shoes', 'jthrasher1t', '340-811-3185', 527, 4.2, 'sollicitudin ut suscipit a feugiat', 71);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-04-16', '13872 Petterle Terrace', 'jcb', 'Clothing', 'rcotherill1u', '247-557-3990', 700, 3.3, 'congue risus semper porta volutpat', 11);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-10-09', '84 Stuart Junction', 'jcb', 'Toys', 'adesimoni1v', '792-295-3602', 129, 4.5, 'lacinia sapien quis libero nullam sit', 22);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-03-30', '260 4th Lane', 'diners-club-enroute', 'Health', 'fherreran1w', '534-906-8985', 554, 1.9, 'nibh in lectus pellentesque at nulla suspendisse potenti', 8);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-08-16', '9899 Kennedy Trail', 'jcb', 'Toys', 'ycogin1x', '342-216-8090', 377, 1.7, 'lobortis ligula sit amet eleifend pede libero quis', 1);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-05-29', '4020 Eliot Circle', 'bankcard', 'Music', 'ppaddington1y', '699-377-6736', 182, 7.5, 'ultrices vel augue vestibulum ante ipsum primis in', 2);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-01-17', '193 Swallow Terrace', 'diners-club-enroute', 'Garden', 'mroutledge1z', '213-772-3780', 743, 2.8, 'eros elementum pellentesque quisque porta', 4);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-12-10', '41226 Nobel Park', 'mastercard', 'Toys', 'ddesremedios20', '855-366-4717', 846, 8.6, 'risus praesent lectus vestibulum quam sapien varius ut', 16);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-03-31', '9303 Artisan Avenue', 'instapayment', 'Computers', 'rhansemann21', '937-401-7204', 863, 2.0, 'ipsum primis in faucibus orci luctus', 29);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-02-28', '01365 Barby Center', 'solo', 'Health', 'dstribling22', '674-997-1416', 571, 9.8, 'felis eu sapien cursus vestibulum proin', 32);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2020-09-15', '35240 Carpenter Terrace', 'visa-electron', 'Shoes', 'mpopple23', '684-745-8886', 840, 4.7, 'ante ipsum primis in faucibus', 32);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-09-29', '9 Hooker Hill', 'switch', 'Clothing', 'jbryenton24', '704-727-3530', 704, 6.5, 'posuere felis sed lacus morbi sem', 73);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-03-01', '36 Upham Avenue', 'china-unionpay', 'Health', 'bblundell25', '826-525-5842', 825, 1.0, 'donec diam neque vestibulum eget vulputate ut ultrices', 61);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-05-27', '12 Tomscot Road', 'visa-electron', 'Automotive', 'cbea26', '185-329-6762', 628, 10.0, 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 28);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-01-17', '3621 Goodland Circle', 'jcb', 'Industrial', 'gmattingley27', '880-754-0858', 272, 4.9, 'cum sociis natoque penatibus et', 65);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-05-20', '0883 Northview Park', 'diners-club-international', 'Computers', 'geagell28', '424-140-5791', 553, 4.2, 'nunc donec quis orci eget orci vehicula condimentum', 17);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-03-07', '95706 Onsgard Hill', 'jcb', 'Jewelry', 'rgoscomb29', '426-921-9687', 425, 7.1, 'ipsum primis in faucibus orci luctus', 22);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-10-05', '8773 Grim Drive', 'switch', 'Baby', 'tfounds2a', '457-156-0426', 305, 6.8, 'ut mauris eget massa tempor convallis nulla neque libero convallis', 79);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2017-01-14', '58 Corben Drive', 'jcb', 'Garden', 'bvandenbroek2b', '499-973-4116', 499, 3.7, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', 46);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-10-30', '603 Jenna Drive', 'jcb', 'Music', 'mkeddie2c', '646-294-8744', 433, 9.4, 'sapien ut nunc vestibulum ante ipsum primis in faucibus orci', 23);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-10-15', '4811 Dayton Way', 'switch', 'Grocery', 'cbyres2d', '940-110-9888', 778, 2.2, 'lacus curabitur at ipsum ac', 51);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2023-09-27', '46 Melby Circle', 'jcb', 'Shoes', 'dbozward2e', '835-484-1654', 829, 2.5, 'amet consectetuer adipiscing elit proin risus praesent', 35);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-05-13', '1084 Stang Plaza', 'jcb', 'Clothing', 'agrinsted2f', '327-340-6182', 305, 6.3, 'volutpat eleifend donec ut dolor', 22);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-03-17', '7307 Maryland Junction', 'maestro', 'Baby', 'frogers2g', '403-243-6985', 864, 2.0, 'quis lectus suspendisse potenti in eleifend', 19);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-05-17', '143 Buhler Parkway', 'visa', 'Games', 'rkelinge2h', '612-781-4745', 333, 7.3, 'vestibulum sit amet cursus id', 9);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-11-20', '432 6th Road', 'visa', 'Grocery', 'baustwick2i', '808-371-5445', 286, 8.1, 'gravida nisi at nibh in hac habitasse', 60);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2016-07-19', '36 Rutledge Point', 'jcb', 'Movies', 'gbambrough2j', '940-971-7523', 823, 5.5, 'ipsum primis in faucibus orci luctus et ultrices posuere', 55);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-12-23', '710 Huxley Drive', 'maestro', 'Tools', 'fstubs2k', '140-965-4218', 193, 6.5, 'nullam varius nulla facilisi cras non velit nec', 55);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-11-10', '6637 West Way', 'china-unionpay', 'Games', 'bblennerhassett2l', '849-311-6444', 492, 2.4, 'nunc rhoncus dui vel sem sed sagittis nam congue', 33);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-12-25', '6 Cordelia Road', 'jcb', 'Toys', 'djewess2m', '432-515-8400', 554, 1.1, 'hac habitasse platea dictumst etiam', 90);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2022-03-14', '66580 Little Fleur Center', 'mastercard', 'Kids', 'apastor2n', '805-389-6067', 128, 4.5, 'tincidunt in leo maecenas pulvinar lobortis est', 25);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-06-08', '49 Knutson Pass', 'mastercard', 'Garden', 'mruffler2o', '434-256-8446', 823, 3.9, 'urna pretium nisl ut volutpat', 60);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2018-02-24', '8 La Follette Avenue', 'jcb', 'Games', 'ovassay2p', '636-630-5734', 546, 1.6, 'convallis eget eleifend luctus ultricies eu', 24);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2021-09-23', '71 Lukken Alley', 'americanexpress', 'Home', 'reacott2q', '732-358-8024', 806, 5.4, 'neque vestibulum eget vulputate ut ultrices vel', 27);
insert into DonHang (NgayDatHang, DiaChiGiaoHang, PTThanhToan, TinhTrang, TenNguoiNhanHang, SoDienThoaiNhanHang, TongTien, GiamGia, GhiChu, MaNguoiDung) values ('2019-12-23', '34973 Northridge Center', 'jcb', 'Health', 'choonahan2r', '240-290-1073', 533, 9.3, 'dapibus nulla suscipit ligula in lacus curabitur at ipsum', 45);


 insert phan loai
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Oriental Fresh Tuna');
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Recycled Cotton Shoes');
INSERT INTO PhanLoai (PhanLoaiChinh) VALUES ('Handmade Frozen Salad');


-- insert phan loai phu
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Crime|Drama|Thriller', 3);
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Adventure|Horror|Sci-Fi', 2);
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Romance|Thriller', 2);
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Comedy|Musical', 3);
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Adventure|Thriller|Western', 2);
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Comedy|Horror|Thriller', 1);
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Drama', 1);
insert into PhanLoaiPhu (TenPhanLoaiPhu, MaPhanLoai) values ('Adventure|Drama|Thriller', 1);

-- insert san pham
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Action', 689, 116, 'Electronics', 'ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras', 'http://dummyimage.com/206x100.png/dddddd/000000', 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', 2, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Action|Adventure|Comedy', 264, 106, 'Games', 'nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet', 'http://dummyimage.com/216x100.png/cc0000/ffffff', 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi', 2, 1);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Drama', 676, 178, 'Outdoors', 'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean', 'http://dummyimage.com/133x100.png/ff4444/ffffff', 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in', 8, 3);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Comedy|Drama', 697, 102, 'Home', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum', 'http://dummyimage.com/121x100.png/ff4444/ffffff', 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', 1, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Comedy|Drama|Romance', 186, 128, 'Health', 'posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam', 4, 1);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Comedy|Drama', 368, 110, 'Outdoors', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in', 'http://dummyimage.com/230x100.png/5fa2dd/ffffff', 'aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus', 5, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Drama', 361, 185, 'Automotive', 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et', 'http://dummyimage.com/226x100.png/cc0000/ffffff', 'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis', 6, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Drama|Musical|Romance', 728, 199, 'Kids', 'suscipit a feugiat et eros vestibulum ac est lacinia nisi', 'http://dummyimage.com/134x100.png/dddddd/000000', 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in', 2, 1);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Drama|Sci-Fi', 522, 170, 'Books', 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa', 'http://dummyimage.com/109x100.png/dddddd/000000', 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut', 5, 1);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Horror', 183, 105, 'Industrial', 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit', 'http://dummyimage.com/103x100.png/cc0000/ffffff', 'scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed', 5, 3);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Horror|Thriller', 885, 177, 'Sports', 'libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis', 'http://dummyimage.com/130x100.png/ff4444/ffffff', 'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum', 3, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Action|Thriller', 126, 110, 'Baby', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer', 'http://dummyimage.com/204x100.png/dddddd/000000', 'duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor', 4, 3);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Adventure|Animation|Children|Drama|Musical', 104, 176, 'Garden', 'adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula', 'http://dummyimage.com/215x100.png/dddddd/000000', 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla', 3, 1);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Comedy|Drama|Horror|Thriller', 468, 148, 'Grocery', 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec', 'http://dummyimage.com/125x100.png/5fa2dd/ffffff', 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet', 7, 3);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Comedy|Drama|Romance', 437, 125, 'Computers', 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', 'http://dummyimage.com/181x100.png/cc0000/ffffff', 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper', 6, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Drama', 735, 116, 'Outdoors', 'eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 'http://dummyimage.com/126x100.png/dddddd/000000', 'velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', 8, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Drama', 122, 115, 'Books', 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus', 'http://dummyimage.com/174x100.png/5fa2dd/ffffff', 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 2, 1);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Documentary', 468, 104, 'Automotive', 'proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis', 'http://dummyimage.com/144x100.png/5fa2dd/ffffff', 'ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio', 8, 3);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Action|Film-Noir|Sci-Fi', 310, 196, 'Automotive', 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes', 'http://dummyimage.com/200x100.png/cc0000/ffffff', 'mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis', 1, 2);
insert into SanPham (TenSanPham, GiaNhap, DonGiaBanNhoNhat, TrangThai, MoTaNgan, AnhDaiDien, NoiBat, MaPhanLoaiPhu, MaPhanLoai) values ('Drama', 126, 100, 'Sports', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet', 'http://dummyimage.com/109x100.png/ff4444/ffffff', 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in', 5, 1);


-- color
insert into MauSac (TenMau) values ('Khaki');
insert into MauSac (TenMau) values ('Crimson');
insert into MauSac (TenMau) values ('Green');
insert into MauSac (TenMau) values ('Pink');
insert into MauSac (TenMau) values ('Aquamarine');
insert into MauSac (TenMau) values ('Maroon');
insert into MauSac (TenMau) values ('Mauv');
insert into MauSac (TenMau) values ('Goldenrod');
insert into MauSac (TenMau) values ('Maroon');
insert into MauSac (TenMau) values ('Pink');
insert into MauSac (TenMau) values ('Red');
insert into MauSac (TenMau) values ('Crimson');


insert into SPTheoMau (MaSanPham, MaMau) values (34, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (88, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (49, 11);
insert into SPTheoMau (MaSanPham, MaMau) values (30, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (3, 7);
insert into SPTheoMau (MaSanPham, MaMau) values (35, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (8, 1);
insert into SPTheoMau (MaSanPham, MaMau) values (89, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (43, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (51, 5);
insert into SPTheoMau (MaSanPham, MaMau) values (51, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (29, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (31, 11);
insert into SPTheoMau (MaSanPham, MaMau) values (44, 11);
insert into SPTheoMau (MaSanPham, MaMau) values (69, 11);
insert into SPTheoMau (MaSanPham, MaMau) values (24, 4);
insert into SPTheoMau (MaSanPham, MaMau) values (95, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (71, 7);
insert into SPTheoMau (MaSanPham, MaMau) values (100, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (17, 7);
insert into SPTheoMau (MaSanPham, MaMau) values (12, 5);
insert into SPTheoMau (MaSanPham, MaMau) values (12, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (12, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (55, 7);
insert into SPTheoMau (MaSanPham, MaMau) values (69, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (95, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (44, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (48, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (56, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (72, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (20, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (49, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (33, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (68, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (96, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (95, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (88, 5);
insert into SPTheoMau (MaSanPham, MaMau) values (40, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (15, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (44, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (1, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (47, 7);
insert into SPTheoMau (MaSanPham, MaMau) values (45, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (98, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (93, 11);
insert into SPTheoMau (MaSanPham, MaMau) values (60, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (51, 7);
insert into SPTheoMau (MaSanPham, MaMau) values (82, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (22, 11);
insert into SPTheoMau (MaSanPham, MaMau) values (27, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (34, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (64, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (40, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (64, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (79, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (40, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (77, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (96, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (61, 1);
insert into SPTheoMau (MaSanPham, MaMau) values (1, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (67, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (100, 5);
insert into SPTheoMau (MaSanPham, MaMau) values (6, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (12, 4);
insert into SPTheoMau (MaSanPham, MaMau) values (38, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (74, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (69, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (40, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (86, 4);
insert into SPTheoMau (MaSanPham, MaMau) values (68, 7);
insert into SPTheoMau (MaSanPham, MaMau) values (44, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (28, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (63, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (65, 9);
insert into SPTheoMau (MaSanPham, MaMau) values (89, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (59, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (63, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (14, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (26, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (85, 5);
insert into SPTheoMau (MaSanPham, MaMau) values (7, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (82, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (19, 5);
insert into SPTheoMau (MaSanPham, MaMau) values (38, 11);
insert into SPTheoMau (MaSanPham, MaMau) values (86, 12);
insert into SPTheoMau (MaSanPham, MaMau) values (40, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (54, 6);
insert into SPTheoMau (MaSanPham, MaMau) values (35, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (4, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (1, 8);
insert into SPTheoMau (MaSanPham, MaMau) values (90, 1);
insert into SPTheoMau (MaSanPham, MaMau) values (75, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (39, 10);
insert into SPTheoMau (MaSanPham, MaMau) values (52, 3);
insert into SPTheoMau (MaSanPham, MaMau) values (37, 4);
insert into SPTheoMau (MaSanPham, MaMau) values (46, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (62, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (36, 4);
insert into SPTheoMau (MaSanPham, MaMau) values (60, 2);
insert into SPTheoMau (MaSanPham, MaMau) values (61, 11);

insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cathartes aura', 84);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Conolophus subcristatus', 51);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Pseudoleistes virescens', 10);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Zalophus californicus', 23);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Bubulcus ibis', 83);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Echimys chrysurus', 79);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Nycticorax nycticorax', 8);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Zenaida asiatica', 78);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Morelia spilotes variegata', 85);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cereopsis novaehollandiae', 28);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ploceus rubiginosus', 49);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Neotis denhami', 30);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Vanellus armatus', 7);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Lemur catta', 47);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Trachyphonus vaillantii', 56);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Canis aureus', 24);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Sceloporus magister', 35);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Nycticorax nycticorax', 10);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Motacilla aguimp', 81);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Naja haje', 28);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Potorous tridactylus', 93);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Trachyphonus vaillantii', 84);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Macaca fuscata', 49);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Myrmecobius fasciatus', 85);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Bassariscus astutus', 60);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cercatetus concinnus', 24);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Nectarinia chalybea', 47);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Dendrohyrax brucel', 70);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Felis chaus', 82);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Macropus agilis', 51);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ammospermophilus nelsoni', 43);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cyrtodactylus louisiadensis', 62);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Nasua nasua', 58);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Colobus guerza', 80);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Phalaropus lobatus', 18);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Butorides striatus', 16);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Zalophus californicus', 25);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Chloephaga melanoptera', 8);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Phaethon aethereus', 55);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Leptoptilus dubius', 24);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Choloepus hoffmani', 69);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Petaurus norfolcensis', 8);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ursus americanus', 51);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ardea cinerea', 89);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Climacteris melanura', 99);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Bos taurus', 16);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Semnopithecus entellus', 84);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Tamandua tetradactyla', 62);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Phalaropus fulicarius', 100);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Nucifraga columbiana', 33);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Amblyrhynchus cristatus', 74);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Tursiops truncatus', 26);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Pycnonotus nigricans', 98);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cynomys ludovicianus', 23);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ninox superciliaris', 35);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Isoodon obesulus', 32);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Madoqua kirkii', 97);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Hymenolaimus malacorhynchus', 92);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ciconia ciconia', 2);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ammospermophilus nelsoni', 86);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cracticus nigroagularis', 22);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Lamprotornis superbus', 31);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Trichoglossus chlorolepidotus', 85);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Uraeginthus granatina', 50);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Spheniscus mendiculus', 78);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Macropus rufogriseus', 52);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Megaderma spasma', 36);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Callipepla gambelii', 86);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Alectura lathami', 97);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ardea golieth', 41);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('unavailable', 100);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Carduelis uropygialis', 21);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Felis concolor', 61);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Boa caninus', 96);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('unavailable', 77);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Phoca vitulina', 40);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ciconia ciconia', 71);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Creagrus furcatus', 15);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Sciurus niger', 97);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Eudyptula minor', 69);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cervus duvauceli', 15);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Corvus brachyrhynchos', 67);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Marmota caligata', 28);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ardea cinerea', 51);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Platalea leucordia', 79);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Eudyptula minor', 4);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Buteo regalis', 92);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Dasyurus maculatus', 21);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Elephas maximus bengalensis', 60);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Damaliscus lunatus', 37);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Equus burchelli', 20);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Sarcophilus harrisii', 58);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Chauna torquata', 12);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Madoqua kirkii', 11);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Varanus sp.', 66);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Cervus duvauceli', 87);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Erinaceus frontalis', 29);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Ciconia episcopus', 67);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('unavailable', 34);
insert into AnhChiTietSP (TenFileAnh, MaSPTheoMau) values ('Acridotheres tristis', 82);


insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.46, 4, 183, 28);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.76, 3, 576, 56);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.99, 9, 173, 36);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.23, 8, 900, 84);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.36, 6, 485, 98);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.24, 2, 345, 66);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.56, 7, 643, 54);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.01, 10, 593, 96);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.62, 4, 883, 33);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.62, 1, 182, 71);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.15, 10, 333, 77);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.87, 3, 567, 50);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.94, 2, 431, 93);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.69, 6, 370, 71);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.54, 5, 393, 10);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (3.61, 6, 453, 75);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.17, 5, 168, 46);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.73, 8, 719, 50);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.54, 1, 193, 91);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.95, 9, 554, 73);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (3.29, 7, 683, 45);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.52, 4, 393, 63);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.82, 4, 704, 11);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.83, 2, 698, 39);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.16, 3, 876, 31);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.32, 3, 569, 69);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.87, 10, 503, 93);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.15, 4, 793, 70);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.84, 7, 743, 85);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.95, 6, 823, 98);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.28, 5, 880, 23);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.92, 2, 322, 65);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.85, 10, 644, 69);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.92, 7, 815, 8);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.12, 9, 406, 69);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (3.46, 5, 463, 69);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.22, 7, 700, 44);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.77, 10, 605, 78);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.63, 6, 136, 78);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.02, 6, 834, 96);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.0, 6, 349, 88);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.27, 8, 531, 54);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.66, 9, 569, 45);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.7, 9, 894, 92);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.26, 4, 271, 79);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.45, 6, 863, 1);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.73, 5, 256, 57);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.13, 10, 191, 92);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.46, 3, 362, 30);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.58, 4, 666, 84);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (3.14, 3, 365, 78);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.18, 2, 281, 50);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.95, 8, 711, 92);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.04, 4, 880, 44);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.95, 10, 754, 35);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.46, 3, 807, 64);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.02, 10, 824, 30);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.77, 1, 501, 59);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.71, 5, 340, 29);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.14, 4, 305, 25);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.08, 3, 479, 36);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.68, 7, 462, 3);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.6, 2, 359, 76);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.97, 10, 872, 20);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.81, 2, 137, 40);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.25, 8, 242, 82);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.25, 9, 647, 1);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.58, 6, 381, 35);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.58, 3, 334, 40);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.84, 6, 241, 42);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.49, 3, 385, 98);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.28, 3, 151, 5);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.81, 1, 720, 26);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.02, 6, 160, 42);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.48, 1, 817, 60);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.19, 8, 702, 94);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.52, 4, 691, 92);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.01, 9, 798, 62);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.97, 1, 811, 98);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.19, 6, 148, 72);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.05, 10, 506, 12);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.64, 10, 841, 94);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.74, 10, 536, 32);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.12, 7, 549, 48);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (5.83, 2, 825, 37);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.7, 10, 764, 41);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.01, 8, 675, 25);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.05, 6, 293, 36);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (1.33, 6, 803, 21);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.29, 8, 580, 99);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (3.25, 5, 254, 39);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (8.17, 3, 302, 74);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.28, 2, 395, 37);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (3.44, 2, 183, 95);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (7.31, 5, 661, 9);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (2.61, 8, 752, 94);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (6.1, 7, 384, 3);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (4.18, 3, 583, 63);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (3.03, 8, 358, 74);
insert into ChiTietSPBan (KichCo, SoLuong, DonGiaBan, MaSPTheoMau) values (9.26, 3, 817, 28);

insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (72, 12, 10, 304);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (68, 33, 5, 241);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (52, 90, 6, 778);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (19, 27, 2, 526);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (10, 70, 3, 370);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (78, 40, 9, 637);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (61, 28, 8, 190);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (7, 97, 5, 707);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (2, 42, 6, 331);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (79, 10, 1, 317);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (73, 87, 10, 215);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (20, 84, 6, 478);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (38, 87, 3, 569);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (95, 67, 7, 403);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (28, 34, 7, 593);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (63, 35, 7, 129);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (93, 81, 8, 358);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (97, 48, 5, 844);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (69, 92, 9, 386);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (69, 12, 4, 397);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (14, 57, 7, 449);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (26, 61, 2, 446);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (95, 61, 5, 602);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (15, 39, 6, 529);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (39, 98, 1, 596);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (58, 1, 4, 329);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (6, 90, 3, 743);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (60, 77, 10, 248);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (31, 23, 1, 269);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (93, 93, 4, 115);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (35, 47, 5, 602);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (99, 41, 5, 357);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (53, 50, 3, 738);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (44, 64, 6, 332);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (75, 15, 7, 578);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (17, 73, 8, 288);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (83, 16, 6, 900);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (70, 42, 3, 360);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (69, 58, 6, 743);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (29, 8, 1, 117);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (28, 87, 6, 187);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (45, 4, 9, 897);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (43, 78, 2, 339);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (72, 91, 3, 361);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (58, 1, 10, 762);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (97, 37, 6, 717);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (27, 89, 1, 329);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (23, 64, 1, 129);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (42, 75, 1, 669);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (1, 94, 2, 873);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (31, 79, 3, 306);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (57, 45, 3, 122);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (1, 30, 5, 851);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (57, 20, 7, 375);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (2, 75, 4, 233);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (91, 43, 9, 509);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (25, 17, 7, 783);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (45, 48, 6, 837);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (52, 22, 9, 203);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (61, 68, 3, 307);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (35, 14, 1, 591);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (97, 3, 10, 718);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (6, 100, 8, 573);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (97, 70, 5, 342);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (52, 18, 3, 375);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (61, 3, 10, 303);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (13, 75, 8, 899);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (25, 57, 1, 495);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (81, 69, 2, 746);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (6, 69, 3, 644);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (24, 16, 2, 301);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (62, 23, 9, 503);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (32, 21, 1, 614);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (32, 59, 2, 284);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (91, 24, 8, 113);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (36, 55, 7, 707);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (77, 75, 5, 271);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (12, 71, 4, 411);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (21, 70, 5, 189);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (26, 22, 4, 233);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (1, 3, 7, 400);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (84, 100, 10, 214);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (23, 97, 4, 263);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (12, 53, 7, 631);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (82, 24, 4, 556);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (58, 100, 10, 552);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (91, 11, 4, 703);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (15, 74, 6, 828);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (97, 76, 7, 897);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (93, 51, 3, 494);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (19, 5, 8, 196);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (68, 9, 8, 377);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (95, 15, 8, 301);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (76, 46, 3, 422);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (54, 3, 4, 761);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (58, 15, 6, 481);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (24, 38, 4, 565);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (56, 100, 8, 148);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (72, 17, 3, 288);
insert into ChiTietDonHang (MaChiTietSP, MaDonHang, SoLuongMua, DonGiaBan) values (62, 21, 1, 450);






