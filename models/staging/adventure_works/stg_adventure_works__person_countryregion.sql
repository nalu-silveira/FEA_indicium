with
    src_countryregion as (
        select * from {{ source('adventure_works', 'person_countryregion') }}
    )

select
    cast(coalesce(countryregioncode, 'NA') as string) as pk_id_pais
    , cast(name as string) as nome_pais
from src_countryregion