create table shop.employees
(
	id serial
		constraint employees_pk
			primary key,
	first_name varchar,
	second_name varchar,
	last_name int,
	position varchar,
	manager_id int,
	shop_id int
);

