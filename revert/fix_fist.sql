-- Revert cbibs_db:fix_fist from pg

BEGIN;

    UPDATE cbibs.d_station
    SET site_name = 'Fist Landing CBIBS Buoy'
    WHERE site_name = 'First Landing CBIBS Buoy';

COMMIT;
