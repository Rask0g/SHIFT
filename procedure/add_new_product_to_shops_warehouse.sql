--Добавление товаров на склад магазина
create or replace procedure add_new_product_to_shops_warehouse(
    p_product_id    in integer,
    p_quantity      in double precision,
    p_shop_id       in integer
)
as
$$
declare
    v_count integer;
    v_quantity_type varchar;
begin

    select type
    into v_quantity_type
    from shop.quantity_types as q_t, shop.products as p
    where p.id = p_product_id and p.quantity_type_id = q_t.id;

    if v_quantity_type = 'штука' and (p_quantity - round(p_quantity)) > 0.0000001 then
        raise exception 'Wrong quantity type';
    end if;

    select count(*)
    into v_count
    from shop.shops_warehouse
    where product_id=p_product_id and shop_id=p_shop_id;

    if v_count = 1 then
        update shop.shops_warehouse
        set quantity = (quantity + p_quantity)
        where product_id = p_product_id and shop_id = p_shop_id;
    else
        insert into shop.shops_warehouse (product_id, quantity, shop_id)
        values (p_product_id, p_quantity, p_shop_id);
    end if;
end
$$ language plpgsql;
