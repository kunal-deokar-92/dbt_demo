with cte as
(
    select * from 
    {{source('source1','store')}}
    LIMIT 20
)

select s_store_id,s_rec_start_date,s_rec_end_date
,avg(s_number_employees) AVG_EMP,s_manager
from cte
group by s_store_id,s_rec_start_date,s_rec_end_date,s_manager
qualify (rank() over (partition by s_store_id order by s_rec_start_date desc))=1
order by s_store_id