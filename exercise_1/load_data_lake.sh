echo "Start Hadoop, hdfs and hive using start-hadoop.sh ..."
/root/start-hadoop.sh
/data/stop_postgres.sh
/data/start_postgres.sh
cd "loading_and_modelling/data files"
echo "current working directory is " `pwd`
echo "Remove header lines from files....."
tail -n +2 "Hospital General Information.csv" > hospitals.csv 
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv  
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv  
tail -n +2 "Measure Dates.csv" > measures.csv 
tail -n +2 "hvbp_hcahps_05_28_2015.csv" > surveys_responses.csv
echo "current user is " `whoami`
echo "mkdir /user/w205/hospital_compare. delete if exists...."
sudo -u w205 hdfs dfs -rm -f -r /user/w205/hospital_compare
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare
cd "/home/w205/github/W205/exercise_1/loading_and_modelling/data files"
echo "current working directory is " `pwd`
echo "Put files on the hdfs...."
echo "put  hospitals.csv"
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
sudo -u w205 hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals

echo "put  effective_care.csv"
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
sudo -u w205 hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care


echo "put  readmissions.csv"
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
sudo -u w205 hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions


echo "put  measures.csv"
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/measures
sudo -u w205 hdfs dfs -put measures.csv /user/w205/hospital_compare/measures


echo "put  surveys_responses.csv"
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
sudo -u w205 hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/surveys_responses
echo "script complete..."

 

 
