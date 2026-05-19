with
    src_order_header_sales_reason as (
        select * from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}
    )

select
      cast(salesorderid as int) as pk_id_ordem_venda
    , cast(salesreasonid as int) as fk_id_razao_venda
from src_order_header_sales_reason