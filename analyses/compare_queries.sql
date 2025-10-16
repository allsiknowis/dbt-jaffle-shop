{% set old_relation = ref('customer_orders') %}
{% set new_relation = ref('fct_customer_orders') %}

{{
    audit_helper.compare_relations(
        a_relation=old_relation,
        b_relation=new_relation,
        primary_key="order_id"
    )
}}