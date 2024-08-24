SELECT first_name, last_name, height AS "Height in Inches"
FROM players
WHERE height > 72 AND birth_state = 'CA'
ORDER BY height DESC;
