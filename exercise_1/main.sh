echo "Loading the data lake"
./load_data_lake.sh
echo "Creating the database and the tables"
echo "Running hive in silent mode"
hive -S -v -f hive_base_ddl.sql
echo "Transforming the data"
hive -S -v -f ./transforming/hospitals_transformed_ddl.sql
hive -S -v -f ./transforming/readmissions_transformed_ddl.sql
hive -S -v -f ./transforming/measures_transformed_ddl.sql
hive -S -v -f ./transforming/effective_care_transformed_ddl.sql
hive -S -v -f ./transforming/surveys_responses_transformed_ddl.sql
