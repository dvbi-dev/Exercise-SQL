use master;
go
if exists(select * from sys.databases where name='CsdlHangkhong')
drop database CsdlHangkhong;
go
create database CsdlHangkhong;
go
use CsdlHangkhong;
go

create table CHUYENBAY (
	MaCB char(5),
	GaDi varchar(50),
	GaDen varchar(50),
	DoDai int,
	GioDi datetime,
	GioDen datetime,
	ChiPhi int,
	constraint CHUYENBAY_PK primary key (MaCB)
);

create table MAYBAY (
	MaMB int,
	Loai varchar(50),
	TamBay int,
	constraint MAYBAY_PK primary key (MaMB)
);

create table NHANVIEN (
	MaNV char(9),
	Ten varchar(50),
	Luong int,
	constraint NHANVIEN_PK primary key (MaNV)
);

create table CHUNGNHAN (
	MaNV char(9),
	MaMB int,
	constraint CHUNGNHAN_PK primary key (MaNV, MaMB),
	constraint CHUNGNHAN_NHANVIEN_FK foreign key (MaNV) references NHANVIEN (MaNV),
	constraint CHUNGNHAN_MAYBAY_FK foreign key (MaMB) references MAYBAY (MaMB)
);

-- chen du lieu CHUYENBAY
insert into CHUYENBAY values ('VN431','SGN','CAH',3693,'05:55:00','06:55:00',236);
insert into CHUYENBAY values ('VN320','SGN','DAD',2798,'06:00:00','07:10:00',221);
insert into CHUYENBAY values ('VN464','SGN','DLI',2002,'07:20:00','08:05:00',225);
insert into CHUYENBAY values ('VN216','SGN','DIN',4170,'10:30:00','14:20:00',262);
insert into CHUYENBAY values ('VN280','SGN','HPH',11979,'06:00:00','08:00:00',1279);
insert into CHUYENBAY values ('VN254','SGN','HUI',8765,'18:40:00','20:00:00',781);
insert into CHUYENBAY values ('VN338','SGN','BMV',4081,'15:25:00','16:25:00',375);
insert into CHUYENBAY values ('VN440','SGN','BMV',4081,'18:30:00','19:30:00',426);
insert into CHUYENBAY values ('VN651','DAD','SGN',2798,'19:30:00','08:00:00',221);
insert into CHUYENBAY values ('VN276','DAD','CXR',1283,'09:00:00','12:00:00',203);
insert into CHUYENBAY values ('VN374','HAN','VII',510,'11:40:00','13:25:00',120);
insert into CHUYENBAY values ('VN375','VII','CXR',752,'14:15:00','16:00:00',181);
insert into CHUYENBAY values ('VN269','HAN','CXR',1262,'14:10:00','15:50:00',202);
insert into CHUYENBAY values ('VN315','HAN','DAD',134,'11:45:00','13:00:00',112);
insert into CHUYENBAY values ('VN317','HAN','UIH',827,'15:00:00','16:15:00',190);
insert into CHUYENBAY values ('VN741','HAN','PXU',395,'06:30:00','08:30:00',120);
insert into CHUYENBAY values ('VN474','PXU','PQC',1586,'08:40:00','11:20:00',102);
insert into CHUYENBAY values ('VN476','UIH','PQC',485,'09:15:00','11:50:00',117);

-- chen du lieu MAYBAY
insert into MAYBAY values (747,'Boeing 747 - 400',13488);
insert into MAYBAY values (737,'Boeing 737 - 800',5413);
insert into MAYBAY values (380,'Airbus A380 - 500',15000);
insert into MAYBAY values (340,'Airbus A340 - 300',11392);
insert into MAYBAY values (757,'Boeing 757 - 300',6416);
insert into MAYBAY values (777,'Boeing 777 - 300',10306);
insert into MAYBAY values (767,'Boeing 767 - 400ER',10360);
insert into MAYBAY values (320,'Airbus A320',4168);
insert into MAYBAY values (319,'Airbus A319',2888);
insert into MAYBAY values (727,'Boeing 727',2406);
insert into MAYBAY values (154,'Tupolev 154',6565);

