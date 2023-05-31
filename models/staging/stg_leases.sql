with leases as(
    select 
        id as lease_id,
        created_at as lease_created_at,
        unit_id,
        start_date as lease_start_date,
        end_date as lease_end_date,
        rental_application_id,
        completed as lease_completed,
        uploaded_at as lease_uploaded_at






    from {{ source('property_management', 'leases') }}
)

select * from leases