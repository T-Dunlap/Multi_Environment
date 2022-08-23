{{ config(materialized='table') }}

with source_data as (

    select 1 as id--, 'abc' as Column1
    union all
    select 2 as id--, 'def' as Column1
    union all 
    select 3 as id--, 'ghi' as Column1
)

select *
from source_data

