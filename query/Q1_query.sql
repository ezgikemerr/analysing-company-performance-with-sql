select
	product_name,
	unit_price
	from products 
	where unit_price>=20 and unit_price<=50
		and discontinued=0
	order by unit_price desc;


		