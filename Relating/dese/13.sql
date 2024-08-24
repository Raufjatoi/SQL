-- This query finds the average graduation rate for public schools in each city and lists cities with a rate above 90%
SELECT s.city, AVG(g.graduated) AS avg_graduation_rate
FROM schools s
JOIN graduation_rates g ON s.id = g.school_id
WHERE s.type = 'Public School'
GROUP BY s.city
HAVING AVG(g.graduated) > 90
ORDER BY avg_graduation_rate DESC;
