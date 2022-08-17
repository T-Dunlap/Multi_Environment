{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
{%- set cust_schema_name = "customschema"-%}  

    {%- if 'dev' in target.name.lower() -%}

        {%- if custom_alias_name is none -%}

            {{ cust_schema_name  ~ '__' ~ node.name }}

        {%- else -%}

            {{ cust_schema_name  ~ '__' ~ (custom_alias_name | trim) }}

        {%- endif -%}
    
    {%- else -%}

        {%- if custom_alias_name is none -%}

            {{ node.name }}

        {%- else -%}

            {{ custom_alias_name | trim }}

        {%- endif -%}
        
    {%- endif -%}

{%- endmacro %}