UPDATE users
SET password = '982c0381c279d139fd221fce974916e7' -- MD5 hash of "oops!" get from md5hashgenerator.com. 
WHERE username = 'admin';

DELETE FROM user_logs
WHERE old_username = 'admin';


INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
VALUES (
    'update',
    'admin',  
    'admin',  
    NULL,     
    (SELECT password FROM users WHERE username = 'emiley33') 
);

