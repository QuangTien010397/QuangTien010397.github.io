use master
if exists(select * from sysdatabases where name = 'QLHocSinh')
drop database QLHocSinh
go
create database QLHocSinh
go
use QLHocSinh
go

create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30),
	HoTen nvarchar(50),
)

create table HocSinh
(
	MaHS int identity constraint PK_HocSinh primary key,
	HoTen nvarchar(50),
	NgaySinh datetime,
	GioiTinh nvarchar(10),
	Email varchar(50),
	DiaChi nvarchar(50),
	MaLop int
)
create table Lop
(
	MaLop int identity constraint PK_Lop primary key,
	MaKhoi int,
	MaNamHoc int,
	TenLop varchar(50),
	MaGiaoVien int,
	SiSo float,
)

create table Khoi
(
	MaKhoi int identity constraint PK_Khoi primary key,
	TenKhoi varchar(50)
)

create table MonHoc
(
	MaMon int identity constraint PK_MonHoc primary key,
	TenMon nvarchar(50)
)

create table NamHoc
(
	MaNamHoc int identity constraint PK_NamHoc primary key,
	TenNamHoc varchar(50)
)

create table DiemMon
(
	MaDiemMon int identity constraint PK_Diem primary key,
	MaHS int,
	MaMon int,
	DiemMonHoc float,
	MaHocKy int ,
	Diem15phut float,
	Diem1Tiet float,
	DiemTB float
)

create table GiaoVien
(
	MaGiaoVien int identity constraint PK_GiaoVien primary key,
	TenGiaoVien nvarchar(50),
	DiaChi nvarchar (50),
	DienThoai varchar(50),
	MaMon int,
)

create table HocKy
(
	MaHocKy int identity constraint PK_HocKy primary key,
	TenHocKy nvarchar(50)
)

create table ThamSo
(
	MaThamSo int identity constraint PK_ThamSo primary key,
	TenThamSo nvarchar(max),
	Ghichu nvarchar(50)
)


alter table HocSinh add
	constraint FK_HocSinh_Lop foreign key (MaLop)references Lop(MaLop)
	
alter table Lop add 
	constraint FK_Lop_Khoi foreign key (MaKhoi) references Khoi(MaKhoi),
	constraint FK_Lop_NamHoc foreign key (MaNamHoc) references NamHoc(MaNamHoc),
	constraint FK_Lop_GiaoVien foreign key (MaGiaoVien) references GiaoVien(MaGiaoVien)
	
alter table GiaoVien add 
	constraint FK_GiaoVien_MonHoc foreign key (MaMon) references MonHoc(MaMon)
	
alter table DiemMon add 
	constraint FK_DiemMon_HocSinh foreign key (MaHS) references HocSinh(MaHS),
	constraint FK_DiemMon_MonHoc foreign key (MaMon) references MonHoc(MaMon),
	constraint FK_DiemMon_HocKy foreign key (MaHocKy) references HocKy(MaHocKy)	
			
