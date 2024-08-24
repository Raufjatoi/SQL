SELECT COUNT(*) AS count_of_eastern_capital_titles
FROM views
WHERE artist = 'Hiroshige' AND english_title LIKE '%Eastern Capital%';
