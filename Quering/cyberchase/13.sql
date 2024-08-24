SELECT id , season , episode_count , title , topic , air_date , production_code 
FROM episodes 
WHERE season = 1 
OR season = 2 
OR season = 3 
LIMIT = 20;