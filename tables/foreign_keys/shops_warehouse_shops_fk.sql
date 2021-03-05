alter table shop.shops_warehouse add constraint shops_warehouse_shops_fk foreign key (shop_id) references shops(id);
