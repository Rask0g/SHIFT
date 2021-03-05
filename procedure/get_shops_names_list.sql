--Получение списка всех магазинов
create or replace procedure get_shops_names_list(
    p_shops_names inout varchar[]
)
as
$$
begin
    select array_agg(shop.shops.name)
      into p_shops_names
      from shop.shops;
end;
$$ language plpgsql;
