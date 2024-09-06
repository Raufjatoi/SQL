-- 1. Query to find all information related to a specific user by userID
-- This query retrieves all personal and medical information of a user.
SELECT * FROM USER WHERE userID = 1;

-- 2. Query to find the medical history of a user by userID
-- Retrieves all history records for a given user, sorted by event date.
SELECT * FROM HISTORY WHERE userID = 1 ORDER BY eventDate DESC;

-- 3. Query to find all predictions for a user
-- Retrieves all disease predictions made for a specific user, sorted by date.
SELECT * FROM PREDICTION WHERE userID = 1 ORDER BY predictionDate DESC;

-- 4. Query to get all users who have a specific medical condition
-- Finds all users who have a particular medical condition in their medical history.
SELECT u.username, u.email
FROM USER u
JOIN INFO i ON u.userID = i.userID
WHERE i.medicalHistory LIKE '%Diabetes%';

-- 5. Query to count the number of predictions made in the database
-- Provides a total count of all disease predictions.
SELECT COUNT(*) AS totalPredictions FROM PREDICTION;

-- 6. Query to find the latest prediction for each user
-- Retrieves the most recent prediction record for every user.
SELECT p1.*
FROM PREDICTION p1
JOIN (
    SELECT userID, MAX(predictionDate) AS maxDate
    FROM PREDICTION
    GROUP BY userID
) p2 ON p1.userID = p2.userID AND p1.predictionDate = p2.maxDate;

-- 7. Query to find all users who have received a prediction with a high confidence score
-- Lists users with a confidence score above 90% for any prediction.
SELECT DISTINCT u.username, u.email
FROM USER u
JOIN PREDICTION p ON u.userID = p.userID
WHERE p.confidenceScore > 90;

-- 8. Query to find the average confidence score of predictions for a specific disease
-- Calculates the average confidence score for a disease across all users.
SELECT diseaseName, AVG(confidenceScore) AS avgConfidence
FROM PREDICTION
WHERE diseaseName = 'Heart Disease'
GROUP BY diseaseName;

-- 9. Query to get a user's profile along with their most recent checkup date
-- Joins user data with their information table to show the latest checkup date.
SELECT u.username, u.email, i.lastCheckupDate
FROM USER u
LEFT JOIN INFO i ON u.userID = i.userID
ORDER BY i.lastCheckupDate DESC;

-- 10. Query to list all unique diseases predicted in the database
-- Retrieves a list of all unique diseases that have been predicted.
SELECT DISTINCT diseaseName FROM PREDICTION;
