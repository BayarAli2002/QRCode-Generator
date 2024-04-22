use bayar

drop table Enrollment;
drop table Student;
drop table Department;
drop table College;
drop table University;
drop table users;

create table users(
userName nvarchar(50),
[password] nvarchar(50)
)
go

insert into users values ('admin','1234');
insert into users values ('osama','1234');
insert into users values ('ali','4321');
insert into users values ('bayar','1234');
insert into users values ('rezgar','1234');

create table University(
Univ_ID int primary key,
Univ_Name nvarchar(50),
Adress nvarchar(50)
)
go

insert into University values(1,'Salahaddin','Erbil-karkuk-street');
insert into University values(2,'Sulaimani','Sulaimani-street');
insert into University values(3,'Duhok','Duho-Zakho-street');

select * from University;

create table College(
College_ID int primary key,
College_Name nvarchar(50),
Dean nvarchar(50),
Univ_ID int foreign key references University(Univ_ID)
)
go

insert into College values(11,'Science','Professor Rasper',1);
insert into College values(12,'Engineering','Professor Dler',1);
insert into College values(13,'Language','Dr Haider',1);
insert into College values(14,'Engineering','Dr Safen',2);
insert into College values(15,'Medicine','Dr Sara',2);
insert into College values(16,'Language','Dr Shima',3);
insert into College values(17,'Science','Dr Zanko',3);
insert into College values(18,'Engineering','Dr Saja',3);
insert into College values(19,'Medicine','Dr Nasreen',3);

select * from College;

create table Department(
Dep_ID int primary key,
Dep_Name nvarchar(50),
Supervisor nvarchar(50),
College_ID int foreign key references College(College_ID)
)
go

insert into Department values(123,'CS & IT','Dr Dler',11);
insert into Department values(124,'Math','Dr Maria',11);
insert into Department values(125,'Physic','Dr Nushi',11);
insert into Department values(126,'Geology','Dr Mohammed',11);
insert into Department values(127,'Biology','Dr Jose',11);
insert into Department values(128,'chemic','Dr Wei',11);
insert into Department values(129,'Software Engineering','Dr Salar',12);
insert into Department values(130,'Mechanical & Mechatronics','Dr Yan',12);
insert into Department values(131,'Architecture','Dr John',12);
insert into Department values(132,'Civil','Dr David',12);
insert into Department values(133,'Electrical','Dr Li',12);
insert into Department values(134,'Kurdish','Dr Eanoo',13);
insert into Department values(135,'Arabic','Dr Abdul',13);
insert into Department values(136,'English','Dr Ana',13);
insert into Department values(137,'French','Dr Ying',13);
insert into Department values(138,'Germany','Dr Michael',13);
insert into Department values(139,'Turkish','Dr Juan',13);

insert into Department values(140,'Software Engineering','Dr Anna',14);
insert into Department values(141,'Mechanical & Mechatronics','Dr Mary',14);
insert into Department values(142,'Architecture','Dr Jean',14);
insert into Department values(143,'Civil','Dr Robert',14);
insert into Department values(144,'Electrical','Dr Daniel',14);
insert into Department values(145,'General Medicine','Dr Luis',15);
insert into Department values(146,'Dentistry','Dr Carlos',15);
insert into Department values(147,'Pharmacy','Dr James',15);
insert into Department values(148,'Ophthalmology','Dr Antonio',15);

insert into Department values(149,'Kurdish','Dr Joseph',16);
insert into Department values(150,'Arabic','Dr Hui',16);
insert into Department values(151,'English','Dr Elena',16);
insert into Department values(152,'French','Dr Francisco',16);
insert into Department values(153,'Germany','Dr Hong',16);
insert into Department values(154,'Turkish','Dr Marie',16);
insert into Department values(155,'CS & IT','Dr Min',17);
insert into Department values(156,'Math','Dr Lei',17);
insert into Department values(157,'Physic','Dr Yu',17);
insert into Department values(158,'Geology','Dr Ibrahim',17);
insert into Department values(159,'Biology','Dr Peter',17);
insert into Department values(160,'chemic','Dr Fatima',17);
insert into Department values(161,'Software Engineering','Dr Aleksandr',18);
insert into Department values(162,'Mechanical & Mechatronics','Dr Richard',18);
insert into Department values(163,'Architecture','Dr Xin',18);
insert into Department values(164,'Civil','Dr Bin',18);
insert into Department values(165,'Electrical','Dr Paul',18);
insert into Department values(166,'General Medicine','Dr Ping',19);
insert into Department values(167,'Dentistry','Dr Lin',19);
insert into Department values(168,'Pharmacy','Dr Olga',19);
insert into Department values(169,'Ophthalmology','Dr Sri',19);

