{{
    config(
        materialized='table'
    )
}}



{%set START_DATE =  '1993-01-01'%}
{%set END_DATE = '1997-08-31'%}

SELECT 
    J.JOB_TITLE, 
    D.DEPT_NAME, 
    CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS FULL_NAME,
    J.START_DATE,
    J.END_DATE
FROM {{ ref('Raw_employees') }} E 
JOIN {{ ref('Raw_departments') }} 
D ON E.DEPT_ID = D.DEPT_ID 
JOIN {{ ref('Raw_jobs') }} 
J ON J.JOB_ID = E.JOB_ID 
WHERE J.START_DATE >= '{{START_DATE}}'  
  AND J.END_DATE <= '{{END_DATE}} '
