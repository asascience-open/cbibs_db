-- Revert cbibs_db:force_standard_name_verification from pg

BEGIN;

    ALTER TABLE cbibs.d_variable DROP constraint valid_standard_name;

COMMIT;
