create database homework_ka_3;
use homework_ka_3;
-- drop database homework_ka_3;
create table pxuat(
soPX int auto_increment primary key,
ngayXuat date,
tenKH varchar(50)
);

create table vattu(
maVtu int auto_increment primary key,
tenvtu varchar(50),
dvtinh varchar(50),
phantram varchar(50)
);

create table nhacc(
maNCC int auto_increment primary key,
tenNCC varchar(50),
diachi varchar(50),
dienthoai varchar(10)
);

create table donhang(
soDH int auto_increment primary key,
ngayDH date,
maNCC int,
foreign key (maNCC) references nhacc(maNCC)
);

create table pnhap(
soPN int auto_increment primary key,
ngaynhap date,
soDH int,
foreign key (soDH) references donhang(soDH)
);

create table tonkho(
idKho int auto_increment primary key,
maVtu int,
sldau int,
tongSLN int,
tongSLX int,
slcuoi int,
foreign key (maVtu) references vattu(maVtu)
);

create table ctpxuat(
soPX int,
maVtu int,
slxuat int,
dgxuat int,
primary key (soPX,maVtu),
foreign key (soPX) references pxuat(soPX),
foreign key (maVtu) references vattu(maVtu)
);

create table ctdonhang(
soDH int,
maVtu int,
sldat int,
primary key (soDH,maVtu),
foreign key (soDH) references donhang(soDH),
foreign key (maVtu) references vattu(maVtu)
);

create table ctpnhap(
soPN int,
maVtu int,
slnhap int,
dgnhap int,
primary key (soPN,maVtu),
foreign key (soPN) references pnhap(soPN),
foreign key (maVtu) references vattu(maVtu)
);

insert into vattu (tenvtu,dvtinh,phantram)
values 
('xi mang','met vuong','5%'),
('sat', 'met vuong', '3%'),
('thep', 'met vuong', '4%'),
('gach', 'vien', '2%'),
('cat', 'met khoi','6%'),
('soi', 'met vuong','1%'),
('ton', 'met vuong','2%'),
('da', 'met vuong','3%'),
('nhua', 'met vuong','2%'),
('thach cao', 'met vuong','2%');

insert into tonkho(maVtu,sldau,tongSLN,tongSLX,slcuoi)
values
(3,500,500,200,300),
(6,1000,1000,200,800),
(1,1500,1500,400,1100),
(10,1600,1600,600,1000),
(7,700,700,500,200);

insert into nhacc(tenNCC,diachi,dienthoai)
values
('hoa phat','thai binh','0938475632'),
('vissai','binh thuan','0993485761'),
('thai hung','phu tho','0939485762');

insert into donhang(ngayDH,maNCC)
values
('2024-04-14',2),
('2024-05-20',1),
('2024-01-22',3);

insert into pnhap(ngaynhap,soDH)
values
('2024-05-13',1),
('2024-05-29',2),
('2024-02-19',3);

insert into pxuat(ngayXuat,tenKH)
values
('2024-08-10','Juan'),
('2024-07-10','Juy'),
('2024-05-10','Janh long');

insert into ctdonhang(soDH,maVtu,sldat)
values
(2,4,500),
(3,10,600),
(1,9,200),
(3,2,700),
(2,5,900),
(1,8,400);

insert into ctpnhap(soPN,maVtu,slnhap,dgnhap)
values 
(2,8,700,3000),
(3,9,300,9000),
(1,10,800,8000),
(2,10,500,4000),
(1,4,900,2000),
(2,5,1000,1000);

insert into ctpxuat(soPX,maVtu,slxuat,dgxuat)
values 
(1,8,200,10000),
(2,3,500,11000),
(3,5,700,13000),
(2,2,100,15000),
(3,7,900,20000),
(1,10,10000,19000);

create view vw_CTPNHAP as
select soPN, maVtu, slnhap, dgnhap, (slnhap*dgnhap) as 'thanh tien nhap'
from ctpnhap;

-- drop view vw_CTPNHAP;

select*from vw_CTPNHAP;

create view vw_CTPNHAP_VT as
select ct.soPN, ct.maVtu, vt.tenvtu, ct.slnhap, ct.dgnhap,(ct.slnhap*ct.dgnhap) as 'thanh tien nhap'
from ctpnhap ct
join vattu vt on ct.maVtu = vt.maVtu;

-- drop view vw_CTPNHAP_VT;

select*from vw_CTPNHAP_VT;

