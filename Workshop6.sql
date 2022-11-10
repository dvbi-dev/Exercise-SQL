use master;
go
if exists(select * from sys.databases where name='CsdlCongty')
drop database CsdlCongty;
go
create database CsdlCongty;
go
use CsdlCongty;
go
create table NHANVIEN (
	Ho	varchar(15),
	Dem	varchar(15),
	Ten	varchar(15),
	MaNV	char(9),
	NgSinh	date,
	DChi	varchar(30),
	GTinh	varchar(3),
	Luong	real,
	MaGS	char(9),
	MaPhong int,
	constraint NHANVIEN_PK	primary key (MaNV),
	constraint NHANVIEN_FK_NHANVIEN foreign key (MaGS) references NHANVIEN (MaNV),
	constraint NHANVIEN_DM_Phai check (GTinh in ('F', 'f', 'M', 'm'))	
);

create table PHONGBAN (
	TenPB	varchar(15),
	MaPB	int,
	TrPhong	char(9),
	NgNhanChuc	date,
	constraint PHONGBAN_PK primary key (MaPB),
	constraint PHONGBAN_FK_NHANVIEN foreign key (TrPhong) references NHANVIEN (MaNV)
);

alter table NHANVIEN
add constraint NHANVIEN_FK_PHONGBAN foreign key (MaPhong) references PHONGBAN (MaPB);

create table TRUSO__PHONG (
	MaPhong	int,
	Truso	varchar(15),
	constraint DIADIEM_PHG_PK primary key (MaPhong, Truso),
	constraint DIADIEM_PHG_FK_PHONGBAN foreign key (MaPhong) references PHONGBAN (MaPB)
);

create table DUAN (
	TenDA	varchar(15),
	MaDA	int,
	Diadiem	varchar(15),
	PhQuanly	int,
	constraint DUAN_PK primary key (MaDA),
	constraint DUAN_FK_PHONGBAN foreign key (PhQuanly) references PHONGBAN (MaPB)
);

create table THAMGIA (
	MaNV	char(9),
	MaDA	int,
	SoGio	decimal(6,1),
	constraint PHANCONG_PK primary key (MaNV, MaDA),
	constraint PHANCONG_FK_NHANVIEN foreign key (MaNV) references NHANVIEN (MaNV),
	constraint PHANCONG_FK_DUAN foreign key (MaDA) references DUAN (MaDA)
);

create table THANNHAN (
	MaNV	char(9),
	TenTN	varchar(15),
	GTinh	varchar(3),
	NgSinh	date,
	Quanhe	varchar(8),
	constraint THANNHAN_PK primary key (MaNV, TenTN),
	constraint THANNHAN_FK_NHANVIEN foreign key (MaNV) references NHANVIEN (MaNV),
	constraint THANNHAN_DM_Phai check (GTinh in ('M', 'm', 'F', 'f'))
);

-- chen du lieu PHONGBAN
insert into PHONGBAN values ('Nghien cuu',5,null,null);
insert into PHONGBAN values ('Dieu hanh',4,null,null);
insert into PHONGBAN values ('Quan ly',1,null,null);

-- chen du lieu NHANVIEN
insert into NHANVIEN values ('Le','Van','Bo','888665555','1937-11-10','450 Trung Vuong, Ha Noi','M',55000,null,1);
insert into NHANVIEN values ('Phan','Van','Nghia','333445555','1955-12-08','638 Nguyen Van Cu, Q5, TpHCM','M',40000,'888665555',5);
insert into NHANVIEN values ('Nguyen','Bao','Hung','123456789','1965-01-09','731 Tran Hung Dao, Q1, TpHCM','M',30000,'333445555',5);
insert into NHANVIEN values ('Tran',null,'Nam','666884444','1962-09-15','975 Ba Ria Vung Tau','M',38000,'333445555',5);
insert into NHANVIEN values ('Hoang','Kim','Yen','453453453','1972-07-31','543 Mai Thi Luu, Q1, TpHCM','F',25000,'333445555',5);
insert into NHANVIEN values ('Du','Thi','Hau','987654321','1951-06-20','291 Ho Van Hue, QPN, TpHCM','F',43000,'888665555',4);
insert into NHANVIEN values ('Au',null,'Vuong','999887777','1968-07-19','332 Nguyen Thai Hoc, Q1, TpHCM','F',25000,'987654321',4);
insert into NHANVIEN values ('Nguyen','Van','Giap','987987987','1969-03-09','980 Le Hong Phong, Q10, TpHCM','M',25000,'987654321',4);

