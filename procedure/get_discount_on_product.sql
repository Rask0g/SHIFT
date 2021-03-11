-- Получение размера скидки на единицу товара
create or replace procedure get_discount_on_product(
    p_product_id       in      integer,
    p_total_discount   inout   numeric(12,2)
)
as
$$
declare
    v_group_id          integer;
    v_price             numeric;
    v_parents_groups    integer[];
    v_percent           numeric[];
    v_fixed_sum         numeric[];
    v_discount_type     varchar[];
begin

p_total_discount = 0;

-- Получение цены товара и его номера группы
select group_id, price
  into v_group_id, v_price
  from products
 where id = p_product_id;

-- Получение всех родительских групп
with recursive r as (
select id, parent_group_id
  from product_groups pg
 where pg.id = v_group_id

union

select pg.id, pg.parent_group_id
  from product_groups pg
  join r
    on pg.id = r.parent_group_id
)
select array_agg(parent_group_id)
  into v_parents_groups
  from r;

-- Все скидки на заданный товар
select array_agg(type),
       array_agg(percent),
       array_agg(fixed_sum)
  into v_discount_type,
       v_percent,
       v_fixed_sum
  from shop.discounts d,
       shop.discount_types dt
 where d.begin  < now()::timestamp
   and d.finish > now()::timestamp
   and d.type_id = dt.id
   and (dt.type = 'все товары' or
        group_id = any(array_append(v_parents_groups, v_group_id)) or
        product_id = p_product_id);

-- Считаем скидку в виде процента от цены товара
for i in 1..cardinality(v_percent) loop
    if v_percent[i] is not null then
        p_total_discount = v_price * (v_percent[i] / 100);
    end if;
    end loop;

-- Считаем скидку в виде фиксированной суммы
for i in 1..cardinality(v_fixed_sum) loop
    if v_fixed_sum[i] is not null then
        p_total_discount = p_total_discount + v_fixed_sum[i];
    end if;
    end loop;
end
$$ language plpgsql;
