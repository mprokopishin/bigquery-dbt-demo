with source as (
      select * from {{ source('sources', 'listings') }}
),
renamed as (
    select
        listid,
        sellerid,
        eventid,
        dateid,
        numtickets,
        priceperticket,
        totalprice,
        listtime

    from source
)
select * from renamed
  