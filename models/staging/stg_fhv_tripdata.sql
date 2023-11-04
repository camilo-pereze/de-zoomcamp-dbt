{{ config(materialized='view') }}

select
    -- identifiers
    cast(dispatching_base_num as string) as dispatching_base_num,
    cast(pulocationid as integer) as  pickup_locationid,
    cast(dolocationid as integer) as dropoff_locationid,
    cast(sr_flag as string) as sr_flag,
    cast(affiliated_base_number as string) as affiliated_base_number,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime
from {{ source('fhv','fhv_2019_data') }}


{% if var('is_test_run', default=false) %}
    limit 100
{% endif %}