-- chinh sua du lieu PHONGBAN
update PHONGBAN
set TrPhong='888665555',NgNhanChuc='1981-06-19'
where MaPB=1;
update PHONGBAN
set TrPhong='987987987',NgNhanChuc='1995-01-01'
where MaPB=4;
update PHONGBAN
set TrPhong='333445555',NgNhanChuc='1988-05-22'
where MaPB=5;

-- chen du lieu TruSO_Phong
insert into TRUSO__PHONG values (1,'Phu Nhuan');
insert  into TRUSO__PHONG values (4,'Go Vap');
insert  into TRUSO__PHONG values (5,'Tan Binh');
insert into TRUSO__PHONG values (5,'Phu Nhuan');
insert into TRUSO__PHONG values (5,'Thu Duc');

-- chen du lieu DUAN
insert into DUAN values ('San pham X',1,'Tan Binh',5);
insert into DUAN values ('San pham Y',2,'Thu Duc',5);
insert into DUAN values ('San pham Z',3,'Phu Nhuan',5);
insert into DUAN values ('Tin hoc hoa',10,'Go Vap',4);
insert into DUAN values ('Tai to chuc',20,'Phu Nhuan',1);
insert into DUAN values ('Phuc loi',30,'Go Vap',4);

-- chen du lieu PHANCONG
insert into THAMGIA values ('123456789',1,32.5);
insert into THAMGIA values ('123456789',2,7.5);
insert into THAMGIA values ('666884444',3,40);
insert into THAMGIA values ('453453453',1,20);
insert into THAMGIA values ('453453453',2,20);
insert into THAMGIA values ('333445555',2,10);
insert into THAMGIA values ('333445555',3,10);
insert into THAMGIA values ('333445555',10,10);
insert into THAMGIA values ('333445555',20,10);
insert into THAMGIA values ('999887777',30,30);
insert into THAMGIA values ('999887777',10,10);
insert into THAMGIA values ('987987987',10,35);
insert into THAMGIA values ('987987987',30,5);
insert into THAMGIA values ('987654321',30,20);
insert into THAMGIA values ('987654321',20,15);
insert into THAMGIA values ('888665555',20,null);

-- chen du lieu THANNHAN
insert into THANNHAN values ('333445555','Anh','F','1986-04-05','Con gai');
insert into THANNHAN values ('333445555','The','M','1983-10-25','Con trai');
insert into THANNHAN values ('333445555','Loi','F','1958-05-03','Vo');
insert into THANNHAN values ('987654321','An','M','1942-02-28','Chong');
insert into THANNHAN values ('123456789','Minh','M','1988-01-01','Con trai');
insert into THANNHAN values ('123456789','Anh','F','1988-12-30','Con gai');
insert into THANNHAN values ('123456789','Yen','F','1967-05-05','Vo');



