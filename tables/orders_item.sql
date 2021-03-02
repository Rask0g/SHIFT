create table shop.orders_item
(
	id serial
		constraint orders_item_pk
			primary key,
	order_id int,
	product_id int,
	quantity double precision,
	quantity_type_id int,
	discount int,
	amount money,
	total_sum money
);
