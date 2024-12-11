create database lab10;


create table Books (
    book_id int primary key,
    title varchar(255),
    author varchar(255),
    price decimal(10, 2),
    quantity int
);


create table Orders (
    order_id int primary key,
    book_id int references Books(book_id),
    customer_id int,
    order_date  date,
    quantity int
);


create table Customers (
    customer_id int primary key,
    name varchar(255),
    email varchar(255)
);


insert into Books ( book_id, title, author, price, quantity)
values
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);

insert into Customers (customer_id, name, email)
values
(101, 'John Doe', 'johndoe@example.com'),
(102, 'John Doe', 'johndoe@example.com');


-- task 1:
begin transaction;

insert into Orders(order_id, book_id, customer_id, order_date, quantity)
values
(1, 1, 101, current_date, 2 );

update Books
set quantity = quantity - 2
where book_id = 1;

commit;



-- task 2:
do $$
begin

  insert into Orders (order_id, book_id, customer_id, order_date, quantity)
  values (2, 3, 102, current_date, 10);

  if (select quantity from Books where book_id = 3) >= 10 then

      commit;
  else

      rollback ;
  end if;

end $$;

-- task 3:

-- s1:
set transaction isolation level read committed;
begin transaction;

update Books
set price = 55.00
where book_id = 1;

commit;

-- s2:
set transaction isolation level read committed;
begin transaction;

select price from Books where book_id = 1;

commit;


-- task 4:
begin transaction;

update Customers
set email = 'newemail@example.com'
where customer_id = 101;

commit;

select email from Customers where customer_id = 101;
