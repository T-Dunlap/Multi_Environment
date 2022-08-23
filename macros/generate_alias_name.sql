{% macro generate_alias_name(custom_alias_name=none,node=none) -%}

    {%- if 'dev' in target.name.lower() -%}

        {%- if custom_alias_name is none -%}

            {{ node.config.schema ~ '__' ~ node.name }}

        {%- else -%}

            {{ node.config.schema ~ '__' ~ (custom_alias_name | trim) }}

        {%- endif -%}
    
    {%- else -%}

        {%- if custom_alias_name is none -%}

            {{ node.name }}

        {%- else -%}

            {{ custom_alias_name | trim }}

        {%- endif -%}

    {%- endif -%}

{%- endmacro %}