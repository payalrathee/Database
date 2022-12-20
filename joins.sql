-- *************************************************JOINS**************************************************

-- *************INNER JOINS******************
-- select order_id,p.product_id,quantity_in_stock,p.unit_price 
-- from order_items oi join products p
-- on oi.product_id=p.product_id;

-- select order_id,p.product_id,quantity_in_stock,p.unit_price 
-- from order_items oi join sql_inventory.products p
-- on oi.product_id=p.product_id;

-- select e1.first_name emp,e2.first_name manager
-- from employees e1 join employees e2
-- on e1.reports_to=e2.employee_id;

-- select e.first_name emp,m.first_name manager
-- from employees e join employees m
-- on e.reports_to=m.employee_id;

-- select o.order_id,o.order_date,c.first_name,c.last_name,os.name status
-- from orders o join customers c join  order_statuses os
-- on o.customer_id=c.customer_id and o.status=os.order_status_id;

-- select p.invoice_id,p.date,p.amount,c.name,pm.name method
-- from payments p join clients c join payment_methods pm
-- on p.client_id=c.client_id and p.payment_method=pm.payment_method_id;

-- when FK takes values from composite PK
-- select *
-- from order_items i join order_item_notes n
-- on i.order_id=n.order_id and i.product_id=n.product_id;

-- *************OUTER JOINS*****************
-- select c.customer_id,c.first_name,o.order_id
-- from orders o right join customers c
-- on o.customer_id=c.customer_id;

-- select p.product_id,p.name,oi.quantity
-- from order_items oi right join products p
-- on oi.product_id=p.product_id;


-- select c.customer_id,c.first_name,o.order_id,s.name shipper
-- from customers c 
-- left join orders o 
-- 	on c.customer_id=o.customer_id
-- left join shippers s
-- 	on o.shipper_id=s.shipper_id
-- order by c.customer_id

-- select o.order_id,o.order_date,c.first_name customer,s.name shipper,os.name status
-- from orders o 
-- join customers c
-- 	on o.customer_id=c.customer_id
-- left join shippers s
-- 	on o.shipper_id=s.shipper_id
-- join order_statuses os
-- 	on o.status=os.order_status_id;

-- select e.first_name employee,m.first_name manager
-- from employees e
-- left join employees m
-- 	on e.reports_to=m.employee_id;

-- select o.order_id,c.first_name
-- from orders o join customers c
-- using (customer_id);   -- only if column name is the same in both tables

-- select o.order_id,n.note
-- from order_items o join order_item_notes n
-- using (order_id,product_id);

-- select p.date,c.name client,p.amount,pm.name method
-- from payments p
-- join clients c
-- 	using (client_id)
-- join payment_methods pm
-- 	on p.payment_method=pm.payment_method_id;

-- **************NATURAL JOIN***************
-- select *
-- from payments p natural join clients c;

-- *************CROSS JOIN***********
-- select *
-- from payments p cross join clients c
-- on p.client_id=c.client_id;

-- select *
-- from payments p,clients c
-- where p.client_id=c.client_id;


























