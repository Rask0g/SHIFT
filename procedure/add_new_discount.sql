--Добавление скидки
create or replace procedure add_new_discount(
    p_type_id     in integer,
    p_begin       in timestamp,
    p_finish      in timestamp,
    p_product_id  in integer,
    p_group_id    in integer,
    p_percent     in double precision,
    p_fixed_sum   in numeric(12,2)
)
as
$$
begin
    if (p_product_id is null and p_group_id is not null or p_product_id is not null and p_group_id is null) and  -- p_product_id xor p_group_id
       (p_percent is null and p_fixed_sum is not null or p_percent is not null and p_fixed_sum is null)
    then insert into shop.discounts (type_id, begin, finish, product_id, group_id, percent, fixed_sum)
         values (p_type_id, p_begin, p_finish, p_product_id, p_group_id, p_percent, p_fixed_sum);
    else
        raise exception 'Wrong arguments passed';
    end if;
end
$$ language plpgsql;
