!echo "Creating surveys_responses_transformed  table";
USE hospital_compare;
DROP TABLE IF EXISTS surveys_responses_transformed ; 
CREATE TABLE surveys_responses_transformed  
AS
SELECT 
 provider_id,
 hospital_name,
 state,
 comm_nurse_achievement,
 comm_nurse_improvement,
 comm_nurse_dimension_score,
 comm_doc_achievements,
 comm_doc_improvement,
 comm_doc_dimension_score,
 responsiveness_hos_staff_achievement,
 responsiveness_hos_staff_improvement,
 responsiveness_hos_staff_dimension_score,
 pain_mgmt_achievement,
 pain_mgmt_improvement,
 pain_mgmt_dimension_score,
 comm_medicines_achievement,
 comm_medicines_improvement,
 comm_medicines_dimension_score,
 cleanliness_achievement,
 cleanliness_improvement,
 cleanliness_dimension_score,
 discharge_info_achievement,
 discharge_info_improvement,
 discharge_info_dimension_score,
 overall_rating_achievement,
 overall_rating_improvement,
 overall_rating_dimension_score,
 HCAHPS_base_score,
 HCAHPS_consistency_score
FROM surveys_responses
WHERE HCAHPS_base_score NOT IN ('Not Available');

