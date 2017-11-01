!echo "Creating measures_transformed table";
USE hospital_compare;
DROP TABLE IF EXISTS measures_transformed; 
CREATE TABLE measures_transformed AS 
SELECT measure_name, measure_id FROM measures
WHERE measure_id NOT IN ('EDV');

