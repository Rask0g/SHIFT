create type order_info as
(
    order_items     shop.order_item_info[],
    employee_id     integer,
    shop_id         integer
);
