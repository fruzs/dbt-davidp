​​{% macro conversion_rate_in_percentage(column_numerator, column_denominator, precision=2) %}
   ROUND(
       SUM({{ column_numerator }}) / COUNT(distinct {{ column_denominator }})::numeric * 100, 
       {{ precision }}
    )
{% endmacro %}