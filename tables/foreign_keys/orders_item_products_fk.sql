alter table shop.orders_item add constraint orders_item_products_fk foreign key (product_id) references products(id);
