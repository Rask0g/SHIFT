alter table shop.orders_item add constraint orders_item_quantity_types_fk foreign key (quantity_type_id) references quantity_types(id);
