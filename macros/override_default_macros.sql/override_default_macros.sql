{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {% elif target.name == 'CI'%}

        ci_schema

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}

 {% macro generate_alias_name(custom_alias_name=none, node=none) -%}
 
    {%- if target.name == 'CI' -%}
        {%- if custom_alias_name is none -%}

            {{ env_var('DBT_CLOUD_PR_ID') }}__{{ node.name }}

         {%- else -%}
 
            {{ custom_alias_name | trim }}

        {%- endif -%}

    {% elif target.name == 'dev' %}
        {%- if custom_alias_name is none -%}
 
            {{ target.schema }}_{{ node.name }}
 
        {%- else -%}
 
            {{ custom_alias_name | trim }}

        {%- endif -%}

    {% else %}

        {{ node.name }}

    {%- endif -%}
    
{%- endmacro %}