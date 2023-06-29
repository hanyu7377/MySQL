select * from store.customers
limit 6, 3;


-- get the top three royal customers
select * from store.customers 
order by points desc
limit 3