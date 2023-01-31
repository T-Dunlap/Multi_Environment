{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {% do return(adapter.dispatch('generate_alias_name', 'dbt')(custom_alias_name, node)) %}
{%- endmacro %}

{% macro default__generate_alias_name(custom_alias_name=none, node=none) -%}

    {%- if target.name == 'dev' or target.name == 'ci' -%}

        {%- if custom_alias_name is none -%}

            {{ target.schema }}__{{ node.config.schema }}__{{ node.name }}

        {%- else -%}

            {{ target.schema }}__{{ node.config.schema }}__{{ (custom_alias_name | trim) }}

        {%- endif -%}

    {%- else  -%}

        {%- if custom_alias_name is none -%}

            {{ node.name }}

        {%- else -%}

            {{ custom_alias_name | trim }}

        {%- endif -%}

    {%- endif -%}



{%- endmacro %}
