--1. List all actors
SELECT * from actors;

-- 2 FInd the surname of the actors with the forname 'John'
SELECT last_name from actor where first_name = 'John';

-- 3 Find all actors with surname 'Neeson'.
select * from actor where last_name = 'Neeson';

--4 Find all actors with ID numbers divisible by 10.
select * from actor where (actor_id %10) = 0;

--5 What is the description of the movie with an ID of 100?
select description from film where film_id = 100;
 
 --6 Find every R rated movie.
select title, rating from film where rating = 'r';

-- 7 Find every non-R-rated movie.
select title, rating from film where rating != 'r';

--8 Find the ten shortest movies.
select title, length from film order by length asc limit 10;

--9 Find the movies with the longest runtime, without using LIMIT
select title, length
 from film 
 where length = (select max(length) from film);

--10Find all movies that have deleted scenes.
select title, special_features from film where special_features = 'Deleted Scenes';

--11  Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) > 2 ORDER BY last_name DESC;

--12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name FROM actor group by last_name HAVING COUNT(last_name) > 1 ORDER BY COUNT(last_name) DESC;

--13Which actor has appeared in the most films?
SELECT
  a.actor_id, first_name, last_name,
  COUNT(a.actor_id) AS `actor_in_films` 

FROM
  sakila.film_actor a
inner join 
sakila.actor b
on a.actor_id = b.actor_id
GROUP BY 
actor_id, first_name, last_name
ORDER BY 
  `actor_in_films` DESC

LIMIT 1;

--14 'Academy Dinosaur' has been rented out,
-- when is it due to be returned?
SELECT return_date, inventory_id FROM sakila.rental where inventory_id in (SELECT inventory_id FROM sakila.inventory where film_id = (select film_id from sakila.film where title = 'academy dinosaur'));

--15  What is the average runtime of all films?
select avg(length) from sakila.film;


-- 16. List the average runtime for every film category.
 select  c.name as category_name, avg(b.length) as average_length
 from sakila.film_category a
 inner join sakila.film b 
 on a.film_id = b.film_id
 inner join 
 sakila.category c 
 on a.category_id = c.category_id
  group by a.category_id,c.name ;

--17. List all movies featuring a robot.
select title, description from sakila.film where description like '%robot%';

-- 18. How many movies were released in 2010?
select * from sakila.film where release_year = 2010;

--19. Find the titles of all the horror movies.
 select  c.name as category_name, b.title
 from sakila.film_category a
 inner join sakila.film b 
 on a.film_id = b.film_id
 inner join 
 sakila.category c 
 on a.category_id = c.name like 'Horror';

--0. List the full name of the staff member with the ID of 2
select  first_name, last_name from sakila.staff where staff_id=2;
