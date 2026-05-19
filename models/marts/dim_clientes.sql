with
    int_clientes as (
        select * from {{ ref('int_vendas__clientes') }}
    )

select
    pk_id_cliente
    , nome_cliente
    , tipo_cliente
    , fk_id_loja
    , fk_id_territorio
from int_clientes