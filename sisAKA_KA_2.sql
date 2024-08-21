create database homework_KA_2;
use homework_KA_2;
-- drop database homework_KA_2;
create table city(
idCi int auto_increment primary key,
nameCi varchar(50) not null
);


create table destination(
idDes int auto_increment primary key,
nameDes varchar(50),
description text,
priceDes double,
idCi int,
foreign key (idCi) references city(idCi)
);

create table client(
idCl int auto_increment primary key,
nameCl varchar(50) not null,
CCCD varchar(20) not null,
yod varchar(4) not null,
idCi int,
foreign key (idCi) references city(idCi)
);

create table category(
idCat int auto_increment primary key,
categoryCode varchar(50),
categoryName varchar(50)
);

create table tour(
idT int auto_increment primary key,
tourCode varchar(50),
idCat int,
foreign key (idCat) references category(idCat),
idDes int,
foreign key (idDes) references  destination(idDes),
startDate date,
endDate date
);

create table orderTour(
idO int auto_increment primary key,
idTour int,
foreign key (idTour) references tour(idT),
idCl int,
foreign key (idCl) references client(idCl),
status text
);

insert into city (nameCi)
values 
("Atlantic"),
("Berlin"),
("Tokyo"),
("Paris"),
("Seoul");

insert into destination(nameDes,description,priceDes,idCi)
values 
('my','chau au',200,1),
('duc','chau au',150,2),
('nhat ban','chau a',300,3),
('phap','chau au',500,4),
('han quoc','chau a',150,5);

insert into client(nameCl,CCCD,yod,idCi)
values
('Nguyen Thanh Cong', '123456789', '2003', 1),
('Tran Hoa Ly', '234567890', '2003', 1),
('Le Van Chuyen', '345678901', '2000', 2),
('Pham Van Duy', '456789012', '1999', 2),
('Đo Van Kien', '567890123', '1998', 3),
('Hoang Thi No', '678901234', '2010', 3),
('Ngo Van Toan', '789012345', '2006', 4),
('Ly Thi Huong', '890123456', '2014', 4),
('Vu Van Cao', '901234567', '1997', 5),
('Đang Ha An', '012345678', '1998', 5);

insert into category(categoryCode,categoryName)
values
('ND01','nghi duong'),
('TQ02','tham quan');

insert into tour(tourCode,idCat,idDes,startDate,endDate)
values
('T001', 1, 1, '2024-09-01', '2024-09-05'),
('T002', 1, 2, '2024-09-10', '2024-09-14'),
('T003', 2, 3, '2020-03-15', '2020-04-18'),
('T004', 1, 4, '2024-09-20', '2024-09-25'),
('T005', 2, 5, '2020-09-28', '2020-04-02'),
('T006', 1, 1, '2024-10-03', '2024-10-08'),
('T007', 2, 2, '2020-03-10', '2024-10-15'),
('T008', 1, 3, '2024-10-17', '2024-10-21'),
('T009', 2, 4, '2024-10-23', '2024-10-28'),
('T010', 1, 5, '2020-03-30', '2024-11-03'),
('T011', 2, 1, '2024-11-05', '2024-11-10'),
('T012', 1, 2, '2024-11-12', '2020-04-17'),
('T013', 2, 3, '2020-03-19', '2024-11-23'),
('T014', 1, 4, '2024-11-25', '2020-04-29'),
('T015', 2, 5, '2024-12-01', '2024-12-06');

INSERT INTO orderTour(idTour, idCl, status) 
VALUES (1, 1, 'da dat'), (2, 2, 'da dat'), (3, 3, 'chua dat'), (4, 4, 'da dat'), 
       (5, 5, 'chua dat'), (6, 6, 'da dat'), (7, 7, 'da dat'), (8, 8, 'chua dat'), 
       (9, 9, 'da dat'), (10, 10, 'da dat');

select c.nameCi as 'ten thanh pho', count(t.idT) as 'so luong tour'
from city c
join destination des on c.idCi = des.idCi
join tour t on des.idDes = t.idDes
group by c.nameCi;

select tourCode as "ma tour", count(idT) as "so tour"
from tour
where month(startDate)= 3 and year(startDate) = 2020
group by tourCode;

select tourCode as "ma tour", count(idT) as "so tour"
from tour
where month(endDate)= 4 and year(endDate) = 2020
group by tourCode;

