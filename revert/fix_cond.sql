-- Revert cbibs_db:fix_cond from pg

BEGIN;

    DELETE FROM cbibs.d_units
    WHERE unit_name = 'Siemen per meter';

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'Micro Siemen per meter')
    WHERE actual_name = 'sea_water_electrical_conductivity';

COMMIT;
