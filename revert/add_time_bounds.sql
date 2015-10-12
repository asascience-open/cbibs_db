-- Revert cbibs_db:add_time_bounds from pg

BEGIN; 
    ALTER TABLE cbibs.d_variable ADD COLUMN aggregate_depth boolean
                                            NOT NULL DEFAULT false;
    ALTER TABLE cbibs.d_variable DROP COLUMN depth_cell_method; 
    ALTER TABLE cbibs.d_variable DROP COLUMN time_cell_method; 
COMMIT;
