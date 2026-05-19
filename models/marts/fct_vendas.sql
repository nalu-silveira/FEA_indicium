with
    cabecalho_pedidos as (
        select * from {{ ref('stg_adventure_works__sales_salesorderheader') }}
    )

    , detalhe_pedidos as (
        select * from {{ ref('stg_adventure_works__sales_salesorderdetail') }}
    )

    , motivos_agrupados as (
        select * from {{ ref('int_vendas__motivos') }}
    )

select
    d.pk_id_detalhe_pedido
    , d.fk_id_venda as fk_id_pedido
    , d.fk_id_produto
    , c.fk_id_cliente
    , c.fk_id_cartao_credito
    , c.fk_id_endereco_cobranca as fk_id_endereco
    
    -- contexto
    , c.data_pedido
    , c.status_pedido
    , c.is_venda_online
    , coalesce(m.motivos_venda, 'Não Informado') as motivos_venda
    
    -- métricas
    , d.quantidade_item
    , d.preco_unitario
    , d.desconto_unitario as percentual_desconto_item
    
    --faturamento bruto
    , (d.quantidade_item * d.preco_unitario) as valor_bruto_item
    
    -- valor exato em moedas de desconto
    , (d.quantidade_item * d.preco_unitario * d.desconto_unitario) as valor_desconto_item
    
    -- faturamento Líquido final (Bruto - Desconto)
    , (d.quantidade_item * d.preco_unitario * (1 - d.desconto_unitario)) as valor_liquido_item

from detalhe_pedidos d
inner join cabecalho_pedidos c 
    on d.fk_id_venda = c.pk_id_venda
left join motivos_agrupados m 
    on d.fk_id_venda = m.id_pedido