select
        line_item.ORDER_ITEM_KEY,
        line_item.PART_KEY,
        line_item.LINE_NUMBER,
        line_item.EXTENDED_PRICE,
        orders.O_ORDERKEY,
        orders.O_CUSTKEY,
        orders.O_ORDERDATE,
        {{discounted_amount('line_item.EXTENDED_PRICE','line_item.DISCOUNT')}} as item_discounted
    from
        {{ref('stg_tpch_orders')}} as orders
    join
        {{ref('stg_tpch_line_items')}} as line_item
            on orders.O_ORDERKEY = line_item.order_key
    order by orders.O_ORDERDATE