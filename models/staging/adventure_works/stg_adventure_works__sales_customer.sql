with
    src_customer as (
        select * from {{ source('adventure_works', 'sales_customer') }}
    )

select
    cast(customerid as int) as pk_id_cliente
    , cast(personid as int) as fk_id_pessoa
    , cast(storeid as int) as fk_id_loja
    , cast(territoryid as int) as fk_id_territorio
from src_customer
