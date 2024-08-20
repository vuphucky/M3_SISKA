create database homework_KA;
use homework_KA;

create table address(
idAD int primary key,
address varchar(50)
);

create table classes(
idC int primary key,
nameCL varchar(50),
language varchar(50),
description varchar(50)
);

create table students(
idS int primary key,
fullname varchar(50),
age int,
phone varchar(10),
idC int,
foreign key (idC) references classes(idC),
idAD int,
foreign key (idAD) references address(idAD)
);

create table course(
idCOU int primary key,
nameCOU varchar(50),
description varchar(50)
);

create table point(
idP int primary key,
point double,
idCOU int,
foreign key (idCOU) references course(idCou),
idS int,
foreign key (idS) references students(idS)
);

insert into address
values (1,"ha noi"),
	   (2,"da nang"),
       (3,"sai gon"),
       (4,"hue"),
       (5,"italy");

insert into classes
values (1,"C0524I1","Java","kho"),
       (2,"C0624I1", "Java Script", "de"),
       (3,"C0724I1", "python", "de"),
       (4,"C0324I1", "C++", "rat kho"),
       (5,"C0224I1", "C#", "sieu kho");
       
insert into students
-- idS int primary key,fullname varchar(50),age int,phone varchar(10),idC int,idAD int,
values (1,"nguyen joanh long", 24, "0923495864",1,1),
       (2,"nguyen duc zuy", 24,"0938475242",2,3),
       (3,"Le van chuyen", 20,"0928374652",4,5),
       (4, "vu kieu anh", 32, "0938475382",3,4),
       (5, "nguyen duc anh", 30,"0928173645",5,2),
       (6, "le thi tram anh", 20,"0928376541",2,3),
       (7,"vu thi ngo", 25,"0928374652",4,2),
       (8,"cao ba quat",22,"0938472635",1,5),
       (9,"doan van hau",21,"0928374653",3,2),
       (10,"bui van chien",34,"0928374627",4,1);
       
       insert into course
       -- idCOU,nameCOU,description
       values (1,"full stack","full time"),
              (2,"Gabriel","part time"),
              (3,"Charles","full time"),
              (4,"sova", "part time"),
              (5,"garen","full time"),
              (6,"Yi","part time"),
	          (7,"Jame","full time"),
			  (8,"jett","part time"),
              (9,"Tim","full time"),
              (10,"Fatima","part time"),
              (11,"Beatriz","full time"),
			  (12,"John","part time"),
			  (13,"Diya","full time"),
              (14,"Eric","part time"),
              (15,"thresh","full time"),
              (16,"Hanna","part time"),
              (17,"chamber","full time"),
              (18,"shaco","part time"),
              (19,"Lulu","full time"),
              (20,"Blitz","part time");
        
       insert into point
       -- idP,point,idCOU,idS
       values (1,8.5,2,9),
              (2,7,1,8),
              (3,6.5,5,7),
              (4,5,4,6),
              (5,6,7,5),
              (6,9.5,11,4),
              (7,10,15,3),
              (8,7,20,2),
              (9,10,12,1),
              (10,8.5,16,10),
              (11,8,17,10),
              (12,4,5,1),
              (13,3,3,2),
              (14,10,19,5),
              (15,7,5,8);
              
select *
from students 
where fullname like "nguyen %";

select*
from students
where fullname like "% anh";

select*
from students
where age between 18 and 25;

select*
from students
where idS = 12 or idS = 13;

select c.nameCL, count(s.idS) as "soluong hV"
from classes c
join students s on c.idC = s.idC
group by c.nameCL;

select ad.address, count(s.idS) as "so luong hv"
from address ad
join students s on ad.idAD = s.idAD
group by ad.address;

	
       