--Nhap Hoc Sinh
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Boonie Stack', '2000-09-10 22:39:38', 'Male', 'bstack0@jugem.jp', '4 Tennessee Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gilly Akast', '2001-07-30 01:01:41', 'Female', 'gakast1@imdb.com', '31 Continental Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gualterio Schleicher', '2003-05-18 11:07:16', 'Male', 'gschleicher2@addtoany.com', '2687 Sachtjen Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Wilbert Bebbell', '2003-09-30 17:34:56', 'Male', 'wbebbell3@google.ca', '8411 Orin Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Wilt Djordjevic', '2000-03-28 04:30:19', 'Male', 'wdjordjevic4@netscape.com', '6 Ryan Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Anette Keijser', '2003-09-13 06:54:03', 'Female', 'akeijser5@gizmodo.com', '82 Graceland Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ange Canape', '2000-10-14 19:39:58', 'Male', 'acanape6@cyberchimps.com', '400 Debra Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Harlan Skelbeck', '2001-01-02 12:45:06', 'Male', 'hskelbeck7@booking.com', '2076 Roth Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Geordie MacKimmie', '2001-12-13 05:02:19', 'Male', 'gmackimmie8@craigslist.org', '493 Vahlen Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aylmer Mowatt', '2003-06-08 21:33:19', 'Male', 'amowatt9@narod.ru', '05 Raven Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Madelle Ferryn', '2003-02-27 20:46:40', 'Female', 'mferryna@yahoo.com', '826 Gateway Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Northrop Geistbeck', '2003-03-22 14:08:20', 'Male', 'ngeistbeckb@google.com.au', '135 Buhler Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Helli Antonijevic', '2000-01-27 23:48:42', 'Female', 'hantonijevicc@histats.com', '3 Schurz Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aeriela Civitillo', '2001-04-07 19:51:52', 'Female', 'acivitillod@apple.com', '120 5th Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Anthia Surgen', '2003-06-18 03:24:55', 'Female', 'asurgene@umn.edu', '83 Trailsway Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Schuyler Tourry', '2002-10-12 03:37:10', 'Male', 'stourryf@aboutads.info', '698 Colorado Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Isidore Banfield', '2001-10-16 09:51:33', 'Male', 'ibanfieldg@reddit.com', '1 Judy Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Doti Tann', '2002-10-23 20:34:50', 'Female', 'dtannh@zimbio.com', '76 Corry Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fabiano Arsey', '2002-07-04 21:52:35', 'Male', 'farseyi@simplemachines.org', '9 Mayfield Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dore Kennermann', '2002-05-19 01:30:34', 'Female', 'dkennermannj@eepurl.com', '6622 Sachs Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Catlin Orrah', '2001-12-02 13:01:15', 'Female', 'corrahk@storify.com', '0 Loeprich Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Oneida Caisley', '2001-05-09 10:47:51', 'Female', 'ocaisleyl@soundcloud.com', '816 Maple Wood Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Orlan York', '2002-08-17 17:55:10', 'Male', 'oyorkm@ycombinator.com', '93309 Waxwing Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Roselia Nowak', '2002-11-18 06:33:03', 'Female', 'rnowakn@squarespace.com', '37 Darwin Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hayley Abden', '2001-02-17 09:34:44', 'Female', 'habdeno@lycos.com', '6275 Northport Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Karlan Goolding', '2003-06-08 20:52:50', 'Male', 'kgooldingp@nydailynews.com', '07710 2nd Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dawn McHaffy', '2003-04-01 23:38:10', 'Female', 'dmchaffyq@networksolutions.com', '80 Glacier Hill Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maryjane Ollander', '2000-04-16 06:52:28', 'Female', 'mollanderr@hubpages.com', '48973 Division Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Giffy Checchetelli', '2003-10-02 06:23:49', 'Male', 'gchecchetellis@economist.com', '819 East Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nickolaus Carlick', '2001-11-30 03:43:27', 'Male', 'ncarlickt@auda.org.au', '3 La Follette Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Albina Bengtson', '2001-10-18 22:24:37', 'Female', 'abengtsonu@hostgator.com', '738 Sutherland Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vidovic Jerams', '2002-07-24 09:40:17', 'Male', 'vjeramsv@taobao.com', '702 Columbus Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Timotheus Klaves', '2002-02-14 12:33:41', 'Male', 'tklavesw@so-net.ne.jp', '442 Marquette Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Craggy Scroxton', '2000-06-15 06:17:19', 'Male', 'cscroxtonx@intel.com', '81 Sauthoff Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brantley Culshew', '2000-11-08 13:14:06', 'Male', 'bculshewy@nps.gov', '8586 Hollow Ridge Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Donelle Schiersch', '2001-02-22 21:51:43', 'Female', 'dschierschz@artisteer.com', '7321 American Ash Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ethel Kynastone', '2001-06-29 18:51:34', 'Female', 'ekynastone10@wikia.com', '20870 Esch Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tabbie Woodyatt', '2002-07-23 19:31:19', 'Male', 'twoodyatt11@linkedin.com', '570 Di Loreto Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gilburt Nolder', '2000-05-13 05:16:57', 'Male', 'gnolder12@vimeo.com', '33 Annamark Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Letitia Peete', '2002-06-10 11:53:26', 'Female', 'lpeete13@networkadvertising.org', '06966 Transport Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aila Willwood', '2001-07-10 07:05:54', 'Female', 'awillwood14@desdev.cn', '52175 Independence Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tiffi Kanwell', '2000-08-01 23:18:49', 'Female', 'tkanwell15@usatoday.com', '49 Commercial Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vladamir Sinnat', '2003-02-12 12:46:52', 'Male', 'vsinnat16@ehow.com', '512 Haas Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Markos Aspinal', '2003-09-06 16:30:42', 'Male', 'maspinal17@auda.org.au', '79557 Hayes Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ric Filip', '2001-06-09 15:37:55', 'Male', 'rfilip18@hao123.com', '12 Esch Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ernestus Girkin', '2002-11-28 23:32:45', 'Male', 'egirkin19@360.cn', '5882 Stang Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shirl Piwell', '2001-03-30 03:51:01', 'Female', 'spiwell1a@google.com.br', '9 Meadow Ridge Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Turner de Pinna', '2003-04-14 21:07:04', 'Male', 'tde1b@japanpost.jp', '080 Maple Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dore Bidder', '2003-01-05 01:18:24', 'Female', 'dbidder1c@nymag.com', '022 Ilene Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Wit Gaythwaite', '2001-04-14 20:13:06', 'Male', 'wgaythwaite1d@sina.com.cn', '936 Bayside Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stanford Bowdidge', '2001-10-31 10:15:23', 'Male', 'sbowdidge1e@statcounter.com', '11785 Knutson Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lotti Kauscher', '2000-03-17 04:53:41', 'Female', 'lkauscher1f@cbslocal.com', '2 Butternut Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sheree Boller', '2002-04-09 00:08:54', 'Female', 'sboller1g@eepurl.com', '8275 Prairie Rose Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mureil Silberschatz', '2000-01-03 04:53:04', 'Female', 'msilberschatz1h@booking.com', '5426 Stoughton Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Iorgo Swannell', '2001-10-03 16:18:07', 'Male', 'iswannell1i@homestead.com', '553 Lukken Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tiffani Meiklejohn', '2000-11-01 13:44:54', 'Female', 'tmeiklejohn1j@elpais.com', '792 Namekagon Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ambur Longden', '2003-07-12 20:08:31', 'Female', 'alongden1k@geocities.com', '87976 Lotheville Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emilio McCrann', '2003-01-23 10:08:52', 'Male', 'emccrann1l@utexas.edu', '3769 Westerfield Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jerry Donoher', '2002-07-22 13:53:23', 'Female', 'jdonoher1m@sfgate.com', '1 Fallview Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barty Fawley', '2003-12-20 21:43:32', 'Male', 'bfawley1n@alibaba.com', '3762 Evergreen Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Waverley Jarratt', '2001-03-18 12:22:30', 'Male', 'wjarratt1o@jigsy.com', '50381 Warner Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Phillipp Bashford', '2002-03-05 23:14:57', 'Male', 'pbashford1p@cbc.ca', '406 Gateway Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Melesa Caustick', '2000-05-15 23:06:49', 'Female', 'mcaustick1q@deliciousdays.com', '3 Mayer Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Illa Rookledge', '2000-02-24 06:39:35', 'Female', 'irookledge1r@simplemachines.org', '90446 Mallard Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Loy Rambaut', '2003-05-14 22:43:41', 'Male', 'lrambaut1s@wp.com', '53220 Buell Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rosalie Gulston', '2001-11-21 13:23:11', 'Female', 'rgulston1t@lulu.com', '7 Riverside Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Edy Druitt', '2002-08-15 09:46:20', 'Female', 'edruitt1u@auda.org.au', '021 Heath Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Diann Shillingford', '2003-02-23 23:30:25', 'Female', 'dshillingford1v@ask.com', '4828 Namekagon Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Niko Ciccerale', '2000-12-28 20:03:40', 'Male', 'nciccerale1w@hatena.ne.jp', '0 Upham Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gottfried Gissing', '2003-01-07 03:34:12', 'Male', 'ggissing1x@vistaprint.com', '6170 Superior Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chrisy Chaves', '2002-11-09 02:56:50', 'Male', 'cchaves1y@yahoo.co.jp', '579 Ilene Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hope Shepherdson', '2003-08-15 00:18:28', 'Female', 'hshepherdson1z@miitbeian.gov.cn', '318 Hallows Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dona Done', '2001-02-01 08:05:14', 'Female', 'ddone20@bbb.org', '050 Tennyson Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cindee Bennell', '2000-11-11 21:59:46', 'Female', 'cbennell21@answers.com', '4309 Northridge Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eldredge Aitchison', '2000-02-01 15:52:11', 'Male', 'eaitchison22@ameblo.jp', '2 Marcy Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Zacharias Colin', '2000-01-05 06:48:19', 'Male', 'zcolin23@buzzfeed.com', '39 Northport Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lucio Tremblay', '2001-05-04 04:58:11', 'Male', 'ltremblay24@google.co.jp', '7032 Saint Paul Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Julie Mulvy', '2000-07-11 03:52:49', 'Female', 'jmulvy25@nih.gov', '9474 Springview Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nickie Ashlin', '2002-09-19 15:47:27', 'Female', 'nashlin26@shop-pro.jp', '0075 Declaration Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aeriell Tracy', '2001-04-10 16:25:17', 'Female', 'atracy27@auda.org.au', '29 Welch Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sidney Wilkins', '2002-04-09 22:23:13', 'Male', 'swilkins28@stanford.edu', '45810 Ilene Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jilli Murden', '2001-06-25 07:57:53', 'Female', 'jmurden29@cyberchimps.com', '87793 Susan Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Obediah Peegrem', '2000-08-29 19:31:03', 'Male', 'opeegrem2a@spiegel.de', '01 Glacier Hill Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Noelyn Coom', '2002-02-04 03:10:47', 'Female', 'ncoom2b@tinyurl.com', '21793 Reinke Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Farlie Darkott', '2002-01-22 11:41:34', 'Male', 'fdarkott2c@reverbnation.com', '087 Brentwood Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Krisha Hadigate', '2001-01-20 04:38:16', 'Male', 'khadigate2d@theguardian.com', '0614 Morning Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Addie Horsey', '2002-02-25 15:25:55', 'Male', 'ahorsey2e@mapquest.com', '053 Eastlawn Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Priscella Lamdin', '2001-03-17 22:15:00', 'Female', 'plamdin2f@marketwatch.com', '251 Grover Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sibelle Kruschev', '2000-06-19 18:46:07', 'Female', 'skruschev2g@telegraph.co.uk', '43351 Gale Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Roddie McDonagh', '2000-08-09 22:38:12', 'Male', 'rmcdonagh2h@oakley.com', '02 Fulton Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mayor Goricke', '2001-07-14 18:14:36', 'Male', 'mgoricke2i@digg.com', '59646 Dixon Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Field Rickets', '2000-01-18 21:17:34', 'Male', 'frickets2j@google.fr', '65822 Manufacturers Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Luke Brodeau', '2002-07-07 02:35:21', 'Male', 'lbrodeau2k@elegantthemes.com', '5547 6th Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brigida Haile', '2000-06-29 04:20:56', 'Female', 'bhaile2l@ow.ly', '2 Columbus Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gery Tripett', '2001-02-19 03:27:55', 'Male', 'gtripett2m@wordpress.com', '0392 Center Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Martie Crosbie', '2002-07-03 21:04:04', 'Female', 'mcrosbie2n@gravatar.com', '0 Debs Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elna Bastiman', '2001-12-13 12:12:44', 'Female', 'ebastiman2o@facebook.com', '70 Ronald Regan Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elroy Friend', '2002-10-29 13:16:57', 'Male', 'efriend2p@chronoengine.com', '26030 Steensland Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kali Ghent', '2003-06-20 06:57:29', 'Female', 'kghent2q@npr.org', '2724 Park Meadow Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sydel Benoy', '2002-10-11 04:57:25', 'Female', 'sbenoy2r@wsj.com', '6256 David Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jonas Lockery', '2003-06-02 07:38:48', 'Male', 'jlockery2s@ted.com', '76 Graedel Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rhodia Bravery', '2002-09-28 23:37:20', 'Female', 'rbravery2t@chronoengine.com', '3845 Red Cloud Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Moises Hirtzmann', '2001-04-05 22:42:13', 'Male', 'mhirtzmann2u@theguardian.com', '4337 Mariners Cove Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jaimie Leather', '2003-01-06 14:45:23', 'Female', 'jleather2v@abc.net.au', '659 Stone Corner Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Margeaux Charity', '2000-08-09 14:51:51', 'Female', 'mcharity2w@marriott.com', '566 Sutherland Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Randolf Dewhurst', '2003-04-26 14:43:55', 'Male', 'rdewhurst2x@admin.ch', '70609 Lerdahl Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stefan Prime', '2003-01-03 07:21:11', 'Male', 'sprime2y@about.com', '10327 Merry Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dallas Fairbourn', '2002-08-20 04:34:52', 'Female', 'dfairbourn2z@php.net', '9071 3rd Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cecilius Khalid', '2001-11-19 06:09:44', 'Male', 'ckhalid30@icq.com', '16 Nelson Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rogers Faragan', '2002-07-30 05:07:45', 'Male', 'rfaragan31@1und1.de', '55255 Dahle Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jamie Weatherby', '2003-05-12 03:27:36', 'Male', 'jweatherby32@bloglines.com', '53494 Beilfuss Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alicea Hannah', '2003-05-04 19:00:54', 'Female', 'ahannah33@ft.com', '7026 Eagan Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Burt Battman', '2000-06-01 15:45:22', 'Male', 'bbattman34@free.fr', '1 Sachs Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gradeigh McGillacoell', '2000-03-24 02:29:48', 'Male', 'gmcgillacoell35@gravatar.com', '4 Monica Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sheelagh Templman', '2002-03-23 14:35:35', 'Female', 'stemplman36@homestead.com', '3 Mitchell Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Randi Iapico', '2000-02-15 22:08:42', 'Female', 'riapico37@flavors.me', '10257 Wayridge Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ingaborg Gyurko', '2002-05-03 08:46:20', 'Female', 'igyurko38@nhs.uk', '1 Arizona Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pennie Kitchenham', '2000-08-23 18:22:02', 'Female', 'pkitchenham39@google.pl', '2344 Memorial Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Verena Rapa', '2002-06-27 10:42:41', 'Female', 'vrapa3a@house.gov', '2139 Havey Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Herold Menauteau', '2001-01-12 08:38:53', 'Male', 'hmenauteau3b@woothemes.com', '3 Di Loreto Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Huey Orts', '2001-02-05 01:08:36', 'Male', 'horts3c@slate.com', '5006 Hanover Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pat Hamments', '2000-03-15 15:13:20', 'Female', 'phamments3d@wufoo.com', '8 Toban Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Zane Bustard', '2001-01-26 20:23:47', 'Male', 'zbustard3e@dot.gov', '36980 Sunfield Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Federico Flack', '2003-04-01 01:53:01', 'Male', 'fflack3f@msu.edu', '9627 Mcguire Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marti Bacup', '2002-05-05 12:29:48', 'Female', 'mbacup3g@redcross.org', '04 Stuart Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mireielle Bownd', '2001-11-09 08:49:47', 'Female', 'mbownd3h@webnode.com', '84758 Bonner Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ernie Belli', '2001-10-23 06:04:30', 'Male', 'ebelli3i@amazon.com', '90 Dunning Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lonny Chumley', '2002-04-08 01:20:31', 'Male', 'lchumley3j@123-reg.co.uk', '93832 Bay Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Neda Ovise', '2000-05-13 11:02:32', 'Female', 'novise3k@360.cn', '2165 Hanson Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dillon Bowyer', '2000-06-26 23:18:57', 'Male', 'dbowyer3l@unblog.fr', '58 North Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ignatius Riddle', '2002-08-12 12:23:10', 'Male', 'iriddle3m@sciencedirect.com', '3 Cherokee Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Byrle Fouch', '2002-10-17 13:56:08', 'Male', 'bfouch3n@goo.gl', '39 Northland Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Faun Erlam', '2000-06-02 03:21:51', 'Female', 'ferlam3o@newsvine.com', '981 Thackeray Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cecily Fosserd', '2002-04-11 02:16:46', 'Female', 'cfosserd3p@cdc.gov', '977 Duke Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gian Edmondson', '2002-03-10 02:35:55', 'Male', 'gedmondson3q@buzzfeed.com', '064 Cordelia Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Baldwin Baal', '2003-09-23 03:25:23', 'Male', 'bbaal3r@simplemachines.org', '23 Cascade Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Angelico Bruhnke', '2000-08-21 20:01:45', 'Male', 'abruhnke3s@jimdo.com', '0841 Nobel Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sigvard Huxley', '2000-11-27 22:49:56', 'Male', 'shuxley3t@bigcartel.com', '75015 4th Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cherilyn Kubacek', '2001-02-20 05:25:22', 'Female', 'ckubacek3u@oracle.com', '09435 Loftsgordon Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bastien Richardeau', '2001-12-31 22:43:08', 'Male', 'brichardeau3v@chronoengine.com', '63 Lerdahl Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barty Lilliman', '2002-05-04 19:00:21', 'Male', 'blilliman3w@nsw.gov.au', '46 Cardinal Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stanton O''Hone', '2003-09-13 17:52:11', 'Male', 'sohone3x@linkedin.com', '8 Cambridge Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Faith Wardell', '2000-03-04 13:53:13', 'Female', 'fwardell3y@ifeng.com', '51 Stuart Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Karissa Astupenas', '2003-03-04 02:44:40', 'Female', 'kastupenas3z@reverbnation.com', '979 Vera Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Roseanne Ferrillo', '2003-02-25 06:47:15', 'Female', 'rferrillo40@t.co', '29367 Homewood Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rance Clevely', '2002-02-16 15:54:12', 'Male', 'rclevely41@51.la', '63 Washington Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cos Saywood', '2000-03-02 11:44:54', 'Male', 'csaywood42@psu.edu', '941 Hayes Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ermin Cleverley', '2002-04-13 08:47:16', 'Male', 'ecleverley43@exblog.jp', '312 Bartillon Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kimberley Applegate', '2000-10-28 17:55:18', 'Female', 'kapplegate44@forbes.com', '687 Crest Line Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lemmie Van der Beek', '2003-12-20 00:05:25', 'Male', 'lvan45@oakley.com', '17190 Bluejay Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elnora Wimmer', '2000-11-03 11:17:34', 'Female', 'ewimmer46@xrea.com', '39 Kropf Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Trent de Banke', '2002-03-20 18:42:14', 'Male', 'tde47@boston.com', '32 Mallory Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lelah Larn', '2002-04-01 19:28:23', 'Female', 'llarn48@ucoz.com', '51 Butternut Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Myrtie Colborn', '2002-09-07 16:27:16', 'Female', 'mcolborn49@accuweather.com', '527 Buhler Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marlee Laurance', '2000-11-27 23:56:38', 'Female', 'mlaurance4a@moonfruit.com', '1 Beilfuss Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lorie Ferencowicz', '2003-10-27 14:05:07', 'Female', 'lferencowicz4b@blogtalkradio.com', '395 Comanche Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Humfrid Nutley', '2001-08-27 00:53:57', 'Male', 'hnutley4c@linkedin.com', '75 Summit Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('La verne Heddan', '2002-07-11 10:33:45', 'Female', 'lverne4d@instagram.com', '17798 Norway Maple Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Caprice Greenslade', '2001-08-18 23:27:38', 'Female', 'cgreenslade4e@latimes.com', '331 Division Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Baudoin Tander', '2003-01-17 04:29:17', 'Male', 'btander4f@nih.gov', '66732 Esker Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Genia Andover', '2003-01-27 09:53:51', 'Female', 'gandover4g@epa.gov', '804 Jackson Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Letisha Simonyi', '2003-08-03 04:32:07', 'Female', 'lsimonyi4h@mit.edu', '442 Toban Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Orran Lenham', '2003-09-30 02:16:07', 'Male', 'olenham4i@google.co.uk', '13 Fuller Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Evin Thominga', '2001-02-04 02:16:07', 'Male', 'ethominga4j@shutterfly.com', '29312 Manley Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sallyann Measor', '2002-08-21 07:22:36', 'Female', 'smeasor4k@example.com', '6 Helena Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ibrahim Coules', '2000-08-21 04:20:45', 'Male', 'icoules4l@imdb.com', '012 Anthes Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nadeen McGraffin', '2001-02-07 04:01:22', 'Female', 'nmcgraffin4m@yahoo.com', '1317 Swallow Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stu Sancias', '2001-10-20 15:29:40', 'Male', 'ssancias4n@gmpg.org', '38158 Moland Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Liana Timberlake', '2002-08-08 12:57:32', 'Female', 'ltimberlake4o@adobe.com', '98355 Brown Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cinnamon Joust', '2002-11-16 13:03:51', 'Female', 'cjoust4p@sitemeter.com', '258 Mallory Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ruthie Jandel', '2001-10-07 01:10:16', 'Female', 'rjandel4q@behance.net', '3627 Crownhardt Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dew Yearby', '2000-04-28 11:30:42', 'Male', 'dyearby4r@smugmug.com', '2 Dapin Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Darby Waudby', '2001-11-04 17:37:48', 'Female', 'dwaudby4s@foxnews.com', '38158 Huxley Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Guss Yakushkin', '2003-10-10 17:36:49', 'Male', 'gyakushkin4t@stumbleupon.com', '3665 Fairfield Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sloan Owlner', '2002-02-06 17:21:20', 'Male', 'sowlner4u@themeforest.net', '17 Crest Line Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Poul Youell', '2002-02-26 08:02:35', 'Male', 'pyouell4v@plala.or.jp', '37 Surrey Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brady Szachniewicz', '2001-12-19 01:42:25', 'Male', 'bszachniewicz4w@hibu.com', '220 Doe Crossing Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marla Bradie', '2002-02-22 09:52:23', 'Female', 'mbradie4x@printfriendly.com', '1711 Eagle Crest Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dominga Cookman', '2001-07-02 18:53:30', 'Female', 'dcookman4y@nyu.edu', '66 Cottonwood Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gannon Feak', '2003-11-10 06:19:46', 'Male', 'gfeak4z@epa.gov', '89 Lighthouse Bay Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Coriss McCloughen', '2002-03-22 02:27:34', 'Female', 'cmccloughen50@yellowpages.com', '25987 Mesta Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kevyn Cradoc', '2001-10-04 06:20:50', 'Female', 'kcradoc51@scientificamerican.com', '2 Dovetail Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Basilio MacNeill', '2003-10-06 21:18:31', 'Male', 'bmacneill52@kickstarter.com', '26648 2nd Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Obie Beere', '2001-04-13 03:30:04', 'Male', 'obeere53@europa.eu', '0729 Crownhardt Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Reese Streat', '2000-04-24 04:41:59', 'Male', 'rstreat54@wikimedia.org', '0927 Annamark Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nola Gowman', '2001-10-20 09:38:09', 'Female', 'ngowman55@netlog.com', '877 Prairieview Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kassandra Rait', '2000-12-13 21:53:16', 'Female', 'krait56@hibu.com', '47078 Ramsey Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rudolf Gunney', '2002-11-27 13:09:03', 'Male', 'rgunney57@amazon.de', '18571 Roth Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Margalit Siseland', '2002-02-12 18:04:09', 'Female', 'msiseland58@cnet.com', '1628 Elgar Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ashely Chrismas', '2002-05-15 11:23:28', 'Female', 'achrismas59@mail.ru', '4282 Marcy Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alethea Danielsky', '2002-03-23 01:29:02', 'Female', 'adanielsky5a@examiner.com', '38 Graceland Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emmerich Levecque', '2003-07-24 10:19:47', 'Male', 'elevecque5b@nyu.edu', '28259 Forest Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kimbell Collerd', '2003-10-16 01:06:05', 'Male', 'kcollerd5c@intel.com', '754 Sunfield Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Michel Yaneev', '2002-01-04 07:01:04', 'Male', 'myaneev5d@constantcontact.com', '27 Lighthouse Bay Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maxie Gilligan', '2003-06-28 09:20:55', 'Female', 'mgilligan5e@linkedin.com', '8 Roth Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Inga Bartholin', '2001-07-28 11:18:00', 'Female', 'ibartholin5f@blog.com', '7859 Eastwood Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Arda Schlagman', '2002-03-08 01:31:41', 'Female', 'aschlagman5g@odnoklassniki.ru', '5 Havey Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kylen Rentelll', '2000-11-18 09:23:41', 'Female', 'krentelll5h@etsy.com', '4642 Wayridge Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lorenza Lundberg', '2001-10-07 22:29:32', 'Female', 'llundberg5i@e-recht24.de', '485 Sutteridge Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lukas Versey', '2000-01-08 03:33:43', 'Male', 'lversey5j@yelp.com', '8 Scott Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Phylis Feaster', '2003-10-18 08:56:36', 'Female', 'pfeaster5k@aol.com', '01527 Clarendon Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shena Kyttor', '2003-10-17 01:10:51', 'Female', 'skyttor5l@sourceforge.net', '31 Tony Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Candy Hutable', '2001-12-11 21:24:48', 'Female', 'chutable5m@newsvine.com', '494 Darwin Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Leigh Stiegers', '2003-09-17 04:23:24', 'Male', 'lstiegers5n@edublogs.org', '0472 Browning Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Glenna Crow', '2003-08-28 03:51:31', 'Female', 'gcrow5o@freewebs.com', '59799 Kennedy Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mylo Regis', '2001-02-02 08:18:34', 'Male', 'mregis5p@slate.com', '160 Maywood Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Garnette Aburrow', '2002-05-08 15:33:20', 'Female', 'gaburrow5q@earthlink.net', '3 Toban Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sam Breche', '2002-02-24 04:57:01', 'Male', 'sbreche5r@examiner.com', '8 Judy Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Phylis Priddy', '2003-10-20 01:38:58', 'Female', 'ppriddy5s@istockphoto.com', '4 Mcguire Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Del Waryk', '2003-10-09 11:40:39', 'Male', 'dwaryk5t@cmu.edu', '2 Norway Maple Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elka Conrad', '2003-12-01 13:41:31', 'Female', 'econrad5u@usa.gov', '3 Bunker Hill Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Karney MacGillicuddy', '2003-03-02 22:31:36', 'Male', 'kmacgillicuddy5v@senate.gov', '9874 Arrowood Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Berri Whiteson', '2003-10-03 09:56:54', 'Female', 'bwhiteson5w@cbslocal.com', '7336 Nelson Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Steffen Bowley', '2003-06-17 03:50:46', 'Male', 'sbowley5x@networksolutions.com', '2 Westport Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bambi Deem', '2001-08-22 13:08:32', 'Female', 'bdeem5y@e-recht24.de', '9 Buell Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Katrine Lowes', '2000-08-17 21:04:46', 'Female', 'klowes5z@examiner.com', '6444 School Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Garland Wordington', '2003-07-31 10:40:09', 'Female', 'gwordington60@yahoo.co.jp', '863 Clarendon Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Min Vescovo', '2003-10-04 16:43:30', 'Female', 'mvescovo61@telegraph.co.uk', '2 Ruskin Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gar Jamrowicz', '2003-02-24 02:10:12', 'Male', 'gjamrowicz62@amazon.co.jp', '95239 Anderson Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barde Wadham', '2001-11-22 17:16:57', 'Male', 'bwadham63@seesaa.net', '1195 Carpenter Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sergio Rupke', '2001-03-15 09:47:53', 'Male', 'srupke64@senate.gov', '4609 Westridge Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gunther Flintoff', '2000-11-03 05:25:22', 'Male', 'gflintoff65@sphinn.com', '11380 Harper Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Davida Kennaird', '2001-07-27 07:31:57', 'Female', 'dkennaird66@ted.com', '2 Hovde Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cordelie Tee', '2001-08-31 23:59:39', 'Female', 'ctee67@sphinn.com', '8 Gale Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marcie Petroulis', '2003-09-29 15:05:40', 'Female', 'mpetroulis68@cdc.gov', '12584 Vahlen Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mathilde Spoor', '2003-11-29 05:53:33', 'Female', 'mspoor69@aboutads.info', '0 Darwin Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Henry Bette', '2000-10-07 09:46:57', 'Male', 'hbette6a@unicef.org', '7 Porter Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Arney Cowdray', '2000-06-08 18:26:05', 'Male', 'acowdray6b@apple.com', '2 Hanover Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gwenette Zohrer', '2003-03-18 03:02:46', 'Female', 'gzohrer6c@opensource.org', '2687 Tennyson Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nicolette Crenage', '2001-06-29 10:13:11', 'Female', 'ncrenage6d@theatlantic.com', '802 Crest Line Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shae Pigford', '2002-09-27 08:06:51', 'Male', 'spigford6e@51.la', '61910 Bunker Hill Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Smitty Guillot', '2000-02-11 18:17:39', 'Male', 'sguillot6f@hp.com', '8 Ridgeview Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Yorgos Sharpus', '2002-08-18 07:23:55', 'Male', 'ysharpus6g@nbcnews.com', '73 Fairfield Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Daren Impey', '2001-11-21 10:07:39', 'Male', 'dimpey6h@techcrunch.com', '5 Amoth Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kristofor Coke', '2000-11-29 09:53:02', 'Male', 'kcoke6i@sohu.com', '21258 Vermont Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Adah Wadhams', '2001-02-16 00:41:20', 'Female', 'awadhams6j@tripod.com', '93863 Jenifer Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dagny Medlen', '2002-04-27 11:48:24', 'Male', 'dmedlen6k@netlog.com', '9928 2nd Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aveline Davidzon', '2003-05-15 15:42:02', 'Female', 'adavidzon6l@mlb.com', '91 Debs Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tori Olivera', '2003-12-01 12:44:38', 'Female', 'tolivera6m@bloglines.com', '224 Myrtle Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Benoite Gianninotti', '2002-03-08 21:05:47', 'Female', 'bgianninotti6n@hexun.com', '8353 Monica Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Leodora Caldecourt', '2002-10-02 23:48:07', 'Female', 'lcaldecourt6o@latimes.com', '00 Prairieview Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kinna Haggish', '2000-12-19 12:22:35', 'Female', 'khaggish6p@dell.com', '40303 Manufacturers Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tally Yardy', '2002-06-02 12:16:03', 'Male', 'tyardy6q@jugem.jp', '135 Norway Maple Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jerrold Dubbin', '2000-03-04 13:37:03', 'Male', 'jdubbin6r@tiny.cc', '9 Morningstar Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('August Truckell', '2000-08-11 03:04:14', 'Male', 'atruckell6s@comsenz.com', '01062 Eagle Crest Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Reuven Darter', '2002-08-22 02:23:18', 'Male', 'rdarter6t@netscape.com', '2080 Artisan Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hyacinth Stinchcombe', '2003-04-13 06:03:43', 'Female', 'hstinchcombe6u@dropbox.com', '351 Waxwing Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shea Lantry', '2002-01-15 01:37:08', 'Male', 'slantry6v@wisc.edu', '580 Tomscot Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aloisia Sapshed', '2003-06-01 14:37:54', 'Female', 'asapshed6w@mlb.com', '2 Reinke Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gael Niven', '2002-01-28 19:09:40', 'Male', 'gniven6x@constantcontact.com', '8848 Sunfield Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eartha Downgate', '2003-03-25 15:22:06', 'Female', 'edowngate6y@qq.com', '405 Dexter Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ania Masdin', '2002-01-31 15:32:38', 'Female', 'amasdin6z@redcross.org', '16 Rigney Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Freddie Pervoe', '2000-12-09 03:29:07', 'Female', 'fpervoe70@nifty.com', '529 Continental Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Olimpia Guerrin', '2001-09-05 18:55:07', 'Female', 'oguerrin71@nymag.com', '636 Carpenter Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stanford Bank', '2000-04-19 02:03:38', 'Male', 'sbank72@csmonitor.com', '0265 Judy Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chucho Blewis', '2001-04-23 14:42:59', 'Male', 'cblewis73@discuz.net', '3 Corscot Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Daren Brashaw', '2001-03-12 01:01:56', 'Male', 'dbrashaw74@linkedin.com', '2669 La Follette Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Malvin Gallahue', '2003-12-08 05:36:08', 'Male', 'mgallahue75@slideshare.net', '6 North Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kleon Tyt', '2000-11-23 09:35:36', 'Male', 'ktyt76@huffingtonpost.com', '77 Blackbird Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ingaborg Rymer', '2002-04-28 05:57:00', 'Female', 'irymer77@miitbeian.gov.cn', '6688 American Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Thadeus Govern', '2002-01-19 01:36:47', 'Male', 'tgovern78@marketwatch.com', '4 Rusk Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Oliviero Stangoe', '2000-08-26 13:51:07', 'Male', 'ostangoe79@flavors.me', '04 Thierer Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alonso Faltskog', '2001-09-04 15:23:48', 'Male', 'afaltskog7a@g.co', '21212 Manley Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ariel Chester', '2000-12-22 23:39:32', 'Female', 'achester7b@delicious.com', '1 Dryden Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Julissa Seviour', '2001-12-12 22:11:53', 'Female', 'jseviour7c@mail.ru', '143 Calypso Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Curt Garlett', '2002-05-19 00:56:31', 'Male', 'cgarlett7d@amazon.de', '3 Michigan Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Glyn Matteini', '2000-05-02 21:53:59', 'Male', 'gmatteini7e@studiopress.com', '6 Ramsey Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pasquale Firminger', '2001-11-05 04:17:36', 'Male', 'pfirminger7f@lycos.com', '8 Columbus Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rubie Gaskin', '2002-04-09 00:56:14', 'Female', 'rgaskin7g@ebay.com', '02561 Myrtle Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ingamar Barr', '2003-07-03 05:35:11', 'Male', 'ibarr7h@canalblog.com', '8 Eastlawn Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ginnie Brewerton', '2001-03-28 13:49:06', 'Female', 'gbrewerton7i@bbc.co.uk', '922 Ilene Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Silvano Hofer', '2002-12-05 15:12:46', 'Male', 'shofer7j@dropbox.com', '09 Oakridge Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lanae McCullough', '2000-07-21 13:10:18', 'Female', 'lmccullough7k@sphinn.com', '12 Paget Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carmine Cheine', '2001-03-14 23:58:38', 'Male', 'ccheine7l@uol.com.br', '7200 Brown Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Georgetta Ciobotaro', '2001-01-17 16:45:56', 'Female', 'gciobotaro7m@sitemeter.com', '7247 6th Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Audie Soles', '2003-11-15 05:07:40', 'Female', 'asoles7n@ucsd.edu', '59 Haas Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dominick Grimsley', '2002-02-08 08:57:47', 'Male', 'dgrimsley7o@si.edu', '71 Reindahl Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jody Alexsandrovich', '2000-09-24 11:38:15', 'Male', 'jalexsandrovich7p@mayoclinic.com', '44819 Grover Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brice Croci', '2000-02-29 06:09:13', 'Male', 'bcroci7q@zdnet.com', '563 Coolidge Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Harriet Antoons', '2000-11-11 14:28:59', 'Female', 'hantoons7r@mozilla.org', '11 Schurz Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lurlene Gladding', '2000-02-09 16:22:28', 'Female', 'lgladding7s@gmpg.org', '672 Maple Wood Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eward Robardey', '2000-06-21 10:28:49', 'Male', 'erobardey7t@hc360.com', '25314 Gulseth Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jonathan Whittington', '2001-12-20 22:53:15', 'Male', 'jwhittington7u@gmpg.org', '7 Washington Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nevins Leather', '2000-08-25 23:02:39', 'Male', 'nleather7v@ocn.ne.jp', '265 Comanche Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lydon Blackall', '2001-08-16 04:43:21', 'Male', 'lblackall7w@patch.com', '91 Jenifer Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cami Semple', '2002-12-19 05:23:07', 'Female', 'csemple7x@ftc.gov', '4 Green Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maddi Abbes', '2001-06-08 22:11:05', 'Female', 'mabbes7y@homestead.com', '5257 Express Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kessiah Gotobed', '2001-09-02 10:22:25', 'Female', 'kgotobed7z@hugedomains.com', '397 Carpenter Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Drusi Tilbury', '2003-09-20 16:35:33', 'Female', 'dtilbury80@paginegialle.it', '3385 Kennedy Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ryon Jeaffreson', '2001-01-16 14:05:15', 'Male', 'rjeaffreson81@ocn.ne.jp', '17508 Vahlen Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jessi Parres', '2003-07-11 11:56:02', 'Female', 'jparres82@opensource.org', '2 Bellgrove Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Adriaens Wastell', '2003-12-26 11:23:53', 'Female', 'awastell83@friendfeed.com', '651 Village Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Janina Willwood', '2002-11-21 18:43:53', 'Female', 'jwillwood84@de.vu', '61504 Thackeray Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Zacharie d'' Elboux', '2001-05-03 08:24:53', 'Male', 'zd85@ox.ac.uk', '1 Thierer Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alard Steptow', '2002-10-01 05:38:47', 'Male', 'asteptow86@pen.io', '687 Carberry Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barron Rape', '2003-08-18 12:39:47', 'Male', 'brape87@histats.com', '6805 Kensington Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marisa Worham', '2002-03-12 14:53:50', 'Female', 'mworham88@liveinternet.ru', '11564 Anderson Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dehlia Eltone', '2000-09-06 10:46:54', 'Female', 'deltone89@a8.net', '820 Meadow Valley Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Holly-anne Mathonnet', '2002-07-28 22:11:08', 'Female', 'hmathonnet8a@list-manage.com', '96138 Pierstorff Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jan Meindl', '2003-10-07 13:38:38', 'Male', 'jmeindl8b@sphinn.com', '22761 Northview Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Briano Busch', '2000-11-11 00:52:12', 'Male', 'bbusch8c@intel.com', '56580 Mcguire Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Frank Lazell', '2002-02-14 20:54:06', 'Male', 'flazell8d@delicious.com', '8283 Calypso Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tracey Di Giorgio', '2000-03-20 21:34:55', 'Male', 'tdi8e@google.co.jp', '5093 Butterfield Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sutton Baudrey', '2003-06-20 21:51:17', 'Male', 'sbaudrey8f@behance.net', '521 Corry Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nesta Ashpital', '2002-11-22 14:21:32', 'Female', 'nashpital8g@google.ca', '2 Service Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Berkley Harburtson', '2000-10-12 17:25:24', 'Male', 'bharburtson8h@foxnews.com', '79 Alpine Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Windy Rollin', '2000-04-26 04:45:39', 'Female', 'wrollin8i@google.it', '98 Fallview Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chrisse Hadwen', '2000-10-31 17:12:07', 'Male', 'chadwen8j@list-manage.com', '1 Corry Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Patrica Bushnell', '2000-05-03 10:05:23', 'Female', 'pbushnell8k@facebook.com', '779 Lien Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Levi Wiltshire', '2002-03-27 03:33:38', 'Male', 'lwiltshire8l@alexa.com', '0 Shopko Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Waylan Spinke', '2003-11-28 10:53:45', 'Male', 'wspinke8m@photobucket.com', '6827 Lien Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elke Lindell', '2000-01-12 22:34:20', 'Female', 'elindell8n@usgs.gov', '6237 Saint Paul Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Des de Clerk', '2002-10-22 05:53:57', 'Male', 'dde8o@utexas.edu', '789 Lotheville Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vladimir Lodin', '2003-10-06 14:08:18', 'Male', 'vlodin8p@last.fm', '6610 Sutteridge Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tonye Gerger', '2000-12-13 03:46:26', 'Female', 'tgerger8q@uiuc.edu', '35833 South Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cass Sinnat', '2002-08-17 09:50:44', 'Male', 'csinnat8r@wp.com', '287 Linden Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ethyl Tennet', '2002-05-27 11:59:40', 'Female', 'etennet8s@sourceforge.net', '568 Monterey Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Raphael Ferryman', '2001-07-15 03:38:14', 'Male', 'rferryman8t@unc.edu', '1281 Melvin Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Verina Dundredge', '2001-03-03 22:06:24', 'Female', 'vdundredge8u@amazon.co.uk', '77061 Daystar Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Manfred Hall-Gough', '2000-03-28 10:53:11', 'Male', 'mhallgough8v@intel.com', '948 Meadow Ridge Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rollo O'' Finan', '2002-12-29 17:08:36', 'Male', 'ro8w@gmpg.org', '81 Northview Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carin Wudeland', '2001-11-24 15:19:39', 'Female', 'cwudeland8x@businessweek.com', '734 Bowman Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marlo Nisuis', '2003-01-21 14:36:53', 'Male', 'mnisuis8y@squarespace.com', '143 Dawn Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Darcy L''Episcopio', '2002-09-22 07:34:12', 'Male', 'dlepiscopio8z@rediff.com', '4 Homewood Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lew Boylan', '2002-11-01 04:15:53', 'Male', 'lboylan90@godaddy.com', '43 Meadow Valley Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mikaela Dodsworth', '2003-09-04 11:50:15', 'Female', 'mdodsworth91@state.gov', '72751 Scoville Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dulcine Bras', '2001-01-13 02:50:42', 'Female', 'dbras92@intel.com', '378 Pepper Wood Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Raynell Lamblot', '2003-06-07 14:04:36', 'Female', 'rlamblot93@netlog.com', '09 6th Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ardyth Gothrup', '2003-10-29 01:15:16', 'Female', 'agothrup94@360.cn', '4 1st Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ricard Dybald', '2001-03-07 08:45:02', 'Male', 'rdybald95@about.me', '89 Mayfield Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fidelio Scartifield', '2000-11-25 19:11:16', 'Male', 'fscartifield96@ftc.gov', '7 American Ash Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Garvin Warwicker', '2001-03-14 13:53:08', 'Male', 'gwarwicker97@pinterest.com', '216 Burning Wood Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Querida Dugue', '2001-07-30 11:33:42', 'Female', 'qdugue98@trellian.com', '11 Thompson Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rochette Trammel', '2001-03-21 13:32:16', 'Female', 'rtrammel99@theguardian.com', '5161 Briar Crest Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nikolaos Whelband', '2002-09-08 12:21:14', 'Male', 'nwhelband9a@hc360.com', '440 Rigney Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stillmann Fidian', '2002-12-05 15:32:42', 'Male', 'sfidian9b@wisc.edu', '12 Forster Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Weber MacAdam', '2002-09-02 05:01:44', 'Male', 'wmacadam9c@japanpost.jp', '6 Eagan Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hali McKea', '2000-03-25 14:53:35', 'Female', 'hmckea9d@acquirethisname.com', '78 Ridgeview Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lacie Bygraves', '2001-12-09 08:09:33', 'Female', 'lbygraves9e@is.gd', '38 Sugar Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emalia Newson', '2002-06-11 22:06:45', 'Female', 'enewson9f@wisc.edu', '7783 West Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cchaddie Kennelly', '2003-03-31 19:28:11', 'Male', 'ckennelly9g@mlb.com', '26 Spenser Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sheri Moye', '2003-03-03 10:00:18', 'Female', 'smoye9h@wordpress.org', '8 Armistice Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Colan Gehringer', '2003-11-05 05:00:49', 'Male', 'cgehringer9i@yale.edu', '04 Red Cloud Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Codi Leethem', '2001-05-18 10:20:03', 'Male', 'cleethem9j@biblegateway.com', '329 Bowman Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Edin Elnor', '2000-12-05 07:00:31', 'Female', 'eelnor9k@last.fm', '94140 Dottie Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sydney Hawick', '2002-01-29 03:31:27', 'Female', 'shawick9l@51.la', '5 Debs Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Goraud Bulbrook', '2000-09-11 17:43:06', 'Male', 'gbulbrook9m@google.com', '55883 Walton Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Adelina McKain', '2003-10-11 13:15:16', 'Female', 'amckain9n@pcworld.com', '32243 Everett Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Isador Charleston', '2000-10-10 23:44:06', 'Male', 'icharleston9o@squidoo.com', '6 Transport Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Linell Hansemann', '2002-09-07 21:20:11', 'Female', 'lhansemann9p@canalblog.com', '802 Wayridge Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ibrahim Kochl', '2000-11-09 10:02:53', 'Male', 'ikochl9q@sogou.com', '4 Grayhawk Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Prudence Oppie', '2002-11-11 17:26:06', 'Female', 'poppie9r@behance.net', '3380 Marcy Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Angel Carlow', '2002-01-03 15:23:50', 'Male', 'acarlow9s@house.gov', '704 Fisk Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vinnie Gumme', '2002-05-30 22:30:59', 'Male', 'vgumme9t@fastcompany.com', '420 Algoma Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sibeal Ayscough', '2001-02-18 16:09:09', 'Female', 'sayscough9u@cdc.gov', '0445 Arrowood Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Willey Fellgett', '2001-08-01 23:08:22', 'Male', 'wfellgett9v@latimes.com', '409 Banding Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hirsch De Mars', '2003-10-18 05:57:27', 'Male', 'hde9w@typepad.com', '93 Sauthoff Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Anny Kittow', '2002-04-23 21:48:58', 'Female', 'akittow9x@google.com', '8 Debs Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gage Baynam', '2003-02-15 21:32:36', 'Male', 'gbaynam9y@latimes.com', '8 Huxley Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ceil Cartmer', '2003-12-09 23:18:59', 'Female', 'ccartmer9z@google.com.hk', '7 High Crossing Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jakob Danaher', '2002-07-05 12:55:38', 'Male', 'jdanahera0@guardian.co.uk', '86075 Talisman Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emile Mucklo', '2003-11-29 19:10:12', 'Male', 'emuckloa1@canalblog.com', '36 Monterey Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gladi Connold', '2002-07-30 12:45:54', 'Female', 'gconnolda2@deliciousdays.com', '985 Vermont Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Candy Paprotny', '2000-12-17 07:31:57', 'Female', 'cpaprotnya3@clickbank.net', '42433 Butterfield Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Martynne Grahame', '2003-07-09 00:25:04', 'Female', 'mgrahamea4@state.gov', '54 Westport Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jerrold Dahlman', '2002-05-05 12:32:47', 'Male', 'jdahlmana5@buzzfeed.com', '15 Northwestern Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Imelda Pyvis', '2000-11-09 11:19:55', 'Female', 'ipyvisa6@google.ca', '9 Gateway Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Leann Vanyashin', '2002-05-21 20:28:13', 'Female', 'lvanyashina7@ycombinator.com', '6 Hoepker Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cammy Schimann', '2001-03-30 16:57:08', 'Female', 'cschimanna8@bbb.org', '1 Dapin Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lisha Mackin', '2001-07-30 05:46:16', 'Female', 'lmackina9@macromedia.com', '766 Aberg Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bourke Shuker', '2000-10-09 06:59:44', 'Male', 'bshukeraa@wufoo.com', '35 Eagan Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Adelina Laydel', '2001-06-28 09:23:27', 'Female', 'alaydelab@skype.com', '5 Dorton Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mauricio Abbis', '2003-07-16 09:07:15', 'Male', 'mabbisac@lulu.com', '78 Mcguire Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Anjanette Bendin', '2002-03-18 20:26:51', 'Female', 'abendinad@xrea.com', '26674 Kipling Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hallie Tesche', '2002-10-25 02:14:57', 'Female', 'htescheae@godaddy.com', '14 Almo Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Min Rangle', '2000-09-05 04:51:48', 'Female', 'mrangleaf@flickr.com', '77 Petterle Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nanon Schroeder', '2002-05-01 14:27:18', 'Female', 'nschroederag@elpais.com', '0 Cambridge Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Muffin Beglin', '2000-10-05 00:33:36', 'Male', 'mbeglinah@cisco.com', '6417 Corscot Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Curry McTrusty', '2001-12-09 07:48:27', 'Male', 'cmctrustyai@networksolutions.com', '962 Donald Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lanie Albers', '2002-01-24 06:52:26', 'Male', 'lalbersaj@imageshack.us', '4052 Marquette Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Miguela Lichtfoth', '2001-05-30 17:50:29', 'Female', 'mlichtfothak@jalbum.net', '1 Gale Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lory Hamilton', '2001-07-31 12:09:01', 'Female', 'lhamiltonal@dion.ne.jp', '7 Buell Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Danice Silverston', '2002-08-07 00:58:35', 'Female', 'dsilverstonam@dion.ne.jp', '61841 Onsgard Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Claude Swinford', '2002-01-15 22:56:28', 'Female', 'cswinfordan@1und1.de', '05 Dorton Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Weber Brayshay', '2000-05-23 01:42:15', 'Male', 'wbrayshayao@blogspot.com', '0257 Norway Maple Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dominik Lisamore', '2001-11-01 22:41:13', 'Male', 'dlisamoreap@drupal.org', '093 Barnett Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ivan Fayne', '2001-01-08 03:28:56', 'Male', 'ifayneaq@cnbc.com', '3640 Havey Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marthena Rame', '2002-02-17 09:29:12', 'Female', 'mramear@cmu.edu', '8 Kennedy Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Abby Boxall', '2002-03-05 11:43:31', 'Female', 'aboxallas@virginia.edu', '90 Arizona Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Karen MacDermand', '2001-10-09 17:32:17', 'Female', 'kmacdermandat@wufoo.com', '330 1st Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kerri McVeigh', '2001-10-17 06:19:27', 'Female', 'kmcveighau@mayoclinic.com', '9461 Sullivan Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brana Kervin', '2002-07-15 05:51:28', 'Female', 'bkervinav@godaddy.com', '90 Elgar Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tawsha Chipping', '2001-09-24 13:42:53', 'Female', 'tchippingaw@zimbio.com', '51305 1st Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Isaiah Russo', '2001-12-10 23:48:19', 'Male', 'irussoax@multiply.com', '07 Schmedeman Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Annalise MacAskill', '2001-04-21 15:27:52', 'Female', 'amacaskillay@ucoz.com', '753 Northfield Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cathi Digan', '2003-12-09 11:55:39', 'Female', 'cdiganaz@vimeo.com', '03 Wayridge Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jay Micheau', '2000-12-21 21:45:30', 'Male', 'jmicheaub0@wufoo.com', '2814 Hallows Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Virginie Robeson', '2002-02-26 05:32:40', 'Female', 'vrobesonb1@wix.com', '0 Katie Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Edee Netting', '2001-09-04 02:18:42', 'Female', 'enettingb2@va.gov', '1854 Thompson Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Zacharia Philbrick', '2002-02-22 05:42:02', 'Male', 'zphilbrickb3@shinystat.com', '0389 Dennis Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hillary Strawbridge', '2002-04-13 11:11:52', 'Male', 'hstrawbridgeb4@ycombinator.com', '325 Aberg Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Luise McCerery', '2002-04-26 05:06:59', 'Female', 'lmccereryb5@hexun.com', '621 Steensland Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dehlia Georgel', '2000-06-30 14:57:29', 'Female', 'dgeorgelb6@hexun.com', '08631 Welch Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dusty Willey', '2002-04-04 19:49:51', 'Female', 'dwilleyb7@github.com', '3 Crescent Oaks Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tabitha Guillotin', '2002-03-21 06:52:15', 'Female', 'tguillotinb8@linkedin.com', '432 Hayes Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kristyn Keelan', '2003-12-22 18:51:24', 'Female', 'kkeelanb9@fc2.com', '7102 Lukken Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emelita Simonazzi', '2000-06-26 04:02:37', 'Female', 'esimonazziba@a8.net', '29091 Hansons Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dario Squibe', '2001-01-30 03:05:36', 'Male', 'dsquibebb@businessinsider.com', '64029 Onsgard Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Markus Lawly', '2002-10-26 09:21:48', 'Male', 'mlawlybc@wunderground.com', '15 Red Cloud Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Christiane Stollenhof', '2000-11-13 20:16:34', 'Female', 'cstollenhofbd@1688.com', '36638 Tomscot Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rand Capon', '2001-11-14 06:13:52', 'Male', 'rcaponbe@wired.com', '89208 Grayhawk Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Doll Cessford', '2002-09-15 19:31:47', 'Female', 'dcessfordbf@auda.org.au', '0 Lindbergh Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fianna Sparhawk', '2001-06-09 12:57:57', 'Female', 'fsparhawkbg@forbes.com', '14 Briar Crest Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Becky Bissill', '2001-11-13 16:33:32', 'Female', 'bbissillbh@upenn.edu', '8 Carey Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Midge Newcomen', '2001-10-16 07:40:09', 'Female', 'mnewcomenbi@lulu.com', '98506 Carioca Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Donnajean Leask', '2003-10-31 23:10:27', 'Female', 'dleaskbj@forbes.com', '67 Acker Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Wait Shearman', '2002-03-05 06:08:40', 'Male', 'wshearmanbk@opensource.org', '97 Bartelt Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tallie Riddles', '2002-10-25 15:37:45', 'Male', 'triddlesbl@freewebs.com', '7 Bashford Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gianni Warder', '2003-02-23 14:32:49', 'Male', 'gwarderbm@pen.io', '016 Logan Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stillmann Northen', '2000-03-19 18:26:03', 'Male', 'snorthenbn@wiley.com', '635 Sage Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nikki Daniaud', '2000-08-29 03:29:06', 'Female', 'ndaniaudbo@noaa.gov', '084 Loeprich Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marjie Lusgdin', '2001-09-15 16:18:03', 'Female', 'mlusgdinbp@geocities.com', '02296 Marquette Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eliza Snelman', '2002-08-20 18:28:41', 'Female', 'esnelmanbq@elegantthemes.com', '2354 Prairieview Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Winny Medhurst', '2001-02-05 14:09:01', 'Male', 'wmedhurstbr@upenn.edu', '48431 Spaight Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Antoni Doggrell', '2000-04-01 09:09:40', 'Male', 'adoggrellbs@ibm.com', '43061 Superior Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aldin Benmore', '2003-10-31 23:43:22', 'Male', 'abenmorebt@ovh.net', '693 Farwell Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ragnar Fashion', '2000-08-04 15:14:04', 'Male', 'rfashionbu@admin.ch', '192 Oakridge Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Merle Mersey', '2001-11-27 08:07:33', 'Male', 'mmerseybv@gizmodo.com', '3071 Coleman Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ed Cisson', '2002-05-06 15:10:35', 'Male', 'ecissonbw@chronoengine.com', '5608 Di Loreto Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Erena Purselowe', '2000-03-10 15:06:07', 'Female', 'epurselowebx@sakura.ne.jp', '936 Lighthouse Bay Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Addy Ditchburn', '2002-07-29 11:57:21', 'Male', 'aditchburnby@msu.edu', '644 Old Shore Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Franny Docherty', '2002-06-06 21:22:17', 'Male', 'fdochertybz@sourceforge.net', '9 Straubel Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Madelaine Preuvost', '2000-09-23 07:11:01', 'Female', 'mpreuvostc0@kickstarter.com', '74448 Melody Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Erminie Coch', '2002-10-04 07:53:38', 'Female', 'ecochc1@illinois.edu', '06917 Warbler Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jameson Reiglar', '2000-08-29 02:11:48', 'Male', 'jreiglarc2@sfgate.com', '8064 Linden Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fin Blaes', '2003-07-06 13:06:02', 'Male', 'fblaesc3@elegantthemes.com', '4336 Kedzie Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Andriette Spada', '2002-08-31 02:42:03', 'Female', 'aspadac4@newyorker.com', '45 Pleasure Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nanete Castanos', '2000-11-08 03:57:39', 'Female', 'ncastanosc5@cbslocal.com', '490 Sycamore Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mareah Worthington', '2000-08-31 19:31:51', 'Female', 'mworthingtonc6@nature.com', '3911 Mendota Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bernette Faulkner', '2003-11-15 19:27:24', 'Female', 'bfaulknerc7@cloudflare.com', '56782 Saint Paul Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jorie Readman', '2001-04-08 09:42:37', 'Female', 'jreadmanc8@reverbnation.com', '6015 Old Shore Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cindelyn Tremethack', '2003-09-13 16:28:34', 'Female', 'ctremethackc9@huffingtonpost.com', '5947 Algoma Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Guthry Shenley', '2000-06-01 15:23:44', 'Male', 'gshenleyca@earthlink.net', '18 Moland Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Freddy Littrik', '2000-09-30 11:00:07', 'Female', 'flittrikcb@networkadvertising.org', '4 Loeprich Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ermina Greiser', '2003-03-04 02:24:30', 'Female', 'egreisercc@discuz.net', '420 8th Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Iggy De Ortega', '2003-04-10 06:26:38', 'Male', 'idecd@samsung.com', '5748 Pierstorff Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Neill Bellino', '2001-09-30 16:08:04', 'Male', 'nbellinoce@vimeo.com', '8356 Comanche Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lenna Ilett', '2003-03-10 11:23:59', 'Female', 'lilettcf@omniture.com', '573 Warbler Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Darlene Schankelborg', '2001-06-08 12:41:46', 'Female', 'dschankelborgcg@nationalgeographic.com', '057 Judy Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Waylon Petteford', '2003-12-20 03:32:23', 'Male', 'wpettefordch@paginegialle.it', '5671 Ruskin Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Filberte Sheasby', '2000-04-08 12:39:15', 'Male', 'fsheasbyci@gravatar.com', '68 Chive Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tammi Plan', '2003-02-23 07:13:53', 'Female', 'tplancj@liveinternet.ru', '5 Briar Crest Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cris Glavias', '2003-03-04 06:58:03', 'Male', 'cglaviasck@wired.com', '36356 Brown Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tillie Whiting', '2000-04-17 02:08:57', 'Female', 'twhitingcl@zimbio.com', '5982 Hagan Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Filberto Jado', '2000-10-29 16:51:22', 'Male', 'fjadocm@accuweather.com', '3 Warrior Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jody Peaurt', '2001-04-29 13:58:10', 'Female', 'jpeaurtcn@theguardian.com', '80552 Anhalt Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alisha O''Crotty', '2001-01-29 06:22:44', 'Female', 'aocrottyco@netvibes.com', '2040 Everett Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Calv Franchioni', '2003-07-21 03:18:37', 'Male', 'cfranchionicp@springer.com', '76339 Corry Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nelson Perotti', '2002-11-09 18:13:21', 'Male', 'nperotticq@indiegogo.com', '11898 Derek Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alena Plak', '2003-11-13 10:00:27', 'Female', 'aplakcr@timesonline.co.uk', '69 Lunder Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Laney Scholar', '2001-07-07 10:04:31', 'Female', 'lscholarcs@nytimes.com', '55 Reinke Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lutero Huxstep', '2002-01-16 06:06:44', 'Male', 'lhuxstepct@yellowpages.com', '13 Thompson Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Colet Oglethorpe', '2003-12-06 04:19:49', 'Male', 'coglethorpecu@facebook.com', '94 Clyde Gallagher Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nobe Shuxsmith', '2002-06-23 20:59:47', 'Male', 'nshuxsmithcv@china.com.cn', '97681 Mandrake Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rollie Carter', '2002-06-19 00:53:21', 'Male', 'rcartercw@sun.com', '379 John Wall Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tonia Marco', '2002-01-11 14:54:22', 'Female', 'tmarcocx@epa.gov', '21 Harper Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Beryle Monkley', '2001-01-06 16:37:26', 'Female', 'bmonkleycy@aboutads.info', '2325 Talisman Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kellby Edworthy', '2001-01-25 15:35:04', 'Male', 'kedworthycz@naver.com', '4 Buell Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Angelle Lippiatt', '2001-08-22 15:25:36', 'Female', 'alippiattd0@shutterfly.com', '5 Knutson Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vince Reinger', '2002-11-13 16:46:04', 'Male', 'vreingerd1@nsw.gov.au', '68 Division Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emmott Brusby', '2001-11-02 07:14:25', 'Male', 'ebrusbyd2@google.cn', '6973 Waxwing Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cloris Westphalen', '2003-05-07 02:34:29', 'Female', 'cwestphalend3@howstuffworks.com', '64 Gale Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jessamyn Derges', '2003-05-23 23:43:52', 'Female', 'jdergesd4@hibu.com', '6373 Golf View Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mordecai Pieracci', '2001-11-27 18:59:56', 'Male', 'mpieraccid5@goo.ne.jp', '1011 Bartelt Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Filia Janus', '2003-08-10 11:06:11', 'Female', 'fjanusd6@tiny.cc', '76 Tony Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Starlene Jossel', '2003-12-11 07:30:44', 'Female', 'sjosseld7@wired.com', '26 Valley Edge Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aaron Gelder', '2002-05-02 05:23:49', 'Male', 'agelderd8@ameblo.jp', '05 Carpenter Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Giraldo Whitwell', '2002-02-28 00:10:18', 'Male', 'gwhitwelld9@opera.com', '873 Anhalt Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Heather Exon', '2001-01-28 10:25:41', 'Female', 'hexonda@nba.com', '44800 Hermina Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Melissa Alton', '2003-02-02 21:22:00', 'Female', 'maltondb@elegantthemes.com', '43637 Warbler Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Casandra Peret', '2003-10-09 17:27:30', 'Female', 'cperetdc@psu.edu', '4961 Columbus Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jorey Sabater', '2000-10-23 09:23:47', 'Female', 'jsabaterdd@live.com', '97 Londonderry Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Winifred Edghinn', '2000-07-07 04:28:13', 'Female', 'wedghinnde@creativecommons.org', '7 Morrow Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Odey Bertholin', '2000-06-24 17:58:57', 'Male', 'obertholindf@hatena.ne.jp', '955 Everett Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rooney Solman', '2000-12-15 03:23:59', 'Male', 'rsolmandg@businessweek.com', '582 Browning Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Enrichetta Vearnals', '2002-03-23 03:58:38', 'Female', 'evearnalsdh@ameblo.jp', '2405 Harbort Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Valery Savil', '2000-05-17 20:37:40', 'Female', 'vsavildi@ibm.com', '5 Doe Crossing Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tonia Hatcher', '2000-10-10 20:39:17', 'Female', 'thatcherdj@opensource.org', '9 Sage Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rudie Birdwhistell', '2001-05-02 15:39:49', 'Male', 'rbirdwhistelldk@pbs.org', '93 Nobel Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Felisha McLoughlin', '2001-05-30 09:41:36', 'Female', 'fmcloughlindl@patch.com', '53 Esker Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lenore Forker', '2003-06-01 20:54:26', 'Female', 'lforkerdm@ibm.com', '84537 Logan Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Schuyler Van der Brugge', '2003-02-13 08:51:34', 'Male', 'svandn@alibaba.com', '450 Scott Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marla Allery', '2001-03-31 14:52:49', 'Female', 'mallerydo@hibu.com', '71 Spohn Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rodolphe Briddock', '2001-06-20 06:52:47', 'Male', 'rbriddockdp@fema.gov', '890 Anzinger Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Antonin Croisdall', '2001-02-07 00:23:02', 'Male', 'acroisdalldq@jigsy.com', '162 Gerald Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Franklin Getley', '2002-11-27 15:53:10', 'Male', 'fgetleydr@creativecommons.org', '4 Welch Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dolli Lorryman', '2000-05-29 21:24:58', 'Female', 'dlorrymands@spiegel.de', '70052 Heffernan Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rosemonde Westerman', '2002-08-17 19:20:15', 'Female', 'rwestermandt@independent.co.uk', '93042 East Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sande Danell', '2003-01-09 03:03:14', 'Female', 'sdanelldu@netvibes.com', '44 Esch Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Judi Matt', '2001-06-02 17:15:42', 'Female', 'jmattdv@army.mil', '61 Arkansas Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Steve Pariso', '2000-10-13 05:58:50', 'Male', 'sparisodw@wsj.com', '6517 Sloan Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bernhard Ruggs', '2002-04-26 18:35:01', 'Male', 'bruggsdx@timesonline.co.uk', '67 Thompson Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Herc Thrift', '2000-12-15 18:53:20', 'Male', 'hthriftdy@technorati.com', '5477 Vermont Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Trent Matthews', '2003-06-27 21:40:21', 'Male', 'tmatthewsdz@buzzfeed.com', '773 Maywood Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Davis Devanney', '2001-12-16 21:01:37', 'Male', 'ddevanneye0@liveinternet.ru', '396 Holmberg Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rory Garter', '2002-11-15 08:09:45', 'Female', 'rgartere1@unesco.org', '08 Crescent Oaks Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aprilette Wheaton', '2001-08-08 06:26:01', 'Female', 'awheatone2@zdnet.com', '7 Little Fleur Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Heindrick Meighan', '2000-09-08 07:55:17', 'Male', 'hmeighane3@weibo.com', '39 Stoughton Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Melli Robey', '2003-10-27 15:31:35', 'Female', 'mrobeye4@hexun.com', '819 Barby Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nertie Boatwright', '2002-08-22 05:31:53', 'Female', 'nboatwrighte5@hibu.com', '68 Anderson Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hynda Stadden', '2003-12-22 17:20:03', 'Female', 'hstaddene6@vistaprint.com', '1 Kropf Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aliza Rhodus', '2001-04-07 15:31:41', 'Female', 'arhoduse7@opera.com', '38 Warbler Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carson Benthall', '2000-05-06 05:24:37', 'Male', 'cbenthalle8@newsvine.com', '114 Chive Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nathanial Foister', '2002-01-01 16:52:34', 'Male', 'nfoistere9@altervista.org', '8921 Washington Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Danette Longland', '2003-04-03 15:39:18', 'Female', 'dlonglandea@yahoo.com', '6 Blaine Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hannah Fourmy', '2003-02-05 17:41:42', 'Female', 'hfourmyeb@t.co', '376 Bunting Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Laurene MacGown', '2002-01-19 11:54:23', 'Female', 'lmacgownec@jigsy.com', '99 Bonner Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ranique Dalziel', '2001-12-06 07:12:54', 'Female', 'rdalzieled@tiny.cc', '9 Lotheville Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mort Mimmack', '2003-04-25 08:01:58', 'Male', 'mmimmackee@umich.edu', '020 Thackeray Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Galvin Pedel', '2001-01-16 08:18:36', 'Male', 'gpedelef@msu.edu', '9 Granby Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Loree Tredgold', '2000-04-02 10:07:13', 'Female', 'ltredgoldeg@census.gov', '241 Gale Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mildred Mose', '2001-10-23 21:30:25', 'Female', 'mmoseeh@deliciousdays.com', '8 Superior Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Florentia Hasluck', '2000-12-16 07:18:48', 'Female', 'fhasluckei@forbes.com', '66 Bobwhite Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cynthea Breston', '2002-05-21 07:16:18', 'Female', 'cbrestonej@vk.com', '7 Mccormick Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Willetta Feavers', '2003-10-16 15:59:21', 'Female', 'wfeaversek@nps.gov', '2097 Jana Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Clarice Huller', '2001-09-03 09:26:35', 'Female', 'chullerel@mashable.com', '9984 Union Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Leora Battleson', '2002-10-18 09:29:12', 'Female', 'lbattlesonem@amazon.com', '7899 Truax Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gard Phipard-Shears', '2000-05-27 23:33:19', 'Male', 'gphipardshearsen@flavors.me', '04054 Eagan Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lindsay Bailiss', '2001-11-27 16:04:12', 'Female', 'lbailisseo@umn.edu', '6806 Birchwood Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Reagen Franschini', '2002-02-14 16:34:55', 'Male', 'rfranschiniep@ask.com', '23 Parkside Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kenna Clubley', '2000-11-05 18:42:16', 'Female', 'kclubleyeq@hexun.com', '4269 Hanover Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jamima O''Dogherty', '2000-03-08 06:01:51', 'Female', 'jodoghertyer@abc.net.au', '4 Prairieview Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Abey Colvin', '2002-10-24 13:11:30', 'Male', 'acolvines@cnn.com', '360 Weeping Birch Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Davis Verma', '2003-09-21 16:50:38', 'Male', 'dvermaet@google.pl', '9202 Fair Oaks Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mart Oselton', '2001-11-14 01:24:54', 'Male', 'moseltoneu@networkadvertising.org', '3 Granby Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nolie Timson', '2001-02-20 10:50:46', 'Female', 'ntimsonev@marriott.com', '60 Meadow Vale Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Miner Kimblen', '2002-08-03 06:12:43', 'Male', 'mkimblenew@e-recht24.de', '68409 Eggendart Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pollyanna Clowley', '2000-07-08 19:20:29', 'Female', 'pclowleyex@examiner.com', '90 Everett Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barron Purviss', '2001-07-27 17:48:00', 'Male', 'bpurvissey@disqus.com', '7183 Superior Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ebeneser Beenham', '2001-06-02 00:03:39', 'Male', 'ebeenhamez@webmd.com', '92096 Mariners Cove Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dorri Hubery', '2000-07-26 06:30:17', 'Female', 'dhuberyf0@behance.net', '4440 Hauk Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Neil Dumphries', '2000-02-20 21:14:23', 'Male', 'ndumphriesf1@salon.com', '48610 Menomonie Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Leslie Bourton', '2000-01-17 10:43:59', 'Male', 'lbourtonf2@cocolog-nifty.com', '6 Towne Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Olly Giraldez', '2001-06-17 16:04:44', 'Male', 'ogiraldezf3@senate.gov', '2 Shopko Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elysha Barroux', '2000-10-14 16:59:32', 'Female', 'ebarrouxf4@nature.com', '5 Clyde Gallagher Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hugh Tuley', '2002-01-23 01:11:09', 'Male', 'htuleyf5@bravesites.com', '308 Monument Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Liam Ipsley', '2003-06-11 23:31:26', 'Male', 'lipsleyf6@ifeng.com', '87 Schiller Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Glad Curwen', '2003-03-12 02:35:24', 'Female', 'gcurwenf7@goo.ne.jp', '05 Eliot Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Claudette Engelbrecht', '2002-02-16 00:18:54', 'Female', 'cengelbrechtf8@geocities.jp', '66 Bunting Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marietta Rowntree', '2000-06-25 05:28:17', 'Female', 'mrowntreef9@cyberchimps.com', '957 Laurel Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pooh Egre', '2002-01-30 14:34:52', 'Female', 'pegrefa@woothemes.com', '1597 Rieder Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Itch Duncklee', '2002-07-28 17:21:40', 'Male', 'idunckleefb@webmd.com', '22 Loeprich Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sancho Tohill', '2002-02-07 17:00:37', 'Male', 'stohillfc@foxnews.com', '64674 Hanson Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lothario Arrigo', '2002-10-26 15:36:30', 'Male', 'larrigofd@ucoz.ru', '07431 Caliangt Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nicola Shower', '2003-02-28 12:30:54', 'Female', 'nshowerfe@bing.com', '7 Jenna Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Viviyan Bradane', '2000-01-30 12:37:07', 'Female', 'vbradaneff@bbb.org', '72088 Johnson Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jamie Presdie', '2002-10-03 08:17:31', 'Male', 'jpresdiefg@clickbank.net', '78346 Sunnyside Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nils Bartlomiejczyk', '2003-01-05 20:47:11', 'Male', 'nbartlomiejczykfh@issuu.com', '6 Scott Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Broderic Lewins', '2003-11-08 12:53:21', 'Male', 'blewinsfi@google.it', '5291 Warrior Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kimberlyn Bridgewood', '2002-07-24 05:01:33', 'Female', 'kbridgewoodfj@sina.com.cn', '6 Declaration Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Teresita Hastler', '2003-11-10 20:58:16', 'Female', 'thastlerfk@domainmarket.com', '331 Dahle Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jaymie Mee', '2003-08-02 15:30:01', 'Male', 'jmeefl@google.it', '247 Spohn Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cathie Sissens', '2001-10-15 08:42:16', 'Female', 'csissensfm@apache.org', '830 High Crossing Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nathan Vlies', '2000-10-12 11:54:35', 'Male', 'nvliesfn@jiathis.com', '5 Menomonie Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Audre Leighfield', '2000-12-16 06:37:05', 'Female', 'aleighfieldfo@jiathis.com', '99940 Forest Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kliment Itzcovich', '2000-09-24 19:02:39', 'Male', 'kitzcovichfp@diigo.com', '3013 Debra Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Urbano Le Hucquet', '2003-09-29 05:32:16', 'Male', 'ulefq@buzzfeed.com', '1762 Porter Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fidole McPeice', '2002-10-24 07:59:39', 'Male', 'fmcpeicefr@house.gov', '12 Summit Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Steffane Emburey', '2000-01-01 02:09:09', 'Female', 'sembureyfs@merriam-webster.com', '13893 Northridge Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Milo Arnaudin', '2002-10-08 04:44:06', 'Male', 'marnaudinft@cloudflare.com', '67203 Mesta Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Celestina Kilgour', '2001-02-14 17:59:53', 'Female', 'ckilgourfu@cdbaby.com', '555 1st Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Casi Pimlott', '2001-06-25 11:59:27', 'Female', 'cpimlottfv@discuz.net', '6547 Springs Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Moore Crunkhorn', '2002-01-04 11:16:36', 'Male', 'mcrunkhornfw@dedecms.com', '19288 Lillian Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Freedman McGrath', '2001-02-09 01:37:54', 'Male', 'fmcgrathfx@ning.com', '937 Shelley Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bess Dunning', '2000-12-30 08:19:22', 'Female', 'bdunningfy@yahoo.co.jp', '6 Milwaukee Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marlow Mc Dermid', '2003-10-25 01:11:13', 'Male', 'mmcfz@un.org', '84 Manufacturers Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Torie Smidmor', '2001-10-04 13:56:24', 'Female', 'tsmidmorg0@yelp.com', '4 Packers Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kirby Troy', '2002-03-28 12:48:49', 'Male', 'ktroyg1@devhub.com', '540 Burrows Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Theodore Durram', '2003-02-03 19:00:16', 'Male', 'tdurramg2@merriam-webster.com', '1 Monument Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Otes Sellner', '2003-03-25 01:21:39', 'Male', 'osellnerg3@mayoclinic.com', '92174 Mccormick Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('August Edon', '2000-03-07 02:56:35', 'Male', 'aedong4@cargocollective.com', '8039 Bellgrove Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cathryn Jillions', '2001-11-29 15:12:23', 'Female', 'cjillionsg5@cnet.com', '25 Monica Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cecilio Brounfield', '2000-02-13 13:22:13', 'Male', 'cbrounfieldg6@ed.gov', '6 Coolidge Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Zebulen Harding', '2002-07-09 02:44:40', 'Male', 'zhardingg7@fotki.com', '68 Becker Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Simeon Taffley', '2001-07-14 04:21:30', 'Male', 'staffleyg8@t.co', '088 Autumn Leaf Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ferdie Ledwich', '2000-03-17 14:47:23', 'Male', 'fledwichg9@jigsy.com', '7018 Fisk Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Clem Standring', '2002-09-18 14:49:36', 'Male', 'cstandringga@over-blog.com', '7 Jay Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Phillida Treen', '2000-04-12 08:17:18', 'Female', 'ptreengb@forbes.com', '0345 Anzinger Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Winfred Manach', '2001-02-23 09:38:33', 'Male', 'wmanachgc@yelp.com', '0 Arapahoe Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elberta Piell', '2002-10-29 04:18:44', 'Female', 'epiellgd@google.de', '90 Pearson Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Laney Huske', '2000-08-27 03:23:54', 'Female', 'lhuskege@google.es', '30 Fordem Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eydie Lillgard', '2003-09-23 21:32:14', 'Female', 'elillgardgf@oaic.gov.au', '380 Maryland Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Curcio Downing', '2000-09-07 14:42:22', 'Male', 'cdowninggg@uiuc.edu', '286 Del Sol Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Evania Blabie', '2001-08-11 22:10:25', 'Female', 'eblabiegh@engadget.com', '34 Dixon Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Frasquito Cotta', '2000-12-25 17:43:29', 'Male', 'fcottagi@google.ca', '60935 Fremont Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Noland Odby', '2001-01-21 17:26:01', 'Male', 'nodbygj@mlb.com', '8481 Troy Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nancey Wastie', '2003-04-26 09:02:10', 'Female', 'nwastiegk@yellowbook.com', '0 Truax Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Wood Mingaud', '2000-01-15 17:11:44', 'Male', 'wmingaudgl@drupal.org', '73564 Sycamore Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Abbie Looks', '2000-01-25 08:14:46', 'Male', 'alooksgm@ucoz.ru', '28370 Transport Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gerianne Pither', '2000-09-18 20:35:11', 'Female', 'gpithergn@wikimedia.org', '4 Esch Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Abramo Fewlass', '2003-10-14 23:09:49', 'Male', 'afewlassgo@tamu.edu', '10940 Prairie Rose Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Quinn McCart', '2003-03-26 03:28:12', 'Female', 'qmccartgp@twitpic.com', '41 Riverside Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chet Crumbleholme', '2002-09-14 17:40:56', 'Male', 'ccrumbleholmegq@marketwatch.com', '85209 Manufacturers Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Arvin Bronot', '2000-12-03 02:48:59', 'Male', 'abronotgr@nsw.gov.au', '9422 Autumn Leaf Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Calley Flear', '2000-07-19 01:35:51', 'Female', 'cfleargs@vkontakte.ru', '14376 Hauk Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Haskell Jeannenet', '2002-10-31 10:20:00', 'Male', 'hjeannenetgt@thetimes.co.uk', '47143 Sloan Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Irita Bussel', '2000-12-07 00:44:13', 'Female', 'ibusselgu@springer.com', '71 Utah Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ludovico Faunt', '2002-07-30 11:44:08', 'Male', 'lfauntgv@businessinsider.com', '019 Manufacturers Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jaymee Satford', '2002-03-31 07:12:14', 'Female', 'jsatfordgw@mit.edu', '968 Saint Paul Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rosina Nichols', '2002-12-13 23:19:41', 'Female', 'rnicholsgx@e-recht24.de', '672 Rigney Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hedwig Baber', '2000-05-11 22:10:30', 'Female', 'hbabergy@oaic.gov.au', '30 Blue Bill Park Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dorine Magwood', '2001-04-07 01:30:30', 'Female', 'dmagwoodgz@nasa.gov', '0644 Muir Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Waldemar Castella', '2002-03-27 08:55:53', 'Male', 'wcastellah0@fotki.com', '955 Vidon Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eunice Lapwood', '2003-07-07 08:28:34', 'Female', 'elapwoodh1@bigcartel.com', '315 Thierer Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mellie Depka', '2003-11-13 12:06:58', 'Female', 'mdepkah2@archive.org', '6 Vernon Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Antonin Farans', '2001-04-19 15:56:44', 'Male', 'afaransh3@japanpost.jp', '2 Arizona Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tabbitha Budgey', '2000-03-27 22:07:02', 'Female', 'tbudgeyh4@livejournal.com', '10765 Sunbrook Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bunnie Clere', '2002-08-25 23:55:58', 'Female', 'bclereh5@nymag.com', '18 West Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gordon Baudassi', '2002-11-04 18:44:53', 'Male', 'gbaudassih6@sbwire.com', '288 Forest Run Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Andromache Hundell', '2003-10-19 12:42:46', 'Female', 'ahundellh7@timesonline.co.uk', '8 Blackbird Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ciro Hanmer', '2002-06-29 08:36:38', 'Male', 'chanmerh8@techcrunch.com', '34 Hovde Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Estell Weitzel', '2001-05-23 13:48:57', 'Female', 'eweitzelh9@fastcompany.com', '824 Springs Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Reggie Yeoland', '2002-06-09 22:13:24', 'Male', 'ryeolandha@geocities.jp', '0010 Kim Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Syd Knight', '2000-11-16 01:49:06', 'Male', 'sknighthb@cornell.edu', '78 Kim Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stormi Zorzini', '2002-03-23 11:55:54', 'Female', 'szorzinihc@digg.com', '0 Kingsford Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shandra Canelas', '2000-08-15 09:02:01', 'Female', 'scanelashd@ihg.com', '411 Harbort Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Yasmin Houndson', '2002-06-15 02:30:18', 'Female', 'yhoundsonhe@dailymotion.com', '0684 Thierer Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Felike Mainson', '2002-11-28 08:19:06', 'Male', 'fmainsonhf@skyrock.com', '63 Packers Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Walsh Hanselmann', '2001-06-19 14:10:09', 'Male', 'whanselmannhg@cnet.com', '065 Ronald Regan Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Normie Renison', '2003-08-11 15:37:19', 'Male', 'nrenisonhh@wikipedia.org', '8727 Lien Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cammy Robotham', '2003-02-22 00:14:24', 'Female', 'crobothamhi@godaddy.com', '8 Gerald Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dorey Broune', '2003-09-03 06:08:08', 'Male', 'dbrounehj@walmart.com', '191 Esch Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jeddy Pettet', '2000-04-07 11:10:07', 'Male', 'jpettethk@aol.com', '1338 John Wall Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gabriel Milsted', '2002-08-18 13:40:54', 'Female', 'gmilstedhl@prlog.org', '89547 Russell Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mill Cottier', '2001-12-31 07:25:14', 'Male', 'mcottierhm@bizjournals.com', '5009 Katie Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bidget Proud', '2000-06-26 12:25:38', 'Female', 'bproudhn@freewebs.com', '2013 Lighthouse Bay Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Doyle Sherwin', '2000-02-27 00:54:41', 'Male', 'dsherwinho@flavors.me', '412 Pennsylvania Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brigg Newbery', '2002-08-04 11:13:54', 'Male', 'bnewberyhp@csmonitor.com', '6080 Crowley Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Anet McCrann', '2002-04-18 23:15:12', 'Female', 'amccrannhq@tuttocitta.it', '6657 Jana Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kathy Keigher', '2003-01-02 20:52:46', 'Female', 'kkeigherhr@ftc.gov', '043 Mcbride Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Salvador Youngman', '2002-09-14 13:35:57', 'Male', 'syoungmanhs@ezinearticles.com', '5 Roth Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alain Mynott', '2002-03-12 02:17:07', 'Male', 'amynottht@prweb.com', '14050 Hooker Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Costanza Aime', '2002-06-16 05:25:10', 'Female', 'caimehu@wufoo.com', '60 Lakeland Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Wynnie Geall', '2002-02-08 18:54:27', 'Female', 'wgeallhv@npr.org', '16 Brickson Park Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sibyl Scamel', '2000-04-07 18:31:02', 'Male', 'sscamelhw@bandcamp.com', '008 Messerschmidt Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Antonietta Richie', '2002-03-12 04:39:20', 'Female', 'arichiehx@foxnews.com', '728 Everett Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Denver Waddup', '2000-10-21 10:23:02', 'Male', 'dwadduphy@toplist.cz', '5107 Victoria Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cassie Allewell', '2001-12-23 15:19:12', 'Female', 'callewellhz@dailymotion.com', '9591 Trailsway Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ariel Wabersinke', '2003-01-10 09:59:26', 'Female', 'awabersinkei0@usnews.com', '69683 Kings Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cliff Wingatt', '2003-04-08 00:06:50', 'Male', 'cwingatti1@skyrock.com', '39 Calypso Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Colver Drance', '2000-10-24 09:09:44', 'Male', 'cdrancei2@ft.com', '78798 Eliot Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Phillis Pistol', '2000-12-23 07:55:21', 'Female', 'ppistoli3@cmu.edu', '63 Michigan Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Konstance Bosward', '2003-09-14 16:52:58', 'Female', 'kboswardi4@google.ru', '98654 Buena Vista Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ardyth Iori', '2001-08-12 12:35:39', 'Female', 'aiorii5@paginegialle.it', '05 Beilfuss Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Olly Grut', '2001-02-04 08:55:27', 'Male', 'ogruti6@smh.com.au', '929 Browning Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cecilius Friedenbach', '2002-07-16 19:24:05', 'Male', 'cfriedenbachi7@angelfire.com', '840 Washington Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Willi Bowerman', '2000-10-31 15:36:14', 'Female', 'wbowermani8@desdev.cn', '525 Manley Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Loraine Jorge', '2003-02-06 23:41:26', 'Female', 'ljorgei9@wordpress.org', '5301 Victoria Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fairleigh Alcock', '2001-01-25 12:56:55', 'Male', 'falcockia@furl.net', '969 Katie Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Herman Ort', '2001-10-22 14:38:03', 'Male', 'hortib@discovery.com', '4583 Roxbury Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gardener Husk', '2000-09-07 05:09:06', 'Male', 'ghuskic@vk.com', '657 Schmedeman Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shantee Esilmon', '2002-10-22 14:08:59', 'Female', 'sesilmonid@ebay.co.uk', '7 Arapahoe Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carol Baumadier', '2000-04-10 22:32:35', 'Female', 'cbaumadierie@drupal.org', '38 Sundown Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Horatia Tettersell', '2000-05-26 19:01:28', 'Female', 'htettersellif@constantcontact.com', '17758 Veith Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Victoir Philpott', '2000-09-19 04:32:00', 'Male', 'vphilpottig@soup.io', '69204 Golf Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elden Lightowlers', '2003-02-17 11:01:56', 'Male', 'elightowlersih@behance.net', '98049 Briar Crest Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Millard Tumelty', '2003-07-14 20:59:35', 'Male', 'mtumeltyii@bizjournals.com', '074 Annamark Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Avril Mc Menamin', '2003-02-06 08:25:11', 'Female', 'amcij@cornell.edu', '7689 New Castle Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aindrea Tofano', '2001-12-27 02:44:13', 'Female', 'atofanoik@columbia.edu', '056 Maywood Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dyna Jellis', '2002-01-15 12:10:42', 'Female', 'djellisil@smh.com.au', '52701 Bluejay Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Terese Saladine', '2000-09-15 11:13:32', 'Female', 'tsaladineim@ox.ac.uk', '761 Westend Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pru Bucktharp', '2001-12-30 14:02:05', 'Female', 'pbucktharpin@uol.com.br', '7 Atwood Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carmella Werrett', '2003-06-26 18:53:27', 'Female', 'cwerrettio@ovh.net', '94 Dwight Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ilario Lordon', '2000-12-21 10:09:07', 'Male', 'ilordonip@msn.com', '1915 Columbus Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Morgan Birley', '2001-11-09 20:25:25', 'Male', 'mbirleyiq@artisteer.com', '6 Boyd Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lucius Inold', '2001-07-02 13:08:20', 'Male', 'linoldir@senate.gov', '201 Corry Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barbey Kennerknecht', '2002-03-19 00:42:43', 'Female', 'bkennerknechtis@foxnews.com', '00 Delladonna Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Morissa Barbery', '2002-05-30 15:24:50', 'Female', 'mbarberyit@toplist.cz', '484 Novick Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Salomon Goburn', '2002-10-05 05:17:23', 'Male', 'sgoburniu@samsung.com', '26361 Elka Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Janeva Saxon', '2001-02-08 19:02:27', 'Female', 'jsaxoniv@woothemes.com', '53596 Paget Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emlynne Goldingay', '2002-11-30 21:50:15', 'Female', 'egoldingayiw@blogger.com', '864 Melody Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Manfred Mugg', '2003-07-12 00:20:10', 'Male', 'mmuggix@flavors.me', '4454 Washington Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Montgomery Seymer', '2003-08-01 20:10:41', 'Male', 'mseymeriy@jiathis.com', '7 Eastlawn Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ettore Pautot', '2002-02-14 22:23:00', 'Male', 'epautotiz@tinypic.com', '0 Hollow Ridge Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nell Barraclough', '2000-11-19 06:08:10', 'Female', 'nbarracloughj0@xrea.com', '3617 Swallow Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lombard Killough', '2000-04-01 14:52:49', 'Male', 'lkilloughj1@noaa.gov', '057 Melody Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lorne Keneleyside', '2000-10-02 16:31:01', 'Male', 'lkeneleysidej2@canalblog.com', '97447 Sullivan Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sol Blasetti', '2003-01-13 09:04:49', 'Male', 'sblasettij3@amazon.de', '16804 Hooker Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kareem Quenby', '2002-05-22 13:19:34', 'Male', 'kquenbyj4@tripod.com', '730 Ilene Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Waly Kemetz', '2001-12-28 20:22:30', 'Female', 'wkemetzj5@yale.edu', '251 Old Shore Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hobey Forsbey', '2003-09-14 10:29:31', 'Male', 'hforsbeyj6@gov.uk', '24 Heath Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rahel Wightman', '2001-01-03 02:43:30', 'Female', 'rwightmanj7@theguardian.com', '516 Arkansas Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brocky Moorcraft', '2003-09-03 13:53:13', 'Male', 'bmoorcraftj8@whitehouse.gov', '528 Marquette Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Edin Kigelman', '2003-07-01 15:07:50', 'Female', 'ekigelmanj9@cafepress.com', '3 Pleasure Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Matelda Jennaway', '2003-03-11 21:48:35', 'Female', 'mjennawayja@tripadvisor.com', '3 Northfield Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Farly Wiggin', '2001-12-21 07:34:25', 'Male', 'fwigginjb@furl.net', '40 Brickson Park Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Araldo Curwood', '2001-09-05 04:47:15', 'Male', 'acurwoodjc@godaddy.com', '05 Fairview Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ancell Entwistle', '2003-07-19 13:47:04', 'Male', 'aentwistlejd@surveymonkey.com', '6 Union Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Germana Hockey', '2003-07-17 18:28:57', 'Female', 'ghockeyje@google.ru', '60 Aberg Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nikolas Lindstrom', '2003-08-06 08:14:32', 'Male', 'nlindstromjf@macromedia.com', '37652 Anderson Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Moira Tollmache', '2001-09-26 07:05:13', 'Female', 'mtollmachejg@purevolume.com', '8937 Dennis Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alanson Grinyov', '2002-12-30 14:52:11', 'Male', 'agrinyovjh@instagram.com', '8 Melody Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Joline Novic', '2000-07-04 15:03:59', 'Female', 'jnovicji@tripod.com', '51642 Declaration Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jarib Keoghane', '2003-02-10 01:42:22', 'Male', 'jkeoghanejj@rediff.com', '6 Hayes Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Selina Girke', '2001-07-07 21:56:14', 'Female', 'sgirkejk@geocities.jp', '72543 Northwestern Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chickie Roadnight', '2000-03-23 07:12:30', 'Female', 'croadnightjl@wix.com', '5155 Gina Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dayna Busby', '2000-07-14 19:44:06', 'Female', 'dbusbyjm@indiegogo.com', '76 Meadow Vale Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aldis Skeel', '2001-11-27 04:40:36', 'Male', 'askeeljn@japanpost.jp', '03723 Sunnyside Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Valry Bottinelli', '2003-03-09 16:49:45', 'Female', 'vbottinellijo@utexas.edu', '52748 Northfield Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Garrett Miguel', '2003-10-03 07:41:36', 'Male', 'gmigueljp@miibeian.gov.cn', '825 Darwin Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ilse Atton', '2002-08-23 06:24:20', 'Female', 'iattonjq@stumbleupon.com', '5 Grasskamp Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Salem Rutty', '2000-04-27 14:14:32', 'Male', 'sruttyjr@slashdot.org', '60347 Gateway Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Melany Darker', '2000-06-08 16:55:26', 'Female', 'mdarkerjs@shareasale.com', '7 Muir Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Octavius Meins', '2003-02-28 16:27:47', 'Male', 'omeinsjt@archive.org', '75 Armistice Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Isaak Kensington', '2003-11-10 21:35:33', 'Male', 'ikensingtonju@vimeo.com', '5304 Ryan Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Obadiah Duggen', '2003-05-08 06:18:14', 'Male', 'oduggenjv@noaa.gov', '1 Loomis Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Urban Jeakins', '2003-06-27 19:20:10', 'Male', 'ujeakinsjw@surveymonkey.com', '1 Basil Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ivett Manlow', '2001-12-03 20:04:32', 'Female', 'imanlowjx@blogs.com', '4 Shoshone Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marcella Ricart', '2000-07-03 20:59:18', 'Female', 'mricartjy@people.com.cn', '4 Holy Cross Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Montgomery Buer', '2000-06-25 23:06:30', 'Male', 'mbuerjz@woothemes.com', '8 Barby Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sari Seeks', '2003-08-20 19:44:51', 'Female', 'sseeksk0@ustream.tv', '6 Twin Pines Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Leigha Wickey', '2002-12-10 16:20:59', 'Female', 'lwickeyk1@nps.gov', '474 Barby Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Merrili Clilverd', '2003-11-13 14:08:14', 'Female', 'mclilverdk2@toplist.cz', '8135 Green Ridge Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Flossie Trainer', '2001-04-16 21:45:37', 'Female', 'ftrainerk3@over-blog.com', '9185 Farwell Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Erek Blinerman', '2000-08-04 10:00:35', 'Male', 'eblinermank4@google.de', '98792 Truax Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Toddie Jurn', '2002-05-21 20:10:02', 'Male', 'tjurnk5@time.com', '1 Rowland Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gilli Grummitt', '2002-08-07 07:32:53', 'Female', 'ggrummittk6@geocities.com', '70182 Moland Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ellerey Arrighetti', '2003-12-09 13:47:21', 'Male', 'earrighettik7@bravesites.com', '125 Bluestem Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maude Hazle', '2003-02-19 07:34:53', 'Female', 'mhazlek8@ed.gov', '07 Anderson Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ad McGlue', '2001-11-09 18:33:59', 'Male', 'amcgluek9@smugmug.com', '6303 Larry Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Delores Capehorn', '2003-12-16 19:32:05', 'Female', 'dcapehornka@cafepress.com', '5691 Emmet Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Coop Crystal', '2001-06-23 08:49:55', 'Male', 'ccrystalkb@mozilla.org', '8 Sage Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jannel Gonzalvo', '2001-11-18 10:19:53', 'Female', 'jgonzalvokc@netscape.com', '8025 Eggendart Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Reggie Bowley', '2000-05-30 16:56:59', 'Female', 'rbowleykd@uol.com.br', '03404 Mcbride Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Connie Vlahos', '2000-02-04 20:13:31', 'Male', 'cvlahoske@flavors.me', '7 Veith Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Renate Wraith', '2000-12-12 00:54:49', 'Female', 'rwraithkf@elpais.com', '980 Namekagon Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brear Phibb', '2002-01-16 11:30:20', 'Female', 'bphibbkg@mashable.com', '5 Derek Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Janifer Healings', '2000-08-02 10:30:31', 'Female', 'jhealingskh@dell.com', '1188 Muir Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dew Nevin', '2001-10-05 15:57:31', 'Male', 'dnevinki@cornell.edu', '246 Shoshone Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hewitt Garley', '2002-11-18 16:09:24', 'Male', 'hgarleykj@ihg.com', '18582 Springs Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Matthias Coverley', '2003-07-31 13:39:00', 'Male', 'mcoverleykk@toplist.cz', '40 Randy Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('William Hazelhurst', '2002-08-27 19:20:26', 'Male', 'whazelhurstkl@phoca.cz', '6 Hagan Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Henriette Sendley', '2001-09-08 08:41:22', 'Female', 'hsendleykm@rediff.com', '0 Garrison Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marinna Rothert', '2003-08-21 00:42:05', 'Female', 'mrothertkn@theglobeandmail.com', '5 Clyde Gallagher Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Petronella Beaves', '2002-08-17 22:43:13', 'Female', 'pbeavesko@tripadvisor.com', '100 East Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chantal Brockhurst', '2003-08-09 01:21:50', 'Female', 'cbrockhurstkp@umich.edu', '4 Spohn Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Goraud Blything', '2002-12-28 13:15:43', 'Male', 'gblythingkq@qq.com', '14416 Gerald Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ernestine Slott', '2000-07-02 11:20:32', 'Female', 'eslottkr@moonfruit.com', '522 Holy Cross Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Catriona Chipchase', '2000-04-19 14:47:12', 'Female', 'cchipchaseks@purevolume.com', '48694 Bowman Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Suzie O''Dooghaine', '2001-08-15 10:09:57', 'Female', 'sodooghainekt@blogger.com', '7391 Corben Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Erhart Conahy', '2001-10-06 19:21:28', 'Male', 'econahyku@google.nl', '5 Hoard Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ozzy Kynastone', '2002-04-02 08:11:42', 'Male', 'okynastonekv@mozilla.com', '420 Arapahoe Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Benn Roffe', '2002-04-07 08:14:23', 'Male', 'broffekw@moonfruit.com', '8 Glendale Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cory Domokos', '2003-01-02 17:20:56', 'Male', 'cdomokoskx@symantec.com', '5 Loeprich Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ker Gwinnell', '2003-07-25 16:46:57', 'Male', 'kgwinnellky@xrea.com', '844 Del Sol Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Talia Pierse', '2002-03-30 22:40:30', 'Female', 'tpiersekz@posterous.com', '53 2nd Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Karrah Cowup', '2003-03-23 11:00:31', 'Female', 'kcowupl0@liveinternet.ru', '2 Algoma Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Yance Meekin', '2002-03-01 04:47:30', 'Male', 'ymeekinl1@usatoday.com', '20 Gateway Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lance Grigorkin', '2001-05-13 17:01:11', 'Male', 'lgrigorkinl2@theatlantic.com', '8336 Lakewood Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lydie Wolfe', '2000-09-24 18:51:53', 'Female', 'lwolfel3@globo.com', '25 Garrison Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Abba Taffurelli', '2000-10-03 12:48:38', 'Male', 'ataffurellil4@europa.eu', '66106 Nelson Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ivar Cubberley', '2000-10-17 02:37:46', 'Male', 'icubberleyl5@addthis.com', '17224 Anniversary Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Betta Whipp', '2001-08-15 18:11:02', 'Female', 'bwhippl6@woothemes.com', '925 Forest Dale Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Beau Planque', '2002-11-26 23:26:13', 'Male', 'bplanquel7@npr.org', '96 Fairfield Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Caresse McCoughan', '2001-09-11 14:16:44', 'Female', 'cmccoughanl8@netvibes.com', '29619 Carey Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mac Fantonetti', '2000-06-15 20:51:18', 'Male', 'mfantonettil9@narod.ru', '60 Washington Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Noel Oliveto', '2003-01-09 13:35:04', 'Male', 'nolivetola@phpbb.com', '0 Lyons Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dre Pick', '2002-05-01 00:17:11', 'Female', 'dpicklb@desdev.cn', '0 Menomonie Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rock Britzius', '2001-01-09 14:20:58', 'Male', 'rbritziuslc@disqus.com', '14 Golf View Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ynes Heino', '2002-02-13 07:09:29', 'Female', 'yheinold@technorati.com', '31712 Melody Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barnett Presman', '2001-05-27 14:43:02', 'Male', 'bpresmanle@cafepress.com', '22 Ruskin Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Francklyn Mixer', '2000-04-10 08:18:57', 'Male', 'fmixerlf@yellowpages.com', '40684 Messerschmidt Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tabbi Skidmore', '2001-08-11 18:02:20', 'Female', 'tskidmorelg@ca.gov', '326 Waxwing Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lothario Nanetti', '2001-07-22 18:29:56', 'Male', 'lnanettilh@com.com', '92191 Graedel Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gardener Darkott', '2000-07-01 17:28:52', 'Male', 'gdarkottli@angelfire.com', '1871 Anhalt Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Alice Fuchs', '2003-09-12 14:49:29', 'Female', 'afuchslj@comcast.net', '81 Sage Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Micheil Gentric', '2003-01-02 04:45:00', 'Male', 'mgentriclk@wsj.com', '4649 Toban Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Keefe Stachini', '2002-01-08 08:14:29', 'Male', 'kstachinill@cafepress.com', '31 Hazelcrest Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rochester Hultberg', '2000-11-18 05:00:50', 'Male', 'rhultberglm@twitter.com', '4423 Ilene Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Olin Strangeways', '2002-02-09 12:33:39', 'Male', 'ostrangewaysln@delicious.com', '00 Gina Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rafe Newhouse', '2003-01-09 06:26:56', 'Male', 'rnewhouselo@blogspot.com', '22 Truax Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Luce Rignall', '2001-11-10 18:15:25', 'Male', 'lrignalllp@shareasale.com', '05 Katie Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Del Tansly', '2002-01-02 16:34:54', 'Female', 'dtanslylq@slideshare.net', '69346 Miller Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mickie Trusty', '2000-03-27 22:26:52', 'Female', 'mtrustylr@flickr.com', '15587 Iowa Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mollee O''Ferris', '2001-01-13 19:10:06', 'Female', 'moferrisls@soundcloud.com', '0 Reinke Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Melody Cawdery', '2000-03-21 12:03:41', 'Female', 'mcawderylt@clickbank.net', '8905 Spaight Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cirilo McCroary', '2003-07-13 13:27:49', 'Male', 'cmccroarylu@phpbb.com', '0381 Crownhardt Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Harrietta McGarrell', '2003-02-07 14:00:27', 'Female', 'hmcgarrelllv@issuu.com', '45810 Bluejay Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shurlock Tipton', '2003-04-14 00:57:00', 'Male', 'stiptonlw@businessinsider.com', '59 Merry Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Halli Slessor', '2001-05-11 05:51:00', 'Female', 'hslessorlx@princeton.edu', '43584 Hintze Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Serge Duplock', '2003-07-26 02:58:14', 'Male', 'sduplockly@chronoengine.com', '11 Troy Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aretha Gofford', '2001-06-09 11:28:50', 'Female', 'agoffordlz@bloglines.com', '4 Vernon Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Zsa zsa Waymont', '2001-04-16 15:11:39', 'Female', 'zzsam0@yelp.com', '48 Mariners Cove Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Natty Swinfon', '2000-06-05 11:50:52', 'Male', 'nswinfonm1@wired.com', '091 Arizona Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Izak Gutherson', '2002-10-19 10:35:38', 'Male', 'iguthersonm2@nbcnews.com', '58231 Jackson Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kelila Troni', '2003-12-13 06:27:12', 'Female', 'ktronim3@seesaa.net', '78161 Monica Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Trever Matterdace', '2002-10-26 07:33:28', 'Male', 'tmatterdacem4@xing.com', '5527 Lukken Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maureene Crowcroft', '2001-01-26 08:38:34', 'Female', 'mcrowcroftm5@timesonline.co.uk', '7180 Arrowood Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cordie Bayly', '2001-06-20 05:22:13', 'Female', 'cbaylym6@ucoz.ru', '976 Continental Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Christophe Thominga', '2001-04-11 23:18:00', 'Male', 'cthomingam7@cam.ac.uk', '1 Kenwood Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Baillie Dowall', '2001-09-29 05:17:30', 'Male', 'bdowallm8@china.com.cn', '59453 Scofield Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vonnie Hambridge', '2001-11-13 11:28:44', 'Female', 'vhambridgem9@nbcnews.com', '3 Anzinger Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sandra MacConnulty', '2000-08-24 04:39:34', 'Female', 'smacconnultyma@bluehost.com', '0839 Anderson Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Garrott Pattingson', '2002-05-21 03:08:56', 'Male', 'gpattingsonmb@google.it', '16 Logan Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Baillie Lacelett', '2001-03-05 18:14:15', 'Male', 'blacelettmc@sfgate.com', '31 Northridge Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Christal Theuff', '2003-10-24 06:05:14', 'Female', 'ctheuffmd@kickstarter.com', '74721 Morningstar Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ruth Rains', '2000-04-28 11:07:26', 'Female', 'rrainsme@domainmarket.com', '93211 Eagan Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Reeba Worts', '2003-11-07 10:31:41', 'Female', 'rwortsmf@ed.gov', '2 Nelson Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vassili Reboulet', '2000-08-10 12:57:40', 'Male', 'vrebouletmg@paypal.com', '0 Main Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hilton Bouzek', '2003-07-26 01:18:51', 'Male', 'hbouzekmh@chron.com', '0 Ridgeway Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kaja McIlmorie', '2001-07-29 12:17:06', 'Female', 'kmcilmoriemi@xrea.com', '64 Longview Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Westbrook McCurley', '2003-07-29 14:09:15', 'Male', 'wmccurleymj@mysql.com', '74 Hooker Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Colly Sollon', '2003-12-06 11:30:47', 'Female', 'csollonmk@google.ca', '97 Esch Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barrie Swinyard', '2001-09-26 18:08:29', 'Female', 'bswinyardml@google.cn', '21634 Little Fleur Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Farris Whitehair', '2000-05-08 22:14:26', 'Male', 'fwhitehairmm@squidoo.com', '86649 2nd Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dorry Conway', '2003-11-20 10:40:21', 'Female', 'dconwaymn@istockphoto.com', '3635 Doe Crossing Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mirabelle Croisier', '2002-08-27 13:52:05', 'Female', 'mcroisiermo@4shared.com', '0 West Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Willy Darbyshire', '2000-09-05 10:43:55', 'Male', 'wdarbyshiremp@google.nl', '623 Mccormick Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Virgina Mongenot', '2002-07-21 00:28:41', 'Female', 'vmongenotmq@yolasite.com', '562 Thierer Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jackqueline Trewin', '2000-01-09 13:28:52', 'Female', 'jtrewinmr@gmpg.org', '7 Delladonna Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Archaimbaud Terran', '2000-11-30 19:26:19', 'Male', 'aterranms@people.com.cn', '89 Aberg Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sidonia Dewberry', '2002-05-20 00:22:10', 'Female', 'sdewberrymt@accuweather.com', '11816 Nobel Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tadd Firle', '2000-07-09 04:54:55', 'Male', 'tfirlemu@bizjournals.com', '3 Wayridge Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aggie Demaine', '2000-07-31 13:37:48', 'Female', 'ademainemv@google.nl', '0 Oriole Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carla Mamwell', '2001-07-10 14:25:30', 'Female', 'cmamwellmw@youku.com', '2 John Wall Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cthrine Birckmann', '2003-06-05 01:21:00', 'Female', 'cbirckmannmx@ning.com', '8 Annamark Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carma Darnbrook', '2002-11-28 12:21:45', 'Female', 'cdarnbrookmy@forbes.com', '67113 Hoard Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Randell Kulic', '2003-05-24 07:41:02', 'Male', 'rkulicmz@github.com', '8722 Briar Crest Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Giffie Parcells', '2000-02-24 20:43:22', 'Male', 'gparcellsn0@gizmodo.com', '18515 Parkside Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Christabella Clamp', '2003-08-01 15:20:55', 'Female', 'cclampn1@wikimedia.org', '3852 Orin Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Garv Matys', '2002-05-09 03:53:07', 'Male', 'gmatysn2@sciencedaily.com', '7691 Main Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kathie Grattan', '2002-11-25 15:23:46', 'Female', 'kgrattann3@barnesandnoble.com', '337 Delladonna Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jillayne Swyer-Sexey', '2003-06-29 18:38:52', 'Female', 'jswyersexeyn4@goo.gl', '39711 Hoard Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gerard Van Leijs', '2003-12-09 16:59:04', 'Male', 'gvann5@umn.edu', '2117 Melvin Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Linnell Georghiou', '2000-10-05 01:34:46', 'Female', 'lgeorghioun6@salon.com', '8 Karstens Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chelsy Luesley', '2002-12-11 15:06:12', 'Female', 'cluesleyn7@google.nl', '679 Sunbrook Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nickola Sexty', '2002-04-03 09:47:18', 'Male', 'nsextyn8@wisc.edu', '34366 Dwight Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Steffie Borgnet', '2001-12-02 17:00:35', 'Female', 'sborgnetn9@redcross.org', '93447 Hermina Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Harris Fairfoull', '2003-05-12 17:46:39', 'Male', 'hfairfoullna@photobucket.com', '40 Sommers Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lory Antrack', '2002-08-24 10:42:03', 'Female', 'lantracknb@jiathis.com', '25 Tennessee Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Christiane O''Rodane', '2002-10-20 16:53:07', 'Female', 'corodanenc@networkadvertising.org', '0 Upham Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Asia Bittleson', '2000-08-31 03:01:57', 'Female', 'abittlesonnd@vimeo.com', '1570 Rutledge Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Florencia Harling', '2000-11-11 15:58:14', 'Female', 'fharlingne@wired.com', '819 Coolidge Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Daisy Jarnell', '2000-05-21 14:00:31', 'Female', 'djarnellnf@xing.com', '922 Dayton Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Inglis Gowdridge', '2003-09-08 04:22:08', 'Male', 'igowdridgeng@ovh.net', '67 Eliot Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chrisy MacGillivrie', '2001-06-06 01:12:22', 'Male', 'cmacgillivrienh@ocn.ne.jp', '38 Corscot Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sybila Borman', '2002-07-28 11:05:50', 'Female', 'sbormanni@lycos.com', '84094 Forest Dale Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Salvador Leggan', '2002-01-10 22:04:48', 'Male', 'sleggannj@ifeng.com', '0511 International Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Devon Hunstone', '2001-02-26 12:10:04', 'Female', 'dhunstonenk@usnews.com', '14 Truax Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sioux McBrearty', '2002-04-07 14:11:52', 'Female', 'smcbreartynl@pagesperso-orange.fr', '89590 Golden Leaf Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Freeman Oxtarby', '2002-07-14 20:27:00', 'Male', 'foxtarbynm@reference.com', '79963 Kenwood Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cecelia Roddick', '2002-06-29 07:05:45', 'Female', 'croddicknn@wsj.com', '93 Dovetail Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jayson Maxworthy', '2003-10-21 14:24:40', 'Male', 'jmaxworthyno@usa.gov', '967 Scoville Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lianne Fassbindler', '2002-11-14 04:18:08', 'Female', 'lfassbindlernp@twitpic.com', '28 Oak Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jayne Whitlock', '2000-08-08 23:06:30', 'Female', 'jwhitlocknq@auda.org.au', '87823 Chive Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Julina Szymaniak', '2001-07-14 06:04:42', 'Female', 'jszymaniaknr@vimeo.com', '03 Haas Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Walker Guerro', '2001-07-24 04:00:42', 'Male', 'wguerrons@ted.com', '7063 Anhalt Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lilly Sinott', '2002-12-27 10:31:21', 'Female', 'lsinottnt@jugem.jp', '09555 Oakridge Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Felipa O'' Molan', '2002-02-18 22:53:02', 'Female', 'fonu@tuttocitta.it', '73262 4th Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aggie Calvard', '2000-08-10 02:49:22', 'Female', 'acalvardnv@ft.com', '5132 Mariners Cove Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Parry Nielson', '2001-11-17 10:08:00', 'Male', 'pnielsonnw@alibaba.com', '526 Sunbrook Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Thorstein Thickett', '2000-03-07 20:43:17', 'Male', 'tthickettnx@printfriendly.com', '50135 Continental Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pammie Arnhold', '2001-04-10 04:57:24', 'Female', 'parnholdny@addtoany.com', '77 Evergreen Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jared Lorryman', '2001-10-26 22:14:21', 'Male', 'jlorrymannz@bloglovin.com', '95 Utah Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Johnathan D''Aguanno', '2003-08-02 14:15:08', 'Male', 'jdaguannoo0@sbwire.com', '1 Shelley Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Doralynne Balshen', '2000-12-01 11:40:41', 'Female', 'dbalsheno1@hp.com', '49725 Oneill Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sabina Stowers', '2002-12-14 00:05:28', 'Female', 'sstowerso2@wunderground.com', '6 Transport Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Quintus Hyde-Chambers', '2003-09-08 12:02:18', 'Male', 'qhydechamberso3@latimes.com', '4866 Kim Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Debi Androsik', '2000-11-09 06:18:06', 'Female', 'dandrosiko4@senate.gov', '43379 Packers Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Boonie Sanders', '2001-02-10 03:09:48', 'Male', 'bsanderso5@paypal.com', '57 Blackbird Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lorrin Cowpe', '2001-09-03 09:40:39', 'Female', 'lcowpeo6@ebay.com', '82651 Manitowish Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fanny Speeks', '2001-08-06 23:34:33', 'Female', 'fspeekso7@google.de', '85 Straubel Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dee dee Agar', '2002-05-29 20:18:12', 'Female', 'ddeeo8@etsy.com', '13448 Randy Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elsi Saville', '2000-04-07 15:46:23', 'Female', 'esavilleo9@dedecms.com', '7898 Chive Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stavros Shurville', '2000-12-09 17:46:32', 'Male', 'sshurvilleoa@typepad.com', '10 Red Cloud Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sonny Bezley', '2003-01-15 23:13:22', 'Male', 'sbezleyob@bing.com', '6 Huxley Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eydie Connachan', '2001-12-10 14:48:17', 'Female', 'econnachanoc@bbc.co.uk', '85876 Magdeline Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Helene Souten', '2001-05-08 13:33:21', 'Female', 'hsoutenod@prnewswire.com', '80 Myrtle Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ethel Mocher', '2001-10-06 06:42:58', 'Female', 'emocheroe@irs.gov', '5236 Loomis Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Betteann Bagger', '2001-09-14 12:24:35', 'Female', 'bbaggerof@wikipedia.org', '456 Mayfield Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Stirling Brignell', '2001-02-08 13:35:45', 'Male', 'sbrignellog@printfriendly.com', '059 Cherokee Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kit Butcher', '2001-04-16 22:43:27', 'Male', 'kbutcheroh@shareasale.com', '09 Sage Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eugenio Standbridge', '2000-09-21 06:30:15', 'Male', 'estandbridgeoi@mayoclinic.com', '375 Dennis Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emelita Dodgson', '2002-06-18 16:54:47', 'Female', 'edodgsonoj@hexun.com', '4 Muir Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Davie Panketh', '2002-07-15 07:26:39', 'Male', 'dpankethok@rakuten.co.jp', '1977 Jenifer Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ferris Dyter', '2000-04-28 19:44:17', 'Male', 'fdyterol@digg.com', '19 Becker Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kendal Connell', '2001-05-19 21:15:42', 'Male', 'kconnellom@weebly.com', '897 Monterey Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jaymie Osman', '2001-12-27 01:04:53', 'Male', 'josmanon@pcworld.com', '1 Beilfuss Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kelci Kenyam', '2000-10-11 05:49:19', 'Female', 'kkenyamoo@biglobe.ne.jp', '14 Northview Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Banky Dmych', '2003-03-06 00:08:58', 'Male', 'bdmychop@cam.ac.uk', '0856 Lunder Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Darline Tessington', '2002-01-10 11:25:33', 'Female', 'dtessingtonoq@yahoo.co.jp', '56 Bunting Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Delora Walker', '2000-08-26 09:55:26', 'Female', 'dwalkeror@go.com', '1 Summit Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Westley Barrett', '2003-07-14 22:54:05', 'Male', 'wbarrettos@addtoany.com', '5 Moulton Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Emilie Bedward', '2001-07-18 06:28:57', 'Female', 'ebedwardot@unc.edu', '455 Sullivan Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kerr Feehely', '2003-12-20 23:28:45', 'Male', 'kfeehelyou@youtu.be', '90 Waubesa Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sanders Barrand', '2003-10-10 05:01:03', 'Male', 'sbarrandov@arstechnica.com', '274 Northview Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Uriel Retchford', '2000-01-05 12:16:50', 'Male', 'uretchfordow@jalbum.net', '5571 Nelson Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gusta McAw', '2002-04-14 03:47:26', 'Female', 'gmcawox@netvibes.com', '18 Bartillon Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ninnette O''Noulane', '2003-12-15 07:21:49', 'Female', 'nonoulaneoy@google.fr', '76982 Delaware Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sibeal Minnock', '2000-03-05 13:18:25', 'Female', 'sminnockoz@ca.gov', '249 Veith Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Taryn MacClancey', '2003-01-27 08:30:28', 'Female', 'tmacclanceyp0@list-manage.com', '9 Elka Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Katherina Gleadhall', '2001-10-29 09:54:49', 'Female', 'kgleadhallp1@bravesites.com', '28844 Barnett Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Vern Brumham', '2002-11-24 10:01:09', 'Male', 'vbrumhamp2@odnoklassniki.ru', '70 Manley Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ivy Zmitrovich', '2001-11-01 00:41:25', 'Female', 'izmitrovichp3@free.fr', '65449 Amoth Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ephraim Orviss', '2002-12-21 13:27:16', 'Male', 'eorvissp4@weibo.com', '5 Dixon Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dallis Crolly', '2000-06-21 14:30:50', 'Male', 'dcrollyp5@instagram.com', '708 Russell Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bartel Petley', '2000-12-11 03:24:20', 'Male', 'bpetleyp6@paypal.com', '48 Ronald Regan Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ferrell Wooller', '2003-07-24 20:41:52', 'Male', 'fwoollerp7@loc.gov', '93023 Kim Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Mendie Fawson', '2000-10-09 18:56:49', 'Male', 'mfawsonp8@admin.ch', '9205 Arapahoe Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Page Willshire', '2001-03-30 05:00:05', 'Female', 'pwillshirep9@archive.org', '326 Drewry Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Terence Ference', '2002-11-08 20:52:20', 'Male', 'tferencepa@theatlantic.com', '399 Dennis Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Morie Royall', '2001-02-13 22:58:03', 'Male', 'mroyallpb@zdnet.com', '2926 Sage Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Giselbert Kobes', '2003-03-23 18:19:40', 'Male', 'gkobespc@ameblo.jp', '192 Montana Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kristan Lapree', '2001-12-08 01:11:56', 'Female', 'klapreepd@ihg.com', '08 Grover Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Suellen Kop', '2000-07-07 07:21:20', 'Female', 'skoppe@sina.com.cn', '17459 North Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sherye Tantum', '2003-08-29 00:34:44', 'Female', 'stantumpf@google.pl', '5 Kensington Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Isahella Dawby', '2002-02-15 06:29:19', 'Female', 'idawbypg@fc2.com', '34749 Garrison Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pace Tomney', '2001-04-30 01:36:32', 'Male', 'ptomneyph@symantec.com', '191 Sycamore Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Patric Capron', '2000-10-24 09:01:04', 'Male', 'pcapronpi@biglobe.ne.jp', '05368 Tennyson Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Tracey D''eathe', '2001-03-22 09:04:21', 'Female', 'tdeathepj@wp.com', '52193 Butternut Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Traver Bilsford', '2003-09-07 18:55:54', 'Male', 'tbilsfordpk@dell.com', '1387 Doe Crossing Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kayla Doyley', '2001-10-25 07:17:03', 'Female', 'kdoyleypl@flickr.com', '12497 Maryland Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jaclyn Bottelstone', '2001-11-04 04:20:43', 'Female', 'jbottelstonepm@blog.com', '8 Forster Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Bennett Leggat', '2001-04-01 23:33:33', 'Male', 'bleggatpn@lulu.com', '98 Hanover Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jeromy Thrasher', '2001-09-02 18:15:13', 'Male', 'jthrasherpo@bravesites.com', '7666 Summerview Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Flossy Farreil', '2001-12-19 21:45:50', 'Female', 'ffarreilpp@mayoclinic.com', '9991 Bonner Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Edlin Kelland', '2001-09-10 21:58:19', 'Male', 'ekellandpq@google.it', '79053 Artisan Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Carlina Hassard', '2000-01-01 14:41:05', 'Female', 'chassardpr@mozilla.org', '58 Cherokee Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rudolph Servis', '2001-07-05 14:26:01', 'Male', 'rservisps@washington.edu', '3761 Comanche Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Demetrius Liccardo', '2002-05-31 23:42:40', 'Male', 'dliccardopt@google.com.br', '8929 Mendota Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Konstantin Meardon', '2000-03-17 11:06:55', 'Male', 'kmeardonpu@baidu.com', '7 Armistice Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Giavani McCrillis', '2000-08-21 05:34:49', 'Male', 'gmccrillispv@ted.com', '1 Kensington Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kevyn Giovannacc@i', '2001-04-23 23:36:07', 'Female', 'kgiovannaccipw@xrea.com', '82083 Trailsway Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Barris McPhail', '2002-03-23 10:36:09', 'Male', 'bmcphailpx@youku.com', '369 Anhalt Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Sherill Pelosi', '2000-06-26 13:55:54', 'Female', 'spelosipy@chicagotribune.com', '48 Vahlen Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Braden Ansteys', '2000-09-02 10:44:39', 'Male', 'bansteyspz@rambler.ru', '7193 Parkside Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lockwood Zanneli', '2003-08-03 21:08:40', 'Male', 'lzanneliq0@ucsd.edu', '54 Shopko Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Hugo Klugel', '2003-11-11 00:34:09', 'Male', 'hklugelq1@domainmarket.com', '6 Blaine Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Francine Skoggins', '2001-06-23 01:18:49', 'Female', 'fskogginsq2@dagondesign.com', '53 Waxwing Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Enrique Krook', '2000-04-30 02:38:05', 'Male', 'ekrookq3@tuttocitta.it', '98 Starling Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maryanna Dolohunty', '2003-01-29 02:21:34', 'Female', 'mdolohuntyq4@flavors.me', '59712 Evergreen Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pam Grizard', '2000-01-18 14:53:16', 'Female', 'pgrizardq5@google.com', '26183 Pennsylvania Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lorry Caplan', '2001-03-30 15:30:44', 'Male', 'lcaplanq6@dyndns.org', '6701 Marquette Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Walker Potbury', '2000-02-02 22:56:45', 'Male', 'wpotburyq7@youtube.com', '31 Bay Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cello Carlisi', '2003-03-18 16:47:43', 'Male', 'ccarlisiq8@indiatimes.com', '886 American Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gusella Inskipp', '2000-12-16 16:06:21', 'Female', 'ginskippq9@epa.gov', '407 Bunker Hill Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pamela Karpmann', '2001-08-29 23:09:53', 'Female', 'pkarpmannqa@ucla.edu', '52296 Sherman Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gertrude Casin', '2000-01-04 14:05:36', 'Female', 'gcasinqb@123-reg.co.uk', '42640 Elka Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Saundra Stoodale', '2000-12-17 03:02:49', 'Male', 'sstoodaleqc@sourceforge.net', '0803 Browning Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Grenville Pridding', '2000-11-23 22:17:11', 'Male', 'gpriddingqd@angelfire.com', '3313 North Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Olly Jellings', '2000-05-09 11:45:08', 'Male', 'ojellingsqe@ibm.com', '5194 Meadow Vale Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brooke Fiveash', '2002-03-18 04:16:48', 'Female', 'bfiveashqf@wikimedia.org', '00 Ridge Oak Plaza');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jan Gateley', '2000-08-20 10:29:36', 'Female', 'jgateleyqg@boston.com', '5 Morning Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dee Kirrens', '2003-12-03 05:57:54', 'Female', 'dkirrensqh@sohu.com', '0854 Miller Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Eziechiele McConway', '2002-06-19 18:32:57', 'Male', 'emcconwayqi@state.gov', '62 Graceland Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chelsie Ferri', '2003-12-20 16:29:41', 'Female', 'cferriqj@springer.com', '103 Melody Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shana Poole', '2001-10-03 09:36:37', 'Female', 'spooleqk@ovh.net', '549 Eggendart Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elsa Chatten', '2002-08-30 06:24:12', 'Female', 'echattenql@pen.io', '063 Fairview Crossing');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Rriocard Greenman', '2001-12-29 22:31:57', 'Male', 'rgreenmanqm@omniture.com', '00643 Trailsway Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Meredith Easlea', '2003-10-20 19:08:34', 'Female', 'measleaqn@over-blog.com', '76 2nd Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Batholomew Francklin', '2003-02-26 05:51:41', 'Male', 'bfrancklinqo@pinterest.com', '30137 Sherman Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Zacharias Abba', '2002-09-30 03:59:59', 'Male', 'zabbaqp@about.com', '4681 Del Mar Road');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lyell Rosone', '2002-10-08 06:17:19', 'Male', 'lrosoneqq@sakura.ne.jp', '353 Lien Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chase Geistmann', '2000-12-05 01:55:12', 'Male', 'cgeistmannqr@simplemachines.org', '3522 Rutledge Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Cathrin Chesney', '2001-05-06 13:49:01', 'Female', 'cchesneyqs@scribd.com', '47229 Luster Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Loella Calcott', '2001-02-07 17:53:19', 'Female', 'lcalcottqt@mozilla.org', '2 Hallows Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brietta Duferie', '2001-09-12 18:25:44', 'Female', 'bduferiequ@go.com', '72 Drewry Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gretta Fulop', '2003-10-16 23:03:20', 'Female', 'gfulopqv@guardian.co.uk', '7516 Lotheville Court');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jacynth O''Caherny', '2000-05-29 17:37:23', 'Female', 'jocahernyqw@ycombinator.com', '8 Scott Junction');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Brietta Traves', '2003-04-10 02:30:27', 'Female', 'btravesqx@naver.com', '81087 Fair Oaks Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jackie Cochran', '2001-02-14 13:37:19', 'Female', 'jcochranqy@xing.com', '939 Kipling Center');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Doe Crane', '2002-07-15 20:25:05', 'Female', 'dcraneqz@google.de', '8229 5th Trail');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Nedi Pryor', '2000-10-14 00:35:39', 'Female', 'npryorr0@usa.gov', '871 Truax Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Haydon Filkin', '2000-01-08 07:25:28', 'Male', 'hfilkinr1@guardian.co.uk', '30877 Dawn Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Fleur Stranger', '2000-12-29 21:54:19', 'Female', 'fstrangerr2@upenn.edu', '34630 Di Loreto Lane');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maddy Malek', '2002-05-22 10:43:49', 'Female', 'mmalekr3@yahoo.com', '24 Mccormick Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aaren Janikowski', '2001-11-01 02:43:58', 'Female', 'ajanikowskir4@dropbox.com', '28 Barnett Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Dido Torbeck', '2002-05-21 09:58:40', 'Female', 'dtorbeckr5@smugmug.com', '66 Aberg Drive');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Karita Yes', '2001-02-12 23:08:49', 'Female', 'kyesr6@hubpages.com', '6 Dayton Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Maddy Rostron', '2001-10-05 05:56:21', 'Female', 'mrostronr7@weather.com', '68366 Homewood Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gabriellia Carrane', '2003-10-11 16:31:23', 'Female', 'gcarraner8@prweb.com', '7486 Erie Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Karlik Glaysher', '2000-04-26 10:07:44', 'Male', 'kglaysherr9@netvibes.com', '391 Acker Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ebenezer Lowes', '2001-01-25 02:16:15', 'Male', 'elowesra@sfgate.com', '87200 Meadow Ridge Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Marcel Harvison', '2000-10-27 03:27:45', 'Male', 'mharvisonrb@homestead.com', '3358 Daystar Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Baldwin Gelderd', '2000-10-16 06:16:57', 'Male', 'bgelderdrc@joomla.org', '32810 Bluejay Avenue');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ginni Beardsall', '2001-08-05 20:37:33', 'Female', 'gbeardsallrd@walmart.com', '590 Ridgeview Parkway');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Lynsey Kerin', '2001-08-30 22:39:59', 'Female', 'lkerinre@mapy.cz', '24907 Arapahoe Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Ivett Newbatt', '2000-02-21 09:12:55', 'Female', 'inewbattrf@4shared.com', '6650 Pleasure Way');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Kingston Hawarden', '2000-06-23 22:33:36', 'Male', 'khawardenrg@cisco.com', '8 Graceland Park');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Elliot Keslake', '2003-05-02 07:26:05', 'Male', 'ekeslakerh@cnn.com', '49057 Lukken Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Jarib Romanin', '2002-03-17 13:07:24', 'Male', 'jromaninri@rediff.com', '318 New Castle Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Morna Dowey', '2003-04-21 01:44:35', 'Female', 'mdoweyrj@opensource.org', '460 Dunning Point');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Chery Pease', '2000-08-08 18:31:34', 'Female', 'cpeaserk@noaa.gov', '9 Marquette Pass');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Garrik Heaslip', '2000-07-13 11:36:55', 'Male', 'gheasliprl@photobucket.com', '01 Menomonie Hill');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Aldus Pennuzzi', '2002-02-05 19:56:59', 'Male', 'apennuzzirm@storify.com', '37 Clove Alley');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Pierce Haimes', '2002-06-10 10:12:22', 'Male', 'phaimesrn@etsy.com', '0 Ilene Street');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Shannan Hirtz', '2001-09-12 02:37:28', 'Male', 'shirtzro@plala.or.jp', '53291 Caliangt Circle');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Katrinka Wigzell', '2001-07-19 13:40:13', 'Female', 'kwigzellrp@livejournal.com', '09880 Everett Place');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Gabbey Staite', '2003-12-26 11:33:24', 'Female', 'gstaiterq@aol.com', '777 Sloan Terrace');
insert into HocSinh (HoTen, NgaySinh, GioiTinh, Email, DiaChi) values ('Beth Grishanin', '2001-08-25 01:35:16', 'Female', 'bgrishaninrr@auda.org.au', '60158 Grasskamp Hill');