create view vw_CTPNHAP_VT_PN as
select ct.soPN, p.ngaynhap, dh.soDH, vt.maVtu, vt.tenvtu, ct.slnhap,ct.dgnhap, (ct.slnhap*ct.dgnhap) as 'thanh tien nhap'
from ctpnhap ct
join pnhap p on p.soPN = ct.soPN
join vattu vt on vt.maVtu = ct.maVtu
join donhang dh on dh.soDH = p.soDH;

select*from vw_CTPNHAP_VT_PN;

create view vw_CTPNHAP_VT_PN_DH as
select p.soPN, p.ngaynhap, dh.soDH, dh.maNCC, ct.maVtu, vt.tenvtu, ct.slnhap, ct.dgnhap, (ct.slnhap*ct.dgnhap) as 'thanh tien nhap'
from ctpnhap ct
join vattu vt on vt.maVtu = ct.maVtu
join pnhap p on p.soPN = ct.soPN
join donhang dh on dh.soDH = p.soDH
join nhacc cc on cc.maNCC = dh.maNCC;

select*from vw_CTPNHAP_VT_PN_DH;

create view vw_CTPNHAP_loc  as
select ct.soPN, ct.maVtu, ct.slnhap, ct.dgnhap, (ct.slnhap*ct.dgnhap) as 'thanh tien nhap'
from ctpnhap ct
join vattu vt on vt.maVtu = ct.maVtu
join pnhap p on p.soPN = ct.soPN
where ct.slnhap > 500;

select*from vw_CTPNHAP_loc;

create view  vw_CTPNHAP_VT_loc as
select ct.soPN, ct.maVtu,vt.tenvtu, ct.slnhap, ct.dgnhap, (ct.slnhap*ct.dgnhap) as 'thanh tien nhap'
from ctpnhap ct
join vattu vt on vt.maVtu = ct.maVtu
join pnhap p on p.soPN = ct.soPN
where vt.dvtinh = 'met khoi';

select * from vw_CTPNHAP_VT_loc;

create view vw_CTPXUAT as
select ct.soPX, ct.maVtu, ct.slxuat, ct.dgxuat, (ct.slxuat * ct.dgxuat) as ' thanhtienxuat'
from ctpxuat ct
join pxuat p on p.soPX = ct.soPX
join vattu vt on vt.maVtu = ct.maVtu;

select*from vw_CTPXUAT;

create view  vw_CTPXUAT_VT as
select ct.soPX, ct.maVtu, vt.tenvtu, ct.slxuat, ct.dgxuat
from ctpxuat ct
join vattu vt on vt.maVtu = ct.maVtu;

select*from  vw_CTPXUAT_VT;

create view vw_CTPXUAT_VT_PX as
select ct.soPX, p.tenKH ,ct.maVtu, vt.tenvtu, ct.slxuat, ct.dgxuat
from ctpxuat ct
join pxuat p on p.soPX = ct.soPX
join vattu vt on vt.maVtu = ct.maVtu;

select*from vw_CTPXUAT_VT_PX;

delimiter //
create procedure tim_Slg_cuoi_Vtu(in ma_VT int)
begin
 select slcuoi from tonkho
 where maVtu = ma_vt;
 end //
 delimiter ;
 
 call tim_Slg_cuoi_Vtu(1);
 
 
 delimiter // 
 create procedure tim_tongxuat(in ma_VT int)
begin
 select (slxuat*dgxuat) as 'tong xuat' from ctpxuat
 where maVtu = ma_vt;
 end //
 delimiter ;
 
 call tim_tongxuat(2);
 
  delimiter // 
 create procedure tim_tong_solg_dat(in so_DH int)
begin
 select sldat  from ctdonhang
 where soDH = so_DH;
 end //
 delimiter ;
 
 call tim_tong_solg_dat(3);
 
 delimiter //
 create procedure them_donhang(
 in dh_ngayDH date,
 in dh_maNCC int)
 begin
 insert into donhang(ngayDH,maNCC)
values (dh_ngayDH,dh_maNCC );
end //
delimiter ;

call them_donhang('2024-08-22',2);
select*from donhang;

delimiter //
 create procedure them_chitietdonhang(
in ct_soDH int,
in  ct_maVtu int,
in ct_sldat int
)
 begin
 insert into ctdonhang(soDH,maVtu,sldat)
values (ct_soDH,ct_maVtu,ct_sldat);
end //
delimiter ;

call them_chitietdonhang(4,6,400);
select*from ctdonhang;

delimiter //
    create procedure xoa_NCC(
    in ma_ncc int
    )
    begin
    delete from nhacc where maNCC = ma_NCC;
    end //
    delimiter ;
    
insert into nhacc (tenNCC,diachi,dienthoai)
values ('chuyensex','ha noi', '0938475632');

select*from nhacc;
call xoa_NCC(4);