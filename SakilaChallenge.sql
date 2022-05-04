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
