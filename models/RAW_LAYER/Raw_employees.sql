{{
    config(
        materialized='table'
    )
}}

select * from DBT_TRANSFORM.EMPLOYEES_DETAILS.EMPLOYEES