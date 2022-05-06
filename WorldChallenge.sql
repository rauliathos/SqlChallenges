--1. Using COUNT , get the number of cities in the USA.
select count(name) from world.city where CountryCode = 'USA';

-- 2. Find out the population and life expectancy for people in Argentina.
select Population, LifeExpectancy from world.country where name = 'Argentina';

--3. Using IS NOT NULL , ORDER BY , and LIMIT , which country has the highest life expectancy?
select Name, LifeExpectancy from world.country where LifeExpectancy is not null order by  LifeExpectancy desc limit 1 ;

--4. Using JOIN ... ON , find the capital city of Spain.
select a.name, b.name 
from world.country a
inner join world.city b on 
 a.code = b.CountryCode
where a.Name = 'Spain' limit 1;

--5. Using JOIN ... ON , list all the languages spoken in the Southeast Asia region.
select a.Region, b.Language
 from world.country a
inner join world.countrylanguage b on 
 a.code = b.CountryCode
where a.region = 'Southeast Asia' ;

--6. Using a single query, list 25 cities around the world that start with the letter F.
select name from world.city where name like 'F%'limit 25 ;

--7. Using COUNT and JOIN ... ON , get the number of cities in China.
select a.name, count(b.name) 
from world.country a
inner join world.city b on 
 a.code = b.CountryCode
where a.Name = 'China' ;

--8. Using IS NOT NULL , ORDER BY , and LIMIT , which country has the lowest population? Discard non-zero populations.
select name, population from world.country where Population is not null and Population !=0 order by Population limit 1;

--9. Using aggregate functions, return the number of countries the database contains.
select count(name) from world.country;

--10. What are the top ten largest countries by area?
select name from world.country order by SurfaceArea desc limit 10;

--11. List the five largest cities by population in Japan.
select a.name, b.name, b.Population 
from world.country a
inner join world.city b on 
 a.code = b.CountryCode
where a.Name = 'Japan' limit 10;

--12. List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
update world.country
set headofstate = 'Elizabeth II'
where headofstate = 'Elisabeth II';

select name, code from world.country where HeadOfState like '%Elizabeth II%';

--13. List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

SELECT name , population/surfacearea AS population_to_area_ratio
 FROM world.country WHERE population !=0
 ORDER BY population_to_area_ratio ASC LIMIT 10;

--14. List every unique world language.
select  distinct language from world.countrylanguage order by language asc;


--15. List the names and GNP of the world's top 10 richest countries.
 select name, gnp from world.country order by gnp desc limit 10;



--16. List the names of, and number of languages spoken by, the top ten most multilingual countries.
select countrycode, b.name, count(language)
from world.countrylanguage a 
inner join world.country b 
on a.CountryCode = b.code 
group by CountryCode, b.name order by count(Language) desc limit 10;


--17. List every country where over 50% of its population can speak German.
select a.*, b.name 
from world.countrylanguage a 
inner join world.country b 
on a.CountryCode = b.code  where language = 'German' and Percentage > 50;


--18. Which country has the worst life expectancy? Discard zero or null values.
 select name, lifeexpectancy 
 from world.country 
 where LifeExpectancy is not null and LifeExpectancy >0
 order by LifeExpectancy asc limit 1;


--19. List the top three most common government forms.
 select governmentform, count(governmentform) 
 from world.country
 group by GovernmentForm 
 order by count(GovernmentForm ) desc limit 3;

 --20. How many countries have gained independence since records began?
  select count(IndepYear) from country where IndepYear is not null;
