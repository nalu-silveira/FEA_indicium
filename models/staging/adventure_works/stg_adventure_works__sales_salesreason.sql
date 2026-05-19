with
    src_sales_reason as (
        select * from {{ source('adventure_works', 'sales_salesreason') }}
    )

select
    cast(salesreasonid as int) as pk_id_ordem_venda
    , cast(name as string) as nome_razao_venda
    , cast(reasontype as string) as tipo_razao_venda
from src_sales_reason