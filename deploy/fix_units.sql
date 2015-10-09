-- Deploy cbibs:fix_units to pg

BEGIN;

    INSERT INTO cbibs.d_units (unit_name, canonical_units, netcdf)
    SELECT 'millimeters per second', 'mm/s', 'mm s-1'
    WHERE NOT EXISTS ( SELECT id FROM cbibs.d_units WHERE unit_name = 'millimeters per second');

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'millimeters per second')
    WHERE actual_name in ('current_velocity', 'current_average_velocity');

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'degree')
    WHERE actual_name in ('current_direction');

COMMIT;
