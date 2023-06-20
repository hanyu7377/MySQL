select * from store.customers
where birth_date > '1990-01-01' or (points > 1000 and state = 'va');

select * from store.customers
where  birth_date > '1990-01-01' or points > 1000 ;

select * from store.customers
where not ( birth_date > '1990-01-01' or points > 1000 );

-- from the order_items table, get the items
-- for order #6
-- where the total price is greater than 30
select * from store.order_items
where order_id = 6  and unit_price * quantity > 30
