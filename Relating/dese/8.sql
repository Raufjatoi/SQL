SELECT name, pupils
FROM districts 
JOIN expenditures ON "district"."id" = "schools"."id";
