with leases as(

    select * from {{ ref('stg_leases') }}
),

applications as(

    select * from {{ ref('stg_rental_applications') }}
),



units as(

    select * from {{ ref('stg_units') }}
),

final as(

    select
        units.unit_id,
        units.rent_amount,
        units.unit_status,
        leases.rental_application_id,
        applications.application_status
        
    from units
    left join leases on units.unit_id = leases.unit_id
    left join applications on leases.rental_application_id = applications.application_id

    order by unit_id
)

select * from final