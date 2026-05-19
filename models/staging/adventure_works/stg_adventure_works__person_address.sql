with
    src_person_address as (
        select * from {{ source('adventure_works', 'person_address') }}
    )

select
    cast(addressid as int) as pk_id_endereco
    , cast(stateprovinceid as int) as fk_id_estado
    , cast(city as string) as cidade
    , cast(concat_ws(' ', addressline1, addressline2) as string) as endereco
    , cast(postalcode as string) as codigo_postal
from src_person_address