use  sakila;

####Q2.a
select avg(replacement_cost) as average_replace_cost from film
where special_features = "Deleted Scenes,Behind the Scenes";


#####Q2.b
with tmp as (
select f.*, c.name as category from film f
left join film_category fc on f.film_id = fc.film_id
left join category c on fc.category_id = c.category_id)

select category , rating,
       count(film_id) as Total_number_of_films, 
	   max(rental_rate) as max_rental_rate, 
       max(rental_duration) as max_rental_duration 
       from tmp
       where length >= 120
       group by category ,rating
       order by category ,rating;
    

######Q2.c
with tmp as (
select fa.actor_id,
       concat(a.first_name,", ",a.last_name ) as full_name , 
       fa.film_id ,
       f.rating,
       f.title from film_actor fa
left join actor a on fa.actor_id = a.actor_id
left join film f on fa.film_id = f.film_id
where f.rating = "PG"
)


select actor_id, full_name , group_concat(title separator " | ") as movie_acted_in from tmp
group by actor_id;


#####Q2.d
with tmp as (
    select r.rental_id, 
           r.inventory_id,
           i.film_id,
           fc.category_id,
           c.name as category, 
           f.title as Film_name,
           l.name as language,
           f.release_year,
           f.rental_duration,
           p.amount
           from rental r
           left join inventory i on r.inventory_id = i.inventory_id
           left join payment p on r.rental_id = p.rental_id
           left join film f on i.film_id = f.film_id
           left join film_category fc on f.film_id = fc.film_id
           left join category c on fc.category_id = c.category_id
           left join language l on f.language_id = l.language_id
	order by rental_id
)

select category , 
       Film_name, 
       language, 
       release_year, 
       sum(rental_duration) as Total_Rental_Time_in_Days,
       sum(amount) as Gross_Rental_Revenue 
       from tmp
where category = "Action"
group by film_id ;
#######Q2.e
with tmp as (
    select f.film_id,
           fc.category_id,
           c.name as category, 
           f.title as Film_name,
           l.name as language,
           f.release_year,
           f.replacement_cost
           from film f
           left join film_category fc on f.film_id = fc.film_id
           left join category c on fc.category_id = c.category_id
           left join language l on f.language_id = l.language_id
)

select Film_name, 
       category , 
       language, 
       release_year, 
       replacement_cost,
       case when replacement_cost <= 10 then "A" 
            when replacement_cost > 10 and replacement_cost <= 20 then "B"
            when replacement_cost > 20 then "C" end as customersreplacement_cost_category
       from tmp
       where category in ("Action", "Children", "Classics", "Comedy" , "Documentary")
       order by replacement_cost asc;
       
#####Q3.a

describe film;
Alter table film 
  modify column special_features varchar(255);
UPDATE film
SET special_features = REPLACE(special_features, 'Behind the Scenes', 'Extras');
select film_id ,special_features from film
where special_features = "Extras";
select special_features from film;


####Q3.b
SELECT 
    CONSTRAINT_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_SCHEMA = 'sakila'
    AND TABLE_NAME = 'inventory';
ALTER TABLE film_actor
DROP FOREIGN KEY fk_film_actor_film;
ALTER TABLE film_category
DROP FOREIGN KEY fk_film_category_film;
Alter table inventory
drop foreign key fk_inventory_film;

begin transaction
set foreign_key_check = 0;
commit;

with tmp as (
select f.* ,fc.category_id,c.name as category from film f
left join film_category fc on f.film_id = fc.film_id
left join category c on fc.category_id = c.category_id
where c.name = "Games"
)



DELETE FROM film 
WHERE film_id IN 
    (SELECT film_id FROM tmp) ;
    
    

select * from film
limit 100000;


########Q3.c
use sakila;
alter table film
add column temporary_column double,
add column random_selection char(1);

update film
set temporary_column = rand() ,
    random_selection  = case 
                     when temporary_column < 0.33 then "X"
                     when temporary_column between 0.33 and 0.66 then "Y"
                     else "Z" end;

select count(film_id) from film 
group by random_selection;

alter table film
drop temporary_column;

