{{
    config(
        materialized='table'
    )
}}

select * from {{ source('Emp_details', 'DEPARTMENTS') }}