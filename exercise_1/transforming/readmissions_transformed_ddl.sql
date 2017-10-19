!echo "Creating readmissions_transformed table";
USE hospital_compare;
DROP TABLE IF EXISTS readmissions_transformed; 
CREATE TABLE readmissions_transformed AS 
SELECT provider_id, 
hospital_name, 
state,
measure_name, 
measure_id,
compared_to_national, 
denominator,
score,
lower_estimate,
higher_estimate,
footnote,
measure_start_date,
measure_end_date
FROM readmissions
WHERE compared_to_national NOT IN ('Number of Cases Too Small', 'Not Available'); 

