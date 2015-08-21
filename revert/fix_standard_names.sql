-- Revert cbibs_db:fix_standard_names from pg

BEGIN;

    ALTER TABLE cbibs.d_variable DROP COLUMN netcdf_name;
    ALTER TABLE cbibs.d_variable DROP COLUMN aggregate_depth; 

COMMIT;
