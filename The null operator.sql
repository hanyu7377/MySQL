select * from store.customers
where phone is null;
select * from store.customers
where phone is not null;

-- get the orders that are not shipped
select * from store.orders
where shipped_date is null