with
    sales as (select * from {{ source("sources", "sales") }}),
    final as (
        select
            salesid as salesid,
            listid,
            sellerid,
            buyerid,
            eventid,
            dateid,
            qtysold,
            pricepaid,
            commission,
            saletime
        from sales
    )
select *
from final

