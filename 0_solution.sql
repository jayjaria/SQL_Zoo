--1. Modify it to show the population of Germany
select population from world where name='Germany'

--2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
select name,population from world where name in('Sweden','Norway','Denmark')

-- 3. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
select name,area from world where area between 200000 and 250000