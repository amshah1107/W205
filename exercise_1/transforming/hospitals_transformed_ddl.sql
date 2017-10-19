!echo "Creating hospitals_transformed table";
USE hospital_compare;
DROP TABLE IF EXISTS hospitals_transformed; 
CREATE TABLE hospitals_transformed AS 
SELECT provider_id, hospital_name, state
FROM hospitals; 

