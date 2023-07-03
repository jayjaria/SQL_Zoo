-- 1.List each country name where the population is larger than that of 'Russia'.
select name from world where population > (select population from world where name = 'Russia')

-- 2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name from world where continent = 'Europe' and gdp/population > (select gdp/population from world where name = 'United Kingdom')

-- 3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
select name, continent from world where continent in(select continent from world where name in('Argentina', 'Australia')) order by name

-- 4.Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
select name,population from world where population > (select population from world where name='United Kingdom') and population < (select population from world where name = 'Germany')

-- 5.Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
select name, concat(round(population/(select population from world where name = 'Germany')*100), '%') from world where continent = 'Europe';

-- 6.Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
select name from world where gdp> all(select gdp from world where continent='Europe' and gdp>0)

-- 7.Find the largest country (by area) in each continent, show the continent, the name and the area:
select continent, name , area from world x where area >=all(select area from world y where x.continent = y. continent and y.area>0)

-- 8.List each continent and the name of the country that comes first alphabetically.
select continent, name from world x where name <= all(select name from world y where x.continent = y.continent)

-- 9.Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
select name,continent,population from world where continent in(select continent from world x where 25000000>= (select max(population) from world y where x.continent = y.continent))

-- 10.Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
select name, continent from world x where population > all(select 3*population from world y where x.continent = y.continent and x.name <> y.name)