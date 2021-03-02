create table shop.shops_warehouse
(
	id serial
		constraint shops_warehouse_pk
			primary key,
	product_id int,
	quantity double precision,
	shop_id int
);
