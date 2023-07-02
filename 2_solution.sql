-- 1.SQL command to show the name, continent and population of all countries.
select name, continent, population from world

-- 2. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
select name from world where population>=200000000

-- 3.Give the name and the per capita GDP for those countries with a population of at least 200 million.
select name, gdp/population from world where population >=200000000

-- 4.Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
select name,population/1000000 from world where continent='South America'

-- 5.Show the name and population for France, Germany, Italy
select name,population from world where name in('France','Germany','Italy')

-- 6.Show the countries which have a name that includes the word 'United'
select name from world where name like '%United%'

-- 7.Show the countries that are big by area or big by population. Show name, population and area.
select name,population,area from world where area>3000000 or population>250000000

-- 8.Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
select name,population,area from world where (area>3000000 and population <250000000) or (area<3000000 and population>250000000)

-- 9.For South America show population in millions and GDP in billions both to 2 decimal places.
select name,round(population/1000000,2), round(gdp/100000000,2) from world where continent = 'South America'

-- 10.Show per-capita GDP for the trillion dollar countries to the nearest $1000.
select name,round(gdp/population,-3) from world where gdp>=1000000000000

-- 11.Show the name and capital where the name and the capital have the same number of characters.
select name, capital from world where len(name) = len(capital)

-- 12.Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
select name, capital from world where left(name,1)=left(capital,1) and name<>capital

-- 13.Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name. Find the country that has all the vowels and no spaces in its name.
select name from world where name like '%a%' and name like'%e%' and name like'%i%'and name like'%o%'and name like'%u%' and name not like '% %'
