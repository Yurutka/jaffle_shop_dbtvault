{{
    config(
        enabled=True
    )
}}

select date_trunc('week', order_date::timestamp)::date as order_week, status, count(*)
from dbt.source_orders
group by order_week,status
order by order_week desc, status