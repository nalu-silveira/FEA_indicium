with
    src_product as (
        select * from {{ source('adventure_works', 'production_product') }}
    )

select
    cast(productid as int) as pk_id_produto
    , cast(productsubcategoryid as int) as fk_id_subcategoria
    
    -- Atributos do Produto 
    , cast(name as string) as nome_produto
    , cast(productnumber as string) as codigo_produto
    , cast(color as string) as cor_produto
    
    -- Valores de Referência 
    , cast(listprice as double) as preco_lista
    
    -- Flags de Controle (Filtrando apenas produtos comercializáveis)
    , cast(finishedgoodsflag as boolean) as is_produto_final

from src_product
where finishedgoodsflag = true -- Boa prática: já elimina as matérias-primas e peças da fábrica aqui na base