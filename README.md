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
 
