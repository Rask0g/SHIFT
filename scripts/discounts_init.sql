do $$
    declare
begin
    call add_new_discount(2, '2021-02-01 12:00:00', '2021-05-01 12:00:00', null, 3, 7.5, null);
    call add_new_discount(1, '2021-01-01 12:00:00', '2021-12-31 12:00:00', null, null, null, 500);
    call add_new_discount(2, '2021-01-01 12:00:00', '2021-05-01 12:00:00', null, 14, 50, null);
    call add_new_discount(3, '2021-01-01 12:00:00', '2021-05-01 12:00:00', 9, null, null, 2000);
    call add_new_discount(3, '2021-05-01 12:00:00', '2021-07-01 12:00:00', 7, null, null, 500);
end
$$ language plpgsql;
