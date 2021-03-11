--Добавление нового магазина
create or replace procedure add_new_shop(
    p_name	    in varchar,
    p_address	in varchar
)
as
$$
begin
    insert into shop.shops (name, address)
    values (p_name, p_address);
end
$$ language plpgsql;
