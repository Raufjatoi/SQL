SELECT "name", "per_pupil_expenditure"
FROM "districts"
JOIN expenditures ON "district"."id" = "expenditures"."id"
WHERE type = 'Public School District'
ORDER BY per_pupil_expenditure DESC
LIMIT 10;
