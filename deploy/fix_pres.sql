-- Deploy cbibs_db:fix_pres to pg

BEGIN;

    INSERT INTO cbibs.d_units (unit_name, canonical_units, netcdf)
    SELECT 'millibars', 'mbar', 'mbar'
    WHERE NOT EXISTS ( SELECT id FROM cbibs.d_units WHERE unit_name = 'millibars');

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'millibars')
    WHERE actual_name = 'air_pressure';


COMMIT;
