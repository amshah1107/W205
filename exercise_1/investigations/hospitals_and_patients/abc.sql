use hospital_compare;
set hive.cli.print.header=true;
!echo "Querying for correlation between average score and survey score; 


CREATE TABLE patient_read_data AS
SELECT hospital_score_readd.provider_id,
hospital_score_readd.hospital_name,
hospital_score_readd.avgscore,
surveys_responses_transformed.hcahps_base_score,
surveys_responses_transformed.hcahps_consistency_score
from hospital_score_readd, surveys_responses_transformed
WHERE hospital_score_readd.provider_id = surveys_responses_transformed.provider_id;
 



--select hospital_score_readd.avgscore,surveys_responses_transformed.hcahps_base_score,surveys_responses_transformed.hcahps_consistency_score
--from hospital_score_readd, surveys_responses_transformed
--WHERE hospital_score_readd.provider_id = surveys_responses_transformed.provider_id
--GROUP BY hospital_score_readd.hospital_name
--LIMIT 10;



--SELECT hospital_score_readd.hospital_name,
--covar_pop(CAST(surveys_responses_transformed.hcahps_base_score + surveys_responses_transformed.hcahps_consistency_score AS INT), CAST(hospital_score_readd.avgscore AS INT))
--from hospital_score_readd, surveys_responses_transformed
--WHERE hospital_score_readd.provider_id = surveys_responses_transformed.provider_id
--GROUP BY hospital_score_readd.hospital_name
--LIMIT 10;

--surveys_responses_transformed.hcahps_base_score 
--WHERE hospital_score_readd.provider_id = surveys_responses_transformed.provider_id
--GROUP BY hospital_score_readd.hospital_name,surveys_responses_transformed.hcahps_base_score
--LIMIT 10;

--SELECT hospital_score_readd.hospital_name,
--hospital_score_readd.avgscore, 
--FROM hospital_score_readd, surveys_responses_transformed
--WHERE hospital_score_readd.provider_id = surveys_responses_transformed.provider_id
--GROUP BY hospital_score_readd.hospital_name
--LIMIT 10;
--corr(CAST(surveys_responses_transformed.hcahps_base_score AS INT), hospital_score_readd.avgscore)
