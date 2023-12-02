create database dbtichhop

go
use dbtichhop
go
create table VanPhongDaiDien(
	MaTP int identity(1,1) primary key,
	TenTP nvarchar(50),
	DiaChiVP nvarchar(50),
	Bang nvarchar(50),
	NgayThanhLapVP date
);
create table KhachHang(
	MaKH int identity(1,1) primary key,
	TenKH nvarchar(50),
	NgayDatHangDauTien date,
	MaTP int foreign key references VanPhongDaiDien(MaTp)
);
create table KhachHangDuLich(
	MaKH int primary key references KhachHang(MaKH),
	HuongDanVienDuLich nvarchar(50),
);
create table KhachHangBuuDien(
	MaKH int primary key references KhachHang(MaKH),
	DiaChiBuuDien nvarchar(50),
);
create table CuaHang(
	MaCH int identity(1,1) primary key,
	SoDienThoai varchar(50),
	NgayThanhLapCH date,
	MaTP int foreign key references VanPhongDaiDien(MaTP)
);
create table MatHang(
	MaMH int identity(1,1) primary key,
	MoTa nvarchar(50),
	KichCo nvarchar(50),
	TrongLuong int,
	Gia int,
	NgayBatDauMoBan date
);
create table MatHangDuocLuuTru(
	MaCH int foreign key references CuaHang(MaCH),
	MaMH int foreign key references MatHang(MaMH),
	SoLuongTrongKho int,
	NgayNhap date,
	primary key(MaCH, MaMH)
);
create table DonDatHang(
	MaDon int identity(1,1) primary key,
	NgayDatHang date,
	MaKH int foreign key references KhachHang(MaKH)
);
create table MatHangDuocDat(
	MaDon int foreign key references DonDatHang(MaDon),
	MaMH int foreign key references MatHang(MaMH),
	SoLuongDat int,
	GiaDat int
	primary key(MaDon, MaMH)
);

insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Irvine', '0 Lake View Drive', 'California', '2021-03-30');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Petaluma', '7248 Schmedeman Hill', 'California', '2021-02-21');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('San Bernardino', '031 Crest Line Road', 'California', '2021-10-28');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Miami', '26 Amoth Lane', 'California', '2021-10-01');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Lake Charles', '4026 Truax Circle', 'New York', '2021-09-19');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Houston', '25071 Kensington Road', 'New York', '2021-08-11');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Lawrenceville', '6620 Merry Court', 'Ohio', '2021-08-04');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Lynn', '302 Sunnyside Trail', 'Ohio', '2021-12-20');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Watertown', '43 Becker Pass', 'Washington', '2021-11-27');
insert into VanPhongDaiDien (TenTP, DiaChiVP, Bang, NgayThanhLapVP) values ('Las Vegas', '2968 Donald Circle', 'Washington', '2021-06-19');


insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('3849753314', '2021-02-11', 1);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('1415783670', '2021-03-17', 1);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('9013372803', '2021-03-10', 1);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('6265049861', '2021-04-13', 1);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('7621995675', '2021-02-22', 2);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('1335130579', '2021-03-04', 2);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('8492154876', '2021-03-23', 3);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('9893201145', '2021-03-17', 3);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('7784377645', '2021-01-19', 4);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('2167694745', '2021-04-02', 4);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('4711858517', '2021-04-04', 5);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('1245914172', '2021-04-10', 5);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('8122989041', '2021-03-31', 6);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('1993175839', '2021-03-20', 7);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('6713947290', '2021-03-11', 7);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('3406070790', '2021-03-10', 8);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('5914884308', '2021-04-13', 8);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('1097033578', '2021-04-14', 9);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('6316794361', '2021-04-07', 9);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('2234496001', '2021-03-12', 10);
insert into CuaHang (SoDienThoai, NgayThanhLapCH, MaTP) values ('1089201025', '2021-01-26', 10);


insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Happy Gerard', '2022-06-15', 1);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Addie Orhrt', '2022-10-26', 1);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Alvy Sharpley', '2023-02-16', 1);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Hynda Houten', '2022-11-22', 1);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Jobyna McArdell', '2023-04-29', 1);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Babette Roath', '2022-04-16', 1);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Niel St. Clair', '2022-10-02', 2);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Culley Assante', '2022-06-13', 2);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Dalton Yearns', '2022-09-01', 2);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Enid Camoletto', '2023-02-22', 2);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Blisse Edmonstone', '2023-01-18', 3);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Adam Laphorn', '2022-12-12', 3);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Berty Wattisham', '2022-12-09', 3);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Shelby Pitrasso', '2022-03-16', 3);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Lyman Tortis', '2022-09-29', 4);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Heda Ledur', '2022-06-03', 4);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Rriocard Jeffray', '2022-12-07', 4);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Tina Haugen', '2022-09-23', 5);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Quill Cuttler', '2022-05-25', 5);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Almeta Gorelli', '2022-05-29', 5);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Shepherd Cruickshanks', '2022-05-10', 5);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Kasey Kennifick', '2022-06-05', 5);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Corinna Kivell', '2022-12-13', 6);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Findley Callcott', '2022-12-12', 6);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Sophia Trevna', '2022-06-24', 6);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Kimble Doorey', '2022-08-14', 7);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Yardley Salvage', '2022-01-05', 7);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Ennis Ryles', '2022-09-28', 7);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Sarah Izard', '2022-08-23', 7);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Basile Lohoar', '2023-01-13', 8);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Lana Figure', '2022-06-14', 8);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Sydelle Brychan', '2023-01-13', 8);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Dawna Farfull', '2023-02-15', 9);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Talbot Crickmoor', '2022-09-05', 9);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Lion Wanley', '2022-11-02', 9);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Tammara Corcoran', '2022-06-27', 10);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Violante Amiable', '2022-12-29', 10);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Gene Vass', '2023-03-04', 10);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Ardene Longland', '2022-08-09', 10);
insert into KhachHang (TenKH, NgayDatHangDauTien, MaTP) values ('Guinevere Daft', '2022-01-16', 10);

insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (1, '46 Bartelt Court');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (2, '31 Sunnyside Point');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (3, '70709 Eagle Crest Road');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (4, '2290 Arrowood Alley');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (5, '0 Dunning Alley');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (6, '664 Stephen Court');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (7, '35167 Aberg Street');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (8, '189 Upham Circle');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (9, '499 North Circle');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (10, '7564 Elka Junction');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (11, '02166 Starling Point');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (12, '8875 Ramsey Alley');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (13, '9611 Luster Road');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (14, '1920 Jenna Point');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (15, '974 Emmet Circle');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (16, '91 High Crossing Avenue');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (17, '7 Waywood Court');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (18, '809 Marcy Plaza');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (19, '3 Columbus Avenue');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (20, '90 Hansons Hill');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (21, '3633 Bonner Hill');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (22, '9833 Laurel Trail');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (23, '6 Meadow Valley Junction');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (24, '5 Vermont Plaza');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (25, '11796 Evergreen Street');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (26, '3 Grayhawk Way');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (27, '3 Mallard Terrace');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (28, '2 Hudson Street');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (29, '9615 Sunbrook Street');
insert into KhachHangBuuDien (MaKH, DiaChiBuuDien) values (30, '09486 Melvin Junction');

insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (21, 'Frances Sollner');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (22, 'Julius Hampton');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (23, 'Ebba Ivanusyev');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (24, 'Ellynn Breeder');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (25, 'Umeko Bramhall');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (26, 'Annecorinne Peasegod');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (27, 'Sue De Lasci');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (28, 'Pooh Buchan');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (29, 'Rikki Jiggens');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (30, 'Laurent Hessle');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (31, 'Sanders Mangion');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (32, 'Galen McGougan');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (33, 'Ketty Spencock');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (34, 'Ginger Tick');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (35, 'Helen-elizabeth Menichi');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (36, 'Burton Sturrock');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (37, 'Arturo Beagin');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (38, 'Coreen Pencot');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (39, 'Fedora Rothschild');
insert into KhachHangDuLich (MaKH, HuongDanVienDuLich) values (40, 'Sande Koppe');

insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Tea - Green', 'Medium', 12, 459, '2022-02-22');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Cheese - Swiss Sliced', 'Medium', 14, 762, '2022-04-08');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Oven Mitts - 15 Inch', 'Small', 2, 186, '2022-03-24');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Lamb - Pieces, Diced', 'Medium', 12, 446, '2022-04-28');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Cheese - Roquefort Pappillon', 'Big', 11, 125, '2022-04-18');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Brandy Apricot', 'Medium', 8, 143, '2022-03-16');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Lettuce - Spring Mix', 'Medium', 20, 486, '2022-01-30');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Cleaner - Lime Away', 'Medium', 9, 397, '2022-02-27');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Sansho Powder', 'Medium', 14, 966, '2022-04-14');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Cheese - Gouda', 'Small', 7, 357, '2022-04-24');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Juice - Propel Sport', 'Small', 11, 945, '2022-03-27');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Pork - Tenderloin, Fresh', 'Medium', 7, 437, '2022-02-27');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Iced Tea - Lemon, 340ml', 'Big', 16, 656, '2022-04-19');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Cheese - St. Paulin', 'Small', 14, 893, '2022-03-25');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Syrup - Pancake', 'Medium', 15, 100, '2022-02-03');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Pear - Asian', 'Medium', 18, 946, '2022-04-26');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Sage Ground Wiberg', 'Big', 10, 389, '2022-02-15');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Flour - Pastry', 'Medium', 7, 426, '2022-03-19');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Pepper - Roasted Red', 'Small', 12, 864, '2022-03-30');
insert into MatHang (MoTa, KichCo, TrongLuong, Gia, NgayBatDauMoBan) values ('Cake - Sheet Strawberry', 'Small', 16, 150, '2022-03-12');

