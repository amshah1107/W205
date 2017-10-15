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



!echo "Records in hospital table";
SELECT COUNT(provider_id) FROM hospitals; 
!echo "Records in measure table";
SELECT COUNT(*) FROM measures;
!echo "Records in effective_care table";
SELECT COUNT(*) FROM effective_care;
!echo "Records in readmissions table";
SELECT COUNT(*) FROM readmissions;
