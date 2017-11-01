**Project for W205: Data Analysis of Hospital Compare DataSet**  
**By Manish Shah**  
**Date:10/31/2017**  

# DataSet:

The dataset is from https://data.medicare.gov/data/hospital-compare CMS hospital compare. 

For this exercise, only a subset of files are used. The following files are used. 

Files | Description
------|-------------
Hospital General Information.csv | General Hospital Information
Timely and Effective Care - Hospitals.csv | Procedure Data
Readmissions and Deaths - Hospitals.csv | Procedure Data
Measures Dates.csv | Mapping of measures to code
hvbp_hcahps_05_28_2015.csv | Example survey response Data

These files have been downloaded and stored in the data files folder under loading and modelling. 

# Run Environment:

The analysis has been tested on AWS hosted EC2 instance with 100 GB of diskspace, 8 GB of Ram and 2 processors and using Linux operating system. The AMI used is "UCB W205 Spring 2016 (ami-be0d5fd4)"  

The exercises uses hadoop version 2.6  

Postgres version: 8.4  
 

# Folders and Files 

The folder "exercise_1" contains all the files for this project. This folder contains the following folders

Files | Description
------|-------------
investigations | Contains best_hospitals, best_states, hospital_variability, hospitals_and_patients for analysis
transforming | Transforms the raw data by removing NULLs and incomplete data
loading_and_modelling | This folder contains  data files folder that contains the data  


The file main.sh runs all the needed scripts for this exercise.   
The file hive_base_ddl.sql creates the postgres scripts to create the tables and load the data.  
The file load_data_lake.sh copies the files to hadoop. 
 
# Run Instructions

To run the project run the main.sh script. This has been tested to run as root. 

# Transformations

1. Effective care: For this data set, we filter the Not Available, High, Low and Medium. The high, low and medium refers to the number of emergency department patients and thus it is not useful for the analysis.   

2. Hospitals: We just filter out the unwanted columns like address, city, etc. We create two tables one for Veterans hospital and another one for non veterans to study the scores in either one.    

3. patient_readd_data: This is a secondary table which joins the scores from the readmission data and the customer survey for ease of correlation calculation.   

4. hospital_score_effcare: This is a secondary table to calculate and store statistics information about effective care. It calculates the min, max, average, standard deviation, variance, and sum for the scores in the effective care dataset.   

5. measures_transformed_ddl.sql: In this table we just filter out EDV (Emergency Department Visits) from the Measures table.   

6. readmissions_transformed: In this table, we filter out information like address, city, etc and also filter outNot Available and "Number of cases too small" in the "compared_to_national" column to filter out non available data.    

7. hospital_score_readd: This is a secondary table to calculate and store statistics information about readmissions. It calculates the min, max, average, standard deviation, variance, and sum for the scores in the readmission data set.    

8. patient_effcare_data: This is a secondary table which joins the scores from the effective care data and the customer survey for ease of correlation calculation.   

9. surveys_responses_transformed: In this table, we filter out some unwanted columns from the surveys responses table and also filter out the non applicable score rows.       

 

# Analysis

There is a text file with extension ".txt" in each of the folders under the investigations folder that details the findings. 

## Hospital Analysis:

1. The hospitals are queried based on the total scores of all measures. The
query outputs the aggregate score, average score, maxscore, minscore, and std
deviation.   
2. The query is done separately for effective care and for readmissions.   
3. Interestingly, the top 10 hospitals are different for effective care and
readmissions.   
4. Contrary to poular belief, we found that the non veterans hospitals have a higher aggregate
score for both effective care and readmissions.  
5. The average score for all measures were higher for the nonveterans hospital
vs. the veterans hospital. These might due to fewer veterans hospital
participating.   
6. There are 129 veterans hospital in the data set and 4695 non veterans
hospitals in the dataset.  

## States Analysis:
1. The aggregate score for effective care is higher than the aggregate score
of readmission in most of the states. This may be due to a large number of
patients in the effective care.   
2. The veterans hospitals scored lower on both the effective care and on the
readmission care. The difference was two times or higher.   

## Hospital variability Analysis:
1. In the readmission category, the heart failures, pulmonary diseases are the top two measures with the highest score.   
2. In the effective care, the ED1 and OP 18 measures are the top two with the highest score. This is understandable as ED1 is the emergency department care and OP 18 is the mean time between Emergency department arrival and departure. The score drops significantly for the other measures.   
3. The aggregate scores for the effective care are much much higher compared to the readmission.   

## Hospitals and Patients Analysis:  
1. We find that the average effective care scores and survey scores are negatively correlated. This is a bit surprising finding. Maybe the survey responses are filled by people who are not happy with the service. 
2. The average readmission score and the survey scores are also negatively correlated.  
3. There is no data for veterans hospital for patient surveys. So we have no correlation data for the veterans hospital. 
