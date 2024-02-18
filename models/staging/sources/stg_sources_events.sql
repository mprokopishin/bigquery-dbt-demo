with source as (
      select * from {{ source('sources', 'events') }}
),
renamed as (
    select
        eventid,
        venueid,
        catid,
        dateid,
        eventname,
        starttime
    from source
)
select * from renamed
  