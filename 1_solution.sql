-- 1.Find the country that start with Y
select name from world where name like 'Y%'

-- 2.Find the countries that end with y
select name from world where name like '%y'

-- 3.Find the countries that contain the letter x
select name from world where name like '%x%'

-- 4.Find the countries that end with land
select name from world where name like '%land'

-- 5.Find the countries that start with C and end with ia
select name from world where name like 'C%ia'

-- 6.Find the country that has oo in the name
select name from world where name like '%oo%'

-- 7.Find the countries that have three or more a in the name
select name from world where name like '%a%a%a%'

-- 8.Find the countries that have "t" as the second character.
select name from world where name like '_t%'

-- 9.Find the countries that have two "o" characters separated by two others.
select name from world where name like '%o__o%'

-- 10.Find the countries that have exactly four characters.
select name from world where name like '____'

-- 11.Find the country where the name is the capital city.
SELECT name FROM world WHERE name LIKE capital

-- 12.Find the country where the capital is the country plus "City".
select name from world where capital like concat(name,' ','City')

-- 13.Find the capital and the name where the capital includes the name of the country.
select capital, name from world where capital like concat('%',name,'%')

-- 14.Find the capital and the name where the capital is an extension of name of the country.
select capital, name from world where capital like concat('%',name,'%') and capital>name

-- 15.Show the name and the extension where the capital is an extension of name of the country.
select name, replace(capital, name , '') from world where capital like 
concat('%',name,'%')and capital > name