-- chen du lieu NHANVIEN
insert into NHANVIEN values ('242518965','Tran Van Son',120433);
insert into NHANVIEN values ('141582651','Doan Thi Mai',178345);
insert into NHANVIEN values ('011564812','Ton Van Quy',153972);
insert into NHANVIEN values ('567354612','Quan Cam Ly',256481);
insert into NHANVIEN values ('552455318','La Que',101745);
insert into NHANVIEN values ('550156548','Nguyen Thi Cam',205187);
insert into NHANVIEN values ('390487451','Le Van Luat',212156);
insert into NHANVIEN values ('274878974','Mai Quoc Minh',99890);
insert into NHANVIEN values ('254099823','Nguyen Thi Quynh',24450);
insert into NHANVIEN values ('356187925','Nguyen Vinh Bao',44740);
insert into NHANVIEN values ('355548984','Tran Thi Hoai An',212156);
insert into NHANVIEN values ('310454876','Ta Van Do',212156);
insert into NHANVIEN values ('489456522','Nguyen Thi Quy Linh',127984);
insert into NHANVIEN values ('489221823','Bui Quoc Chinh',23980);
insert into NHANVIEN values ('548977562','Le Van Quy',84476);
insert into NHANVIEN values ('310454877','Tran Van Hao',33546);
insert into NHANVIEN values ('142519864','Nguyen Thi Xuan Dao',227489);
insert into NHANVIEN values ('269734834','Truong Tuan Anh',289950);
insert into NHANVIEN values ('287321212','Duong Van Minh',48090);
insert into NHANVIEN values ('552455348','Bui Thi Dung',92013);
insert into NHANVIEN values ('248965255','Tran Thi Ba',43723);
insert into NHANVIEN values ('159542516','Le Van Ky',48250);
insert into NHANVIEN values ('348121549','Nguyen Van Thanh',32899);
insert into NHANVIEN values ('574489457','Bui Van Lap',20);

-- chen du lieu CHUNGNHAN
insert into CHUNGNHAN values ('567354612',747);
insert into CHUNGNHAN values ('567354612',737);
insert into CHUNGNHAN values ('567354612',757);
insert into CHUNGNHAN values ('567354612',777);
insert into CHUNGNHAN values ('567354612',767);
insert into CHUNGNHAN values ('567354612',727);
insert into CHUNGNHAN values ('567354612',340);
insert into CHUNGNHAN values ('552455318',737);
insert into CHUNGNHAN values ('552455318',319);
insert into CHUNGNHAN values ('552455318',747);
insert into CHUNGNHAN values ('552455318',767);
insert into CHUNGNHAN values ('390487451',340);
insert into CHUNGNHAN values ('390487451',320);
insert into CHUNGNHAN values ('390487451',319);
insert into CHUNGNHAN values ('274878974',757);
insert into CHUNGNHAN values ('274878974',767);
insert into CHUNGNHAN values ('355548984',154);
insert into CHUNGNHAN values ('310454876',154);
insert into CHUNGNHAN values ('142519864',747);
insert into CHUNGNHAN values ('142519864',757);
insert into CHUNGNHAN values ('142519864',777);
insert into CHUNGNHAN values ('142519864',767);
insert into CHUNGNHAN values ('142519864',737);
insert into CHUNGNHAN values ('142519864',340);
insert into CHUNGNHAN values ('142519864',320);
insert into CHUNGNHAN values ('269734834',747);
insert into CHUNGNHAN values ('269734834',737);
insert into CHUNGNHAN values ('269734834',340);
insert into CHUNGNHAN values ('269734834',757);
insert into CHUNGNHAN values ('269734834',777);
insert into CHUNGNHAN values ('269734834',767);
insert into CHUNGNHAN values ('269734834',320);
insert into CHUNGNHAN values ('269734834',319);
insert into CHUNGNHAN values ('269734834',727);
insert into CHUNGNHAN values ('269734834',154);
insert into CHUNGNHAN values ('242518965',737);
insert into CHUNGNHAN values ('242518965',757);
insert into CHUNGNHAN values ('141582651',737);
insert into CHUNGNHAN values ('141582651',757);
insert into CHUNGNHAN values ('141582651',767);
insert into CHUNGNHAN values ('011564812',737);
insert into CHUNGNHAN values ('011564812',757);
insert into CHUNGNHAN values ('574489457',154);
--1
select*from CHUYENBAY
where GaDen like 'DAD'
--2
select*from MAYBAY
where TamBay>10000
--3
select*from NHANVIEN
where Luong<10000
--4
select*from CHUYENBAY
where DoDai>=8000 and DoDai<=10000
--5
select*from CHUYENBAY
where GaDi like 'SGN' and GaDen like 'BMV'
--6
select Count (GaDi) as 'SochuyenbayxuatphattuSaiGon'
from CHUYENBAY
where GaDi like'SGN'
--7
select Count(Loai) as 'SomaybayBoeing'
from MAYBAY
where Loai like 'Boeing%'
--8
select sum(Luong) as'tongsoluongtrachoNV'
from NHANVIEN
--9
select MaNV
from MAYBAY,CHUNGNHAN
where MAYBAY.MaMB=CHUNGNHAN.MaMB and Loai like'Boeing%'
--10
select Ten
from NHANVIEN,CHUNGNHAN
where   CHUNGNHAN.MaNV=NHANVIEN.MaNV and MaMB=747;
--11
select MaMB
from NHANVIEN,CHUNGNHAN
where CHUNGNHAN.MaNV=NHANVIEN.MaNV and Ten like'Nguyen%'
--12
select MaNV
from MAYBAY,CHUNGNHAN
where    MAYBAY.MaMB=CHUNGNHAN.MaMB and Loai like 'Boeing%' and Loai like'Airbus%';
--13
select MaMB,Loai
from MAYBAY
where MAYBAY.TamBay>(select CHUYENBAY.DoDai from CHUYENBAY where CHUYENBAY.MaCB like 'VN280')
--14
select*from CHUYENBAY
where DoDai<(select TamBay from MAYBAY where Loai like 'Airbus A320')
--15
select distinct Ten
from NHANVIEN,CHUNGNHAN,MAYBAY
where   CHUNGNHAN.MaNV=NHANVIEN.MaNV and MAYBAY.MaMB=CHUNGNHAN.MaMB and Loai like'Boeing%';
--16 
select MAYBAY.MaMB,MAYBAY.Loai,count(CHUNGNHAN.MaNV)as TONGSOPC
from MAYBAY inner join CHUNGNHAN on CHUNGNHAN.MaMB=MAYBAY.MaMB
group by MAYBAY.MaMB,MAYBAY.Loai
--17
SELECT CHUYENBAY.* FROM CHUYENBAY as CHUYENBAY, CHUYENBAY as cb WHERE CHUYENBAY.GaDi=cb.GaDen
and CHUYENBAY.GaDen=cb.GaDi
--18

