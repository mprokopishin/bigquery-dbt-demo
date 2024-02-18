with 
    states as (
        select distinct state
        from {{ ref('stg_sources_users') }}
    )
select *
from states