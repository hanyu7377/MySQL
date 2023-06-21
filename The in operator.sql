select * from store.customers
where state in ('va','fl','ga');

select * from store.customers
where state not in ('va','fl','ga');
-- return products with quantity in stock equal to 49, 38, 72
select  * from store.products
where quantity_in_stock in (49,38,72)