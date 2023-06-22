select * from store.customers
where last_name like '%field%';

select * from store.customers
where last_name  regexp 'field$';

-- use dollar sign to represent the end of the string
select * from store.customers
where last_name  regexp '^field';
-- use carrot sign to represent the beginning of the string

select * from store.customers
where last_name  regexp 'field|mac|rose';

select * from store.customers
where last_name regexp '[gim]e';
-- means ge ie me included in the string
select * from store.customers
where last_name regexp '[a-h]e';
-- means ae be ce de ee fe ge he included in the string

-- get the customers whose
-- first names are elka or ambur
select * from store.customers
where first_name regexp 'elka|ambur';

-- last names end with ey or on
select * from store.customers
where last_name regexp 'ey$|on$';
-- last names start with my or contains se
select * from store.customers
where last_name regexp '^my|se';
-- last names contain B followed by R or U
select * from store.customers
where last_name regexp 'br|bu'

