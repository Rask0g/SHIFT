create table shop.discounts
(
	id		serial
			constraint discounts_pk
			primary key,
	type_id	int,
	begin		timestamp,
	finish		timestamp,
	product_id	int,
	group_id	int,
	percent	double precision,
	fixed_sum	numeric(12,2),
	check (percent >= 0), 
	check (fixed_sum >= 0)
);
