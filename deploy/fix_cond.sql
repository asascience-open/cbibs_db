-- Deploy cbibs_db:fix_cond to pg

BEGIN;

    INSERT INTO cbibs.d_units (unit_name, canonical_units, netcdf)
    SELECT 'Siemen per meter', 'S/m', 'S m-1'
    WHERE NOT EXISTS ( SELECT id FROM cbibs.d_units WHERE unit_name = 'Siemen per meter');

    UPDATE cbibs.d_variable v
    SET d_units_id = (SELECT id FROM cbibs.d_units where unit_name = 'Siemen per meter')
    WHERE actual_name = 'sea_water_electrical_conductivity';

COMMIT;
