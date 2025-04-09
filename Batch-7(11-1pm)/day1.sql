-- Single Line Comments

/*
Multiline 
Comments
*/

-- SQL is not a case sensitive Language as- AGE or age are same.

create database knt_school;

-- to work on it you need to use database first
-- to execute query (ctrl+enter)
use knt_school;

-- create a related table student
create table student(
id int primary key,   -- primary key = not null + unique
name varchar(100) not null,
course varchar(100) not null,
contact varchar(10) not null unique,
city varchar(20) not null
);

-- display table
select * from student;

-- to remove complete data from table
truncate table student;

-- to delete complete attributes and records 
drop table student;

-- insert value in a table
insert into student(id,name,course,contact,city)
values
(1,'Atharva','Data Science','7020597224','Ambernath');


-- insert value in a table
insert into student(id,name,course,contact,city)
values
(2,'Om','Data Science','9321639401','Kalyan'),
(3,'Om','Data Science','9321639402','Kalyan'),
(4,'Om','Data Science','9321639403','Kalyan'),
(5,'Om','Data Science','9321639404','Kalyan'),
(6,'Om','Data Science','9321639405','Kalyan');

-- insert value in a table
insert into student
values
(7,'Atharva','Data Science','7020597227','Ambernath');