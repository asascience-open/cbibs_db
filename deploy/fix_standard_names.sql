-- Deploy cbibs_db:fix_standard_names to pg

BEGIN;

    ALTER TABLE cbibs.d_variable ADD COLUMN netcdf_name text;
    UPDATE cbibs.d_variable SET netcdf_name = actual_name;
    -- column to represent whether we want to aggregate by depth
    ALTER TABLE cbibs.d_variable ADD COLUMN aggregate_depth boolean
                                            NOT NULL DEFAULT false;
    UPDATE cbibs.d_variable SET aggregate_depth = true WHERE 
                                actual_name LIKE 'current\_average%';
    -- update currents names to match CF
    UPDATE cbibs.d_variable SET netcdf_name = 'sea_water_velocity'
                            WHERE actual_name IN ('current_velocity',
                                                  'current_average_velocity');
    UPDATE cbibs.d_variable SET netcdf_name = 'direction_of_sea_water_velocity'
                            WHERE actual_name IN ('current_direction',
                                                  'current_average_direction');

COMMIT;
