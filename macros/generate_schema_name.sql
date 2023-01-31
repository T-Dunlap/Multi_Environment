{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
 {#    {% if not custom_schema_name and node.resource_type == 'model' %}
        {{ exceptions.raise_compiler_error(
            'Model must have a custom schema configured.'
        )}}
    {% endif%}
#}
    {% set default_dev_schema =  env_var("DBT_DEV_TARGET_SCHEMA", 'DEV') %}
    {% set default_ci_schema =  env_var("DBT_CI_TARGET_SCHEMA", 'CI') %}

    {%- if target.name == 'dev' -%}

        {{ default_dev_schema }}

    {%- elif target.name == 'ci' -%}

        {{ default_ci_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}
