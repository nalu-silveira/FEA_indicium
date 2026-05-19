with
    src_product_subcategory as (
        select * from {{ source('adventure_works', 'production_productsubcategory') }}
    )

select
    cast(productsubcategoryid as int) as pk_id_subcategoria_produto
    , cast(productcategoryid as int) as fk_id_categoria_produto
    , cast(name as string) as nome_subcategoria_produto
    , cast(modifieddate as date) as data_atualizacao
from src_product_subcategory