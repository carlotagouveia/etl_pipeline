-- check if discount is greater than zero

select 
    *
from
    {{ ref('fct_orders') }}
where
    item_discount_amount > 0