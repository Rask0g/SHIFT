alter table product_groups add constraint product_groups_fk foreign key (parent_group_id) references product_groups(id);
