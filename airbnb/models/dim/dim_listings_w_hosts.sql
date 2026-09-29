with l as (
    select * from {{ref ('dim_listing_cleansed')}}
)
,h as (
    select * from {{ref ('dim_host_cleansed')}}
)
select l.listing_id,
       l.list_name,
       l.room_type,
       l.minimum_nights,
       l.price,
       l.host_id,
       h.host_name,
       h.is_superhost as host_is_superhost,
       l.created_at,
       greatest(l.updated_At, h.updated_At) as updated_At
from l
left join h on (h.host_id = l.host_id)