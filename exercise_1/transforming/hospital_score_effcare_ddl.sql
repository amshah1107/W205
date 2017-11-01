!echo "Creating hospital_score_effcare"; 
USE hospital_compare;
DROP TABLE IF EXISTS hospital_score_effcare; 
CREATE TABLE hospital_score_effcare AS 
SELECT provider_id, hospital_name, state, 
sum(score) AS aggscore, 
avg(score) AS avgscore, 
variance(score) AS varscore, 
min(score) AS minscore,
max(score) AS maxscore,
stddev_pop(score) AS stddev
FROM effective_care_transformed
GROUP BY provider_id, hospital_name, state;
