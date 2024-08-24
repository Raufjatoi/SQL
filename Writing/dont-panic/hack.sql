UPDATE "users"
SET "password" = '1c658300a285a58aa25d7bd133ca9896' -- hash code for opps!
WHERE username = 'admin';

DELETE from "user_logs"
WHERE "username" = 'admin'

INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
SELECT 'update', 'admin', 'admin', NULL,  (    
    (SELECT password FROM users WHERE username = 'emiley33') 
);