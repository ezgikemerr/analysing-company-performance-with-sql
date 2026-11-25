With employee_category_sales as (
    Select
        c.category_name,
        e.employee_id,
        e.first_name || ' ' || e.last_name as full_name,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) as sales_incl_discount
    From employees e
    Join orders o on e.employee_id = o.employee_id
    Join order_details od on o.order_id = od.order_id
    Join products p on od.product_id = p.product_id
    Join categories c on p.category_id = c.category_id
    Group by c.category_name, e.employee_id, full_name
),
employee_total_sales as (
    SELECT
        employee_id,
        SUM(sales_incl_discount) as total_sales
    From employee_category_sales
    group by employee_id
),
total_sales_all_employees as (
    Select SUM(sales_incl_discount) as total_sales from employee_category_sales
)
Select
    ecs.category_name,
    ecs.full_name,
    Round(ecs.sales_incl_discount::numeric, 2) as total_sales_incl_discount,
    Round((ecs.sales_incl_discount / ets.total_sales)::numeric, 5) as pct_of_employee_total,
    Round((ecs.sales_incl_discount / tsae.total_sales)::numeric, 5) as pct_of_total_sales
From employee_category_sales ecs
Join employee_total_sales ets on ecs.employee_id = ets.employee_id
Cross join total_sales_all_employees tsae
Order by ecs.category_name asc, total_sales_incl_discount desc;






