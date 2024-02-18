with 
    sales_by_state_agg as (select * from {{ ref('da_sales_by_state_agg') }}),
    capacity_by_state as (select * from {{ ref('da_capacity_by_state') }}),
    categories as (select * from {{ ref('stg_sources_categories') }}),
    final as (
        select s.buyer_state state,
            cat.catname, 
            s.ticket_cnt fact_tickets_sold,
            s.revenue fact_revenue_earned,
            s.commission fact_commission_earned,
            c.seat_capacity,
            c.ticket_supply,
            c.ticket_supply * avg_ticket_price potential_revenue 
        from sales_by_state_agg s
        left join capacity_by_state c
            on s.buyer_state = c.state and s.catid = c.catid
        left join categories cat 
            on cat.catid = s.catid          
    )
select *
from final