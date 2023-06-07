with units as(

    select
        id as unit_id,
        created_at as unit_created_at,
        rent as rent_amount,
        name as tenant_name,
        bedrooms as bedroom_count,
        bathrooms as bathroom_count,
        property_id,
        square_feet,
        status as unit_status,
        address_1 as unit_address_1,
        address_2 as unit_address_2,
        city as unit_city,
        state as unit_state,
        zip_code as unit_zip_code,
        uploaded_at as unit_uploaded_at

    from {{ source('property_management', 'units') }}
)

select * from units