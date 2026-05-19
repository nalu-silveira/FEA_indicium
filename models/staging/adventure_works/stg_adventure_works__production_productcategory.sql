with
    src_product_category as (
        select * from {{ source('adventure_works', 'production_productcategory') }}
    )

select
    cast(productcategoryid as int) as pk_id_categoria_produto
    , cast(name as string) as nome_categoria_produto 
    , cast(modifieddate as date) as data_atualizacao
from src_product_category