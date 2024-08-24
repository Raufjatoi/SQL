SELECT name
FROM schools 
JOIN districts ON district_id = id
WHERE name = 'Cambridge';
