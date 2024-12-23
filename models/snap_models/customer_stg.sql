{{
    config(
        materialized='incremental',
        database='dbt_db',
        schema='dbt_snp_sc',
        unique_key='cust_id',
        incremental_strategy='merge',
        merge_exclude_columns=['cust_id']
    )
}}
with cust_cte as (
    select 
        id as cust_id,
        name as cust_name,
        email as email_id,
        address,
        modified_at from {{ source('dbt_db_data', 'CUSTOMER') }}
)
select * from cust_cte