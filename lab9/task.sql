create database lab9;

--1:
create function increase_value(a int) returns int as
$$
begin
    return a + 10;
end;
$$
    language plpgsql;

select increase_value(10);



--2:
create function compare_numbers(a int, b int) returns text as
$$
begin
    if a > b then
        return 'Greater';
    elsif a = b then
        return 'Equal';
    else
        return 'Lesser';
    end if;
end;
$$
    language plpgsql;

select compare_numbers(5,3);



--3:
create function number_series(n int) returns table(series int) as
$$
declare
    i int;
begin
    i := 1;
    while i <= n loop
        series := i;
        return next;
        i := i + 1;
    end loop;
end;
$$
    language plpgsql;

select number_series(10);



--4:
create function find_employee(emp_name varchar)
returns table(id int, department varchar) as
$$
begin
    return query
    select employees.id, employees.department
    from employees
    where name = emp_name;
end;
$$
    language plpgsql;

SELECT * FROM find_employee('John Doe');



--5:
create function list_products(category_name varchar)
returns table(product_id int, product_name varchar, price numeric) as
$$
begin
    return query
    select products.product_id, products.product_name, products.price
    from products
    where category = category_name;
end;
$$
    language plpgsql;

SELECT * FROM list_products('Electronics');



--6:
create function calculate_bonus(emp_id int)
returns numeric as
$$
declare
    salary numeric;
    bonus numeric;
begin
    select employees.salary into salary from employees  where id = emp_id;
    if salary is not null then
        bonus := salary * 0.10;
        return bonus;
    else
        raise exception 'employee not found';
    end if;
end;
$$
    language plpgsql;

create function update_salary(emp_id int)
returns void as $$
declare
    bonus numeric;
begin
    bonus := calculate_bonus(emp_id);
    update employees
    set salary = salary + bonus
    where id = emp_id;
end;
$$ language plpgsql;

select update_salary(1);
SELECT * FROM employees WHERE id = 1;


--7:
create function complex_calculation(input_number int, input_text varchar)
returns text as
$$
declare
    numeric_result int;
    string_result varchar;
    final_result text;
begin
    <<main_block>>
    begin
        <<numeric_computation>>
        begin
            numeric_result := input_number * 2;
        end numeric_computation;

        <<string_manipulation>>
        begin
            string_result := upper(input_text);
        end string_manipulation;

        final_result := numeric_result || ' ' || string_result;

        return final_result;
    end main_block;
end;
$$
    language plpgsql;

select * from complex_calculation(10, 'abc');
