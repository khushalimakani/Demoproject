select * from employee;




insert into employee(name,position,department,hire_date,salary) 
values('khushi patel','Data Analyst','Data Science','2022-05-15',65000.00),
('gaurang parmar','Software Engineer','Web Development','2021-11-20',72000.00),
('rohit jasoliya','Machine Learning Engineer','AI & ML','2023-02-10',85000.00),
('anjali mehta','Database Administrator','Database Management','2020-08-05',60000.00),
('bhavin shah','Project Manager','IT Management','2019-03-25',95000.00)
;

ALTER TABLE employee
RENAME COLUMN depart To department;

TRUNCATE TABLE employee RESTART IDENTITY;

insert into employee2(employee_id,name,position,department,hire_date,salary) 
values(101,'khushi patel','Data Analyst','Data Science','2022-05-15',65000.00),
(102,'gaurang parmar','Software Engineer','Web Development','2021-11-20',72000.00),
(103,'rohit jasoliya','Machine Learning Engineer','AI & ML','2023-02-10',85000.00),
(104,'anjali mehta','Database Administrator','Database Management','2020-08-05',60000.00),
(105,'bhavin shah','Project Manager','IT Management','2019-03-25',95000.00)
;
select * from employee2;

DELETE FROM employee2 where employee_id=105;

ALTER TABLE employee2 
DROP COLUMN salary;

DROP TABLE IF EXISTS employee3;

create table student(
student_id SERIAL primary key,
name varchar(50) not null,
email varchar(100) UNIQUE,
age integer check(age >= 18),
reg_date timestamp default current_timestamp
);

select * from student;
--inserting data into table
Insert into student values(1,'khushali','khushali02@gmail.com',22);

Insert into student values(2,'khushi','khushi02@gmail.com',21);

drop table users;
create table if not exists users(
user_id SERIAL primary key,
username varchar(50) not null,
email varchar(100) not null,
age int,
city varchar(50)
);

select * from users;

insert into users(username,email,age,city) values('khushali','khushi@gmail.com',22,'surat'),
('anay','anay0@gmail.com',21,'ahmedabad');

select user_id,username from users;

update users set age=24 where username='anay';

select * from users order by user_id asc;
select * from users order by username asc;

select * from users;
update users set age=28,city='vapi' where age>23;

update users set age=age+1 where email LIKE '%@gmail.com';


delete from users where user_id=2;

alter table users rename column username to full_name;

alter table users 
alter column age type smallint;

alter table users alter column city set not null;

alter table users add constraint age check(age>=18);

insert into users(full_name,email,age,city) values('vandan','vanadan@gmail.com',18,'surat');

select * from users;

alter table users rename to customers;
select * from customers;

-- change the datatypes of the salary column to integer
alter table employee
alter column salary type integer using salary::integer;

select * from employee;

select *  from employee2;

ALTER TABLE employee2
ADD COLUMN salary NUMERIC(10,2);


copy employee2(employee_id, name, position, department, hire_date, salary)
FROM 'C:/Users/anaya/Downloads/employee_data.csv'
DELIMITER ','
CSV HEADER;

truncate table employee2;

drop table employee2;



select name,salary,(salary*10) as bonus from employee;

select name,salary,
	(salary*12) as annual_salary,
	(salary*0.05) as increment_amount,
	(salary + salary* 0.05) as new_salary,
	(salary *1.05) as new_salary2
from employee;

select * from customers
where age !=30;

select trim('    moniter   ') as trimmed_text;
select length('    moniter   ') as trimmed_text;

select * from customers;
select left(city,3) as city from customers; 
select right(city,3) as city from customers; 

select now() as current_datetime;
select current_date as today_date;
--select added_date, current_date,(current_date-added_date) as days_difference from products;

--extract() - extract parts of a date
--extract the year,month and day from the added_date column.

--select product_name,extract(year from added_date) as year_added,extract(month from added_date) as month_added,extract(day from added_date) as day_added from products;

--age()
--select product_name,age(current_date,added_date) as age_since_added from products;

/*
select product_name,price,
	CASE
		WHEN price>=50000 then 'expensive'
		WHEN price=>10000 AND price<=49999 THEN 'moderate'
		ELSE 'Affordable'
	END AS price_category
FROM products;

*/
/*
select product_name,quantity
	CASE
		WHEN quantity>=10 THAN 'Instock'
		WHEN quantity Between 5 and 9 THAN 'Limited stock'
		Else 'out of stock soon'
	END AS stock_status
from products;

*/

/*
select product_name,quantity
	CASE
		WHEN category like 'Electronic%' THAN 'Electronic item'
		WHEN category like 'Furniture%' THAN 'Furniture item'
		Else 'Accessory Item'
	END AS stock_status
from products;



select product_name,
	COALESCE(discount_price,price) as final_price
FROM products;

*/

select product_name,category,price, row_number() over(partition by category order by price desc)
as row_col from products;