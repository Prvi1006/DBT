{{
    config(
        materialized = 'table'
    )
}}

{% set value = 2 %}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['l.location_id', 'd.dept_id', 'e.emp_id']) }} AS s_key,
    l.country,
    l.city,
    COUNT(e.emp_id) AS num_employees
FROM {{ ref('Raw_employees') }} e
JOIN {{ ref('Raw_departments') }} d 
    ON e.dept_id = d.dept_id
JOIN {{ ref('Raw_locations') }} l 
    ON d.location_id = l.location_i
GROUP BY l.country, l.city
HAVING COUNT(e.emp_id) >= {{ value }}
