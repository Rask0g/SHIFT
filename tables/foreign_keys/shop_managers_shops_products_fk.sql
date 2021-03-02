alter table shop.shop_managers add constraint shop_managers_shops_products_fk foreign key (shop_id) references shops(id);
