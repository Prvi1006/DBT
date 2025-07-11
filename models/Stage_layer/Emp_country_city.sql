{{
    config(
        materialized='table'
    )
}}

{% set value = 2 %}

SELECT 
    l.country,
    l.city,
    COUNT(e.emp_id) AS num_employees
FROM {{ ref('Raw_employees') }} e
JOIN {{ ref('Raw_departments') }} d ON e.dept_id = d.dept_id
JOIN {{ ref('Raw_locations')}} l ON d.location_id = l.location_id
GROUP BY l.country, l.city 
HAVING num_employees >= {{value}}