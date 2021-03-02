create table shop.orders
(
	id serial
		constraint orders_pk
			primary key,
	shop_id int,
	total_amount money,
	date timestamp,
	employee_id int
);
