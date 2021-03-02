alter table shop.employees add constraint employees_shops_fk foreign key (shop_id) references shops(id);
