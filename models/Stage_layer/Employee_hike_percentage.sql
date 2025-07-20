{{
    config(
        materialized='table'
    )
}}



select EMP_ID , 
    FIRST_NAME ,
    SALARY ,
    {{ Employee_hike('10') }}

 from {{ ref('Raw_employee_full_det') }}