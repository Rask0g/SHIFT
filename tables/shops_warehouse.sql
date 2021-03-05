create table shop.shops_warehouse
(
	product_id int not null,
	quantity double precision check (quantity >= 0),
	shop_id int not null,
	constraint shops_warehouse_pk primary key(shop_id, product_id)
);
