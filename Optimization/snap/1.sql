SELECT username
FROM users
WHERE last_login_date >= '2024-01-01'
ORDER BY last_login_date DESC;
