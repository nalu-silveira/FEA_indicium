-- Teste para garantir que nenhum item foi vendido com preço zerado/negativo
-- ou com desconto superior a 100% do preço praticado.
SELECT
    id_ordem_venda
    , preco_unitario
    , desconto_unitario
FROM {{ ref('fct_vendas') }}
WHERE preco_unitario <= 0 
   OR desconto_unitario > preco_unitario