--Nhap Nam Hoc
insert into NamHoc (TenNamHoc) values ('2013-2016');
insert into NamHoc (TenNamHoc) values ('2014-2017');
insert into NamHoc (TenNamHoc) values ('2015-2018');

--Nhap Khoi
insert into Khoi (TenKhoi) values ('Khoi 10')
insert into Khoi (TenKhoi) values ('Khoi 11')
insert into Khoi (TenKhoi) values ('Khoi 12')
GO

CREATE TRIGGER Check_Lop
ON dbo.Lop
FOR INSERT, UPDATE
AS
	IF((SELECT COUNT(*)FROM dbo.Lop)>40)
BEGIN
	PRINT 'Khong the them hoc sinh'
	ROLLBACK TRAN
END

CREATE TRIGGER Check_Tuoi 
ON Hocsinh
FOR INSERT, UPDATE
as 
	declare @ngaysinh date
	select @ngaysinh=NgaySinh from inserted
	if((DATEPART(yyyy,GETDATE()) - DATEPART(yyyy,@ngaysinh)<15) or (DATEPART(yyyy,GETDATE()) - DATEPART(yyyy,@ngaysinh)>20) )
		begin
		print 'tuoi phai trong khoang tu 15 den 20'
		rollback tran
		end

		insert into HocSinh(NgaySinh) values(getdate())

CREATE TRIGGER Check_Diem
ON DiemMon
FOR INSERT, UPDATE
as 
	declare @DiemMonHoc float
	select @DiemMonHoc=DiemMonHoc from inserted
	if(((@DiemMonHoc)>=0) or ((@DiemMonHoc)<=10))
		begin
		print 'diem phai trong khoang tu 0 den 10 ' 
		rollback tran
		end



