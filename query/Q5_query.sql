select
    p.product_name,
    round(p.unit_price::numeric, 2) as current_unit_price,
    round(avg_od.avg_unit_price::numeric, 2) as initial_unit_price,
    cast(
        round(((p.unit_price - avg_od.avg_unit_price) / avg_od.avg_unit_price) * 100)
        as integer
    ) as percentage_increase
from products p
join (
    select 
        product_id,
        AVG(unit_price) as avg_unit_price
    from order_details od
    group by product_id
) avg_od on p.product_id = avg_od.product_id
where 
    (
        ((p.unit_price - avg_od.avg_unit_price) / avg_od.avg_unit_price) * 100 < 20
        or ((p.unit_price - avg_od.avg_unit_price) / avg_od.avg_unit_price) * 100 > 30
    )
order by percentage_increase asc;