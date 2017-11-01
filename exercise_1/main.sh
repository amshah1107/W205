echo "Loading the data lake"
./load_data_lake.sh
echo "Creating the database and the tables"
echo "Running hive in silent mode"
#hive -S -v -f hive_base_ddl.sql
echo "Transforming the data"
for f in ./transforming/*;
 do
  hive -S -v -f $f
 done; 
echo "Investigating the data"
echo "Top 10 hospitals with Quality care with aggregate, average and variance"
hive -S -v -f ./investigations/best_hospitals/best_hospitals.sql
hive -S -v -f ./investigations/best_states/best_states.sql
hive -S -v -f ./investigations/best_states/best_states.sql
hive -S -v -f ./investigations/hospital_variability/hospital_variability.sql
hive -S -v -f ./investigations/hospitals_and_patients/hospitals_and_patients.sql
