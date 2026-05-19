with 
    produtos as (
        select * from {{ ref("stg_adventure_works__production_product") }}
    ),
    
    subcategorias as (
        select * from {{ ref("stg_adventure_works__production_productsubcategory") }}
    ),
    
    categorias as (
        select * from {{ ref("stg_adventure_works__production_productcategory") }}
    )

select
    p.pk_id_produto
    , p.nome_produto
    , p.codigo_produto
    , p.cor_produto
    , p.preco_lista
    , p.is_produto_final
    , s.nome_subcategoria_produto
    , c.nome_categoria_produto

from produtos p
left join subcategorias s 
    on p.fk_id_subcategoria = s.pk_id_subcategoria_produto
left join categorias c 
    on s.fk_id_categoria_produto = c.pk_id_categoria_produto