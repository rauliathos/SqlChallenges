--1. List all actors
SELECT * from actors;

-- 2 FInd the surname of the actors with the forname 'John'
SELECT last_name from actor where first_name = 'John';

-- 3 Find all actors with surname 'Neeson'.
select * from actor where last_name = 'Neeson';

--4 Find all actors with ID numbers divisible by 10.
select * from actor where (actor_id %10) = 0;

--5What is the description of the movie with an ID of 100?
select description from film where film_id = 100;
