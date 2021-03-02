create table shop.products
(
	id serial
		constraint products_pk
			primary key,
	name varchar,
	group_id int,
	price money,
	quantity_type_id int
);
