create table shop.products
(
	id 			serial
				constraint products_pk
				primary key,
	name			varchar,
	group_id		int,
	price			numeric(12,2),
	min_price		numeric(12,2),
	quantity_type_id	int,
	check (price >= 0)
);
