{% macro learn_variable() %}
    -- Jinja varaible
    {% set your_name_jinja = "Jinja" %}

    {{ log("Hello " ~ your_name_jinja, info=True) }}

    -- dbt varaible
    -- part variable via command line
    {{ log("Hello dbt user " ~ var("user_name"), info=True)}}
{% endmacro %}