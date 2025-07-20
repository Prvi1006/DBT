{% macro Employee_hike(hike_per) %}

(salary + (salary * {{hike_per}})) AS NEW_SALARY

{% endmacro %}
