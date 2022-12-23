#!/bin/bash

set -e
#Instal Snowsql
~/git/db-test/snowflakeConfig.sh
echo "Snowsql installed....."
sleep 10
# Dataset loading
snowsql -c snowsqlTest -f ~/git/db-test/snowflake/test.sql;
echo "Data uploaded"
sleep 10
#log file creation
mkdir -p ~/git/db-test/snowflake/logTest

snowsql -c snowsqlTest -f ~/git/db-test/snowflake/groupby-snowsql.sql;

snowsql -f ~/git/db-test/snowflake/groupby-snowsql.sql -o friendly=false

Rscript snowfake/snowfake-parse-log.R group-by result
