-- Commission rate normally is 15%, let's find if somewhere it's different
select
    state,
    catname,
    fact_revenue_earned,
    fact_commission_earned
from {{ ref('da_sale_potential' )}}
where fact_commission_earned != fact_revenue_earned*0.15