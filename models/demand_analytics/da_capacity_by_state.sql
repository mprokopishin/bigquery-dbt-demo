with 
    states as (select * from {{ ref('da_states') }}), 
    events_capacity AS (
        select e.catid,
               v.venuestate,
               sum(v.venueseats) seat_capacity,
               sum(l.numtickets) ticket_supply
        from {{ ref('stg_sources_events') }} e
        left join {{ ref('stg_sources_listings') }} l ON (l.eventid = e.eventid)
        left join {{ ref('stg_sources_venue') }} v ON (v.venueid = e.venueid)
        group by 1, 2
    ),
    final as (
        select *
        from states s
        left join events_capacity e ON (e.venuestate = s.state)
    )
select * 
from final