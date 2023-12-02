create database DW

go
use DW
go
create table Dim_ThoiGian(
	MaTG int identity(1,1) primary key,
	Thang int,
	Quy int,
	Nam int
);
insert Dim_ThoiGian(Thang, Quy, Nam)
	select distinct
		month(dh.NgayDatHang) as Thang,
		Datepart(quarter, dh.NgayDatHang) as Quy,
		year(dh.NgayDatHang) as Nam
	from dbtichhop.dbo.DonDatHang as dh
	union 
	select distinct
		month(mhl.NgayNhap) as Thang,
		Datepart(quarter, mhl.NgayNhap) as Quy,
		year(mhl.NgayNhap) as Nam
	from dbtichhop.dbo.MatHangDuocLuuTru mhl
	order by Nam, Thang asc;

create table Dim_VPDaiDien(
	MaTP int primary key,
	TenTP nvarchar(50),
	DiaChiVP nvarchar(50),
	Bang nvarchar(50)
);
insert Dim_VPDaiDien(MaTP, TenTP, DiaChiVP, Bang)
	select  
		vp.MaTP as MaTP,
		vp.TenTP as TenTP,
		vp.DiaChiVP as DiaChiVP,
		vp.Bang as Bang
	from dbtichhop.dbo.VanPhongDaiDien vp

create table Dim_KhachHang(
	MaKH int primary key,
	TenKH nvarchar(50),
	LoaiKH int,
	TenLoaiKH nvarchar(50),
	MaTP int
);
insert Dim_KhachHang(MaKH, TenKH, LoaiKH, TenLoaiKH, MaTP)
	select
		kh.MaKH as MaKH,
		kh.TenKH as TenKH,
		1 as LoaiKH,
		'BuuDien' as TenLoaiKH,
		kh.MaTP as MaTP
	from dbtichhop.dbo.KhachHang kh 
	inner join dbtichhop.dbo.KhachHangBuuDien khbd on kh.MaKH = khbd.MaKH
	left join dbtichhop.dbo.KhachHangDuLich khdl on kh.MaKH = khdl.MaKH
	where khdl.MaKH is null
	union
	select
		kh.MaKH as MaKH,
		kh.TenKH as TenKH,
		2 as LoaiKH,
		'DuLich' as TenLoaiKH,
		kh.MaTP as MaTP
	from dbtichhop.dbo.KhachHang kh 
	left join dbtichhop.dbo.KhachHangBuuDien khbd on kh.MaKH = khbd.MaKH
	inner join dbtichhop.dbo.KhachHangDuLich khdl on kh.MaKH = khdl.MaKH
	where khbd.MaKH is null
	union
	select
		kh.MaKH as MaKH,
		kh.TenKH as TenKH,
		3 as LoaiKH,
		'CaHai' as TenLoaiKH,
		kh.MaTP as MaTP
	from dbtichhop.dbo.KhachHang kh 
	inner join dbtichhop.dbo.KhachHangBuuDien khbd on kh.MaKH = khbd.MaKH
	inner join dbtichhop.dbo.KhachHangDuLich khdl on kh.MaKH = khdl.MaKH


create table Dim_CuaHang(
	MaCH int primary key, 
	SoDienThoai varchar(50), 
	MaTP int
);
insert Dim_CuaHang(MaCH, SoDienThoai, MaTP)
	select
		ch.MaCH as MaCH,
		ch.SoDienThoai as SoDienThoai,
		ch.MaTP as MaTP
	from dbtichhop.dbo.CuaHang ch

create table Dim_MatHang(
	MaMH int primary key,
	MoTa nvarchar(50),
	KichCo nvarchar(50),
	TrongLuong int,
	Gia int
);
insert Dim_MatHang(MaMH, MoTa, KichCo, TrongLuong, Gia)
	select 
		mh.MaMH as MaMH,
		mh.MoTa as MoTa,
		mh.KichCo as KichCo,
		mh.TrongLuong as TrongLuong,
		mh.Gia as Gia
	from dbtichhop.dbo.MatHang mh

create table Fact_BanHang(
	MaTG int foreign key references Dim_ThoiGian(MaTG),
	Thang int,
	Nam int,
	MaKH int foreign key references Dim_KhachHang(MaKH),
	MaTP int foreign key references Dim_VPDaiDien(MaTP),
	MaMH int foreign key references Dim_MatHang(MaMH),
	SoLuongMua int,
	TongTien int
);


insert Fact_BanHang(Thang, Nam, MaKH, MaTP, MaMH, SoLuongMua, TongTien)
	select
		x.Thang,
		x.Nam,
		x.MaKH,
		x.MaTP,
		x.MaMH,
		Sum(x.SoLuongDat) as SoLuongMua,
		Sum(x.GiaDat) as TongTien
	from (
		select 
		kh.MaKH as MaKH,
		kh.MaTP as MaTP,
		mhd.MaMH as MaMH,
		month(dh.NgayDatHang) as Thang,
		year(dh.NgayDatHang) as Nam,
		mhd.SoLuongDat,
		mhd.GiaDat 
		from dbtichhop.dbo.KhachHang kh, dbtichhop.dbo.DonDatHang dh, dbtichhop.dbo.MatHangDuocDat mhd
		where kh.MaKH = dh.MaKH and dh.MaDon = mhd.MaDon
	)x
	group by
		 x.MaKH, x.MaMH, x.MaTP, x.Thang, x.Nam
	order by
		x.Nam asc, x.Thang asc
update Fact_BanHang
	set MaTG = t.MaTG
	from Dim_ThoiGian t, Fact_BanHang mh
	where t.Thang = mh.Thang and t.Nam = mh.Nam


create table Fact_KhoHang(
	MaTG int foreign key references Dim_ThoiGian(MaTG),
	Thang int, 
	Nam int, 
	MaCH int foreign key references Dim_CuaHang(MaCH), 
	MaMH int foreign key references Dim_MatHang(MaMH), 
	SoLuongTonKho int
);

insert Fact_KhoHang(Thang, Nam , MaCH, MaMH, SoLuongTonKho)
	select
		x.Thang,
		x.Nam,
		x.MaCH,
		x.MaMH,
		Sum(x.SoLuongTrongKho) as SoLuongTonKho	
	from(
		select
			mhl.MaCH as MaCH,
			mhl.MaMH as MaMH,
			mhl.SoLuongTrongKho,
			month(mhl.NgayNhap) as Thang,
			year(mhl.NgayNhap) as Nam
		from dbtichhop.dbo.MatHangDuocLuuTru mhl
	)x
	group by
		 x.MaCH, x.MaMH, x.Thang, x.Nam
	order by
		x.Nam asc, x.Thang asc
update Fact_KhoHang
	set MaTG = t.MaTG
	from Dim_ThoiGian t, Fact_KhoHang kh
	where t.Thang = kh.Thang and t.Nam = kh.Nam



