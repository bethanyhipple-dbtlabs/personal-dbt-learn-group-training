with properties as(

    select * from {{ ref('stg_properties') }}

),

units as(

    select * from {{ ref('stg_units') }}

),

property_income as(

        select
            property_id,
            sum(rent_amount) as total_property_income
        from units
        group by 1
),

final as(

    select 
        properties.property_id,
        properties.property_name,
        properties.property_type,
        property_income.total_property_income

    from properties
    inner join property_income on properties.property_id = property_income.property_id
)

select * from final