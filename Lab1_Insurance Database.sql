create database dinesh_1BM20CS043;
use dinesh_1BM20CS043;

create table PERSON
 ( 
	driver_id varchar(20) primary key,
    driver_name varchar(30),
    driver_adress varchar(20)
);
desc PERSON;

create table CAR
(
	Regno varchar(20),
    model varchar(20),
    year int,
    primary key ( Regno)
);
desc CAR;

create table ACCIDENT
(
	report_number int,
    Date date,
    location varchar(30),
    primary key(report_number)
);
desc ACCIDENT;

create table OWNS
(
	driver_id varchar(20),
    Regno varchar(20),
    primary key(driver_id, Regno),
    foreign key (driver_id) references PERSON (driver_id),
    foreign key(Regno) references PERSON (Regno)
);
desc OWNS;

create table PARTICIPATED
(
	driver_id varchar(20),
    Regno varchar(20),
    report_number int,
    damage_amount int,
    primary key(driver_id, Regno),
    foreign key (driver_id) references PERSON (driver_id),
     foreign key(Regno) references PERSON (Regno),
    foreign key (report_number) references ACCIDENT (report_number)
);
desc PARTICIPATED;

insert into PERSON values ('A01','Richard','Srinivas nagar');
insert into PERSON values ('A02','Pradeep','Rajaji nagar');
insert into PERSON values ('A03','Smith','Ashok Nagar');
insert into PERSON values ('A04','Venu','N R Colony');
insert into PERSON values ('A05','Jhon','Hanumanth nagar');
select * from PERSON;

insert into CAR values('KA052250','Indica',1990);
insert into CAR values('KA031181','Lancer',1957);
insert into CAR values('KA095477','Toyato',1998);
insert into CAR values('KA053408','Honda',2008);
insert into CAR values('KA041702','Audi',2005);
select * from CAR;

insert into ACCIDENT values(11,'01-01-13','Mysore Road');
insert into ACCIDENT values(12,'02-02-04','South end Circle');
insert into ACCIDENT values(13,'21-01-03','Bull Temple Road');
insert into ACCIDENT values(14,'17-02-08','Mysore Road');
insert into ACCIDENT values(15,'04-04-05','Kanakpura Road');
select * from ACCIDENT;

insert into OWNS values('A01','KA052250');
insert into OWNS values('A02','KA053408');
insert into OWNS values('A03','KA031181');
insert into OWNS values('A04','KA095477');
insert into OWNS values('A05','KA041702');
select * from  OWNS;

insert into PARTICIPATED values('A01','KA052250',11,10000);
insert into PARTICIPATED values('A02','KA053408',12,50000);
insert into PARTICIPATED values('A03','KA095477',13,25000);
insert into PARTICIPATED values('A04','KA031181',14,3000);
insert into PARTICIPATED values('A05','KA041702',15,5000);
select * from PARTICIPATED;

-- QUERY 3a
update PARTICIPATED set damage_amount=25000 where Regno='KA053408' and report_number=12;
-- QUERY 3b
insert into ACCIDENT values(16,'15-03-08','Domlur');
-- QUERY 4
select count(distinct driver_id) as CNT from PARTICIPATED a, ACCIDENT b where a.report_number=b.report_number and b.Date like '%08%';
-- QUERY 5
select count(report_number) as CNT from CAR c,PARTICIPATED p where c.Regno=p.Regno and model='Lancer';

-- Additional Query
select * from PARTICIPATED order by damage_amount desc;
select avg(damage_amount) from pARTICIPATED;
delete from PARTICIPATED where damage_amount < (select abg(damage_amount) from PARTICIPATED);
select max(damage_amount) from PARTICIPATED;

