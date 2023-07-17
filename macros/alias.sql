{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {%- if target.name == 'dev' or target.name == 'CI' -%}
        {%- if custom_alias_name is none -%}
            {{ target.profile_name }}__{{ node.name }}
        {%- else -%}
            {{ target.user }}__{{ custom_alias_name | trim }}
        {%- endif -%}
    {%- else  -%}
        {%- if custom_alias_name is none -%}
            {{ node.name }}
        {%- else -%}
            {{ custom_alias_name | trim }}
        {%- endif -%}
    {%- endif -%}
{%- endmacro %}

{% macro generate_schema_name(custom_schema_name, node, source) -%}

   {%- set default_schema = target.schema -%}
    {%- if target.name == 'CI' -%}
        {{source}}
        
    {%- elif custom_schema_name is none -%}

       {{ default_schema }}

   {%- else -%}

       {{ custom_schema_name | trim }}

   {%- endif -%}

{%- endmacro %}