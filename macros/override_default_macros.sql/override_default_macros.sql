{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}

 {% macro generate_alias_name(custom_alias_name=none, node=none) -%}
 
    {%- if target.name == 'dev' -%}
 
        {{ target.schema }}_{{ node.name }}
 
    {%- else -%}
 
        {{ node.name }}
 
    {%- endif -%}
 
{%- endmacro %}