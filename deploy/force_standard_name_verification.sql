-- Deploy cbibs_db:force_standard_name_verification to pg

BEGIN;

  ALTER TABLE cbibs.d_variable ADD CONSTRAINT valid_standard_name FOREIGN KEY (netcdf_name) REFERENCES cbibs.cf_standard_names (standard_name); 

COMMIT;
