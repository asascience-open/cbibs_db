BEGIN; 

--DROP TABLE cf_standard_names;
DROP TABLE cf_standard_names;


UPDATE d_variable
    SET netcdf_name = actual_name,
        depth_cell_method = NULL,
        time_cell_method = NULL;
COMMIT;
