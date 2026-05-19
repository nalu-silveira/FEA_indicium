with
    int_localizacoes as (
        select * from {{ ref('int_vendas__localizacoes') }}
    )

select
    pk_id_endereco
    , endereco
    , cidade
    , codigo_postal
    , nome_estado as estado
    , codigo_estado as sigla_estado
    , nome_pais as pais
from int_localizacoes