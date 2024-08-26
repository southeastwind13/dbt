{{
    config(
        materialized = 'table',
    )
}}

WITH src_hosts AS(
    SELECT * FROM {{ref("src_hosts")}}
)

SELECT
 host_id,
 NVL(host_name, 'Anonymouse') as host_name, -- Set default value when it is null
 is_superhost,
 created_at,
 updated_at
FROM 
 src_hosts