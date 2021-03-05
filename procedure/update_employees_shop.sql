--Написать процедуру перемещения сотрудника на работу в другой магазин
create or replace procedure update_employees_shop(
    p_employee_id   in integer,
    p_shop_id       in integer
)
as
$$
begin
    update shop.employees set shop_id = p_shop_id where id = p_employee_id;
end;
$$ language plpgsql;
