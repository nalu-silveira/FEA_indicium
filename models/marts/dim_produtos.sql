with
    int_produtos as (
        select * from {{ ref('int_vendas__produtos') }}
    )

select
    pk_id_produto
    , nome_produto
    , codigo_produto
    , cor_produto
    , preco_lista
    , nome_subcategoria_produto as subcategoria
    , nome_categoria_produto as categoria
from int_produtos