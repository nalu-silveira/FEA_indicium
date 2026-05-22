with
    src_state_province as (
        select * from {{ source('adventure_works', 'person_stateprovince') }}
    )

select
    cast(stateprovinceid as int) as pk_id_estado
    , cast(countryregioncode as string) as fk_id_pais
    , cast(territoryid as int) as fk_territorio 
    , cast(stateprovincecode as string) as codigo_estado
    , cast(name as string) as nome_estado
from src_state_province