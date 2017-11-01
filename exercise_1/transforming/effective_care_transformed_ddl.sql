!echo "Creating effective_care_transformed table";
USE hospital_compare;
DROP TABLE IF EXISTS effective_care_transformed; 
CREATE TABLE effective_care_transformed AS 
SELECT provider_id, 
 hospital_name,
 state,
 condition,
 measure_id,
 measure_name,
 score,
 sample,
 footnote
FROM effective_care
WHERE score not in ('Not Available')
AND NOT (score like '%High%') 
AND NOT (score like '%Medium')
AND NOT (score like '%Low');
