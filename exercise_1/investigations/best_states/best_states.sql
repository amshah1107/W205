use hospital_compare;
set hive.cli.print.header=true;
!echo "Querying for top 10 states with best readmission score";
SELECT state, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_readd 
GROUP BY state, aggscore, avgscore, varscore, maxscore, minscore, stddev
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 states with best effective care score";
SELECT state, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_effcare 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 states with best veterans hospitals effective care score";
SELECT hospital_score_effcare.state, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_effcare, hospitals_veterans
WHERE hospital_score_effcare.provider_id = hospitals_veterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 states with best Non-Veterans hospitals effective care score";
SELECT hospital_score_effcare.state, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_effcare, hospitals_nonveterans
WHERE hospital_score_effcare.provider_id = hospitals_nonveterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 states with veterans hospitals readmission score";
SELECT hospital_score_readd.state, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_readd, hospitals_veterans
WHERE hospital_score_readd.provider_id = hospitals_veterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;

!echo "Querying for top 10 states with Non-Veterans hospitals readmission score";
SELECT hospital_score_readd.state, aggscore, avgscore, varscore, maxscore, minscore, stddev  
FROM hospital_score_readd, hospitals_nonveterans
WHERE hospital_score_readd.provider_id = hospitals_nonveterans.provider_id 
SORT BY aggscore DESC
LIMIT 10;
