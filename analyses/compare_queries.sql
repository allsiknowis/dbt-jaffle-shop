/*
This query lists all column names from both the old and new models
so we can easily spot any differences in naming.
*/
select
    column_name,
    'in_customer_orders' as source_model
from {{ ref('customer_orders').database }}.{{ ref('customer_orders').schema }}.INFORMATION_SCHEMA.COLUMNS
where table_name = '{{ ref('customer_orders').identifier }}'

union all

select
    column_name,
    'in_fct_customer_orders' as source_model
from {{ ref('fct_customer_orders').database }}.{{ ref('fct_customer_orders').schema }}.INFORMATION_SCHEMA.COLUMNS
where table_name = '{{ ref('fct_customer_orders').identifier }}'

order by 1, 2