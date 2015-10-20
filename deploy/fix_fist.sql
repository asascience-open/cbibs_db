-- Deploy cbibs_db:fix_fist to pg

BEGIN;

    UPDATE cbibs.d_station
    SET site_name='First Landing CBIBS Buoy'
    WHERE site_name = 'Fist Landing CBIBS Buoy';

COMMIT;
