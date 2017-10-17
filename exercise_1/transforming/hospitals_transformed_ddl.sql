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
