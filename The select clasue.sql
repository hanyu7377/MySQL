select * from store.customers 
where customer_id = 1;

select * from store.customers
order by first_name;

select last_name , 
first_name , 
points ,
(points + 10) + 100  as 'discount_factor' 
from store.customers;

select distinct state from store.customers;
select  state from store.customers;


-- return all the products
--  name
-- unit price
-- new price (unit price * 1.1)
select  name ,unit_price, unit_price * 1.1 as new_price from store.products
