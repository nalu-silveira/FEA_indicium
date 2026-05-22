with
    src_person as (
        select * from {{ source('adventure_works', 'person_person') }}
    )

select
    cast(businessentityid as int) as pk_id_pessoa
    , cast(persontype as string) as tipo_pessoa
    , cast(
        concat_ws(' ', title, firstname, middlename, lastname, suffix) 
        as string
      ) as nome_completo_pessoa
from src_person