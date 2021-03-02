alter table employees add constraint employees_fk foreign key (manager_id) references employees(id);
