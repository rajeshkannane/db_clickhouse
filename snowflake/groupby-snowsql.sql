
 drop table if exists ans; 
/* q1: question='sum v1 by id1' */
--q1
-- first run 
CREATE TABLE ans AS SELECT id1, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1;
copy into @teststage/result1.csv from (SELECT 1 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id1, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true; 
drop table ans;
/*list @teststage;*/
get @teststage/result1.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

--second time
CREATE TABLE ans AS SELECT id1, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1;
SELECT *from ANS LIMIT 10;
copy into @teststage/result2.csv from (SELECT 2 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id1, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true; 
drop table ans;
get @teststage/result2.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;


--sql for q2
--first time
CREATE TABLE ans AS SELECT id1, id2, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1, id2;
copy into @teststage/result3.csv from (SELECT 1 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id1, id2, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1, id2;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result3.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

--second time
CREATE TABLE ans AS SELECT id1, id2, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1, id2;
SELECT *from ANS LIMIT 10;
copy into @teststage/result4.csv from (SELECT 2 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id1, id2, sum(v1) AS v1 FROM TESTTABLE1 GROUP BY id1, id2;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result4.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

/* q3: question='sum v1 mean v3 by id3' */
--first time
CREATE TABLE ans AS SELECT id3, sum(v1) AS v1, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id3;
copy into @teststage/result5.csv from (SELECT 1 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id3, sum(v1) AS v1, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id3;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result5.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

--second time
CREATE TABLE ans AS SELECT id3, sum(v1) AS v1, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id3;
SELECT *from ANS LIMIT 10;
copy into @teststage/result6.csv from (SELECT 2 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id3, sum(v1) AS v1, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id3;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result6.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

/* q4: question='mean v1:v3 by id4' */\
--first run
CREATE TABLE ans AS SELECT id4, avg(v1) AS v1, avg(v2) AS v2, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id4;
copy into @teststage/result7.csv from (SELECT 1 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id4, avg(v1) AS v1, avg(v2) AS v2, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id4;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result7.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;
--second run
CREATE TABLE ans AS SELECT id4, avg(v1) AS v1, avg(v2) AS v2, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id4;
SELECT *from ANS LIMIT 10;
copy into @teststage/result8.csv from (SELECT 2 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id4, avg(v1) AS v1, avg(v2) AS v2, avg(v3) AS v3 FROM TESTTABLE1 GROUP BY id4;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result8.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

/* q5: question='sum v1:v3 by id6' */
--first run
CREATE TABLE ans AS SELECT id6, sum(v1) AS v1, sum(v2) AS v2, sum(v3) AS v3 FROM TESTTABLE1 GROUP BY id6;
copy into @teststage/result9.csv from (SELECT 1 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id6, sum(v1) AS v1, sum(v2) AS v2, sum(v3) AS v3 FROM TESTTABLE1 GROUP BY id6;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result9.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

--second run
CREATE TABLE ans AS SELECT id6, sum(v1) AS v1, sum(v2) AS v2, sum(v3) AS v3 FROM TESTTABLE1 GROUP BY id6;
SELECT *from ANS LIMIT 10;
copy into @teststage/result10.csv from (SELECT 2 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id6, sum(v1) AS v1, sum(v2) AS v2, sum(v3) AS v3 FROM TESTTABLE1 GROUP BY id6;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result10.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

/* q6: question='median v3 sd v3 by id4 id5' */
--first run
CREATE TABLE ans AS SELECT id4, id5, median(v3) AS median_v3,STDDEV_POP(v3) AS sd_v3 FROM TESTTABLE1 GROUP BY id4, id5;
copy into @teststage/result11.csv from (SELECT 1 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id4, id5, median(v3) AS median_v3,STDDEV_POP(v3) AS sd_v3 FROM TESTTABLE1 GROUP BY id4, id5;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result11.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

--second run
CREATE TABLE ans AS SELECT id4, id5, median(v3) AS median_v3,STDDEV_POP(v3) AS sd_v3 FROM TESTTABLE1 GROUP BY id4, id5;
SELECT *from ANS LIMIT 10;
copy into @teststage/result12.csv from (SELECT 2 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id4, id5, median(v3) AS median_v3,STDDEV_POP(v3) AS sd_v3 FROM TESTTABLE1 GROUP BY id4, id5;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result12.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

/* q7: question='max v1 - min v2 by id3' */
--first run
CREATE TABLE ans AS SELECT id3, max(v1) - min(v2) AS range_v1_v2 FROM TESTTABLE1 GROUP BY id3;
copy into @teststage/result13.csv from (SELECT 1 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id3, max(v1) - min(v2) AS range_v1_v2 FROM TESTTABLE1 GROUP BY id3;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result13.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;
--second run
CREATE TABLE ans AS SELECT id3, max(v1) - min(v2) AS range_v1_v2 FROM TESTTABLE1 GROUP BY id3;
SELECT *from ANS LIMIT 10;
copy into @teststage/result14.csv from (SELECT 2 AS run, DATE_PART(epoch_second, START_TIME) AS timestamp, 'groupby' AS task, 'TESTTABLE1' AS data_name, NULL AS in_rows, 'sum v1 by id1' AS question, ROWS_PRODUCED AS out_rows, NULL AS out_cols, 'clickhouse' AS solution, release_version AS version, NULL AS git, 'select group by' AS fun, TOTAL_ELAPSED_TIME/1000 as time_sec, BYTES_SCANNED/1073741824 AS mem_gb, 1 AS cache, NULL AS chk, NULL AS chk_time_sec, 0 AS on_disk
from table(information_schema.QUERY_HISTORY_BY_SESSION())
where query_text='CREATE TABLE ans AS SELECT id3, max(v1) - min(v2) AS range_v1_v2 FROM TESTTABLE1 GROUP BY id3;' ORDER BY START_TIME DESC LIMIT 1) file_format = (TYPE=CSV compression='gzip') single=true max_file_size=4900000000 header=true;
drop table ans;
get @teststage/result14.csv file:///home/rajesh/git/db-test/snowflake/log/;
rm @teststage;

/* q8: question='largest two v3 by id6' */
/*CREATE TABLE ans AS SELECT id6, arrayJoin(arraySlice(arrayReverseSort(groupArray(v3)), 1, 2)) AS v3 FROM (SELECT id6, v3 FROM TESTTABLE1 WHERE v3 IS NOT NULL) AS subq GROUP BY id6;*/
--first run
CREATE TABLE ans AS select id6, F.value as v3 
from (select id6, array_slice(ARRAY_AGG(v3) WITHIN GROUP (ORDER BY v3 DESC),0,2) AS v3 FROM (SELECT id6, v3 FROM TESTTABLE1 WHERE v3 IS NOT NULL) AS subq GROUP BY id6), Table(Flatten(v3)) F;



