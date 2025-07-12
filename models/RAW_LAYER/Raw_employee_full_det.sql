{{
    config(
        materialized='table'
    )
}}

select * from DBT_TRANSFORM.EMP_FULL_DETAILS.EMPLOYEE_FULL_DETAILS