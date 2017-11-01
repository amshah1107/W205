use hospital_compare;
set hive.cli.print.header=true;
!echo "Querying for top 10 hospitals with best readmission score";
SELECT hospital_name, aggscore, avgscore, varscore, maxscore, minscore,stddev  
FROM hospital_score_readd 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 hospitals with best effective care score";
SELECT hospital_name, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_effcare 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 veterans hospitals with best effective care score";
SELECT hospital_score_effcare.hospital_name, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_effcare, hospitals_veterans
WHERE hospital_score_effcare.provider_id = hospitals_veterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 Non-Veterans hospitals with best effective care score";
SELECT hospital_score_effcare.hospital_name, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_effcare, hospitals_nonveterans
WHERE hospital_score_effcare.provider_id = hospitals_nonveterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 veterans hospitals with readmission score";
SELECT hospital_score_readd.hospital_name, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_readd, hospitals_veterans
WHERE hospital_score_readd.provider_id = hospitals_veterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 Non-Veterans hospitals with best readmission score";
SELECT hospital_score_readd.hospital_name, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_readd, hospitals_nonveterans
WHERE hospital_score_readd.provider_id = hospitals_nonveterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying average of score for non veterans for readmission score";
SELECT avg(aggscore) AS average  from hospital_score_readd, hospitals_nonveterans
WHERE hospital_score_readd.provider_id = hospitals_nonveterans.provider_id; 

!echo "Querying average of score for veterans for readmission score";
SELECT avg(aggscore) AS average  from hospital_score_readd, hospitals_veterans
WHERE hospital_score_readd.provider_id = hospitals_veterans.provider_id; 


