SELECT players.first_name, players.last_name, ROUND(salaries.salary / performances.H, 2) AS "dollars per hit"
FROM salaries
JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year
JOIN players ON salaries.player_id = players.id
WHERE salaries.year = 2001 AND performances.H > 0
ORDER BY "dollars per hit" ASC, players.first_name ASC, players.last_name ASC
LIMIT 10;
