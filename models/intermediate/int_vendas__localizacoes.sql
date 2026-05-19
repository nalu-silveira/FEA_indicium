with
    enderecos as (
        select * from {{ ref('stg_adventure_works__person_address') }}
    )

    , estados as (
        select * from {{ ref('stg_adventure_works__person_stateprovince') }}
    )

    , paises as (
        select * from {{ ref('stg_adventure_works__person_countryregion') }}
    )

select
    e.pk_id_endereco
    , e.endereco
    , e.cidade
    , e.codigo_postal
    , est.nome_estado
    , est.codigo_estado
    , p.nome_pais
from enderecos e
left join estados est 
    on e.fk_id_estado = est.pk_id_estado
left join paises p 
    on est.fk_id_pais = p.pk_id_pais