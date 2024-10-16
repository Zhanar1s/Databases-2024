-- task 1:
create database lab3;


-- task 2:
select * from departments;
select * from customers;
select * from employees;


-- task 3:
select lastname from employees;


-- task 4:
select distinct lastname from employees;


-- task 5:
select * from employees where lastname = 'Smith';


-- task 6:
select * from employees where lastname = 'Smith' or lastname = 'Doe';
select * from employees where lastname in ('Smith', 'Doe');


-- task 7:
select * from employees where department=14;


-- task 8:
select * from employees where department=37 or department=77;
select * from employees where department in  (37, 77);


-- task 9:
select sum(budget) as  sum  from departments;


-- task 10:
select department, count(*) as num_of_employees from employees group by department;


-- task 11:
select department, count(*) as num_of_employees from employees group by department having count(*)>2;


-- task 12:
select name from departments order by budget desc limit 1 offset 1;


-- task 13:
select name, lastname from employees
where department in (
select code from departments
where budget = (select min(budget) from departments));                            )


-- task 14:
select name from employees where city = 'Almaty'
union
select name from customers where city = 'Almaty';


-- task 15:
select *
from departments
where budget > 60000
order by budget asc , code desc;


-- task 16:
UPDATE departments SET budget = budget * 0.9
WHERE code = (SELECT code FROM departments ORDER BY budget ASC LIMIT 1);


-- task 17:
update employees set department = 14 where department = 77;


-- task 18:
delete from employees where department=14;


-- task 19:
delete from employees;






















select e.name, e.lastname
from employees e
join departments d on e.department=d.code
where budget = (select min(budget) from departments)