#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo  "$($PSQL "SELECT SUM(winner_goals)+SUM(opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),16) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals+opponent_goals),16) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals>2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from games left join teams on games.winner_id=teams.team_id where round='Final' and year=2018; ")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select t.name from games as g full join teams as t on g.winner_id=t.team_id or g.opponent_id = t.team_id where year=2014 and round = 'Eighth-Final' order by t.name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct(name) from games left join teams as t on games.winner_id=t.team_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select year,name from games as g full join teams as t on g.winner_id=t.team_id where round='Final' order by year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select distinct(name) from games as g full join teams as t on g.winner_id=t.team_id or g.opponent_id=t.team_id where name like 'Co%'")"