-- Deploy cbibs_db:add_time_bounds to pg

BEGIN; 
    ALTER TABLE cbibs.d_variable ADD COLUMN depth_cell_method text
      CONSTRAINT valid_cell_method_depth CHECK (depth_cell_method IN
        ('point', 'sum', 'maximum', 'median', 'mid_range', 'mean', 'mode',
         'range', 'standard_deviation', 'variance'));
    -- no longer needed as it's taken care of by depth_cell_method
    ALTER TABLE cbibs.d_variable DROP COLUMN aggregate_depth;

    ALTER TABLE cbibs.d_variable ADD COLUMN time_cell_method text
      CONSTRAINT valid_cell_method_time CHECK (time_cell_method IN
        ('point', 'sum', 'maximum', 'median', 'mid_range', 'mean', 'mode',
         'range', 'standard_deviation', 'variance'));
COMMIT;
