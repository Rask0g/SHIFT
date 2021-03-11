do $$
    declare
begin
    call add_new_shop('Магазин 1','ул Ленина');
    call add_new_shop('Магазин 2','ул Пушкина');
end
$$ language plpgsql;
