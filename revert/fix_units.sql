-- Revert cbibs:fix_units from pg

BEGIN;

    DELETE FROM cbibs.d_units
    WHERE unit_name = 'millimeters per second';

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'meters per second')
    WHERE actual_name in ('current_velocity', 'current_average_velocity');

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'meters per second')
    WHERE actual_name in ('current_direction');

COMMIT;
