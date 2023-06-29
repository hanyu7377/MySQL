select order_id, orders.customer_id,first_name, last_name from store.orders
join  store.customers on store.orders.customer_id = store.customers.customer_id;

select order_id , oi.product_id, quantity, oi.unit_price 
from store.order_items oi
join products p on oi.product_id = p.product_id;

select *
from store.order_items oi
join products p on oi.product_id = p.product_id;

