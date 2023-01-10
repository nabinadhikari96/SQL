# subqueries
show databases;
use mysql;
show tables;
select * from emp_details;
select name,city,salary from emp_details
 where salary>(select avg(salary) from emp_details);
 
 select name,city,salary from emp_details
 where salary>(select salary from emp_details where name ='sita');
 