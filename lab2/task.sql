-- Task 1:
create database lab2;


-- Task 2:
create table countries (
    country_id serial primary key,
    country_name varchar(200),
    region_id int,
    population int
);


-- Task 3:
insert into countries(country_name, region_id, population)
values ('Kazakhstan', 1, 19000000 );


-- Task 4:
insert into countries(country_name)
values('Australia');


-- Task 5:
insert into countries(country_name, region_id, population)
values('Antarctica', NULL, 0);


-- Task 6:
insert into countries(country_name, region_id, population)
values
    ('United States', 2, 330000000),
    ('China', 3, 1400000000),
    ('India', 4, 1380000000);


-- Task 7:
alter table countries
alter column country_name
set default 'Kazakhstan';


-- Task 8:
insert into countries(region_id, population)
values(1, 19000000);


-- Task 9:
insert into countries default values


-- Task 10:
create table countries_new (like countries including all );


-- Task 11:
insert into countries_new
select * from countries;


-- Task 12:
update countries
set region_id = 1
where region_id is null;


-- Task 13:
select country_name, population *1.1 as "New Population"
from countries;



-- Task 14:
delete from countries
where population < 100000;


-- Task 15:
delete from countries_new
where country_id in (select country_id from countries)
returning *;



-- Task 16:
delete from countries
returning *;