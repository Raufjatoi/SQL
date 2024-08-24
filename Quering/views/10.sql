SELECT english_title, contrast AS "Contrast Value"
FROM views
WHERE artist = 'Hiroshige' AND entropy > 5
ORDER BY contrast DESC;
