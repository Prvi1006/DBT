{{
    config(
        materialized='table'
    )
}}

{%- set val = [
    "Sales Executive",
    "Marketing Specialist",
    "Software Engineer",
    "HR Manager",
    "Finance Analyst",
    "Legal Advisor",
    "Tech Support",
    "Operations Lead",
    "Research Analyst",
    "Admin Assistant"
] -%}

SELECT 
    JOB_ID,
    {%- for j_id in val -%}
    SUM(CASE WHEN JOB_TITLE = '{{ j_id }}' THEN SALARY END) AS {{ j_id | replace(' ', '_') | lower }}_total_salary
    {% if not loop.last %},{% endif %}
    {%- endfor -%}
FROM 
    {{ ref('Raw_employee_full_det') }}
GROUP BY 
    JOB_ID
