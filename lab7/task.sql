-- create tables
create table departments (
    department_id int primary key,
    name varchar(100),
    budget decimal(10, 2)
);

create table employees (
    employee_id int primary key,
    department_id int,
    name varchar(100),
    surname varchar(100),
    salary decimal(10, 2),
    foreign key (department_id) references departments(department_id)
);

create table countries (
    country_id int primary key,
    name varchar(100)
);


-- insert data
insert into departments (department_id, name, budget)
values
(1, 'Sales', 100000.00),
(2, 'Engineering', 200000.00),
(3, 'Marketing', 150000.00);
(4, 'Research', 180000.00),
(5, 'Development', 220000.00),
(6, 'Support', 120000.00);

insert into employees (employee_id, department_id, name, surname, salary)
values
(1, 1, 'John', 'Doe', 50000.00),
(2, 2, 'Jane', 'Smith', 75000.00),
(3, 1, 'Bob', 'Johnson', 60000.00),
(4, 3, 'Alice', 'Davis', 55000.00);
(5, 1, 'Emily', 'Brown', 65000.00),
(6, 2, 'David', 'Wilson', 80000.00),
(7, 3, 'Sarah', 'Jones', 58000.00),
(8, 1, 'Michael', 'Taylor', 72000.00),
(9, 2, 'Jessica', 'White', 90000.00),
(10, 3, 'Christopher', 'Martin', 62000.00),
(11, 1, 'Ashley', 'Thompson', 68000.00),
(12, 2, 'Matthew', 'Garcia', 85000.00),
(13, 3, 'Amanda', 'Rodriguez', 61000.00),
(14, 1, 'Daniel', 'Clark', 74000.00);

insert into countries (country_id, name)
values
(1, 'Russia'),
(2, 'USA'),
(3, 'Germany'),
(4, 'France'),
(5, 'China');


-- task 1:
select * from countries where name = 'Russia';

create index index_countries_name on countries (name);


-- task 2:
select * from employees where name = 'John' and surname = 'Doe';

create index index_employees_name_surname on employees (name, surname);


-- task 3:
SELECT * FROM employees WHERE salary < 70000 AND salary > 50000;

create unique index index_employees_salary on employees (salary);

-- task 4:
SELECT * FROM employees WHERE substring(name from 1 for 4) = 'John';

create index index_employees_name_substring on employees ((substring(name from 1 for 4)));


-- task 5:
explain
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id WHERE
d.budget > 120000 AND e.salary < 75000;

create index index_employees_department_id_salary on employees (department_id, salary);
create index index_departments_department_id_budget on departments (department_id, budget);