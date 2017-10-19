!echo "Creating hospitals_transformed table";
USE hospital_compare;
DROP TABLE IF EXISTS hospitals_transformed; 
CREATE TABLE hospitals_transformed 
AS
SELECT provider_id, hospital_name, state
FROM hospitals;

!echo "Creating hospitals_Veterans table";
DROP TABLE IF EXISTS hospitals_Veterans; 
CREATE TABLE hospitals_Veterans 
AS
SELECT provider_id, hospital_name, hospital_type, state
FROM hospitals
WHERE hospital_type LIKE "%VETERANS ADMINISTRATION%";


!echo "Creating hospitals_NonVeterans table";
DROP TABLE IF EXISTS hospitals_NonVeterans; 
CREATE TABLE hospitals_NonVeterans 
AS
SELECT provider_id, hospital_name, hospital_type, state
FROM hospitals
WHERE hospital_type NOT LIKE "%VETERANS ADMINISTRATION%";
