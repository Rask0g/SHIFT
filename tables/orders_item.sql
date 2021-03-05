create table shop.orders_item
(
	id 			serial
				constraint orders_item_pk
				primary key,
	order_id		int,
	product_id		int,
	quantity		double precision,
	quantity_type_id	int,
	discount		int,
	amount			numeric(12,2),
	total_sum		numeric(12,2),
	check (quantity > 0),
	check (amount >= 0),
	check (total_sum >= 0)
);
