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
	NgaySinh date,
	GioiTinh nvarchar(10),
	Email varchar(50),
	DiaChi nvarchar(50),
	IDLogin varchar(50),
	Pass varchar(50),
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
	MaHocKy int ,
	Diem15phut float,
	Diem1Tiet float,
	DiemHK float,
	DiemTB float
)

create table GiaoVien
(
	MaGiaoVien int identity constraint PK_GiaoVien primary key,
	TenGiaoVien nvarchar(50),
	DiaChi nvarchar (50),
	DienThoai varchar(50),
	IDLogin varchar(50),
	Pass varchar(50),
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

--Nhap Nam Hoc
insert into NamHoc (TenNamHoc) values ('2013-2016');
insert into NamHoc (TenNamHoc) values ('2014-2017');
insert into NamHoc (TenNamHoc) values ('2015-2018');

--Nhap Khoi
insert into Khoi (TenKhoi) values ('Khoi 10')
insert into Khoi (TenKhoi) values ('Khoi 11')
insert into Khoi (TenKhoi) values ('Khoi 12')

--Nhap Mon
insert into MonHoc (TenMon) values (N'Toán');
insert into MonHoc (TenMon) values (N'Lý');
insert into MonHoc (TenMon) values (N'Hóa');
insert into MonHoc (TenMon) values (N'Sinh');
insert into MonHoc (TenMon) values (N'Sử');
insert into MonHoc (TenMon) values (N'Địa');
insert into MonHoc (TenMon) values (N'Văn');
insert into MonHoc (TenMon) values (N'Đạo Đức');
insert into MonHoc (TenMon) values (N'Thể Dục');


--Trigger check tuoi
GO
CREATE TRIGGER Check_Tuoi 
ON HocSinh
FOR INSERT, UPDATE
as 
	declare @ngaysinh date
	SET @ngaysinh= (SELECT NgaySinh from Inserted )
	IF (YEAR(GETDATE()) - YEAR(@ngaysinh)<15) or (YEAR(GETDATE()) - YEAR(@ngaysinh)>20)
BEGIN
	PRINT'tuoi phai trong khoang tu 15 den 20'
	ROLLBACK TRAN
END

--Trigger check Diem
GO
CREATE TRIGGER Check_Diem15phut
ON DiemMon
FOR INSERT, UPDATE
as 
	declare @DiemMonHoc float
	select @DiemMonHoc=Diem15phut from inserted
	if(((@DiemMonHoc)<0) or ((@DiemMonHoc)>10))
		begin
		print 'diem phai trong khoang tu 0 den 10 ' 
		rollback tran
		end

GO
CREATE TRIGGER Check_Diem1Tiet
ON DiemMon
FOR INSERT, UPDATE
as 
	declare @DiemMonHoc float
	select @DiemMonHoc=Diem1Tiet from inserted
	if(((@DiemMonHoc)<0) or ((@DiemMonHoc)>10))
		begin
		print 'diem phai trong khoang tu 0 den 10 ' 
		rollback tran
		END
		
GO
CREATE TRIGGER Check_DiemHK
ON DiemMon
FOR INSERT, UPDATE
as 
	declare @DiemMonHoc float
	select @DiemMonHoc=DiemHK from inserted
	if(((@DiemMonHoc)<0) or ((@DiemMonHoc)>10))
		begin
		print 'diem phai trong khoang tu 0 den 10 ' 
		rollback tran
		END
		
INSERT INTO dbo.GiaoVien
        ( TenGiaoVien ,
          DiaChi ,
          DienThoai ,
          IDLogin ,
          Pass ,
          MaMon
        )
VALUES  ( N'ABC' , -- TenGiaoVien - nvarchar(50)
          N'ZYX' , -- DiaChi - nvarchar(50)
          '15132' , -- DienThoai - varchar(50)
          '',
          '',
          1 -- MaMon - int
        )
	
INSERT INTO dbo.Lop
        ( MaKhoi ,
          MaNamHoc ,
          TenLop ,
          MaGiaoVien ,
          SiSo
        )
VALUES  ( 1, -- MaKhoi - int
          1 , -- MaNamHoc - int
          'Lop 10A2' , -- TenLop - varchar(50)
          1 , -- MaGiaoVien - int
          0  -- SiSo - float
        )
	     

  --drop proc sp_NhapHS --
GO       
CREATE PROC sp_NhapHS @MaHS INT, @HoTen NVARCHAR(50), @NgaySinh DATE, @GioiTinh NVARCHAR(50), @Email VARCHAR(50), @DiaChi NVARCHAR(50), @IDLogin varchar(50), @Pass varchar(50), @MaLop INT  
AS 
BEGIN 
	IF NOT EXISTS(SELECT * FROM dbo.Lop WHERE MaLop = @MaLop)
		RAISERROR('lop nay khong ton tai',16,1)
	ELSE IF EXISTS(SELECT * FROM dbo.Lop WHERE SiSo >= 40)
		RAISERROR('Lop da day',16,1)
	ELSE IF EXISTS(SELECT * FROM dbo.HocSinh WHERE MaHS = @MaHS)
		RAISERROR('Trung khoa chinh',16,1)
	ELSE
		BEGIN
			INSERT INTO HocSinh
			VALUES(@HoTen,@NgaySinh,@GioiTinh,@Email,@DiaChi,@IDLogin,@Pass,@MaLop)
			UPDATE dbo.Lop
			SET SiSo = SiSo + 1
			WHERE MaLop=@MaLop
		END
END

EXEC dbo.sp_NhapHS
	@MaHS = 5,   
	@HoTen = N'Kiến An', -- nvarchar(50)
    @NgaySinh = '3/1/2002', -- date
    @GioiTinh = N'Bê Đê', -- nvarchar(50)
    @Email = 'asdasdasdasd', -- varchar(50)
    @DiaChi = N'sadasdasdasd', -- nvarchar(50)
    @IDLogin = '',
    @Pass = '',
    @MaLop = 1 -- int
    
select * from HocSinh
select * from Lop
select * from GiaoVien

    
INSERT INTO dbo.Admin
        ( UserAdmin, PassAdmin, HoTen )
VALUES  ( 'HS', -- UserAdmin - varchar(30)
          '123', -- PassAdmin - varchar(30)
          N'Bùi Quang Tiến'  -- HoTen - nvarchar(50)
          )
     
select * from Admin