!echo "Creating hospital table";
DROP TABLE hospitals;
CREATE TABLE hospitals
(provider_id BIGINT,
 hospital_name STRING,
 address STRING,
 city STRING,
 state STRING,
 zip STRING,
 county STRING,
 phone STRING,
 hospital_type STRING,
 hospital_ownership STRING,
 emergency_services BOOLEAN)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar"     = '"', 
"escapeChar"    = '\\' ) 
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/hospitals'; 

!echo "Creating measures table";
DROP TABLE measures;
CREATE TABLE measures
(measure_name STRING,
 measure_id  STRING,
 start_quarter STRING,
 measure_start_date DATE,
 end_quarter STRING,
 measure_end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar"     = '"', 
"escapeChar"    = '\\' ) 
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/measures'; 


!echo "Creating effective_care table";
DROP TABLE effective_care;
CREATE TABLE effective_care
(provider_id BIGINT,
 hospital_name  STRING,
 address STRING,
 city STRING,
 state STRING,
 zip STRING,
 county STRING,
 phone STRING,
 condition STRING,
 measure_id  STRING,
 measure_name STRING,
 score STRING,
 sample STRING,
 footnote STRING,
 measure_start_date DATE,
 measure_end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar"     = '"', 
"escapeChar"    = '\\' ) 
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/effective_care'; 


!echo "Creating readmissions table";
DROP TABLE readmissions;
CREATE TABLE readmissions
(provider_id BIGINT,
 hospital_name  STRING,
 address STRING,
 city STRING,
 state STRING,
 zip STRING,
 county STRING,
 phone STRING,
 measure_name STRING,
 measure_id  STRING,
 compared_to_national STRING,
 denominator STRING,
 score STRING,
 lower_estimate STRING,
 higher_estimate STRING,
 footnote STRING,
 measure_start_date DATE,
 measure_end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar"     = '"', 
"escapeChar"    = '\\' ) 
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/readmissions'; 


!echo "Creating surveys_responses table";
DROP TABLE surveys_responses;
CREATE TABLE surveys_responses
(provider_id BIGINT,
 hospital_name  STRING,
 address STRING,
 city STRING,
 state STRING,
 zip STRING,
 county STRING,
 comm_nurse_achievement STRING,
 comm_nurse_improvement STRING,
 comm_nurse_dimension_score STRING,
 comm_doc_achievements STRING,
 comm_doc_improvement STRING,
 comm_doc_dimension_score STRING,
 responsiveness_hos_staff_achievement STRING,
 responsiveness_hos_staff_improvement STRING,
 responsiveness_hos_staff_dimension_score STRING,
 pain_mgmt_achievement STRING,
 pain_mgmt_improvement STRING,
 pain_mgmt_dimension_score STRING,
 comm_medicines_achievement STRING,
 comm_medicines_improvement STRING,
 comm_medicines_dimension_score STRING,
 cleanliness_achievement STRING,
 cleanliness_improvement STRING,
 cleanliness_dimension_score STRING,
 discharge_info_achievement STRING,
 discharge_info_improvement STRING,
 discharge_info_dimension_score STRING,
 overall_rating_achievement STRING,
 overall_rating_improvement STRING,
 overall_rating_dimension_score STRING,
 HCAHPS_base_score STRING,
 HCAHPS_consistency_score STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar"     = '"', 
"escapeChar"    = '\\' ) 
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/surveys_responses';

!echo "Completed table loading";

!echo "Records in hospital table";
SELECT COUNT(provider_id) FROM hospitals; 
!echo "Records in measure table";
SELECT COUNT(*) FROM measures;
!echo "Records in effective_care table";
SELECT COUNT(*) FROM effective_care;
!echo "Records in readmissions table";
SELECT COUNT(*) FROM readmissions;
!echo "Records in surveys_responses table";
SELECT COUNT(*) FROM surveys_responses;
