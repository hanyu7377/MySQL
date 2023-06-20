select * from store.customers 
where points > 3000;

select * from store.customers 
where state = 'VA';

select * from store.customers 
where state!= 'VA';

select * from store.customers 
where state <> 'VA';


select * from store.customers 
where birth_date > '1990-01-01';

-- get the orders placed this year
select * from  store.orders
where order_date >= '2019-01-01'
