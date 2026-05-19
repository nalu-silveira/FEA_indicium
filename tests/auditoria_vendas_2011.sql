with 
    calculo_auditoria as (
        select
            round(sum(quantidade_item * preco_unitario), 2) as total_bruto_2011
        from {{ ref('fct_vendas') }} 
        where year(data_pedido) = 2011
    )

select *
from calculo_auditoria
-- O teste falha se o valor calculado for DIFERENTE do valor da auditoria do CEO
where total_bruto_2011 != 12646112.16