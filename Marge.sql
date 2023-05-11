CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50)  NULL,
  last_name VARCHAR(50)  NULL,
  email VARCHAR(100)  NULL UNIQUE,  
  salary NUMERIC(10, 2)  NULL
);

--drop table employees;

CREATE TABLE employees_new (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50)  NULL,
  last_name VARCHAR(50)  NULL,
  email VARCHAR(100)  NULL UNIQUE,  
  salary NUMERIC(10, 2)  NULL,
	job_title VARCHAR(100)  NULL
);

truncate table employees;
truncate table employees_new;

insert into employees values(1,'GM','BAPPA','gm@gmail.com',2000);
insert into employees values(2,'Ratan','KK','ratan@gmail.com',3000);

insert into employees_new values(1,'GM','BAPPA','gm@gmail.com',2000,'Programmer');
insert into employees_new values(2,'Ratan Ahmed','KK','rstan@gmail.com',5000,'Programmer');
insert into employees_new values(3,'Mostak Ahmed','pp','mostak@gmail.com',1000,'Programmer');

select * from employees;
select * from employees_new;

INSERT INTO employees(id,first_name,salary)
SELECT id,first_name,salary FROM employees_new
ON CONFLICT (id) DO UPDATE SET
  first_name = EXCLUDED.first_name,
  salary = EXCLUDED.salary ;



merge into employees sda
using employees_new sdn on sda.id = sdn.id
when matched then
  update set first_name = sdn.first_name, salary = sdn.salary
when not matched then
  insert (id, first_name,last_name,email,salary)
  values (sdn.id, sdn.first_name, sdn.last_name,sdn.email,sdn.salary);
  
  
  
