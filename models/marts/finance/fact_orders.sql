with order_data as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

payment_data as (
    select * from {{ ref('stg_stripe__payments') }}
),

amounts_data as (
    select
    o.order_id,
    o.customer_id,
    sum(p.amount) as amount

    from order_data o
    inner join payment_data p on o.order_id = p.order_id

    group by
    o.order_id,
    o.customer_id
)

select * from amounts_data