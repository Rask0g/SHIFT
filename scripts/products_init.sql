do $$
    declare
begin
    call add_new_product('Honor', 3, 20000, 10000, 1);
    call add_new_product('iPhone', 3, 60000, 40000, 1);
    call add_new_product('Acer', 7, 30000, 20000, 1);
    call add_new_product('Dell', 7, 60000, 45000, 1);
    call add_new_product('Холодильник', 16, 40000, 32000, 1);
    call add_new_product('Утюг', 21, 2000, 1400, 1);
    call add_new_product('Кресло', 25, 5000, 3500, 1);
    call add_new_product('Стул', 29, 3000, 2000, 1);
    call add_new_product('Гардероб', 34, 10000, 7200, 1);
end
$$ language plpgsql;
