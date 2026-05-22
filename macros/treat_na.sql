{% macro treat_na(column_name) %}
    cast(coalesce({{ column_name }}, 'NA') as string)
{% endmacro %}