create database banking;
use banking;

create table Branch
(
	Branch_name varchar(30) primary key,
    Branch_city varchar(20),
    assets real
);
desc Branch;

create table BankAccount
(
	Accno int primary key,
    Branch_name varchar(30),
    Balance real,
    foreign key (Branch_name) references Branch(Branch_name)
);
desc BankAccount;

create table BankCustomer
(
	Customer_name varchar(30) primary key,
    Customer_street varchar(30),
    Customer_city varchar(20)
);
desc BankCustomer;

create table Depositer
(
	Customer_name varchar(30),
    Accno int,
    primary key(Customer_name,Accno),
    foreign key(Customer_name) references BankCustomer (Customer_name),
    foreign key(Accno) references BankAccount (Accno)
);
desc Depositer;

create table Loan 
(	
	Loan_number int primary key,
    Branch_name varchar(30),
    Amount real,
    foreign key (Branch_name) references Branch ( Branch_name)
);
desc Loan;

insert into Branch values ( 'SBI_Chamrajpet','Banglore',50000);
insert into Branch values ( 'SBI_ResidencyRoad','Banglore',10000);
insert into Branch values ( 'SBI_ShivajiRoad','Bombay',20000);
insert into Branch values ( 'SBI_ParlimentRoad','Delhi',10000);
insert into Branch values ( 'SBI_Jantarmantar','Delhi',20000);
select * from Branch;

insert into BankAccount values ( 1,'SBI_Chamrajpet',2000);
insert into BankAccount values ( 2,'SBI_ResidencyRoad',5000);
insert into BankAccount values ( 3,'SBI_ShivajiRoad',6000);
insert into BankAccount values ( 4,'SBI_ParlimentRoad',9000);
insert into BankAccount values ( 5,'SBI_Jantarmantar',8000);
insert into BankAccount values ( 6,'SBI_ShivajiRoad',4000);
insert into BankAccount values ( 8,'SBI_ResidencyRoad',4000);
insert into BankAccount values ( 9,'SBI_ParlimentRoad',3000);
insert into BankAccount values ( 10,'SBI_ResidencyRoad',5000);
insert into BankAccount values ( 11,'SBI_Jantarmantar',2000);
select * from BankAccount;

insert into BankCustomer values('Avinash','Bull_Temple_Road','Banglore');
insert into BankCustomer values('Dinesh','Bannergata_Road','Banglore');
insert into BankCustomer values('Mohan','NationalCollege_Road','Banglore');
insert into BankCustomer values('Nikil','Akbar_Road','Delhi');
insert into BankCustomer values('Ravi','Prithviraj_Road','Delhi');
select * from BankCustomer;

insert into Depositer values ('Avinash',1);
insert into Depositer values ('Dinesh',2);
insert into Depositer values ('Nikil',4);
insert into Depositer values ('Ravi',5);
insert into Depositer values ('Avinash',8);
insert into Depositer values ('Nikil',9);
insert into Depositer values ('Dinesh',10);
insert into Depositer values ('Nikil',11);
select * from Depositer;

insert into Loan values(1,'SBI_Chamrajpet',1000);
insert into Loan values (2,'SBI_ResidencyRoad',2000);
insert into Loan values(3,'SBI_ShivajiRoad',3000);
insert into Loan values(4,'SBI_ParlimentRoad',4000);
insert into Loan values(5,'SBI_Jantarmantar',5000);
select * from Loan;

-- Query 3
select c.Customer_name
from BankCustomer c
where exists
			( 
				select D.Customer_name, count(D.Customer_name)
                from Depositer D, BankAccount B
                where D.Accno = B.Accno and B.Branch_name = 'SBI_ResidencyRoad'
                group by D.Customer_name
                having count( D.Customer_name)>=2
			);
            
-- Query 4

-- Query 5
delete from BankAccount
where Branch_name in
					(
						select Branch_name
                        from Branch
                        where Branch_city = 'Bombay'
					);
                    
-- Additional Queries

-- 1
select * from Loan order by Amount desc;

