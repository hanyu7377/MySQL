select * from store.customers
where last_name like 'b%';
select * from store.customers
where last_name like 'brush%';
select * from store.customers
where last_name like '5b%';
select * from store.customers
where last_name like '%y';
select * from store.customers
where last_name like '_____y';
select * from store.customers
where last_name like 'B____y';

-- get the customers whose addresses contain trail or avenue
select * from store.customers 
where address like '%trail%' or  address like '%avenue%';

-- phone numbers end with 9
select * from store.customers
where phone like '%9'
