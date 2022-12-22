CREATE or replace STORAGE INTEGRATION GCP_INT
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = GCS
ENABLED = TRUE
STORAGE_ALLOWED_LOCATIONS = ('gcs://dbtest-data-bucket/');

create or replace stage my_gcs_stage
  url = 'gcs://dbtest-data-bucket/'
  storage_integration = gcp_int;
  
list @my_gcs_stage;


DESC STORAGE INTEGRATION GCP_INT;

create stage teststage
  copy_options = (on_error='continue');
--projects/_/buckets/databricks-974362341710901
