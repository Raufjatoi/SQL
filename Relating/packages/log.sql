--- *** The lost letter
SELECT * FROM scans 
WHERE package_id = (SELECT id FROM packages 
WHERE from_address_id = (SELECT id FROM addresses
    WHERE address = '900 Somerville Avenue')
AND to_address_id = (SELECT id FROM addresses 
    WHERE address LIKE '2 fin%') 
);

--- ***  The Devious Delicvery ***
SELECT *
FROM packages 
WHERE from_address_id = ( SELECT id
    FROM addresses WHERE address = NULL);

--- *** The Forgotten Delivery *** 
SELECT * FROM scans WHERE package_id(SELECT package_id FROM packages
    WHERE from_address_id = (SELECT id FROM addresses 
        WHERE address = '109 Tileston Street')
    AND to_address_id = (SELECT id FROM addresses
        WHERE address = '778 Maple Place' )
    );  
