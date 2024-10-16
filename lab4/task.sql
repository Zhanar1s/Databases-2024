-- task 1:
create database lab4;


-- task 2:
create table Warehouses(
    code serial primary key,
    location varchar(255),
    capacity integer
);

create table Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse integer references Warehouses(code)
);


-- task 4:
select * from warehouses;


-- task 5:
select * from boxes where value > 150;


-- task 6:
select distinct contents from boxes;


-- task 7:
select warehouse, count(*) as num_box
from Boxes
group by warehouse;


-- task 8:
select warehouse, count(*) as num_box
from Boxes
group by warehouse
having count(*)>2;
--агрегатные функции

-- task 9:
insert into warehouses (location, capacity)
values
('New York', 3);


-- task 10:
insert into boxes (code, contents, value, warehouse)
values
('H5RT', 'Papers', 200, 2);


-- task 11:
update  boxes
set value = 0.85 * value
where value = (select value from boxes order by value desc limit 1 offset 2);


-- task 12:
delete from boxes
where value < 150;


-- task 13:
delete from Boxes
where warehouse in (
    select code FROM Warehouses
    WHERE location = 'New York'
)
RETURNING *;








