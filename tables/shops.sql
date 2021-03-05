create table shop.shops
(
	id 		serial
			constraint shops_pk
			primary key,
	name		varchar,
	address	varchar
);
