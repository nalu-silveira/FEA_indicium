with
    src_order_detail as (
        select * from {{ source('adventure_works', 'sales_salesorderdetail') }}
    )

select
    cast(salesorderdetailid as int) as pk_id_detalhe_pedido
    , cast(salesorderid as int) as fk_id_venda 
    , cast(productid as int) as fk_id_produto
    , cast(specialofferid as int) as fk_id_oferta_especial
    , cast(orderqty as int) as quantidade_item
    , cast(unitprice as double) as preco_unitario
    , cast(unitpricediscount as double) as desconto_unitario
from src_order_detail