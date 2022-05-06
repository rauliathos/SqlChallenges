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