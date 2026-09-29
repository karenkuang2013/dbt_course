{{
    config(
        materialized = 'view',
    )
}}
with dim_host_cleansed as (
    select * from {{ref('src_hosts')}}
)
select host_id,
       nvl(host_name, 'Anoynomous') as host_name,
       is_superhost,
       created_At,
       updated_At
from dim_host_cleansed