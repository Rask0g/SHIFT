--Добавление нового сотрудника
create or replace procedure add_new_employee(
    p_first_name	in varchar,
    p_second_name	in varchar,
    p_last_name	in varchar,
    p_position		in varchar,
    p_manager_id	in integer,
    p_shop_id 		in integer
)
as
$$
begin
    insert into shop.employees (first_name, second_name, last_name, position, manager_id, shop_id)
    values (p_first_name, p_second_name, p_last_name, p_position, p_manager_id, p_shop_id);
end
$$ language plpgsql;
