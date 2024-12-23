{% macro generate_schema_name(schema_name,node) %}

    {% if schema_name is not none %}

    {{schema_name}}

    {% else %}

        {{target.schema  }}  

    {% endif %}
    
{% endmacro %}