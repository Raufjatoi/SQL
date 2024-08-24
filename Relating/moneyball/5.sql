SELECT "name" 
FROM "teams"
WHERE player_id = (
    SELECT player_id 
    FROM players 
    WHERE first_name = 'Satchel'
    AND last_name = 'Paige'
);