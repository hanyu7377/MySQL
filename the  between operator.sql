select * from store.customers
where points >= 1000 and points <= 3000;
select * from store.customers
where points between 1000 and 3000;

-- return customers born between 1/1/1990 and 1/1/2000
select * from store.customers 
where  birth_date between '1990-01-01' and '2000-01-01'