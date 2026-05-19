with
    stg_cartoes as (
        select * from {{ ref('stg_adventure_works__sales_creditcard') }}
    )

select
    pk_id_cartao_credito
    , bandeira_cartao_credito as tipo_cartao
    , numero_cartao_credito
    , mes_vencimento_cartao
    , ano_vencimento_cartao
from stg_cartoes