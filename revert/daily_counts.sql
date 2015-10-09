-- Revert cbibs_db:daily_counts from pg

BEGIN;

    DROP VIEW daily_counts;

COMMIT;
