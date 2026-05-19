with
    src_order_header as (
        select * from {{ source('adventure_works', 'sales_salesorderheader') }}
    )

select
    cast(salesorderid as int) as pk_id_venda
    , cast(customerid as int) as fk_id_cliente
    , cast(creditcardid as int) as fk_id_cartao_credito
    , cast(billtoaddressid as int) as fk_id_endereco_cobranca
    , cast(territoryid as int) as fk_id_territorio
    , cast(orderdate as date) as data_pedido
    , cast(status as int) as status_pedido
    , cast(onlineorderflag as boolean) as is_venda_online
    , cast(subtotal as double) as valor_subtotal
    , cast(taxamt as double) as valor_imposto
    
    -- Colunas descartadas por não responderem ao desafio:
    -- , revisionnumber
    -- , purchaseordernumber
    -- , accountnumber
    -- , creditcardapprovalcode
    -- , rowguid
    -- , modifieddate
from src_order_header