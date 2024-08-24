SELECT players.first_name , players.last_name 
FROM players
JOIN players ON salaries.player_id = players.id AND salaries.year = players.year
JOIN players ON performances.player_id = players.id 
