with rental_applications as(

    select
        id as application_id,
        created_at as application_created_at,
        deleted_at as application_deleted_at,
        status as application_status,
        contact_info_id as applicant_contact_info_id,
        uploaded_at as application_uploaded_at

    from {{ source('property_management', 'rental_applications') }}
)
select * from rental_applications