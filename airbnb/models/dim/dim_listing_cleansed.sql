{{
    config(
        materialized = 'view',
    )
}}
with dim_listings_cleansed as (
    select * from {{ref('src_listings')}}
)
select listing_id,
       listing_url,
       list_name,
       room_type,
       case when minimum_nights = 0 then 1
            else minimum_nights
       end minimum_nights,
       host_id,
       replace(price_str,'$')::number(10,2) as price,
       created_at,
       updated_at
from dim_listings_cleansed