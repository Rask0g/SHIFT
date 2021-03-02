alter table shop.discounts add constraint discounts_discount_types_fk foreign key (type_id) references discount_types(id);
