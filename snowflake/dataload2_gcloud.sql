
create or replace TABLE TESTRUN.TESTSCHEMA.TESTTABLE2 (
	ID1 VARCHAR(16777216),
	ID2 VARCHAR(16777216),
	ID3 VARCHAR(16777216),
	ID4 NUMBER(38,0),
	ID5 NUMBER(38,0),
	ID6 NUMBER(38,0),
	V1 NUMBER(38,0),
	V2 NUMBER(38,0),
	V3 FLOAT
);
copy into TESTTABLE2
  from 'gcs://dbtest-data-bucket/G1_1e8_1e2_0_0.csv'
  storage_integration = GCP_INT
  file_format = (type = csv field_delimiter = ',' skip_header = 1) on_error=continue;

select count (*) from testtable2;

