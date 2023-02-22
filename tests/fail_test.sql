select
    property_id
    
from {{ ref('stg_properties' )}}
where property_id = '1'