select 
	to_char(date_trunc('month', order_date), 'Month YYYY') as year_month,
	count(order_id) as total_orders,
	round(sum(freight))::int as total_freight
from orders 
where order_date>='1997-01-01' and order_date<= '1998-12-31'
group by date_trunc('month', order_date)
having count(order_id)>35
order by total_freight desc;
