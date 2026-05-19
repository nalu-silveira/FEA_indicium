with
    ordem_motivos as (
        select * from {{ ref('stg_adventure_works__sales_salesorderheadersalesreason') }}
    )

    , motivos as (
        select * from {{ ref('stg_adventure_works__sales_salesreason') }}
    )

    , motivos_concluidos as (
        select
            om.pk_id_ordem_venda as id_pedido
            , m.nome_razao_venda
        from ordem_motivos om
        inner join motivos m 
            on om.fk_id_razao_venda = m.pk_id_ordem_venda
    )

select
    id_pedido
    , string_agg(nome_razao_venda, ', ') as motivos_venda
from motivos_concluidos
group by id_pedido