use hospital_compare;
set hive.cli.print.header=true;
!echo "Querying for correlation between average score and survey score; 

!echo "Correlation between readmission scores and survey scores (base + consistency)";

SELECT corr(CAST(avgscore AS INT),CAST(surveybase + consistency AS INT)) AS CORR from patient_readd_data;

!echo "Correlation between effective care scores and survey scores (base + consistency");

SELECT corr(CAST(avgscore AS INT),CAST(surveybase + consistency AS INT)) AS CORR from patient_effcare_data;


!echo "Correlation between readmission care scores and survey scores (base + consistency") for veterans hospital";

SELECT corr(CAST(avgscore AS INT),CAST(surveybase + consistency AS INT)) AS CORR 
FROM patient_readd_data, hospitals_veterans
where hospitals_veterans.provider_id = patient_readd_data.provider_id;

!echo "Correlation between readmission care scores and survey scores (base + consistency") for nonveterans hospital";

SELECT corr(CAST(avgscore AS INT),CAST(surveybase + consistency AS INT)) AS CORR 
FROM patient_readd_data, hospitals_nonveterans
where hospitals_nonveterans.provider_id = patient_readd_data.provider_id;

!echo "Correlation between effective care scores and survey scores (base + consistency") for veterans hospital";
SELECT corr(CAST(avgscore AS INT),CAST(surveybase + consistency AS INT)) AS CORR 
FROM patient_effcare_data, hospitals_veterans
where hospitals_veterans.provider_id = patient_effcare_data.provider_id;

!echo "Correlation between effective care scores and survey scores (base + consistency") for nonveterans hospital";
SELECT corr(CAST(avgscore AS INT),CAST(surveybase + consistency AS INT)) AS CORR 
FROM patient_effcare_data, hospitals_nonveterans
where hospitals_nonveterans.provider_id = patient_effcare_data.provider_id;
