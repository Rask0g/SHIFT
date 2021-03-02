create table discount_types
(
	id serial
		constraint discount_types_pk
			primary key,
	type varchar
);

create table quantity_types
(
	id serial
		constraint quantity_types_pk
			primary key,
	type varchar
);

create table product_groups
(
	id serial
		constraint product_groups_pk
			primary key,
	parent_group_id int,
	group_name varchar
);

create table products
(
	id serial
		constraint products_pk
			primary key,
	name varchar,
	group_id int references product_groups (id),
	price money,
	quantity_type_id int references quantity_types (id)
);

create table discounts
(
	id serial
		constraint discounts_pk
			primary key,
	type_id int references discount_types(id),
	begin timestamp,
	finish timestamp,
	product_id int references products(id),
	group_id int references product_groups(id),
	percent double precision,
	fixed_sum money
);

create table shops_warehouse
(
	id serial
		constraint shops_warehouse_pk
			primary key,
	product_id int references products(id),
	quantity double precision,
	shop_id int
);

create table shops
(
	id serial
		constraint shops_pk
			primary key,
	name varchar,
	address varchar
);

create table employees
(
	id serial
		constraint employees_pk
			primary key,
	first_name varchar,
	second_name varchar,
	last_name int,
	position varchar,
	manager_id int,
	shop_id int references shops(id)
);

create table shop_managers
(
	id serial
		constraint shop_managers_pk
			primary key,
	shop_id int references shops(id),
	manager_id int references employees(id)
);

create table orders
(
	id serial
		constraint orders_pk
			primary key,
	shop_id int references shops(id),
	total_amount money,
	date timestamp,
	employee_id int references employees(id)
);

create table orders_item
(
	id serial
		constraint orders_item_pk
			primary key,
	order_id int references orders(id),
	product_id int references products(id),
	quantity double precision,
	quantity_type_id int references quantity_types(id),
	discount int,
	amount money,
	total_sum money
);
