{{
    config(
        materialized='table',
        transient=true,
        database='dbt_db',
        schema='dbt_sc_stg',
        alias='snp_cust_stg',
        tags='dbt_cust_q'
    )
}}

with cust_cte as(

    select 
    id as cust_id,
    name as cust_name,
    concat(rpad(substr(email,1,5),15,'*'),'gmail.com') as email,
    address,
    modified_at,
    status as cust_status 
    from {{source('dbt_raw','customer')}}

)
select * from cust_cte