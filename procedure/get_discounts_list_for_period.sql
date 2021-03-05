create or replace procedure get_discounts_list_for_period(
    p_begin in    timestamp,
    p_finish   in    timestamp,
    p_discounts inout discount_info[]
) as $$
begin
    select array_agg(
               (d.id, d.begin, d.finish, d.product_id, d.group_id, d.percent, d.fixed_sum)::discount_info
           )
      into p_discounts
      from shop.discounts d
     where d.begin between p_begin and p_finish
        or d.begin   between p_begin and p_finish;
end;
$$ language plpgsql;