insert into DonDatHang (NgayDatHang, MaKH) values ('2022-01-01', 1);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-01-02', 2);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-01-03', 3);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-01-04', 4);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-01-05', 5);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-01-06', 6);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-02-01', 7);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-02-03', 8);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-03-14', 9);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-03-16', 10);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-04-04', 11);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-04-11', 12);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-04-24', 13);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-05-23', 14);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-05-25', 15);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-06-02', 16);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-07-25', 17);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-08-11', 18);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-09-14', 19);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-10-08', 20);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-11-19', 21);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-12-20', 22);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-01-05', 23);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-01-13', 24);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-01-15', 25);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-01-22', 26);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-02-21', 27);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-02-22', 28);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-03-03', 29);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-01', 30);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-03', 31);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-07', 32);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-14', 33);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-21', 34);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-23', 35);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-27', 36);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-04-30', 37);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-05-01', 38);
insert into DonDatHang (NgayDatHang, MaKH) values ('2023-05-01', 39);
insert into DonDatHang (NgayDatHang, MaKH) values ('2022-05-01', 40);

insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (1, 1, 317, '2022-07-15');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (1, 2, 172, '2022-03-18');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (2, 2, 172, '2022-03-18');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (2, 3, 586, '2023-02-22');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (3, 3, 586, '2023-02-22');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (4, 3, 586, '2023-02-22');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (4, 4, 880, '2023-01-27');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (5, 5, 223, '2022-07-07');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (5, 6, 658, '2022-12-11');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (6, 6, 658, '2022-12-11');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (6, 8, 519, '2022-02-08');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (7, 7, 511, '2022-07-08');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (7, 8, 519, '2022-02-08');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (8, 8, 519, '2022-02-08');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (8, 10, 981, '2022-05-18');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (9, 9, 500, '2022-10-03');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (9, 20, 910, '2022-07-19');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (10, 10, 981, '2022-05-18');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (10, 19, 735, '2022-05-22');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (11, 11, 830, '2022-04-07');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (11, 14, 756, '2022-05-06');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (12, 12, 911, '2022-05-26');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (12, 18, 995, '2022-06-10');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (13, 13, 940, '2022-12-22');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (13, 15, 725, '2022-10-04');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (14, 14, 756, '2022-05-06');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (14, 15, 725, '2022-10-04');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (15, 15, 725, '2022-10-04');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (16, 16, 688, '2022-06-15');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (17, 17, 834, '2022-06-27');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (18, 18, 995, '2022-06-10');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (19, 19, 735, '2022-05-22');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (20, 20, 910, '2022-07-19');
insert into MatHangDuocLuuTru (MaCH, MaMH, SoLuongTrongKho, NgayNhap) values (21, 20, 443, '2022-07-12');

insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (1, 1, 4, 1836);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (2, 2, 4, 3048);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (3, 3, 7, 1302);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (4, 4, 8, 3568);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (5, 5, 9, 1125);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (6, 6, 6, 858);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (7, 7, 10, 4860);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (8, 8, 1, 397);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (9, 9, 2, 1932);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (10, 10, 3, 1071);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (11, 11, 2, 1890);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (12, 12, 3, 1311);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (13, 13, 10, 6560);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (14, 14, 1, 893);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (15, 15, 8, 800);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (16, 16, 9, 8514);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (17, 17, 10, 3890);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (18, 18, 8, 3408);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (19, 19, 2, 1728);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (20, 20, 1, 150);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (21, 1, 10, 4590);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (22, 2, 9, 6858);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (23, 3, 8, 1488);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (24, 4, 7, 3122);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (25, 5, 1, 125);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (26, 6, 7, 1001);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (27, 7, 5, 2430);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (28, 8, 1, 397);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (29, 9, 8, 7728);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (30, 10, 2, 714);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (31, 11, 3, 2835);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (32, 12, 3, 1311);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (33, 13, 3, 1968);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (34, 14, 8, 7144);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (35, 15, 1, 100);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (36, 16, 4, 3784);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (37, 17, 7, 2723);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (38, 18, 2, 852);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (39, 19, 9, 7776);
insert into MatHangDuocDat (MaDon, MaMH, SoLuongDat, GiaDat) values (40, 20, 2, 300);
