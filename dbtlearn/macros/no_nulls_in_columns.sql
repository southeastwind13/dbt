{% macro no_nulls_in_columns(model) %}
    select * from {{model}} where 
    {% for col in adapter.get_columns_in_relation(model) -%} -- Hyphen mean we want to trim out the withe space.
        {{ col.column }} is null or -- or in the end for next interation of for to add a new column name
    {% endfor %}
    false -- This is a command to terminate or command
{% endmacro %}