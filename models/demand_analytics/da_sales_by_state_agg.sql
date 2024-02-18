with 
    da_sales_by_state as (select * from {{ ref('da_sales_by_state') }}),
    final as (
        select seller_state,
               buyer_state,
               catid,
               sum(ticket_cnt) ticket_cnt,
               sum(revenue) revenue,
               sum(commission) commission,
               avg(revenue/ticket_cnt) avg_ticket_price
        from da_sales_by_state
        group by 1, 2, 3)
select *
from final