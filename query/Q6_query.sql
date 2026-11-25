Select
    c.category_name,
    Case
        When p.unit_price < 20 then '1. Below $20'
        When p.unit_price Between 20 and 50 then '2. $20 - $50'
        Else '3. Over $50'
    End as price_range,
    Cast(Sum(od.unit_price * od.quantity * (1 - od.discount)) as integer) as total_amount,
    Count(Distinct od.order_id) as order_volume
From categories c
Join products p on c.category_id = p.category_id
Join order_details od on p.product_id = od.product_id
Group by c.category_name, price_range
order by c.category_name asc, price_range asc;