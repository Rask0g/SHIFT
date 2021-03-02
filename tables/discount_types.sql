create table shop.discount_types
(
	id serial
		constraint discount_types_pk
			primary key,
	type varchar
);
