select
		emp.first_name || ' ' || emp.last_name as employee_full_name,
		emp.title as employee_title,
	floor(extract(year from age(emp.hire_date, emp.birth_date))) as age_at_hire,
		mgr.first_name || ' ' || mgr.last_name as manager_full_name,
		mgr.title as manager_title
	from employees emp
	left join employees mgr on emp.reports_to=mgr.employee_id
	order by age_at_hire asc,
			employee_full_name asc;
