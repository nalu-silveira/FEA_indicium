with
    clientes as (
        select * from {{ ref('stg_adventure_works__sales_customer') }}
    )

    , pessoas as (
        select * from {{ ref('stg_adventure_works__person_person') }}
    )

select
    c.pk_id_cliente
    , c.fk_id_loja
    , c.fk_id_territorio
    , coalesce(p.nome_completo_pessoa, 'Razão Social / Loja Não Informada') as nome_cliente
    , coalesce(p.tipo_pessoa, 'PJ') as tipo_cliente
from clientes c
left join pessoas p 
    on c.fk_id_pessoa = p.pk_id_pessoa