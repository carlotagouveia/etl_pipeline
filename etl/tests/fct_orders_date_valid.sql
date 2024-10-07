select
    *
from
    {{ ref('fct_orders') }}
where
    date(order_date) > CURRENT_DATE()
    or date(order_date) < date(1989-01-01)