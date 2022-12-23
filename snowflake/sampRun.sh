#!/bin/bash

#mkdir -p ~/git/db-test/snowflake/log
#rm -f ~/git/db-test/snowflake/log/groupby_G1_1e7_1e2_0_0_q*.csv

snowsql -f ~/git/db-test/snowflake/groupby-snowsql9.sql -o friendly=false

Rscript ~/git/db-test/snowflake/snowflake-parse-log.R groupby G1_1e9_1e2_0_0
