-- 1. Alter the password of the admin account to "oops!"
UPDATE users
SET password = '982c0381c279d139fd221fce974916e7' -- MD5 hash of "oops!"
WHERE username = 'admin';

-- 2. Erase any logs of the password change
DELETE FROM user_logs
WHERE old_username = 'admin';

-- 3. Add false data to frame emily33
INSERT INTO user_logs (type, old_username , new_username, old_password , new_password)
SELECT 'update', 'admin', 'admin' , NULL, (
     SELECT password
     FROM users
     WHERE username = 'emiley33'
);