select Gadi, Count(GaDi) as 'Soluongchuyenbay'
from CHUYENBAY
group by GaDi
--19
select GaDi,Sum(ChiPhi) as'TongchiPhi'
from CHUYENBAY
group by GaDi
--20
select GaDi,Count(Giodi) as'truoc 12h'
from CHUYENBAY
where GioDi<=12
group by GaDi
--21
select MaNV, count(MaMB) SMB from CHUNGNHAN 
group by MaNV
Having Count(MaMB)=3
--22
select MaNV,Max(TamBay) from CHUNGNHAN as CN,MAYBAY as MB
where CN.MaMB=MB.MaMB and CN.MaNV in (select MaNV  from CHUNGNHAN group by MaNV having count(MaMB)>3)
group by MaNV
--23
select NHANVIEN.MaNV,count(MaMB)as SOMAYBAYCOTHELAI 
from NHANVIEN,CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV
group by NHANVIEN.MaNV
--24
select  top(3) NHANVIEN.MaNV,COunt(MaMB) as sochuyenbay
from NHANVIEN,CHUNGNHAN
where    NHANVIEN.MaNV=CHUNGNHAN.MaNV
group by NHANVIEN.MaNV
order by COunt(MaMB) desc
--25
select  top(3) NHANVIEN.MaNV,COunt(MaMB) as sochuyenbay
from NHANVIEN,CHUNGNHAN
where    NHANVIEN.MaNV=CHUNGNHAN.MaNV
group by NHANVIEN.MaNV
order by COunt(MaMB) asc
--26
select Ten
from NHANVIEN
where not exists (select*from CHUNGNHAN where CHUNGNHAN.MaNV=NHANVIEN.MaNV)
--Câu 27
select MaNV from NHANVIEN
where Luong = (select Max(Luong) from NHANVIEN)
--Câu 28
select sum(Luong) as TongLuongPC from NHANVIEN NV
where NV.MaNV in (select distinct MaNV from CHUNGNHAN)

--29
select distinct MaCB
from CHUYENBAY inner join MAYBAY
on Loai like 'Boeing%'
--30
select MaCB
from CHUYENBAY
where GaDi like 'SGN' and GaDen like 'HUI'
group by MACB
--31
select distinct MaCB
from CHUYENBAY ,NHANVIEN,CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV and Luong>=100000
--Câu 32
select Ten from NHANVIEN
where Luong <(select Min(ChiPhi) from CHUYENBAY where GaDi ='SGN' and GaDen='BMV')
--Câu 33
select MaNV from NHANVIEN where Luong in (select Max(Luong) from NHANVIEN as NV where NV.MaNV
in (select distinct MaNV from CHUNGNHAN))
--Câu 34
select MaNV from NHANVIEN
where Luong in (select Max(Luong) from NHANVIEN where not exists(select MaNV from NHANVIEN where Luong in (select Max(Luong) from NHANVIEN as NV where NV.MaNV
in (select distinct MaNV from CHUNGNHAN))))
--Câu 35 
select MaNV from NHANVIEN where Luong in (select Max(Luong) from NHANVIEN as NV where NV.MaNV
in (select distinct MaNV from CHUNGNHAN)) union select MaNV from NHANVIEN
where Luong in (select Max(Luong) from NHANVIEN where not exists(select MaNV from NHANVIEN where Luong in (select Max(Luong) from NHANVIEN as NV where NV.MaNV
in (select distinct MaNV from CHUNGNHAN))))
--38
select CHUNGNHAN.MaNV,MAYBAY.TamBay
from CHUNGNHAN inner join MAYBAY
on CHUNGNHAN.MaMB=MAYBAY.MAMB 
group by CHUNGNHAN.MaNV,MAYBAY.TamBay
having  count(CHUNGNHAN.MaMB)>3  and MAYBAY.TamBay>3200
--Câu 60
select * from CHUNGNHAN 
where not exists (select MaMB from MAYBAY)
--Câu 61
select MaNV from CHUNGNHAN 
where not exists (select MaMB from MAYBAY where Loai like 'Boeing%')  

