{% macro grant_select(role_name) %}

    {% set sql %}
      GRANT SELECT ON {{ this }} TO {{ role_name }};
    {% endset %}

    {% set table = run_query(sql) %}

{% endmacro %}