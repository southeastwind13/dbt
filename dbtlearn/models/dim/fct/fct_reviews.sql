{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

-- If we have change the schema in the raw table then we need to run this with
-- command --full-refresh
-- It will pass everthing to trash and recreate a incremental table from scratch


WITH src_reviews AS(
    SELECT * FROM {{ref('src_reviews')}}
)

SELECT * FROM src_reviews
WHERE review_text IS NOT NULL

-- If it is a incremental load then append this sql conditon
{% if is_incremental() %}
    AND (review_date > (SELECT MAX(review_date) FROM {{ this }}))
{% endif %}