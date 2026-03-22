with cte as (
    select * from
    {{source('source1','item')}}
)
select 
I_ITEM_SK,
I_ITEM_DESC,
I_CURRENT_PRICE,
I_WHOLESALE_COST,
YEAR(I_REC_START_DATE) Start_YEAR,
YEAR(I_REC_END_DATE) END_YEAR,
{{diff_bt_two('I_CURRENT_PRICE','I_WHOLESALE_COST')}} as profit_percent

from cte
limit 10

