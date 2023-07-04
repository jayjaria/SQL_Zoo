-- 1.Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
select matchid, player from goal where teamid='GER'

-- 2.Show id, stadium, team1, team2 for just game 1012
select id,stadium,team1,team2 from game where id=1012

-- 3.Modify it to show the player, teamid, stadium and mdate for every German goal.
select goal.player, goal.teamid, game.stadium, game.mdate from goal join game on (goal.matchid = game.id) where goal.teamid = 'GER'

-- 4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
select game.team1, game.team2, goal.player from game join goal on game.id = goal.matchid where goal.player like 'Mario%'

-- 5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
select goal.player, goal.teamid, eteam.coach, goal.gtime from goal join eteam on goal.teamid = eteam.id where gtime<=10

-- 6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
select game.mdate, eteam.teamname from game join eteam on game.team1= eteam.id where eteam.coach = 'Fernando Santos'

-- 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
select goal.player from game join goal on game.id = goal.matchid where game.stadium = 'National Stadium, Warsaw'

-- 8.Instead show the name of all players who scored a goal against Germany.
select distinct goal.player from goal join game on game.id = goal.matchid where (team1='GER' or team2='GER') and teamid!='GER'

-- 9.Show teamname and the total number of goals scored.
select eteam.teamname, count(*) from eteam join goal on eteam.id = goal.teamid group by teamname

-- 10.Show the stadium and the number of goals scored in each stadium.
select stadium,count(*) from game join goal on game.id = goal.matchid group by stadium 

-- 11.For every match involving 'POL', show the matchid, date and the number of goals scored.
select matchid, mdate, count(*) from game join goal on game.id = goal.matchid where (team1='POL' or team2='POL') group by matchid, mdate

-- 12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
select matchid, mdate, count(*) from game join goal on game.id = goal.matchid where teamid = 'GER' group by matchid, mdate

-- 13.List every match with the goals scored by each team as shown.
select distinct mdate, team1, sum(case when teamid=team1 then 1 else 0 end) score1, team2, sum(case when teamid=team2 then 1 else 0 end) score2
from game join goal on matchid = id group by mdate,team1,team2 order by mdate,team1,team2;