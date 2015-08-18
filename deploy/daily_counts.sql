-- Deploy cbibs_db:daily_counts to pg

BEGIN;
    CREATE VIEW cbibs.daily_counts AS (
          WITH count_query AS (
                SELECT d_variable_id, d_station_id,
                       (measure_ts AT TIME ZONE 'UTC')::date date,
                       l.elevation, COUNT(*) obs_count
                  FROM f_observation o
                  JOIN d_location l
                    ON l.id       = o.d_location_id
                 WHERE measure_ts < date_trunc('day', NOW())
                 GROUP BY (measure_ts AT TIME ZONE 'UTC')::date,
                          d_station_id, d_variable_id, elevation
               )
        SELECT st.description code, actual_name, date, elevation, obs_count
          FROM count_query
          JOIN d_station st
            ON st.id      = count_query.d_station_id
          JOIN d_variable v
            ON v.id       = count_query.d_variable_id
         ORDER BY date, site_code, actual_name, elevation DESC
           );
COMMIT;
