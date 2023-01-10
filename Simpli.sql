# SQL joins
show databases;
use mysql;
show tables;
#inner,left,right,full,self and cross

create table my_emp1(emp_id int,first_name varchar(25),last_name varchar(25),
email varchar(25),job_id int,salary float,dept_id int);
describe my_emp;

insert into my_emp1 values
(1,"nabin","adhikari","nabin@gmail.com",101,100,1001),
(2,"naksh","adhikari","naksh@gmail.com",102,100,1002),
(3,"shsir","adhikari","shisir@gmail.com",103,100,1003),
(4,"deki","bohara","deki@gmail.com",104,101,1004),
(5,"murti","saud","murti@gmail.com",105,101,1005),
(6,"thanya","bohara","thanya@gmail.com",106,106,1006),
(7,"surat","saud","surat@gmail.com",107,101,1007),
(8,"dhelya","saud","dhelya@gmail.com",108,101,1008),
(9,"sunny","adhikari","sunny@gmail.com",109,101,1009),
(10,"tinna","bk","tinna@gmail.com",110,101,1010);
select * from my_emp1;
create table dept_1(dept_id int,dept_name varchar(25),location_id int);
insert into dept_1 values
(1001,"sales",2001),
(1002,"IT",2002),
(1003,"marketing",2003),
(1004,"sales",2004),
(1007,"IT",2007),
(1008,"IT",2008),
(1009,"marketing",2009),
(1010,"IT",2010);
select * from dept;
select * from my_emp1 inner join dept_1 on my_emp1.dept_id =dept_1.dept_id; 
select * from my_emp1 left join dept_1 on my_emp1.dept_id =dept_1.dept_id;
select * from my_emp1 right join dept_1 on my_emp1.dept_id =dept_1.dept_id;  
select * from my_emp1 full join dept_1  ;
select * from my_emp1 cross join dept_1 on my_emp1.dept_id =  dept_1.dept_id; 

select first_name , dept_name from my_emp1 inner join 
dept_1 on my_emp1.dept_id = dept_1.dept_id;  

select first_name , dept_name from my_emp1 right join 
dept_1 on my_emp1.dept_id = dept_1.dept_id; 

select first_name , dept_name from my_emp1 cross join 
dept_1 ; 

select first_name , dept_name from my_emp1 full join dept_1 ; 

#self join
select my_emp1.emp_id as employee_id,my_emp1.email as emp_email ,my_emp1.emp_id 
as manager_id,my_emp1.email as manager_email from my_emp1 where my_emp1.emp_id=my_emp1.emp_id ;
 