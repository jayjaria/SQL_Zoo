-- 1.List the films where the yr is 1962 [Show id, title]
select id,title from movie where yr = 1962

-- 2.Give year of 'Citizen Kane'.
select yr from movie where title='Citizen Kane'

-- 3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id,title,yr from movie where title like 'Star Trek%' order by yr

-- 4.What id number does the actor 'Glenn Close' have?
select movie.id from movie join actor on movie.id = actor.id where name = 'Glenn Close'

-- 5.What is the id of the film 'Casablanca'
select id from movie where title = 'Casablanca'

-- 6.Obtain the cast list for 'Casablanca'. what is a cast list? Use movieid=11768, (or whatever value you got from the previous question)
select name from actor join casting on id = actorid where movieid = 27

-- 7.Obtain the cast list for the film 'Alien'
select name from actor join casting on id = actorid where movieid = (select id from movie where title = 'Alien')

-- 8.List the films in which 'Harrison Ford' has appeared
select title from movie join casting on id = movieid where actorid = (select id from actor where name='Harrison Ford')

-- 9.List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select title from movie join casting on id = movieid where actorid = (select id from actor where name = 'Harrison Ford' and ord!=1)

-- 10.List the films together with the leading star for all 1962 films.
select title, name from (movie join casting on id = movieid) join actor on actor.id = actorid  where yr = 1962 and ord=1 

-- 11.Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
select yr, count(*) from (movie join casting on movie.id = movieid) join actor on actorid = actor.id where name = 'Rock Hudson' group by yr having count(*)>2

-- 12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.Did you get "Little Miss Marker twice"? Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).Title is not a unique field, create a table of IDs in your subquer
select title from (movie join casting on id = movieid) join actor on actor.id = actorid where movieid =(select movieid from casting where actorid = (select id from actor where name = 'Julie Andrews')

-- 13.Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
select name from actor join casting on id = actorid where ord=1 group by name having count(actor.id)>=15

-- 14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
select title,count(*) from movie join casting on id = movieid where yr=1978 group by title order by count(actorid) desc, title

-- 15.List all the people who have worked with 'Art Garfunkel'.
select name from (actor join casting on actor.id = actorid) where movieid in(select movieid from casting join actor on actorid = id where name = 'Art Garfunkel') and name!='Art Garfunkel'