create table shop.discounts
(
	id serial
		constraint discounts_pk
			primary key,
	type_id int,
	begin timestamp,
	finish timestamp,
	product_id int,
	group_id int,
	percent double precision,
	fixed_sum money
);
