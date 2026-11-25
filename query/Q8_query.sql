With category_stats as (
    Select 
        category_id,
        Round(Avg(unit_price)::numeric, 2) as avg_price,
        Round(
            Percentile_Cont(0.5) Within Group (Order by unit_price)::numeric
        , 2) AS median_price
    From products
    Where discontinued = 0
    Group by category_id
)
Select 
    c.category_name,
    p.product_name,
    p.unit_price,
    cs.avg_price as category_avg_price,
    cs.median_price as category_median_price,
    Case
        When p.unit_price < cs.avg_price then 'Below Average'
        When p.unit_price = cs.avg_price then 'Equal Average'
        Else 'Over Average'
   	End as position_vs_avg,
    Case
        When p.unit_price < cs.median_price then 'Below Median'
        When p.unit_price = cs.median_price then 'Equal Median'
        Else 'Over Median'
    End as position_vs_median
from products p
Join categories c on p.category_id = c.category_id
Join category_stats cs on p.category_id = cs.category_id
Where p.discontinued = 0
order by c.category_name asc, p.product_name asc;


