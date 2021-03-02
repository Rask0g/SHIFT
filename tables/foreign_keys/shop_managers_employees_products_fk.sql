alter table shop.shop_managers add constraint shop_managers_employees_products_fk foreign key (manager_id) references employees(id);
