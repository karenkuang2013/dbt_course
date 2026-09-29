{{
    config(
        materialized = 'table',
    )
}}
with fct_review as (
    select * from {{ref('fct_review')}}
)
,full_moon as (
    select * from {{ref('seed_full_moon_dates')}}
)
select r.*,
       case when f.full_moon_date is null then 'not fullmoon'
       else 'full moon' end is_fullmoon
from fct_review r left join full_moon f on (r.review_date = dateadd(day,1, f.full_moon_date))