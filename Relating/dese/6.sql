SELECT name
FROM schools
JOIN graduation_rates  ON id = school_id
WHERE graduated = 100;
