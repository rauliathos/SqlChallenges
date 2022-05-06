--1. List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
select title, release_date
 from movielens.movies
 where release_date
 between '1983-01-01' and '1993-12-31' 
 order by release_date desc;

 --2. Without using LIMIT , list the titles of the movies with the lowest average rating.
select  rating, title from movielens.ratings a
inner join movielens.movies b 
on a.id = b.id 
where rating in( select min(rating) from movielens.ratings );

--3. List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
select a.movie_id 
from genres_movies c
inner join genres d
on  c.genre_id = d.id
inner join 
movielens.ratings a 
on a.movie_id=c.movie_id 
 inner join movielens.users b
 on a.user_id = b.id
 where  age = 24 and gender = 'm'
 and rating = 5
and d.name = 'Sci-Fi';


--4. List the unique titles of each of the movies released on the most popular release day.
 select title
 from movies
 where release_Date in
 (select release_date from
 (
 select  release_date
  from movies
 group by  release_date 
 order by count(release_date)  desc limit 1 
 )
 );

--5Find the total number of movies in each genre; list the results in ascending numeric order.

 select count(c.id) as numbers_of_movies, name as genre from genres_movies a
inner join genres b
on  a.genre_id = b.id
inner join movies c
on c.id= a.movie_id
group by name 
order by count(c.id) asc;