{{
    config(
        materialized = 'view',
    )
}}

WITH src_listeings AS (
    SELECT * FROM {{ref("src_listings")}} 
)

SELECT 
 listing_id,
 listing_name,
 room_type,
 -- If minimium night is zero then set it to one.
 CASE
    WHEN minimum_nights <= 0 THEN 1
    ELSE minimum_nights
 END AS minimum_nights,
 host_id,
 REPLACE(price_str, '$') :: NUMBER(10, 2) AS price, -- Replace '$' with empty string and convert to be number.
 created_at,
 updated_at
FROM 
 src_listeings