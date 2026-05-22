with
    src_creditcard as (
        select * from {{ source('adventure_works', 'sales_creditcard') }}
    )

select
    cast(creditcardid as int) as pk_id_cartao_credito
    , cast(cardtype as string) as bandeira_cartao_credito
    , cast(cardnumber as string) as numero_cartao_credito
    , cast(expmonth as int) as mes_vencimento_cartao
    , cast(expyear as int) as ano_vencimento_cartao
from src_creditcard