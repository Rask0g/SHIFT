alter table shop.shops_warehouse add constraint shops_warehouse_products_fk foreign key (product_id) references products(id);
