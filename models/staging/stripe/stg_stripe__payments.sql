select
id as payment_id,
order_id,
payment_method,
amount

from {{ source('stripe', 'raw_payments') }}