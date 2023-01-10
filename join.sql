create database triggers;
show databases;
use triggers;

create table customers
(cust_id int,agr int,name varchar(30));

# before insert trigger
delimiter //
create trigger age_verify
before insert on customers
for each row
if new.agr < 0 then set new.agr=0;
end if; //
insert into customers values
(101,27,"Nabin"),
(102,-40,"naksh");

select * from customers;

#after insert trigger
create table customers1
(id int auto_increment primary key,
name varchar(25) not null,
email varchar(25),birthday date);

create table message(
id int auto_increment,
messageID int,
message varchar(300)not null,
primary key(id,messageID));

delimiter //
create trigger check_null_dob
after insert on customers1
for each row
begin
if new.birthday is null then
insert into message(messageID,message)
values(new.id,concat('Hi',new.name,'please update your birthdate'));
end if ;
end //
delimiter ;

insert into customers1(name, email, birthday)
values('Nabin','nabin@gmail.com',Null),
('murti','murti@gmail.com','2055-07-17');

select * from message;

#before update 
create table employeess
(emp_id int primary key,
emp_name varchar(25),age int,salary float);
insert into employeess values
(1,'nabin',25,80000),
(2,'haddi',19,8000),
(3,'mau',27,87000),
(4,'Thanya',19,7800),
(5,'nabina',25,80000),
(6,'naksh',20,50000),
(7,'xyz',29,80700),
(8,'murti',23,10000);

delimiter //
create trigger update_trigger
before update on employeess
for each row
begin
if new.salary=8000 then set new.salary = 85000;
else if new.salary<10000 then set new.salary=72000;
end if ;
end if ;
end //
delimiter ;

update employeess
set salary=8000;

select * from employeess;

# before delete
create table salary
(eid int primary key,validfrom date not null,
 amount float not null );
 
 insert into salary(eid,validfrom,amount)
 values(101,'2055-0715',80000),
 (102,'2055-0715',80000),
 (103,'2056-0715',70000),
 (104,'2057-0715',60000),
 (105,'2058-0715',50000),
 (106,'2059-0715',40000),
 (107,'2055-0715',30000),
 (108,'2056-0715',20000);