--Написать процедуру добавления товара в ассортимент магазина
create or replace procedure add_new_product(
    p_product_name     in    varchar,
    p_product_group_id in integer,
    p_price  in integer,
    p_quantity_type_id integer
)
as
$$
begin
    insert into shop.products (name, group_id, price, quantity_type_id)
    values (p_product_name, p_product_group_id, p_price, p_quantity_type_id);
end
$$ language plpgsql;
