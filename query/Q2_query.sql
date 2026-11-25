select 
	ship_country,
	round(Avg(shipped_date-order_date),2) as avg_days_between_order_and_ship,
	count(distinct order_id) as total_unique_orders
from orders 
where extract(year from order_date)=1998
group by ship_country
having
	round(avg(shipped_date-order_date),2)>=5
	and count(distinct order_id)>10
order by ship_country asc;
	