select * from Department;


create table Student(
Student_ID bigint primary key,
First_Name nvarchar(50),
Last_Name nvarchar(50),
Gender nvarchar(10),
Date_Of_Birth date,
Email nvarchar(50),
Phone_Number nvarchar(50),
P_Image nvarchar(max),
)
go

insert into Student values(112200,'Anas','Mnawer','Male','2004-2-18','anasmnawer619@gmail.com','+9647817098716','');
insert into Student values(112201,'Mohammed','Ramma','Male','2000-1-1','hame15766@gmail.com','+9647512087231','');
insert into Student values(112202,'Malik','Mustafa','Male','2003-6-1','Malk321@gmail.com','+9647835539841','');
insert into Student values(112203,'Sakina','Faris','Female','2002-9-1','alibayar893@gmail.com','+9647800274177','');
insert into Student values(112204,'Malik','Qasim','Male','2002-10-5','malkqasim@gmail.com','+9647832394492','');
insert into Student values(112205,'Diyar','Shawish','Male','2002-2-16','diyarfadil@gmail.com','+9647832082056','');
insert into Student values(112206,'Sherwan','Khalo','Male','2001-1-1','shero714@gmail.com','+9647832079379','');
insert into Student values(112207,'Susan','Jessica','Female','2000-7-8','Susan@gmail.com','+9647835459532','');
insert into Student values(112208,'Muhammed','Salih','Male','2003-7-9','muhammed212@gmail.com','+9647805108367','');
insert into Student values(112209,'Abdulaziz','Yaldiz','Male','2003-8-1','aziz201@gmail.com','+9647817374671','');
insert into Student values(112210,'Maya','Abdi','Female','2003-9-11','maya5@gmail.com','+9647835107697','');
insert into Student values(112211,'Hussain','Ali','Male','2004-7-12','bagera21@gmail.com','+9647801307984','');
insert into Student values(112212,'Akram','Ali','Male','2002-12-1','akrmrasul2@gmail.com','+9647807190006','');
insert into Student values(112213,'Wrya','Betty','Male','2003-4-7','wrya615@gmail.com','+9647508733723','');
insert into Student values(112214,'Diyar','Nizam','Male','2003-10-5','diyar77@gmail.com','+9647815276679','');



select * from Student;

create table Enrollment(
Enrol_ID bigint primary key,
Enrollment_Date date,
Grade float,
Image_Certificate nvarchar(max),
Student_ID bigint unique foreign key references Student(Student_ID),
Dep_ID int foreign key references Department(Dep_ID)
)
go

insert into Enrollment values(998800,'2016-8-1',65.2,'images (1).jpg',112200,123);
insert into Enrollment values(998801,'2017-9-1',70.9,'images (2).jpg',112201,123);
insert into Enrollment values(998802,'2018-10-1',80.7,'images (3).jpg',112202,124);
insert into Enrollment values(998803,'2019-11-1',90.4,'images (4).jpg',112203,124);
insert into Enrollment values(998804,'2020-12-1',92.6,'images (5).jpg',112204,125);
insert into Enrollment values(998805,'2016-8-2',86.7,'images (6).jpg',112205,125);
insert into Enrollment values(998806,'2017-9-2',80.2,'images (7).jpg',112206,126);
insert into Enrollment values(998807,'2018-10-2',60.5,'images (8).jpg',112207,126);
insert into Enrollment values(998808,'2019-11-2',50.5,'images (9).jpg',112208,127);
insert into Enrollment values(998809,'2020-12-2',55.5,'images (10).jpg',112209,127);
insert into Enrollment values(998810,'2016-8-3',66.7,'images (11).jpg',112210,128);
insert into Enrollment values(998811,'2017-9-3',77.2,'images (12).jpg',112211,128);
insert into Enrollment values(998812,'2018-10-3',90.5,'images (13).jpg',112212,129);
insert into Enrollment values(998813,'2019-11-3',88.5,'images (14).jpg',112213,129);
insert into Enrollment values(998814,'2020-12-3',99.0,'images (15).jpg',112214,130);



select * from Enrollment;

SELECT * FROM University u
join College c
on u.Univ_ID=c.Univ_ID
join Department d
on c.College_ID=d.College_ID
join Enrollment e
on d.Dep_ID=e.Dep_ID
join Student s
on e.Student_ID=s.Student_ID;
