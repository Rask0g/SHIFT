create table shop.product_groups
(
	id 			serial
				constraint product_groups_pk
				primary key,
	parent_group_id	int,
	group_name		varchar
);
