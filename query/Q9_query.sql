Select
    e.first_name || ' ' || e.last_name as full_name,
    e.title,
    Round(Sum(od.unit_price * od.quantity)::numeric, 2) as total_sales_excl_discount,
    Count(Distinct o.order_id) as total_unique_orders,
    Count(od.order_id) as total_orders,
    Round(Avg(od.unit_price * od.quantity)::numeric, 2) as avg_product_amount_excl_discount,
    Round(
        (Sum(od.unit_price * od.quantity) / NULLIF(Count(Distinct o.order_id), 0))::numeric
    , 2) as avg_order_amount_excl_discount,
    Round(Sum(od.unit_price * od.quantity * od.discount)::numeric, 2) as total_discount_amount,
    Round(Sum(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) as total_sales_incl_discount,
    Round(
        Case 
            When Sum(od.unit_price * od.quantity * (1 - od.discount)) = 0 then 0
            Else (Sum(od.unit_price * od.quantity * od.discount) / Sum(od.unit_price * od.quantity * (1 - od.discount))) * 100
        End
    ::numeric, 2) as total_discount_percentage
From employees e
Join orders o on e.employee_id = o.employee_id
Join order_details od on o.order_id = od.order_id
Group by e.employee_id, e.first_name, e.last_name, e.title
order by total_sales_incl_discount desc;