
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
--Adding comment to prompt change
{{ config(materialized='table') }}

with source_data as (

    select 1 as id--, 'abc' as NewColumn
    union all
    select null as id--, 'def' as NewColumn
    union all 
    select 3 as id--, 'ghi' as NewColumn

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
