{{
    config(
        materialized='table',
        schema = 'stage'
    )
}}

with properties as(
    select
        id as property_id,
        created_at as property_created_at,
        name as property_name,
        address as property_address,
        city as property_city,
        state as property_state,
        zip_code as property_zip_code,
        type as property_type,
        year_built,
        uploaded_at as property_uploaded_at
    
    from {{ source('property_management', 'properties') }}
)
select * from properties