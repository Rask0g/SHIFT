-- Проверка получение скидки на товар или группу товаров
create or replace procedure get_discount_on_product(
    p_product_id    in      integer,
    p_group_id      in      integer,
    p_percent       inout   double precision,
    p_fixed_sum     inout   numeric(12,2)
)
as
$$
begin
    select d.percent, d.fixed_sum
    into p_percent, p_fixed_sum
    from shop.discounts d
    where d.product_id = p_product_id or d.group_id = p_group_id;
end
$$ language plpgsql;
