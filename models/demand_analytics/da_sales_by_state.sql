{{
    config(
        materialized='incremental',
        unique_key=['seller_state', 'buyer_state', 'caldate', 'catid'],
        on_schema_change='sync_all_columns'
    )
}}
with 
  states as (select * from {{ ref('da_states') }}), 
  sales_agg as (
    select su.state su_state,
          bu.state bu_state,
          d.caldate,
          e.catid,
          sum(s.qtysold) as ticket_cnt,
          sum(s.pricepaid) as revenue,
          sum(s.commission) as commission,
          count(distinct su.userid) seller_cnt,
          count(distinct bu.userid) buyer_cnt,
          avg(s.pricepaid/s.qtysold) avg_ticket_price
    from {{ ref('stg_sources_sales') }} s
    join {{ ref('stg_sources_users') }} su on (s.sellerid = su.userid)
    join {{ ref('stg_sources_users') }} bu on (s.buyerid = bu.userid)
    join {{ ref('stg_sources_dates') }} d on (s.dateid = d.dateid)
    join {{ ref('stg_sources_events') }} e on (s.eventid = e.eventid)

    {% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    -- (uses > to include records whose timestamp occurred since the last run of this model)
    where d.caldate > (select max(t.caldate) from {{ this }} t)
    {% endif %}     

    group by 1, 2, 3, 4
  ),
  final as (
    select sst.state seller_state,
          bst.state buyer_state,
          s.caldate,
          s.catid,
          s.ticket_cnt,
          s.revenue,
          s.commission,
          s.seller_cnt,
          s.buyer_cnt,
          s.avg_ticket_price 
    from states sst
    cross join states bst
    left join sales_agg s on (s.su_state = sst.state and s.bu_state = bst.state)
  )
select * 
from final