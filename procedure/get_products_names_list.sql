--Получение списка всего ассортимента товаров сети
create or replace procedure get_products_names_list(
    p_products_names inout varchar[]
)
as
$$
begin
    select array_agg(shop.products.name)
      into p_products_names
      from shop.products;
end;
$$ language plpgsql;
