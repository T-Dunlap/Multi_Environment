{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {%- if custom_alias_name is none -%}

       {{ custom_schema_name ~ '__' ~ node.name }}

    {%- else -%}

        {{ custom_alias_name | trim }}

    {%- endif -%}

{%- endmacro %}