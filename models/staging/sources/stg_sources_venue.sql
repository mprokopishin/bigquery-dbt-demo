with source as (
      select * from {{ source('sources', 'venue') }}
),
renamed as (
    select
        venueid,
        venuename,
        venuecity,
        venuestate,
        venueseats
    from source
)
select * from renamed
  