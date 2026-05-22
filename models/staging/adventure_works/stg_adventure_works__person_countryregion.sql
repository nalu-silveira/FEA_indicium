with
    src_countryregion as (
        select * from {{ source('adventure_works', 'person_countryregion') }}
    )

select
    {{ treat_na('countryregioncode') }} as pk_id_pais
    , cast(name as string) as nome_pais
from src_countryregion