create table shop.shop_managers
(
	id 		serial
			constraint shop_managers_pk
			primary key,
	shop_id	int,
	manager_id	int
);
