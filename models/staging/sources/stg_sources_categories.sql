with 
    categories as (select * from {{ source("sources", "categories") }}),
    final as (
        select
            catid,
            catgroup,
            catname,
            catdesc
        from categories
    )
select * 
from final
  