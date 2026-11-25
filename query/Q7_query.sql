Select
    Case
        When s.country in ('USA', 'United States', 'Canada', 'Mexico') then 'America'
        When s.country in ('Germany', 'France', 'UK', 'United Kingdom', 'Italy', 'Spain', 'Netherlands') then 'Europe'
        When s.country in ('China', 'Japan', 'Australia', 'India', 'New Zealand', 'Singapore') then 'Asia-Pacific'
        Else 'Other'
    End as supplier_region,
    c.category_name,
    Sum(p.unit_in_stock) as total_units_in_stock,
    Sum(p.unit_on_order) as total_units_on_order,
    Sum(p.reorder_level) as total_reorder_level
From products p
Join categories c on p.category_id = c.category_id
Join suppliers s on p.supplier_id = s.supplier_id
Group by supplier_region, c.category_name
order by c.category_name asc, supplier_region asc, total_reorder_level asc;
