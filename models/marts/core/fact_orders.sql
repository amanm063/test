WITH orders AS (
    SELECT * FROM {{ref("stage_orders")}}
),
payments AS (
    SELECT * FROM {{ref("stage_payments")}}
),
fact_orders AS (
    SELECT o.order_id,
           p.payment_id,
           p.amount
    FROM orders o
    LEFT JOIN payments p ON o.order_id = p.order_id  
)
SELECT * FROM fact_orders
LIMIT 500