go
--1
select NgSinh,DChi
from NHANVIEN
where Ho like 'Nguyen' and Dem like 'Bao' and Ten like'Hung';
--2
select Ten,Dchi
from NHANVIEN,PHONGBAN
where PHONGBAN.MaPB=NHANVIEN.MaPhong and MaPB=5
--3
select MaDA,TenDA,PhQuanLy,Ten,DChi,NgSinh
from NHANVIEN,PHONGBAN,DUAN
where NHANVIEN.MaNV=PHONGBAN.TrPhong and NHANVIEN.MaPhong=DUAN.PhQuanly and MaDA=10
--4
select distinct N1.Ho,N1.Ten,N2.Ho as Ho_GS,N2.Ten as Ten_GS
from NHANVIEN N1, NHANVIEN N2,PHONGBAN
where  N2.MaGS=PHONGBAN.TrPhong  
--5
select*from NHANVIEN
--6
select Ho,Ten,Luong
from NHANVIEN
--7
select Ho,Dem,Ten,MaNV,NgSinh,DChi,GTinh,Luong,MaGS
from NHANVIEN,TRUSO__PHONG
where NHANVIEN.MaPhong=TRUSO__PHONG.MaPhong and Truso like 'Phu Nhuan'
--8
select*from NHANVIEN
where Year(NgSinh)>=1950 and year(NgSinh)<=1959
--9
select Ho,Dem,Ten,Luong+(Luong*0.1) as [Luong moi]
from NHANVIEN,DUAN
where  NHANVIEN.MaPhong=DUAN.PhQuanly and TenDA like'San pham X';
--10
select *from NHANVIEN
where Luong>=30000 and Luong<=50000;
--11
select Ho,Ten,TenDA
from NHANVIEN,DUAN
where NHANVIEN.MaPhong=DUAN.PhQuanly
order by PhQuanly desc ,Ten asc
--12
select Ho,Ten
from NHANVIEN,PHONGBAN
where MaGS=TrPhong and MaGS=null;
--13
SELECT Ho,Ten FROM NHANVIEN INNER JOIN THANNHAN ON NHANVIEN.MaNV=THANNHAN.MaNV
WHERE Ten=TenTN and NHANVIEN.GTinh=THANNHAN.GTinh;
--14
select distinct Ho,Ten
from NHANVIEN,DUAN
where PhQuanly=MaPhong and MaPhong=5;
--15
select Ho,Ten
from NHANVIEN
where not exists (select*from THANNHAN where NHANVIEN.MaNV=THANNHAN.MaNV )
--16
SELECT Ho,Ten FROM NHANVIEN WHERE MaNV IN (SELECT TrPhong FROM PHONGBAN WHERE MaNV=PHONGBAN.TrPhong)
AND  MaNV IN (SELECT MaNV FROM THANNHAN WHERE THANNHAN.MaNV=THANNHAN.MaNV);
--17
select distinct MaNV
from NHANVIEN,DUAN
where PhQuanly=MaPhong and MaDA=1 and MaDA=2 or MaDA=3;
--18
select SUM(Luong) as [Tong_Luong],MAX(Luong) as LUONGCAONHAT,MIN(Luong) as LUONGTHAPNHAT,AVG(Luong) as LUONGTRUNGBINH
from NHANVIEN
--19
select SUM(Luong) as [Tong_Luong],MAX(Luong) as LUONGCAONHAT,MIN(Luong) as LUONGTHAPNHAT,AVG(Luong) as LUONGTRUNGBINH
from NHANVIEN,PHONGBAN
where NHANVIEN.MaPhong=PHONGBAN.MaPB and MaPB=5;
--20
select Count(*) as SONV_NGHIENCUU
from NHANVIEN,PHONGBAN
where NHANVIEN.MaPhong=PHONGBAN.MaPB and MaPB=5
--21
select COUNT(Luong) as LUONGRIENGBIER
from NHANVIEN
--22
select MaPB,COunt(*) as TONGNV, AVG(Luong) as Luongtrungbinh
from NHANVIEN,PHONGBAN
where NHANVIEN.MaPhong=PHONGBAN.MaPB
group by MaPB

--23
select MaDA,TenDA,count(*) as SONV
from NHANVIEN,DUAN
where NHANVIEN.MaPhong=DUAN.PhQuanly 
group by MaDA,TenDA
--24
select MaDA,TenDA,count(*) as SONV
from NHANVIEN,DUAN
where NHANVIEN.MaPhong=DUAN.PhQuanly 
group by MaDA,TenDA
having count(*)>2
--25
select MaDA,TenDA,count(*) as SONV_PhSo5
from NHANVIEN,DUAN
where NHANVIEN.MaPhong=DUAN.PhQuanly and MaPhong=5
group by MaDA,TenDA
--26
select MaPB,count(*) as SONV
from NHANVIEN,PHONGBAN
where NHANVIEN.MaPhong=PHONGBAN.MaPB and Luong>40000
group by MaPB
having count(*)>5 
--27
SELECT TenPB,COUNT(*) AS SOLUONGNHANVIEN,AVG(Luong) AS LUONGTRUNGBINH FROM NHANVIEN,PHONGBAN
WHERE MaPhong=MaPB GROUP BY TenPB HAVING AVG(LUONG)>30000;
--28
SELECT TenPB,COUNT(GTinh) AS SOLUONGNHANVIENNam,AVG(Luong) AS LUONGTRUNGBINH FROM NHANVIEN,PHONGBAN
WHERE MaPhong=MaPB and GTinh like 'M' GROUP BY TenPB HAVING AVG(LUONG)>30000;