WITH least_expensive_per_hit AS (
    SELECT players.id
    FROM salaries
    JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year
    JOIN players ON salaries.player_id = players.id
    WHERE salaries.year = 2001 AND performances.H > 0
    ORDER BY (salaries.salary / performances.H) ASC
    LIMIT 10
),
least_expensive_per_rbi AS (
    SELECT players.id
    FROM salaries
    JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year
    JOIN players ON salaries.player_id = players.id
    WHERE salaries.year = 2001 AND performances.RBI > 0
    ORDER BY (salaries.salary / performances.RBI) ASC
    LIMIT 10
)
SELECT DISTINCT players.first_name, players.last_name
FROM players
WHERE players.id IN (SELECT id FROM least_expensive_per_hit)
   OR players.id IN (SELECT id FROM least_expensive_per_rbi)
ORDER BY players.id ASC;
