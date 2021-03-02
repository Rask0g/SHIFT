alter table shop.orders_item add constraint orders_item_orders_fk foreign key (order_id) references orders(id);
