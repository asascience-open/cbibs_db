-- Revert cbibs_db:fix_pres from pg

BEGIN;

    DELETE FROM cbibs.d_units
    WHERE unit_name = 'millibars';

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'Pascal')
    WHERE actual_name = 'air_pressure';

COMMIT;
