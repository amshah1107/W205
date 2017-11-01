use hospital_compare;
set hive.cli.print.header=true;
!echo "Querying for variability in procedures between hospitals for readmission score";
SELECT readmissions_transformed.measure_name, sum(score) as aggregate, avg(score) as average, 
variance(score) AS variance, max(score) as maxscore, min(score) as minscore, 
stddev_pop(score) as stddev
FROM readmissions_transformed, measures_transformed
WHERE readmissions_transformed.measure_id = measures_transformed.measure_id
GROUP by readmissions_transformed.measure_name
SORT BY aggregate DESC
LIMIT 10;


!echo "Querying for variability in procedures between hospitals for effective care score";
SELECT effective_care_transformed.measure_name, sum(score) as aggregate, avg(score) as average, 
variance(score) AS variance, max(score) as maxscore, min(score) as minscore, 
stddev_pop(score) as stddev
FROM effective_care_transformed, measures_transformed
WHERE effective_care_transformed.measure_id = measures_transformed.measure_id
GROUP by effective_care_transformed.measure_name
SORT BY aggregate DESC
LIMIT 10;
