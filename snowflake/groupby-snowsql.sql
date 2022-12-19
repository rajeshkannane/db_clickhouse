--sql for q1
--first time
create table ans as  select id1,sum(v1) as v1 from TESTTABLE group by id1;
SELECT *from ANS LIMIT 10;
drop table ans;
--second time
create table ans as  select id1,sum(v1) as v1 from TESTTABLE group by id1;
SELECT *from ANS LIMIT 10;
drop table ans;
--sql for q2
--first time
CREATE TABLE ans ENGINE = Memory AS SELECT id1, id2, sum(v1) AS v1 FROM DATA_NAME GROUP BY id1, id2;

--q6
CREATE TABLE ans AS SELECT id4, id5, median(v3) AS median_v3,STDDEV_POP(v3) AS sd_v3 FROM TESTTABLE GROUP BY id4, id5;
