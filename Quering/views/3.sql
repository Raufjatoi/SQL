SELECT COUNT(*) AS count_of_fuji_titles
FROM views
WHERE artist = 'Hokusai' AND english_title LIKE '%Fuji%';
