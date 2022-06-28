create database supplier_043;
use supplier_043;

create table Suppliers
(
	Sid int primary key,
	Sname varchar(30),
	City varchar(30)
);
desc Suppliers;

create table Parts
(
	Pid int primary key,
	Pname varchar(30),
	Color varchar(20)
);
desc Parts;

create table Catalog
(
	Sid int,
	Pid int,
	Cost real,
	primary key(Sid,Pid),
	foreign key(Sid) references Suppliers(Sid),
	foreign key(Pid) references Parts(Pid)
);
desc Catalog;

insert into Suppliers values(10001, 'Acme Widget' , 'Banglore');
insert into Suppliers values(10002, 'Jhons' , 'Kolkata');
insert into Suppliers values(10003, 'Vimal' , 'Mumbai');
insert into Suppliers values(10004, 'Reliance' , 'Delhi');
select * from Suppliers;

insert into Parts values (20001 , 'Book','Red');
insert into Parts values (20002 , 'Pen','Red');
insert into Parts values (20003 , 'Pencil','Green');
insert into Parts values (20004 , 'Mobile','Green');
insert into Parts values (20005 , 'Charger','Black');
select * from Parts;

insert into Catalog values(10001, 20001, 10);
insert into Catalog values(10001, 20002, 10);
insert into Catalog values(10001, 20003, 30);
insert into Catalog values(10001, 20004, 10);
insert into Catalog values(10001, 20005, 10);
insert into Catalog values(10002, 20001, 10);
insert into Catalog values(10002, 20002, 20);
insert into Catalog values(10003, 20003, 30);
insert into Catalog values(10004, 20003, 40);
select *from Catalog;



	