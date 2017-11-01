!echo "Creating patient_effcare_data table";
USE hospital_compare;
DROP TABLE IF EXISTS patient_effcare_data; 


CREATE TABLE patient_effcare_data AS
SELECT hospital_score_effcare.provider_id AS provider_id,
hospital_score_effcare.hospital_name AS hospital_name,
hospital_score_effcare.avgscore AS avgscore,
surveys_responses_transformed.hcahps_base_score AS surveybase,
surveys_responses_transformed.hcahps_consistency_score AS consistency
from hospital_score_effcare, surveys_responses_transformed
WHERE hospital_score_effcare.provider_id = surveys_responses_transformed.provider_id;
