with source as (
      select * from {{ source('sources', 'users') }}
),
renamed as (
    select
        userid,
        username,
        firstname,
        lastname,
        city,
        state,
        email,
        phone
    from source
)
select * from renamed
  