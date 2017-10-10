cd "loading_and_modelling/data files"
pwd
echo "Remove header lines from files....."
tail -n +2 "Hospital General Information.csv" > hospitals.csv 
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv  
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv  
tail -n +2 "Measure Dates.csv" > Measures.csv 
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > surveys_responses.csv
whoami
echo "Start Hadoop, hdfs and hive using start-hadoop.sh ..."
/root/start-hadoop.sh
echo "mkdir /user/w205/hospital_compare. delete if exists...."
su - w205
hdfs dfs -rm -f -r /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare
cd "/home/w205/github/W205/exercise_1/loading_and_modelling/data files"
pwd
echo "Put files on the hdfs...."
hdfs dfs -put hospitals.csv /user/w205/hospital_compare
hdfs dfs -put Measures.csv /user/w205/hospital_compare
hdfs dfs -put readmissions.csv /user/w205/hospital_compare
hdfs dfs -put effective_care.csv /user/w205/hospital_compare
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare
echo "script complete..."
 

 
