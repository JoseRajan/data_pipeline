select
    O_ORDERKEY,
    sum(EXTENDED_PRICE) as gross_item_sales_amount,
    sum(item_discounted) as item_discount_amount
from {{ref('int_order_items')}}
group by O_ORDERKEY